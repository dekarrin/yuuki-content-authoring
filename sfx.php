<html>
<body>

	<h1>Sound Effects</h1>
	<?php>
		//$results = mysql_query("SELECT * FROM SoundEffect");
		//$numrows = mysql_numrows($results);
		echo "<table>";
		echo "<tr><td>Index</td> <td>Filename</td> <tr>"
		for($i = 0; $i < $numrows; i++){
			//$index = mysql_result($result, $i, "index");
			//$filename = mysql_result($result, $i, "filename");
			
			echo "<tr>\n";
			echo "<td>$id</td> <td>$filename</td>\n";
			echo "<tr>\n";
		}
		echo "</table">";

	</?>

</body>
</html>