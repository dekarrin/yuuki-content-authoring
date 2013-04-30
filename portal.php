<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Portals</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td><td>ContenPack</td><td>Sprite</td></tr>
		<?php
			$usable_image = get_portals();
			
			foreach($usable_image as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['name']}</td><td>{$u['cid']}</td>
					<td>{$u['sprite']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "submit.php?action=new_portal" method = "post">
		<label for = "file">Filename:</label>
		<input type = "file" name = "file" id = "file"<br>
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
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>