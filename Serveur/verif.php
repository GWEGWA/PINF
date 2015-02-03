<?php

if (isset($_GET["name"]) && isset($_GET["pass"]) && $_GET["name"] != "" && $_GET["pass"] != "" ){
	header("Location:../Client/homepage.php");
	die("");
}else{
	header("Location:../index.php");
	die("");
}

?>