<?php require "includes/common.php"; ?>
<html>
<body>
	<h1>Sound Effects</h1>
	<table border = 1>
		<tr>
			<th>Custom Index</th>
			<th>File Name</th>
			<th>Content Pack</th>
			<th>Preview</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_sfx = get_sfx();
			foreach($usable_sfx as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				$type = '';
				switch (pathinfo($u['filename'], PATHINFO_EXTENSION)) {
					case 'mp3':
						$type = 'audio/mpeg';
						break;
					case 'wav':
					default:
						$type = 'audio/wav';
						break;
				}
				$src = 'sfxs/' . $u['filename'];
		?>
		<tr>
			<td><?php echo $u['customIndex']; ?></td>
			<td><?php echo $u['filename']; ?></td>
			<td><?php echo $c['name']; ?></td>
		<?php
				if ($type == 'audio/mpeg') {
		?>
			<td><object type="application/x-shockwave-flash" data="player.swf" width="200" height="20">
				<param name="movie" value="player.swf" />
				<param name="FlashVars" value="mp3=<?php echo $src; ?>" />
			</object></td>
		<?php
				} else {
		?>
			<td><a href="<?php echo $src; ?>">Listen</a></td>
		<?php
				}
		?>
			<td><a href="submit.php?action=delete_sfx&id=<?php echo $u['id']; ?>">X</a></td></td>
		</tr>
		<?php
			}
		?>
	</table>
	<hr />
	<form action = "submit.php?action=new_sfx" method = "post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>Upload File</th>
				<th>Path on Server</th>
				<th>Custom Index</th>
				<th>Content Pack</th>
			</tr>
			<tr>
				<td><input type="file" name="sfx" /></td>
				<td><input type="text" name="upload_name" /></td>
				<td><input type="text" name="custom_index" /></td>
				<td><select name="cid">
				<?php
			$usable_content_packs = get_content_packs();
			foreach($usable_content_packs as $u){
				echo "<option value=\"{$u['id']}\">{$u['name']}</option>";
			}
				?>
				</select></td>
			</tr>
		</table>
		<input type = "submit" name = "submit" value = "Add Sound Effect"/>
	</form>
	

<?php require 'includes/html/link_box.html'; ?>

</body>
</html>