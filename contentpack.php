<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr><th>&nbsp;</th><th>Name</th></tr>
		<?php
			$usable_contentpacks = get_content_packs();
			
			foreach($usable_contentpacks as $u){
				echo "<tr>";
				echo "<td><a href=\"submit.php?action=delete_content_pack&id={$u['id']}\">X</a></td><td>{$u['name']}</td>";
				echo "</tr>";
			
			}
		?>
	</table>
	<hr />
	<form action = "submit.php?action=new_content_pack" method = "post">
		<table border="1">
			<tr>
				<th>Name</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input type="text" name="name"></td>
				<td><input type = "submit" value = "Add Content Pack"></td>
			</tr>
		</table>
	</form>
	

<?php require 'includes/html/link_box.html'; ?>
</body>
</html>