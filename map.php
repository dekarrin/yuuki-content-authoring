<?php
require 'includes/common.php';
$maps = get_maps();
//$maps = array();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>YCAT :: Maps</title>
		<style>
			input[type="text"] {
				width: 30px;
			}
		</style>
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
				<th>Land</th>
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
				<td><a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $m['id']; ?>">Edit</a>
				<a href="submit.php?action=delete_map&id=<?php echo $m['id']; ?>">Delete</a>
				</td>
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
		<hr />
		<form action="submit.php?action=new_map" method="post">
			<table border="1">
				<tr>
					<th>Content Pack</th>
					<th>Land</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td><select name="content_pack">
<?php
	$cps = get_content_packs();
	foreach ($cps as $cp) {
		echo "\t\t\t\t\t\t<option value=\"{$cp['id']}\">{$cp['name']}</option>\n";
	}
?>
					</select></td>
					<td><select name="land">
<?php
	$lands = get_lands();
	foreach ($lands as $l) {
		echo "\t\t\t\t\t\t<option value=\"{$l['id']}\">{$l['name']}</option>\n";
	}
?>
					</select></td>
					<td><input type="submit" value="Add Map" /></td>
				</tr>
			</table>
		</form>
<?php
} else {
	function check_land($l, $m) {
		if ($l['id'] == $m['landId']) {
			echo 'selected="selected"';
		}
	}
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
		if ($p['portalId'] == $pt['id']) {
			echo 'selected="selected"';
		}
	}
	function check_entity($et, $e) {
		if ($et['id'] == $e['entityId']) {
			echo 'selected="selected"';
		}
	}
	// _GET['edit'] is set
	$edit_id = $_GET['edit'];
	$m = get_map_by_id($edit_id);
	if (is_null($m)) {
?>
		<h3>Unknown Map</h3>
		<p><a href="map.php">Back</a></p>
<?php
	} else {
		$cps = get_content_packs();
?>
		<h3>Editing Map #<?php echo $edit_id; ?></h3>
		<p><a href="map.php">Back</a></p>
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
			<br />
			<label>Land</label>
			<select name="land_id">
<?php
		$lands = get_lands();
		foreach ($lands as $l) {
?>
				<option value="<?php echo $l['id']; ?>" <?php check_land($l, $m); ?>><?php echo $l['name'];?></option>
<?php
		}
?>
			</select>
			<input type="hidden" name="portal_count" value="<?php echo count($m['portals']); ?>" />
			<input type="hidden" name="entity_count" value="<?php echo count($m['entities']); ?>" />
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
					<th>&nbsp;</th>
				</tr>
<?php
			for ($i = 0; $i < count($m['portals']); $i++) {
				$p = $m['portals'][$i];
?>
				<tr>
					<td>(<input type="text" name="portal_x_<?php echo $i; ?>" value="<?php echo $p['x'];?>" />, <input type="text" name="portal_y_<?php echo $i; ?>" value="<?php echo $p['y'];?>" />)</td>
					<td><input type="hidden" name="portal_id_<?php echo $i; ?>" value="<?php echo $p['id']; ?>" />
					<select name="portal_dest_<?php echo $i; ?>">
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
					<td><a href="submit.php?action=delete_map_portal&id=<?php echo $p['id']; ?>&from=<?php echo $edit_id; ?>">Delete</a></td>
				</tr>
<?php
			}
		} else {
?>
				<tr>
					<td>There are currently no portals in this map</td>
				</tr>
<?php
		}
?>
			</table>
			<br />
			<table border="1">
				<caption>Entities</caption>
<?php
		if (!empty($m['entities'])) {
			$e_types = get_entities();
?>
				<tr>
					<th>Coordinates</th>
					<th>Level</th>
					<th>Type</th>
					<th>&nbsp;</th>
				</tr>
<?php
			for ($i = 0; $i < count($m['entities']); $i++) {
				$e = $m['entities'][$i];
?>
				<tr>
					<td>(<input type="text" name="entity_x_<?php echo $i; ?>" value="<?php echo $e['x'];?>" />, <input type="text" name="entity_y_<?php echo $i; ?>" value="<?php echo $e['y'];?>" />)</td>
					<td><input type="text" name="entity_level_<?php echo $i; ?>" value="<?php echo $e['level']; ?>" /></td>
					<td><input type="hidden" name="entity_id_<?php echo $i; ?>" value="<?php echo $e['id']; ?>" />
					<select name="entity_type_<?php echo $i; ?>">
<?php
				foreach ($e_types as $et) {
?>
						<option value="<?php echo $et['id']; ?>" <?php check_entity($et, $e); ?>><?php echo $et['name'] ?></option>
<?php
				}
?>
					</select></td>
					<td><a href="submit.php?action=delete_map_entity&id=<?php echo $e['id']; ?>&from=<?php echo $edit_id; ?>">Delete</a></td>
				</tr>
<?php
			}
		} else {
?>
				<tr>
					<td>There are currently no entities in this map</td>
				</tr>
<?php
		}
?>
			</table>
			<br />
			<input type="submit" value="Update" />
		</form>
		<hr />
		<form action="submit.php?action=new_map_portal" method="post">
			<input type="hidden" name="map_id" value="<?php echo $edit_id; ?>" />
			<table border="1">
				<tr>
					<th>Coordinates</th>
					<th>Destination Map</th>
					<th>Destination Coordinates</th>
					<th>Type</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td>(<input type="text" name="x" />, <input type="text" name="y" />)</td>
					<td><select name="dest_map_id">
<?php
		$maps = get_maps();
		foreach ($maps as $m) {
			echo "\t\t\t\t\t" . '<option value="' . $m['id'] . '">' . $m['id'] . '</option>' . "\n";
		}
?>
					</select></td>
					<td>(<input type="text" name="dest_x" />, <input type="text" name="dest_y" />)</td>
					<td><select name="type">
<?php
		$portals = get_portals();
		foreach ($portals as $p) {
			echo "\t\t\t\t\t" . '<option value="' . $p['id'] . '">' . $p['name'] . '</option>' . "\n";
		}
?>
					</select></td>
					<td><input type="submit" value="Add Portal" /></td>
				</tr>
			</table>
		</form>
		<hr />
		<form action="submit.php?action=new_map_entity" method="post">
			<input type="hidden" name="map_id" value="<?php echo $edit_id; ?>" />
			<table border="1">
				<tr>
					<th>Coordinates</th>
					<th>Level</th>
					<th>Type</th>
					<th>&nbsp;</th>
				</tr>
				<tr>
					<td>(<input type="text" name="x" />, <input type="text" name="y" />)</td>
					<td><input type="text" name="level" /></td>
					<td><select name="type">
<?php
		$entities = get_entities();
		foreach ($entities as $e) {
			echo "\t\t\t\t\t" . '<option value="' . $e['id'] . '">' . $e['name'] . '</option>' . "\n";
		}
?>
					</select></td>
					<td><input type="submit" value="Add Entity" /></td>
				</tr>
			</table>
		</form>
		<p><a href="map.php">Back</a></p>
<?php
	}
}
?>
<?php require 'includes/html/link_box.html'; ?>
	</body>
</html>