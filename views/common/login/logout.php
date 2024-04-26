<?php 

session_start();
session_destroy();

header("Location: http://localhost/test/views/common/homepage.php");

?>