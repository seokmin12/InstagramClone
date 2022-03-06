<?php
    include 'conn.php';
    
    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    $user_name = $_POST['user_name'];

    $image = $_FILES['profile_image']['tmp_name']; 
    $imgContent = addslashes(file_get_contents($image));
    
    $insert_sql = "INSERT INTO user (user_name, profile_image) VALUES ('$user_name', '$imgContent')";
    $result = mysqli_query($conn, $insert_sql);

    if ($result == false) {
        echo "<script>window.alert('저장하는 과정에서 문제가 생겼습니다. 관리자에게 문의하세요.')</script>";
        // echo "<script>history.back();</script>";
        echo mysqli_error($conn);
    } else {
        echo "<script>window.alert('성공적으로 저장되었습니다.')</script>";
        echo "<script>location.href='index.php';</script>";
    };

?>