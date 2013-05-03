<?php require "includes/common.php"; ?>
<html>
	<head>
		<title>YCAT :: Images</title>
		<style>
			img.preview {
				max-width: 50px;
				max-height: 50px;
			}
			table.existing tr {
				height: 50px;
			}
		</style>
	</head>
<body>

	<h1>Images</h1>
	<table border = "1" class="existing">
		<tr>
			<th>Custom Index</th>
			<th>Filename</th>
			<th>Content Pack</th>
			<th>Preview</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_image = get_images();
			
			foreach($usable_image as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				$src = 'images/' . $u['filename'];
		?>
		<tr>
			<td><?php echo $u['customIndex']; ?></td>
			<td><?php echo $u['filename']; ?></td>
			<td><?php echo $c['name']; ?></td>
			<td><img class="preview" src="<?php echo $src; ?>" alt="<?php echo $u['customIndex']; ?> Pic" /></td>
			<td><a href="submit.php?action=delete_image&id=<?php echo $u['id']; ?>">X</a></td>
		</tr>
		<?php
			}
		?>
	</table>
	<hr />
	<form action = "submit.php?action=new_image" method = "post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>Upload File</th>
				<th>Path on Server</th>
				<th>Custom Index</th>
				<th>Content Pack</th>
			</tr>
			<tr>
				<td><input type="file" name="image" /></td>
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
		<input type="submit" value="Add Image" />
	</form>

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>