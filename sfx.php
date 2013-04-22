<html>
<body>

	<h1>Sound Effects</h1>
	<table border = 1>
		<tr><td>Index</td><td>File Name</td></tr>
		<?php
			//$result = mysql_query("SELECT * FROM SoundEffect);
			//$numrows = mysql_numrows(%result);
			//for($i = 0; $i < $numberrows; i++){
				//$index = mysql_result($result, $i, "index");
				//$filename = mysql_result($result, $i, "filename");
				//echo "<tr>";
				//echo "<td>$id</td> <td>$filename</td>";
				//echo "</tr>";
			//}
		?>
	</table>
	
	<!--TODO: upload_file.php needds to be coded-->
	<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
	<label for = "file">Filename:</label>
	<input type = "file" name = "file" id = "file"<br>
	<input type = "submit" name = "submit" value = "Submit">
	</form>

</body>
</html>