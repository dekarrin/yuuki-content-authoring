<?php include "common.php"; ?>
<html>
<body>

	<h1>Content Packs</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td></tr>
		<?php
			$usable_contentpacks = db->get_contentpacks();
			
			foreach($usable_contentpacks as $u){
				echo "<tr>";
				echo "<td>$u['id']</td><td>$u['name']</td>";
				echo "</tr>";
			
			}
		?>
	</table>
	
	<!--TODO:.input.php needds to be coded-->
	<form name = "input" action = "input.php" method = "get">
		Content Pack name: <input type="text" name="firstname">
	<input type = "submit" value = "Submit">
	</form>
</body>
</html>