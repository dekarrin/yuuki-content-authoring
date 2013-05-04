<?php include "includes/common.php";?>
<html>
<head>
	<title>YCAT :: Actions</title>
	<script type="text/javascript" src="actions.js"></script>
</head>
<body>

	<h1>Actions</h1>
	<table border = 1>
		<tr>
			<th>External Name</th>
			<th>Type</th>
			<th>Parameters</th>
			<th>Content Pack</th>
			<th>Delete</th>
		</tr>
		<?php
			$usable_actions = get_actions();
			
			foreach($usable_actions as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				$params_str = '&nbsp;';
				$p_str = '';
				if (count($u['params']) > 0) {
					$params_str = '';
					foreach($u['params'] as $p){
						$params_str .= $p['name'] . ' = ' . $p['value'] . ', ';
						$p_str .= $p['value'] . ', ';
					}
					$params_str = substr($params_str, 0, strlen($params_str)-2);
					$p_str = substr($p_str, 0, strlen($p_str)-2);
				}
				$ex_name = $u['type'] . '(' . $p_str . ')';
		?>
		<tr>
			<td><?php echo $ex_name; ?></td>
			<td><?php echo $u['type']; ?></td>
			<td><?php echo $params_str; ?></td>
			<td><?php echo $c['name']; ?></td>
			<td><a href="submit.php?action=delete_action&id=<?php echo $u['id']; ?>">X</a></td>
		</tr>
		<?php
			}
		?>
	</table>
	<hr />
	<form action="submit.php?action=new_action" method="post" id="add_form">
		<table border="1">
			<tr id="add_headers">
				<th>Content Pack</th>
				<th>Action Base</th>
			</tr>
			<tr id="add_data">
				<td><select name="cid">
		<?php
			$usable_content_packs = get_content_packs();
			foreach($usable_content_packs as $u) {
		?>
					<option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
		<?php
			}
		?>
				</select></td>
				<td><select name="action_type" onchange="actionTypeChanged()" id="base_selector">
					<option value="" selected="selected">(Select One)</option>
		<?php
			$usable_actiontypes = get_action_types();
			foreach($usable_actiontypes as $u) {
		?>
					<option value="<?php echo $u['id']; ?>"><?php echo $u['name']; ?></option>
		<?php
			}
		?>
				</select></td>
			</tr>
		</table>
		<input id="add_count" type="hidden" name="param_count" value="0" />
		<input type="submit" value="Add Action">
	</form>
	
<?php require 'includes/html/link_box.html'; ?>
</body>
</html>