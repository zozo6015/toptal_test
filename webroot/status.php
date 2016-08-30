<?php
$DB_HOST = "localhost";
$DB_USER = "root";
$DB_NAME = "mysql";
$DB_PASS = "";

// Create connection
// $conn = mysql_connect($DB_HOST, $DB_USER);
$conn = mysql_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

//Check connection
if (!$conn) {
	die("Connection failed:" . mysql_connect_error());
}

<html>
<head></head>
<body>

<H1>List all the databases</H1>
<br>

<?php
$res = mysql_query("SHOW DATABASES");

while ($row = mysql_fetch_assoc($res)) {
	echo $row['Database'] . "<br>";
}
?>
<br>
<H1>List all the mysql users</H1>
<br>

<?php
if (!mysql_select_db(mysql)) {
	echo "Unable to select mysql: " . mysql_error();
	exit;
}

$res1 = mysql_query("SELECT DISTINCT User from user");

while ($row1 = mysql_fetch_assoc($res1)) {
	echo $row1['User'] . "<br>";
}

?>
</body>
</html>