<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("dbconnect.php");
$results_per_page = 5;
$pageno = (int)$_POST['pageno'];
$search = $_POST['search'];
$page_first_result = ($pageno - 1) * $results_per_page;

//$sqlloadtutors = "SELECT * FROM tbl_tutors";
$sqlloadtutors = "SELECT tt.tutor_id, tt.tutor_email,tt.tutor_phone, tt.tutor_name, tt.tutor_password, tt.tutor_description, tt.tutor_datereg, GROUP_CONCAT(ts.subject_name ORDER BY ts.subject_id ASC) FROM tbl_tutors tt, tbl_subjects ts WHERE tt.tutor_id = ts.tutor_id AND tutor_name LIKE '%$search%' GROUP BY tt.tutor_id ASC";

$result = $conn->query($sqlloadtutors);
$number_of_result = $result->num_rows;
$number_of_page = ceil($number_of_result / $results_per_page);
$sqlloadtutors = $sqlloadtutors . " LIMIT $page_first_result , $results_per_page";
$result = $conn->query($sqlloadtutors);
if ($result->num_rows > 0) {
    $tutors["tutors"] = array();
    while ($row = $result->fetch_assoc()){
        $tutorlist = array();
        $tutorlist['tutor_id'] = $row['tutor_id'];
        $tutorlist['tutor_email'] = $row['tutor_email'];
        $tutorlist['tutor_phone'] = $row['tutor_phone'];
        $tutorlist['tutor_name'] = $row['tutor_name'];
        $tutorlist['tutor_password'] = $row['tutor_password'];
        $tutorlist['tutor_description'] = $row['tutor_description'];
        $tutorlist['tutor_datereg'] = $row['tutor_datereg'];
        $tutorlist['subjectname'] = $row['GROUP_CONCAT(ts.subject_name ORDER BY ts.subject_id ASC)'];
        array_push($tutors["tutors"],$tutorlist);
    }
    $response = array('status' => 'success', 'pageno'=>"$pageno",'numofpage'=>"$number_of_page", 'data' => $tutors);
    sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'pageno'=>"$pageno",'numofpage'=>"$number_of_page", 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>