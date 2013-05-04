<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Tiles</h1>
	<table border = 1>
		<tr>
			<th>Name</th>
			<th>Content Pack</th>
			<th>Data Character</th>
			<th>Traversable</th>
			<th>Sprite</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_tiles = get_tiles();
			
			foreach($usable_tiles as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				$t = ($u['traversable'] == '1') ? 'Yes' : 'No';
		?>
		<tr>
			<td><?php echo $u['name']; ?></td>
			<td><?php echo $c['name']; ?></td>
			<td><?php echo $u['dataChar']; ?></td>
			<td><?php echo $t; ?></td>
			<td><?php echo $u['sprite']; ?></td>
			<td><a href="submit.php?action=delete_tile&id=<?php echo $u['id']; ?>">X</a>
		</tr>
		<?php
			}
		?>
	</table>
	<hr />
	<form action = "submit.php?action=new_tile" method = "post">
		<table border="1">
			<tr>
				<th>Name</th>
				<th>Content Pack</th>
				<th>Data Character</th>
				<th>Traversable</th>
				<th>Sprite</th>
			</tr>
			<tr>
				<td><input type="text" name="name" /></td>
				<td><select name="cid">
			<?php
			$usable_content_packs = get_content_packs();
			foreach($usable_content_packs as $u){
			?>
					<option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
			<?php
			}
			?>
				</select></td>
				<td><input type="text" name="data_char" /></td>
				<td><input type="checkbox" name="traversable" /></td>
				<td><select name="sprite_id">
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
		<input type="submit" value="Add New Tile" />
	</form>
	

<?php require 'includes/html/link_box.html'; ?>
	
</body>
</html>