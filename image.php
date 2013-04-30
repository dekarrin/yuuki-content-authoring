<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Image</h1>
	<table border = 1>
		<tr><th>ID</th><th>Filename</th><th>Content Pack</th></tr>
		<?php
			$usable_image = get_images();
			
			foreach($usable_image as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['filename']}</td><td>{$c['name']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<form action = "submit.php?action=new_image" method = "post">
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
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>