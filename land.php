<?php
require 'includes/common.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>YCAT :: Land</title>
	</head>
	<body>
		<table>
			<caption>Lands</caption>
<?php
if (!array_key_exists('edit', $_GET)) 
	$lands = get_lands();
	if (!empty($lands)) {
?>
			<tr>
				<th>Name</th>
				<th>Content Pack</th>
				<th>Player Start</th>
				<th>Dimensions</th>
				<th>Actions</th>
			</tr>
<?php
		foreach ($lands as $l) {
			$content = get_content_packs($l['cid']);
			$c = $content[0];
?>
			<tr>
				<td><?php echo $l['name']; ?></td>
				<td><?php echo $c['name']; ?></td>
				<td>(<?php echo $l['startX']; ?>, <?php echo $l['startY']; ?>)</td>
				<td><?php echo $l['width']; ?> x <?php echo $l['height']; ?></td>
				<td><a href="<?php echo $_SERVER['PHP_SELF'] . '?edit=' . $l['id']; ?>">Edit</a></td>
			</tr>				
<?php
		}
	} else {
?>
			<tr>
				<td>There are currently no lands.</td>
			</tr>
<?php
	}
?>
		</table>
<?php
} else {
	function check_content($c, $land) {
		if ($c['id'] == $land['cid']) {
			echo 'selected="selected"';
		}
	}
	$edit_id = $_GET['edit'];
	$lands = get_land_by_id($edit_id);
	if (empty($lands)) {
?>
		<h3>Unknown Land</h3>
		<p><a href="land.php">Back</a></p>
<?php
	} else {
		$land = $lands[0];
		$contents = get_content_packs();
?>
		<h3>Editing Land #<?php echo $edit_id; ?></h3>
		<p><a href="land.php">Back</a></p>
		<form action="edit_land" method="post">
			<input type="hidden" name="id" value="<?php echo $edit_id; ?>" />
			<label>Name:</label><input type="text" name="name" value="<?php echo $land['name']; ?>" /><br />
			<label>Content Pack:</label><select name="cid">
<?php
		foreach ($contents as $c) {
?>
				<option value="<?php echo $c['id']; ?>" <?php check_content($c, $land); ?>><?php echo $c['name']; ?></option>
<?php
		}
?>
			</select><br />
			<label>Player Start:</label>
			(<input type="text" name="start_x" value="<?php echo $land['startX']; ?>" />, <input type="text" name="start_y" value="<?php echo $land['startY']; ?>" />)<br />
			<label>Size:</label>
			<input type="text" name="width" value="<?php echo $land['width']; ?>" /> x <input type="text" name="height" value="<?php echo $land['height']; ?>" /><br />
			<label>Land Data:</label>
			<textarea cols="<?php echo $land['width']; ?>" rows="<?php echo $land['height']; ?>"><?php echo land_to_string($edit_id); ?></textarea>
		</form>
<?php
	}
}
?>
	</body>
</html>