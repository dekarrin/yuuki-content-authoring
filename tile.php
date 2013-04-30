<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Tiles</h1>
	<table border = 1>
		<tr><th>ID</th><th>Name</th><th>Content Pack</th><th>Data Character</th><th>Traversable</th><th>Sprite</th></tr>
		<?php
			$usable_tiles = get_tiles();
			
			foreach($usable_tiles as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				$t = ($u['traversable'] == '1') ? 'Yes' : 'No';
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['name']}</td><td>{$c['name']}</td>
					<td>{$u['dataChar']}</td><td>$t</td>
					<td>{$u['sprite']}	</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<form action = "submit.php?action=new_image" method = "post">
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
	

<?php require 'includes/html/link_box.html'; ?>
	
</body>
</html>