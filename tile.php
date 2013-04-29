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
					<td>{$u['dataChar']}</td><td>{$u['traversable']}</td>
					<td>{$u['sprite']}	</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
		<label for = "file">Filename:</label><br>
		<input type = "file" name = "file" id = "file"><br>
		Name: <input type = "text" name = "name"><br>
		Traversable: <input type = "radio" name = "traversable" value = "true">True
		<input type = "radio" name = "traversable" value = "false">False<br>
		Data Character: <input type = "text" name = "datachar"><br>
		<input type = "submit" name = "submit" value = "Submit"><br>
		<?php
			$usable_content_packs = get_content_packs();
			echo "<select>";
			foreach($usable_content_packs as $u){
				echo "<option value=\"{$u['name']}\">{$u['name']}</option>";
			}
			echo "</select>";
		?>
	</form>
	
	<a href="bgm.php">Backround Music</a>
	<a href="sfx.php">Sound Effects</a>
	<a href="contentpack.php">Content Packs</a>
	<a href="image.php">Image</a>
	<a href="action.php">Actions</a>
	<a href="portal.php">Portal</a>
	<a href="entity.php">Entity</a>
	<a href="tile.php">Tile</a>
	<a href="map.php">Map</a>
	
</body>
</html>