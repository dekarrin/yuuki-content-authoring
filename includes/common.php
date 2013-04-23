<?php
// Contains includes common to all files

// format of require_once; include, include_once, and require are similar.
//require_once("includes/lib/name_of_file.php")

require_once('includes/config.php');
require_once("includes/lib/database.php");

$db = new Database($config['host'] . ':' . $config['port']);
$db->connect($config['user'], $config['pass'], $config['db']);
?>