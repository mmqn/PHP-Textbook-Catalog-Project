<?php
    $data_src_name = "mysql:host=localhost;dbname=bookcatalog";
    $username = "php";
    $password = "php";
    
    try {
        $db = new PDO($data_src_name, $username, $password);
        echo "Database Connection: Success!<br />";
    } catch (PDOException $e) {
        $error_msg = $e->getMessage();
        include('db_error.php');
        exit();
    }
?>