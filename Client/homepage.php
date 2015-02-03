<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../Style/style.css">
    <script type="text/javascript" src="../JavaScript/jquery.js"></script>
    <script type="text/javascript" src="../JavaScript/script.js"></script>
    <title>Homepage</title>
</head>

<body>
	<h1>Homepage</h1><br/>
	<span>Hello world !</span><br/>
	<a href="setting.php">Settings</a>
    <div id="search">
        <div id="searchInpImg">
            <input type="text" id="txtSearch" onkeyup="load(event)" placeholder="Search..."/>
            <img src="../Ressources/Others/loupe.jpg" id="loupe"/>
            <img src="../Ressources/Others/ajax-loader.gif" id="loader"/>
        </div>
        <ul id="suggest">
	    </ul>
    </div>
</body>

</html>