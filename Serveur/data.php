<?php
include("config.php"); 
include("../Libraries/maLibSQL.php");

$data["feedback"] = "ko"; 
$data["result"] = array();

if (isset($_GET["action"])){
    if ($_GET["action"] == "getSearch" && $_GET["contenu"] != ""){
            $searchSQL = mysql_real_escape_string($_GET["contenu"]);
            $SQL = "SELECT tag_name FROM tag WHERE tag_name LIKE '$searchSQL%'";
			$data["result"] = parcoursRs(SQLSelect($SQL));
            $data["feedback"] = "ok";
    }
}

echo json_encode($data);
?>