<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Portals</h1>
	<table border = 1>
		<tr><th>&nbsp;</th><th>Name</th><th>ContentPack</th><th>Sprite</th></tr>
		<?php
			$usable_image = get_portals();
			
			foreach($usable_image as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				echo "<tr>";
				echo "<td><a href=\"submit.php?action=delete_portal&id={$u['id']}\">X</a></td><td>{$u['name']}</td><td>{$c['name']}</td>
					<td>{$u['sprite']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "submit.php?action=new_portal" method = "post">
		Name: <input type="text" name="name" /><br />
		<?php
			$usable_content_packs = get_content_packs();
			echo "ContentPack: <select name=\"cid\">";
			foreach($usable_content_packs as $u){
				echo "<option value=\"{$u['id']}\">{$u['name']}</option>";
			}
			echo "</select><br />";
		?>
		Sprite: <select name="spriteid">
		<?php
			$sprites = get_images();
			foreach ($sprites as $s) {
		?>
			<option value="<?php echo $s['id']; ?>"><?php echo $s['filename']; ?></option>
		<?php
			}
		?>
		<input type = "submit" name = "submit" value = "Add Portal">
	</form>
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>