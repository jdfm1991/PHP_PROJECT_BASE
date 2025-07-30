<?php
require_once("../../config/conexion.php");
require_once("recibocobro_module.php");
require_once(PATH_APP . "/cuentagasto/cuentagasto_module.php");
require_once(PATH_APP . "/cuentaingresos/cuentaingresos_module.php");
require_once(PATH_VENDOR . "/autoload.php");

$colrec = new Receipts();
$expaccount = new ExpenseAccounts();
$incomeaccounts = new IncomeAccounts();

$id = (isset($_GET['id'])) ? $_GET['id'] : '';
$head = '';
$body = '';
$stylesheet = file_get_contents(URL_ASSETS . '/css/style-custom.css');
$logo = URL_ASSETS . '/img/logo.png';
$name = '';
$type = '';

function getNameReceipt($data)
{
  foreach ($data as $row) {
    $name =  $row['numrec'] . ' - ' . $row['unitdep'] . ' - ' . $row['nametenant'];
  }
  return $name;
}

function getTypeReceipt($data)
{
  foreach ($data as $row) {
    $type =  $row['typerec'];
  }
  return $type;
}
function getInfoHeadCondominium($logo, $type)
{
  $condominium = '';
  $condominium .= '
	<div class="img-head-box">
		<img class="img-head" src="' . $logo . '" alt="">
	</div>
	<div class="text-head-box">
		<h3 class="text-head">CONDOMINIO RESIDENCIAS "TU CONDOMINIO"</h3>
		<small class="text-head2">J-00000000-0 </small>
	</div>
	<h3 class="time-head">Fecha de Impresion: {DATE j-m-Y}</h3>
	<br>
  <div class="text-head"> RECIBO DE COBRO </div>';
  if ($type == 'COBRO') {
    $condominium .= '
  <div class="text-head"> RELACION DE COBROS </div>';
  }
  if ($type == 'PENAL') {
    $condominium .= '
  <div class="text-head"> RELACION DE PENALIZACIONES </div>';
  }
  return $condominium;
}

function getInfoHeadReceipt($data)
{
  foreach ($data as $row) {
    $headreceipt = '
	<div class="content-info">
		<div class="info-head-box">
			<br><br> 
			<p class="info-text-1">' . $row['conceptreceipt'] . '</p>
		</div>
		<div class="info-head-box"> 
			<p class="info-text-2">N° RECIBO: ' . $row['numrec'] . '</p>
			<p class="info-text-2">FEC. DE VENC.: ' . $row['expirationdate'] . '</p>
			<p class="info-text-2">N° DEPARTAMENTO: ' . $row['unitdep'] . '</p>
			<p class="info-text-2">NIVEL: ' . $row['levelrec'] . '</p>
			<p class="info-text-2">ALICUOTA: ' . $row['aliquotrec'] . '</p>
		</div>
	</div>';
  }
  return $headreceipt;
}

function getInfoBodyReceipt($id, $account, $item, $type)
{
  $data = [];
  $consultation = '';
  $totalaumont = 0;
  $totalaliquota = 0;
  if ($type == 'EAF') {
    $data = $account->getDataExpenseAcountFixedDB();
    $consultation = 'GASTOS FIJOS';
  }
  if ($type == 'EANF') {
    $data = $account->getDataExpenseAcountNonFixedDB();
    $consultation = 'GASTOS VARIABLES';
  }
  if ($type == 'IAF') {
    $data = $account->getDataIncomeAcountDB();
    $consultation = 'INGRESOS PERCIBIDOS';
  }
  if ($type == 'PAF') {
    $data = $account->getDataPenaltyAcountDB();
    $consultation = 'PENALIDADES';
  }

  $infobody = '
    <table style="text-align:justify; width:100%">
      <tr>
        <th style="padding-bottom: -15px; width:15%">CODIGO</th>
        <th style="padding-bottom: -15px; width:65%">' . $consultation . '</th>
        <th style="padding-bottom: -15px;">MONTO</th>
        <th style="padding-bottom: -15px;">CUOTA</th>
      </tr>';
  foreach ($data as $row) {
    $items = $item->getDataItemsByReceiptDB($id, $row['id']);
    if (!empty($items)) {
      $infobody .= '
        <tr>
          <td style="text-align:center; font-weight: bold; padding-top: 20px;">' . $row['codeaccount'] . '</td>
          <td style="font-weight: bold; padding-top: 20px;">' . $row['expenseaccount'] . '</td>
          <td style="padding-top: 2px;"></td>
          <td style="padding-top: 20px;"></td>
        </tr>';
      foreach ($items as $items) {
        $infobody .= '
					<tr>
						<td></td>
						<td>' . $items['detailexpense'] . '</td>
						<td style="text-align:center; font-weight: bold;">' . number_format($items['amountexpense'], 2) . '</td>
						<td style="text-align:center; font-weight: bold;">' . number_format($items['aumontaliquot'], 2) . '</td>
					</tr>';

        $totalaumont += $items['amountexpense'];
        $totalaliquota += $items['aumontaliquot'];
      }
    }
  }
  $infobody .= '
          <tr style="background-color: #dde3f1da; border: 1px solid #747474;">
						<td style="text-align:center; font-weight: bold; padding-top: 30px;"></td>
						<td style="text-align:center; font-weight: bold; padding-top: 30px;"> TOTAL DE ' . $consultation . '</td>
						<td style="text-align:center; font-weight: bold; padding-top: 30px;">' . number_format($totalaumont, 2) . '</td>
						<td style="text-align:center; font-weight: bold; padding-top: 30px;">' . number_format($totalaliquota, 2) . '</td>
					</tr>
      </table>
      <hr>';
  return $infobody;
}

$data = $colrec->getDataHeaderReceiptDB($id);
$name = getNameReceipt($data);
$type = getTypeReceipt($data);

$head .= getInfoHeadCondominium($logo, $type);
$head .= getInfoHeadReceipt($data);

$body .= '<br><br><div class="content-body">';
if ($type == 'COBRO') {
  $body .= getInfoBodyReceipt($id, $expaccount, $colrec, 'EAF');
  $body .= getInfoBodyReceipt($id, $expaccount, $colrec, 'EANF');
  $body .= getInfoBodyReceipt($id, $incomeaccounts, $colrec, 'IAF');
}
if ($type == 'PENAL') {
  $body .= getInfoBodyReceipt($id, $incomeaccounts, $colrec, 'PAF');
}
$body .= '</div>';

if ($type == 'COBRO') {
  $mpdf = new \Mpdf\Mpdf();
}
if ($type == 'PENAL') {
  $mpdf = new \Mpdf\Mpdf(['format' => [215, 139]]);
}
$mpdf->SetHeader($head);
$mpdf->SetFooter(' Numero de Pagina: {PAGENO}| Fecha de impresion: {DATE j-m-Y}');
$mpdf->WriteHTML($stylesheet, \Mpdf\HTMLParserMode::HEADER_CSS);
$mpdf->WriteHTML($body, \Mpdf\HTMLParserMode::HTML_BODY);
$mpdf->Output($name . '.pdf', \Mpdf\Output\Destination::INLINE);
