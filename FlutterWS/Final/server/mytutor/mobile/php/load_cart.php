<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$email = $_POST['user_email'];
$sqlloadcart = "SELECT tbl_carts.cart_id, tbl_carts.subject_id, tbl_carts.cart_qty, tbl_subjects.subject_name, tbl_subjects.subject_price FROM tbl_carts INNER JOIN tbl_subjects ON tbl_carts.subject_id = tbl_subjects.subject_id WHERE tbl_carts.user_email = '$email' AND tbl_carts.cart_status IS NULL";
$result = $conn->query($sqlloadcart);
$number_of_result = $result->num_rows;
if ($result->num_rows > 0) {
    $total_payable = 0;
    $carts["cart"] = array();
    while ($rows = $result->fetch_assoc()) {
        
        $courseList = array();
        $courseList['cartid'] = $rows['cart_id'];
        $courseList['subjectName'] = $rows['subject_name'];
        $subjectPrice = $rows['subject_price'];
        $courseList['price'] = number_format((float)$subjectPrice, 2, '.', '');
        $courseList['cartqty'] = $rows['cart_qty'];
        $courseList['subjectId'] = $rows['subject_id'];
        $price = $rows['cart_qty'] * $subjectPrice;
        $total_payable = $total_payable + $price;
        $courseList['pricetotal'] = number_format((float)$price, 2, '.', ''); 
        array_push($carts["cart"],$courseList);
    }
    $response = array('status' => 'success', 'data' => $carts, 'total' => $total_payable);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}

?>