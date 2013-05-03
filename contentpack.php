<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr>
			<th>Name</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_contentpacks = get_content_packs();
			
			foreach($usable_contentpacks as $u){
		?>
		<tr>
			<td><?php echo $u['name']; ?></td>
			<td><a href="submit.php?action=delete_content_pack&id=<?php echo $u['id']; ?>">X</a></td>
		</tr>			
		<?php
			}
		?>
	</table>
	<hr />
	<form action = "submit.php?action=new_content_pack" method = "post">
		<table border="1">
			<tr>
				<th>Name</th>
			</tr>
			<tr>
				<td><input type="text" name="name"></td>
			</tr>
		</table>
		<input type = "submit" value = "Add Content Pack" />
	</form>
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>