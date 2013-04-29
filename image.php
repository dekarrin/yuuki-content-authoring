<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Image</h1>
	<table border = 1>
		<tr><td>ID</td><td>Filename</td><td>Contentpacks</td></tr>
		<?php
			$usable_image = get_images();
			
			foreach($usable_image as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['filename']}</td><td>{$u['cid']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "submit.php?action=new_image">
		<label for = "file">Filename:</label>
		<input type = "file" name = "file" id = "file"/><br>
		<input type = "submit" name = "submit" value = "Submit">
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