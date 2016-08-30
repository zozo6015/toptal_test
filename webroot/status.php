<?php
$DB_HOST = "localhost";
$DB_USER = "root";
$DB_NAME = "mysql";
$DB_PASS = "";

// Create connection
$conn = mysql_connect($DB_HOST, $DB_USER);
$conn1 = mysql_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

//Check connection
if (!$conn) {
	die("Connection failed:" . mysql_connect_error());
}
if (!$conn1) {
	die("Connection failed:" . mysql_connect_error());
}

$res = mysql_query("SHOW DATABASES");
$res1 = mysql_query("SELECT DISTINCT User from user");

while ($row = mysql_fetch_assoc($res)) {
	echo $row['Database'] . "\n";
}

while ($row1 = mysql_fetch_assoc($res1)) {
	echo $row1['User'] . "\n";
}

?>