<?php include "includes/common.php";?>
<html>
<body>

	<h1>Actions</h1>
	<table border = 1>
		<tr><td>ID</td><td>Type</td><td>Parameters</td></tr>
		<?php
			$usable_actions = get_actions();
			
			foreach($usable_actions as $u){
				$params_str = '';
				
				foreach($u['params'] as $p){
					$params_str .= $p['name'] . '(' . $p['value'] . ')';
				}
					echo "<tr>";
					echo "<td>{$u['id']}</td><td>{$u['type']}</td>
					<td>{$params_str}</td>";
					echo "</tr>";
			}
		?>
	</table>
	<form action = "submit.php?action=new_action" method = "post">
		<?php
			$usable_actiontypes = get_action_types();
			echo "<select>";
			foreach($usable_actiontypes as $u){
				echo "<option value = '{$u['name']}'>{$u['name']}</option>";
			}
			echo "</select>";
			
		?>
		Action ID: <input type = "text" name "actionid">
		position: <input type = "text" name "position">
		value: <input type = "text" name "value">
		<?php
			$usable_content_packs = get_content_packs();
			echo "<select>";
			foreach($usable_content_packs as $u){
				echo "<option value=\"{$u['name']}\">{$u['name']}</option>";
			}
			echo "</select>";
		?>
		<input type="submit" value="Submit">
	</form>
	
<?php require 'includes/html/link_box.html'; ?>
</body>
</html>