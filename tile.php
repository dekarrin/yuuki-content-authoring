<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Tiles</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td><td>Content Pack</td><td>Data Character</td><td>Traversable</td><td>Sprite</td></tr>
		<?php
			$usable_tiles = get_tiles();
			
			foreach($usable_tiles as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['name']}</td><td>{$u['cid']}</td>
					<td>{$u['datachar']}</td><td>{$u['traversable']}</td>
					<td>{$u['sprite']}	</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
		<label for = "file">Filename:</label>
		<input type = "file" name = "file" id = "file"><br>
		Name: <input type = "text" name = "name">
		Traversable: <input type = "radio" name = "traversable" value = "true">True
		<input type = "radio" name = "traversable" value = "false">False
		Data Character: <input type = "text" name = "datachar">
		<input type = "submit" name = "submit" value = "Submit">
	</form>
	
</body>
</html>