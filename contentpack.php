<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td></tr>
		<?php
			//$result = mysql_query("SELECT * FROM ContentPack);
			//$numrows = mysql_numrows(%result);
			//for($i = 0; $i < $numrows; i++){
				//$index = mysql_result($result, $i, "id");
				//$name = mysql_result($result, $i, "name");
				//echo "<tr>";
				//echo "<td>$id</td> <td>$name</td>";
				//echo "</tr>";
			//}
		?>
	</table>
	
	<!--TODO:.input.php needds to be coded-->
	<form name = "input" action = "input.php" method = "get">
		Content Pack name: <input type="text" name="firstname">
	<input type = "submit" value = "Submit">
	</form>
</body>
</html>