<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");

$name = $_POST['name'];
$phoneno = $_POST['phoneno'];
$address = $_POST['address'];
$email = $_POST['email'];
$password = sha1($_POST['password']);
$na = "na";

$sqlinsert = "INSERT INTO tbl_user (user_name, user_phoneno, user_address, user_email, user_password) VALUES('$name','$phoneno','$address','$email','$password')";
if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    sendEmail($email);
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

function sendEmail($email)
{
    //send email function here
}
?>