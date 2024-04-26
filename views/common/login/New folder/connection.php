<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "Fitness_For_Everyone";
//Fitness_For_Everyone
//login_sample_db
if(!$con = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname))
{

	die("failed to connect!");
}
