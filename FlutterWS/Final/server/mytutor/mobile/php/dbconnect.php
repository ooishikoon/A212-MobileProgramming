<?php
$servername = "localhost";
$username = "moneymon_277290_mytutoruser";
$password = "ZCf_g3sr=1ox";
$dbname = "moneymon_277290_mytutor";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>