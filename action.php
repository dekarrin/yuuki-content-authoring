<?php include "common.php";?>
<html>
<body>

	<h1>Actions</h1>
	<table border = 1>
		<tr><td>ID</td><td>Type</td><td>Parameters</td></tr>
		<?php
			$usable_actions = db->get_action();
			foreach($usable_actions as $u){
				echo "<tr>";
				echo "<td>$u['id']</td><td>$u['type']</td><td>$u['parameters'</td>"
				echo "</tr>";
				}
		?>
	</table>
	<form action "">
		<?php
			
			
		
		
		
		?>
		Action ID: <input type = "text" name "actionid">
		position: <input type = "text" name "position">
		value: <input type = "text" name "value">
	</form>
	
	
</body>
</html>