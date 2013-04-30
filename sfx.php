<?php require "includes/common.php"; ?>
<html>
<body>

	<h1>Sound Effects</h1>
	<table border = 1>
		<tr><th>Index</th><th>File Name</th><th>Content Pack</th></tr>
		<?php
			$usable_sfx = get_sfx();
			foreach($usable_sfx as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['filename']}</td><td>{$c['name']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	
	<form action = "submit.php?action=new_sfx" method = "post">
	<label for = "file">Filename:</label>
	<input type = "file" name = "file" id = "file"/><br>
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