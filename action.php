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
	<form action "">
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
	</form>
	
	<a href="bgm.php">Backround Music</a>
		<a href="sfx.php">Sound Effects</a>
		<a href="contentpack.php">Content Packs</a>
		<a href="image.php">Image</a>
		<a href="action.php">Actions</a>
		<a href="portal.php">Portal</a>
		<a href="entity.php">Entity</a>
		<a href="tile.php">Tile</a>
		<a href="map.php">Map</a>
</body>
</html>