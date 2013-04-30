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
	
	<form action = "submit.php?action=new_image" = method = "post">
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
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>