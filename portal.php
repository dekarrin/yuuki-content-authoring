<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Portals</h1>
	<table border = 1>
		<tr>
			<th>Name</th>
			<th>Content Pack</th>
			<th>Sprite</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_image = get_portals();
			
			foreach($usable_image as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
		?>
		<tr>
			<td><?php echo $u['name']; ?></td>
			<td><?php echo $c['name']; ?></td>
			<td><?php echo $u['sprite']; ?></td>
			<td><a href="submit.php?action=delete_portal&id=<?php echo $u['id'] ?>">X</a></td>
		</tr>
		<?php
			}
		?>
	</table>
	<hr />
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "submit.php?action=new_portal" method = "post">
		<table border="1">
			<tr>
				<th>Name</th>
				<th>Content Pack</th>
				<th>Sprite</th>
			</tr>
			<tr>
				<td><input type="text" name="name" /></td>
				<td><select type="cid">
		<?php
			$usable_content_packs = get_content_packs();
			foreach($usable_content_packs as $u){
		?>
					<option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
		<?php
			}
		?>
				</select></td>
				<td><select name="spriteid">
		<?php
			$sprites = get_images();
			foreach ($sprites as $s) {
		?>
					<option value="<?php echo $s['id']; ?>"><?php echo $s['filename']; ?></option>
		<?php
			}
		?>
				</select></td>
			</tr>
		</table>
		<input type = "submit" name = "submit" value = "Add Portal">
	</form>
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>