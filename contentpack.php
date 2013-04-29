<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td></tr>
		<?php
			$usable_contentpacks = get_contentpacks();
			
			foreach($usable_contentpacks as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['name']}</td>";
				echo "</tr>";
			
			}
		?>
	</table>
	
	<!--TODO:.input.php needds to be coded-->
	<form name = "input" action = "input.php" method = "get">
		Content Pack name: <input type="text" name="firstname">
	<input type = "submit" value = "Submit">
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