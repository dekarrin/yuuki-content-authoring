<?php include "common.php"; ?>
<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td><td>ContenPack</td><td>Sprite</td></tr>
		<?php
			$usable_image = db->get_images();
			
			foreach($usable_image as $u){
				echo "<tr>";
				echo "<td>$u['id']</td><td>$u['name']</td><td>$u['cid']</td>
					<td>$u['sprite']</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<!--TODO: upload_file.php needs to be coded-->
	<form action = "upload_file.php" method = "post" enctype = "multipart/form-data">
		<label for = "file">Filename:</label>
		<input type = "file" name = "file" id = "file"<br>
		<input type = "submit" name = "submit" value = "Submit">
	</form>
</body>
</html>