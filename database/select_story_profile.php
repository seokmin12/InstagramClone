<?php
    include 'conn.php';

    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    $select_sql = "SELECT * FROM user";
    $select_result = mysqli_query($conn, $select_sql);

    $data = array();
    while ($select_row = mysqli_fetch_array($select_result)) {
        $name = $select_row['user_name'];
        $img = base64_encode($select_row['profile_image']);
        $row_data = array("name"=>$name, "img"=>$img);
        array_push($data, $row_data);
    };
    echo json_encode($data);
?>