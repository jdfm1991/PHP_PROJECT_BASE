<?php
require_once("../../config/abrir_sesion.php");
require_once("../../config/conexion.php");
require_once("recibocobro_module.php");

$colrec = new CollectionReceipts();

$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$unit = (isset($_POST['unit'])) ? $_POST['unit'] : '';
$level = (isset($_POST['levelu'])) ? $_POST['levelu'] : '';
$aliquot = (isset($_POST['aliquot'])) ? $_POST['aliquot'] : '';

switch ($_GET["op"]) {
    case 'get_new_number':
        $dato = $colrec->getNewNumberReceiptCollectionDB();
        echo json_encode($dato);
        break;
    case 'get_data_expense_fixed':
        $dato = array();
        $data = $colrec->getDataExpenseAcountFixedDB();
        foreach ($data as $row) {
            $sub_array = array();
            $sub_array['id'] = $row['id'];
            $details = $colrec->getDataCollectionReceiptsDB($row['id']);
            if (!empty($details)) {
                $sub_array['code'] = $row['codeaccount'];
                $sub_array['account'] = $row['expenseaccount'];
                $sub_array['details'] = $details;
                $dato[] = $sub_array;
            }
        }
        echo json_encode($dato, JSON_UNESCAPED_UNICODE);
        break;
}
