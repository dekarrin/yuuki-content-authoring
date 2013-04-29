<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Backround Music</h1>
	<table border = 1>
		<tr><td>Index</td><td>File Name</td><td>Content Pack</td></tr>
		<?php
			$usable_bgm = get_bgm();	
			foreach($usable_bgm as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['filename']}</td><td>{$u['cid']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
		<label for = "file">Filename:</label>
		<input type = "file" name = "file" id = "file"/>
		<input type = "submit" name = "submit" value = "Submit"/>
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