<?php
require_once("../../config/conexion.php");
require_once("recibocobro_module.php");
require_once(PATH_APP . "/cuentagasto/cuentagasto_module.php");
require_once(PATH_APP . "/cuentaingresos/cuentaingresos_module.php");
require_once(PATH_VENDOR . "/autoload.php");

$colrec = new Receipts();
$expaccount = new ExpenseAccounts();
$incomeaccounts = new IncomeAccounts();

$id = '68869ba07ad6e';
$head = '';
$body = '';
$stylesheet = file_get_contents(URL_ASSETS . '/css/style-custom.css');
$logo = URL_ASSETS . '/img/logo.png';

$head .= '
	<div class="img-head-box">
		<img class="img-head" src="' . $logo . '" alt="">
	</div>
	<div class="text-head-box">
		<h3 class="text-head">CONDOMINIO RESIDENCIAS "TU CONDOMINIO"</h3>
		<small class="text-head2">J-00000000-0 </small>
	</div>
	<h3 class="time-head">Fecha de Impresion: {DATE j-m-Y}</h3>
	<br>
	<div class="text-head"> RELACION DE GASTOS </div>
	<br>';
$datahead2 = $colrec->getDataHeaderReceiptDB($id);
foreach ($datahead2 as $row) {
	$head .= '
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
	</div>
	';
}
$body .= '<br><br>
<div class="content-body">
	<table style="text-align:justify; width:100%">
	<tr>
		<th style="padding-bottom: -15px; width:15%">CODIGO</th>
		<th style="padding-bottom: -15px; width:65%">GASTOS FIJOS</th>
		<th style="padding-bottom: -15px;">MONTO</th>
		<th style="padding-bottom: -15px;">CUOTA</th>
	</tr>';
$datafixed = $expaccount->getDataExpenseAcountFixedDB();
foreach ($datafixed as $row) {
	$items = $colrec->getDataExpenseFixedByReceiptDB($id, $row['id']);
	if (!empty($items)) {
		$body .= '
	<tr>
		<td style="text-align:center; font-weight: bold; padding-top: 20px;">' . $row['codeaccount'] . '</td>
		<td style="font-weight: bold; padding-top: 20px;">' . $row['expenseaccount'] . '</td>
		<td style="padding-top: 2px;"></td>
		<td style="padding-top: 20px;"></td>
	</tr>';
		foreach ($items as $items) {
			$body .= '
					<tr>
						<td></td>
						<td>' . $items['detailexpense'] . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
					</tr>
					';
		}
	}
}
$body .= '
</table>
<hr>';


$body .= '<br><br>
	<table style="text-align:justify; width:100%">
	<tr>
		<th style="padding-bottom: -15px; width:15%">CODIGO</th>
		<th style="padding-bottom: -15px; width:65%">GASTOS VARIABLES</th>
		<th style="padding-bottom: -15px;">MONTO</th>
		<th style="padding-bottom: -15px;">CUOTA</th>
	</tr>';
$datafixed = $expaccount->getDataExpenseAcountNonFixedDB();
foreach ($datafixed as $row) {
	$items = $colrec->getDataExpenseFixedByReceiptDB($id, $row['id']);
	if (!empty($items)) {
		$body .= '
	<tr>
		<td style="text-align:center; font-weight: bold; padding-top: 20px;">' . $row['codeaccount'] . '</td>
		<td style="font-weight: bold; padding-top: 20px;">' . $row['expenseaccount'] . '</td>
		<td style="padding-top: 2px;"></td>
		<td style="padding-top: 20px;"></td>
	</tr>';
		foreach ($items as $items) {
			$body .= '
					<tr>
						<td></td>
						<td>' . $items['detailexpense'] . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
					</tr>
					';
		}
	}
}
$body .= '
</table>
<hr>';


$body .= '<br><br>
	<table style="text-align:justify; width:100%">
	<tr>
		<th style="padding-bottom: -15px; width:15%">CODIGO</th>
		<th style="padding-bottom: -15px; width:65%">INGRESOS PERCIBIDOS</th>
		<th style="padding-bottom: -15px;">MONTO</th>
		<th style="padding-bottom: -15px;">CUOTA</th>
	</tr>';
$datafixed = $incomeaccounts->getDataIncomeAcountDB();
foreach ($datafixed as $row) {
	$items = $colrec->getDataExpenseFixedByReceiptDB($id, $row['id']);
	if (!empty($items)) {
		$body .= '
	<tr>
		<td style="text-align:center; font-weight: bold; padding-top: 20px;">' . $row['codeaccount'] . '</td>
		<td style="font-weight: bold; padding-top: 20px;">' . $row['incomeaccount'] . '</td>
		<td style="padding-top: 2px;"></td>
		<td style="padding-top: 20px;"></td>
	</tr>';
		foreach ($items as $items) {
			$body .= '
					<tr>
						<td></td>
						<td>' . $items['detailexpense'] . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
						<td style="text-align:center; font-weight: bold;">' .number_format($items['amountexpense'],2) . '</td>
					</tr>
					';
		}
	}
}
$body .= '
</table>
<hr>';


$body .= '</div>';












$mpdf = new \Mpdf\Mpdf();
$mpdf->SetHeader($head);
$mpdf->WriteHTML($stylesheet, \Mpdf\HTMLParserMode::HEADER_CSS);
$mpdf->WriteHTML($body, \Mpdf\HTMLParserMode::HTML_BODY);
$mpdf->Output('tets.pdf', \Mpdf\Output\Destination::INLINE);
