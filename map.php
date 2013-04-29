<?php
require 'includes/common.php';
$maps = get_maps();
//$maps = array();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>YCAT :: Maps</title>
	</head>
	<body>
<?php
if (!array_key_exists('edit', $_GET)) {
?>
		<table border="1">
			<caption>Maps</caption>
<?php
	if (!empty($maps)) {
?>
			<tr>
				<th>ID</th>
				<th>Content Pack</th>
				<th>Land ID</th>
				<th>Portals</th>
				<th>Entities</th>
				<th>Actions</th>
			</tr>
<?php
		foreach ($maps as $m) {
			$content = get_content_packs($m['cid']);
			$c = $content[0];
			$lands = get_land_by_id($m['landId']);
			$l = $lands[0];
?>
			<tr>
				<td><?php echo $m['id']; ?></td>
				<td><?php echo $c['name']; ?></td>
				<td><?php echo $l['name']; ?></td>
				<td><?php echo count($m['portals']); ?></td>
				<td><?php echo count($m['entities']); ?></td>
				<td><a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $m['id']; ?>">Edit</a></td>
			</tr>
<?php
		}
	} else {
?>
			<tr>
				<td>There are currently no maps.</td>
			</tr>
<?php
	}
?>
		</table>
<?php
} else {
	function check_ref($refed, $refer) {
		if ($refed['id'] == $refer['cid']) {
			echo 'selected="selected"';
		}
	}
	function check_map($mc, $p) {
		if ($p['destMapId'] == $mc['id']) {
			echo 'selected="selected"';
		}
	}
	function check_portal($pt, $p) {
		if ($p['id'] == $pt['id']) {
			echo 'selected="selected"';
		}
	}
	// _GET['edit'] is set
	$edit_id = $_GET['edit'];
	$m = get_map_by_id($edit_id);
	$cps = get_content_packs();
?>
		<h3>Editing Map #<?php echo $edit_id; ?></h3>
		<form action="submit.php?action=edit_map" method="post">
			<input type="hidden" name="id" value="<?php echo $edit_id; ?>" />
			<label>Content Pack</label>
			<select name="cid">
<?php
	foreach ($cps as $c) {
?>
				<option value="<?php echo $c['id']; ?>" <?php check_ref($c, $m); ?>><?php echo $c['name']; ?></option>
<?php
	}
?>
			</select>
			<input type="hidden" name="portal_count" value="<?php echo count($m['portals']); ?>" />
			<table border="1">
				<caption>Portals</caption>
<?php
	if (!empty($m['portals'])) {
		$p_types = get_portals();
		$m_choices = get_maps();
?>
				<tr>
					<th>Coordinates</th>
					<th>Destination Map</th>
					<th>Destination Coordinates</th>
					<th>Type</th>
				</tr>
<?php
		for ($i = 0; $i < count($m['portals']); $i++) {
			$p = $m['portals'][$i];
?>
				<tr>
					<td>(<input type="text" name="portal_x_<?php echo $i; ?>" value="<?php echo $p['x'];?>" />, <input type="text" name="portal_y_<?php echo $i; ?>" value="<?php echo $p['y'];?>" />)</td>
					<td><select name="portal_dest_<?php echo $i; ?>">
<?php
			foreach ($m_choices as $mc) {
?>
						<option value="<?php echo $mc['id']; ?>" <?php check_map($mc, $p); ?>><?php echo $mc['id']; ?></option>
<?php
			}
?>
					</select></td>
					<td>(<input type="text" name="portal_dest_x_<?php echo $i; ?>" value="<?php echo $p['destX'];?>" />, <input type="text" name="portal_dest_y_<?php echo $i; ?>" value="<?php echo $p['destY'];?>" />)</td>
					<td><select name="portal_type_<?php echo $i; ?>">
<?php
			foreach ($p_types as $pt) {
?>
						<option value="<?php echo $pt['id']; ?>" <?php check_portal($pt, $p); ?>><?php echo $pt['name']; ?></option>
<?php	
			}
?>
					</select></td>
				</tr>
<?php
		}
	} else {
?>
<?php
	}
?>
			</table>
			<table>
				<caption>Entities</caption>
				<td>
		</form>
<?php
}
?>
	</body>
</html>