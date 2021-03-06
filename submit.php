<?php
require "includes/common.php";

// credit to http://ben.lobaugh.net/blog/864/php-5-recursively-move-or-copy-files
// for function
function rcopy($src, $dest){

 

    // If source is not a directory stop processing

    if(!is_dir($src)) return false;

 

    // If the destination directory does not exist create it

    if(!is_dir($dest)) { 

        if(!mkdir($dest)) {

            // If the destination directory could not be created stop processing

            return false;

        }    

    }

 

    // Open the source directory to read in files

    $i = new DirectoryIterator($src);

    foreach($i as $f) {

        if($f->isFile()) {

            copy($f->getRealPath(), "$dest/" . $f->getFilename());

        } else if(!$f->isDot() && $f->isDir()) {

            rcopy($f->getRealPath(), "$dest/$f");

        }

    }

}


// credit to rhodesjason at http://stackoverflow.com/questions/1407338/a-recursive-remove-directory-function-for-php
// for function
function destroy_dir($dir) {
	if (!is_dir($dir) || is_link($dir)) {
		return unlink($dir);
	}
	foreach (scandir($dir) as $file) {
		if ($file == '.' || $file == '..') {
			continue;
		}
		if (!destroy_dir($dir . DIRECTORY_SEPARATOR . $file)) {
			chmod($dir . DIRECTORY_SEPARATOR . $file, 0777);
			if (!destroy_dir($dir . DIRECTORY_SEPARATOR . $file)) {
				return false;
			}
		}
	}
	return rmdir($dir);
} 

function show_success($success, $target, $redir = true) {
	if ($success === FALSE) {
		echo 'An error occured.<br />';
	} else {
		if ($redir) {
			header("Refresh: 5; URL=$target");
		}
		echo 'Complete' . (($redir) ? '; Redirecting in 5 seconds...' : '!') . '<br />';
	}
	echo '<a href="' . $target . '">Back</a>';
}

function confirm_delete_file($dir, $type, $table, $target, $refs) {
	global $db;
	$id = $_GET['id'];
	if (array_key_exists('confirm', $_GET) && $_GET['confirm'] === '1') {
		$files = $db->prepared_select("{$table}_filenames", array($id));
		$filename = $files[0]['filename'];
		$id = $db->escaped($id);
		$s = $db->query("DELETE FROM $table WHERE id='$id'");
		if ($s !== FALSE) {
			unlink($dir . '/' . $filename);
		}
		show_success($s, $target);
	} else {
		$num = 0;
		foreach ($refs as $r) {
			$num += get_reference_count($r[0], $r[1], $id);
		}
		echo "Deleting this record will also delete $num record(s) that reference it.<br/>\n";
		echo "Proceed?<br />\n";
		echo '<a href="submit.php?action=delete_' . $type . '&id=' . $id . '&confirm=1">Yes</a>';
		echo '<br/><br/>';
		echo '<a href="'.$target.'">No</a>';
	}
}

function check_confirm($type, $table, $target, $refs) {
	global $db;
	$id = $_GET['id'];
	if (array_key_exists('confirm', $_GET) && $_GET['confirm'] === '1') {
		$id = $db->escaped($id);
		$s = $db->query("DELETE FROM $table WHERE id='$id'");
		show_success($s, $target);
	} else {
		$num = 0;
		foreach ($refs as $r) {
			$num += get_reference_count($r[0], $r[1], $id);
		}
		echo "Deleting this record will also delete $num record(s) that reference it.<br/>\n";
		echo "Proceed?<br />\n";
		echo '<a href="submit.php?action=delete_' . $type . '&id=' . $id . '&confirm=1">Yes</a>';
		echo '<br/><br/>';
		echo '<a href="'.$target.'">No</a>';
	}
}

function create_unique_name($dest, $target, $ext) {
	$parts = pathinfo($target);
	$file = $parts['filename'];
	if (file_exists($dest . '/' . $file . '.' . $ext)) {
		$num = 0;
		$filename = '';
		do {
			$num++;
			$filename = $file . '_' . $num . '.' . $ext;
		} while (file_exists($dest . '/' . $filename));
		return $filename;
	} else {
		return $file . '.' . $ext;
	}
}

function submit_file($source, $name, $dest_dir, $table, $allowed) {
	global $db;
	if ($_FILES[$name]['error'] > 0) {
		switch ($_FILES[$name]['error']) {
			case UPLOAD_ERR_INI_SIZE:
			case UPLOAD_ERR_FORM_SIZE:
				echo 'File too big!<br />';
				break;
			case UPLOAD_ERR_PARTIAL:
				echo 'Upload interrupted!<br />';
				break;
			case UPLOAD_ERR_NO_FILE:
				echo 'No file uploaded!<br />';
				break;
			case UPLOAD_ERR_NO_TMP_DIR:
			case UPLOAD_ERR_CANT_WRITE:
			case UPLOAD_ERR_EXTENSION:
				echo 'Upload failed! Server configuration error!<br />';
				break;
			default:
				echo 'Upload error #' . $_FILES[$name]['error'] . '<br />';
				break;
		}
		show_success(false, $source);
	} else {
		$type = $_FILES[$name]['type'];
		if (!array_key_exists($type, $allowed)) {
			echo 'Only the following types are allowed for this upload:<br /><ul>';
			foreach ($allowed as $type => $a) {
				echo "<li>$type</li>";
			}
			echo '</ul>';
			show_success(false, $source);
			return;
		}
		$target_name = $_POST['upload_name'];
		$index = $db->escaped($_POST['custom_index']);
		$cid = $db->escaped($_POST['cid']);
		if (!file_exists($dest_dir)) {
			mkdir($dest_dir, 0777, true);
		}
		$final_name = create_unique_name($dest_dir, $target_name, $allowed[$type]);
		$final_dest = $dest_dir . '/' . $final_name;
		move_uploaded_file($_FILES[$name]['tmp_name'], $final_dest);
		$s = $db->query("INSERT INTO $table (cid, filename, customIndex) VALUES ('$cid',
		'$final_name', '$index')");
		show_success($s, $source);
	}
}

	switch($_GET['action']){
		case 'new_bgm':
			submit_file('bgm.php', 'bgm', 'bgms', 'BackgroundMusics', array(
				'audio/wav' => 'wav',
				'audio/x-wav' => 'wav',
				'audio/mpeg' => 'mp3'
			));
			break;
			
		case 'new_sfx':
			submit_file('sfx.php', 'sfx', 'sfxs', 'SoundEffects', array(
				'audio/wav' => 'wav',
				'audio/x-wav' => 'wav',
				'audio/mpeg' => 'mp3'
			));
			break;

		case 'new_action':
			$cid = $db->escaped($_POST['cid']);
			$actionTypeId = $db->escaped($_POST['action_type']);
			$s = $db->query("INSERT INTO Actions (cid, actionTypeId) VALUES
			('$cid', '$actionTypeId')");
			$aid = $db->get_insert_id();
			$param_count = $_POST['param_count'];
			for ($i = 0; $i < $param_count; $i++) {
				$p_id = $db->escaped($_POST['param_id_' . $i]);
				$p_val = $db->escaped($_POST['param_val_' . $i]);
				$s = $db->query("INSERT INTO ActionParameterValues (actionParameterId,
				actionId, paramValue) VALUES ('$p_id', '$aid', '$p_val')");
			}
			show_success($s, 'action.php', true);
			break;
			
		case 'new_portal':
			$spriteId = $db->escaped($_POST['spriteid']);
			$name = $db->escaped($_POST['name']);
			$cid = $db->escaped($_POST['cid']);
			$s = $db->query("INSERT INTO Portals(cid, name, spriteId) VALUES ('$cid', '$name', '$spriteId')");
			show_success($s, 'portal.php');
			break;
			
		case 'new_image':
			submit_file('image.php', 'image', 'images', 'Images', array(
				'image/gif' => 'gif',
				'image/jpeg' => 'jpg',
				'image/png' => 'png'
			));
			break;
			
		case 'new_tile':
			$name = $db->escaped($_POST['name']);
			$traversable = array_key_exists('traversable', $_POST) ? 1 : 0;
			$datachar = $db->escaped($_POST['data_char']);
			$cid = $db->escaped($_POST['cid']);
			$sprite_id = $db->escaped($_POST['sprite_id']);
			$s = $db->query("INSERT INTO Tiles (cid, dataChar, name, spriteId, traversable)
			VALUES ('$cid', '$datachar', '$name', '$sprite_id', '$traversable')");
			show_success($s, 'tile.php', true);
			break;
			
		case 'new_map':
			$cid = $db->escaped($_POST['content_pack']);
			$landId = $db->escaped($_POST['land']);
			$s = $db->query("INSERT INTO Maps (cid, landId) VALUES ('$cid', '$landId')");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php">Back</a>';
			break;
			
		case 'new_entity':
			$hpb = $db->escaped($_POST['hpbase']);
			$hpg = $db->escaped($_POST['hpgain']);
			$mpb = $db->escaped($_POST['mpbase']);
			$mpg = $db->escaped($_POST['mpgain']);
			$strengthb = $db->escaped($_POST['strengthbase']);
			$strengthg = $db->escaped($_POST['strengthgain']);
			$defenseb = $db->escaped($_POST['defensebase']);
			$defenseg = $db->escaped($_POST['defensegain']);
			$agilityb = $db->escaped($_POST['agilitybase']);
			$agilityg = $db->escaped($_POST['agilitygain']);
			$accuracyb = $db->escaped($_POST['accuracybase']);
			$accuracyg = $db->escaped($_POST['accuracygain']);
			$magicb = $db->escaped($_POST['magicbase']);
			$magicg = $db->escaped($_POST['magicgain']);
			$luckb = $db->escaped($_POST['luckbase']);
			$luckg = $db->escaped($_POST['luckgain']);
			$xp = $db->escaped($_POST['xpgiven']);
			$name = $db->escaped($_POST['name']);
			$spriteId = $db->escaped($_POST['spriteid']);
			$cid = $db->escaped($_POST['cid']);
			
			//query may not be correct so sorry for shameful display
			$q = "INSERT INTO Entities(cid, name, spriteId, xp, hpBase, 
				hpGain, mpBase, mpGain, strengthBase, strengthGain, defenseBase,
				defenseGain, agilityBase, agilityGain, accuracyBase, accuracyGain,
				magicBase, magicGain, luckBase, luckGain) VALUES ('$cid', '$name',
				'$spriteId', '$xp', '$hpb', '$hpg', '$mpb', '$mpg',
				'$strengthb', '$strengthg', '$defenseb', '$defenseg', '$agilityb', '$agilityg',
				'$accuracyb', '$accuracyg', '$magicb', '$magicg', '$luckb', '$luckg')";
			$s = $db->query($q);
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=entity.php");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="entity.php">Back</a>';
			break;
			
		case 'new_content_pack':
			$name = $db->escaped($_POST['name']);
			$q = "INSERT INTO ContentPacks (name) VALUES ('$name')";
			$s = $db->query($q);
			show_success($s, 'contentpack.php');
			break;
			
		case 'delete_map_portal':
			$id = $db->escaped($_GET['id']);
			$from = $db->escaped($_GET['from']);
			$s = $db->query("DELETE FROM MapPortals WHERE id='$id'");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php?edit=$from");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php?edit='.$from.'">Back</a>';
			break;
			
		case 'delete_tile':
			check_confirm('tile', 'Tiles', 'tile.php', array(
				array('LandTiles', 'tileId')
			));
			break;
			
		case 'delete_map':
			$id = $db->escaped($_GET['id']);
			$s = $db->query("DELETE FROM Maps WHERE id='$id'");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php">Back</a>';
			break;
			
		case 'delete_map_entity':
			$id = $db->escaped($_GET['id']);
			$from = $db->escaped($_GET['from']);
			$s = $db->query("DELETE FROM MapEntities WHERE id='$id'");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php?edit=$from");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php?edit='.$from.'">Back</a>';
			break;
			
		case 'delete_content_pack':
			check_confirm('content_pack', 'ContentPacks', 'contentpack.php', array(
				array('SoundEffects', 'cid'),
				array('BackgroundMusics', 'cid'),
				array('Actions', 'cid'),
				array('Maps', 'cid'),
				array('Lands', 'cid'),
				array('Entities', 'cid'),
				array('Images', 'cid'),
				array('Portals', 'cid'),
				array('Tiles', 'cid')
			));
			break;
			
		case 'delete_action':
			check_confirm('action', 'Actions', 'action.php', array(
				array('EntityAbilities', 'actionId')
			));
			break;
			
		case 'delete_portal':
			check_confirm('portal', 'Portals', 'portal.php', array(
				array('MapPortals', 'portalId')
			));
			break;
		
		case 'delete_bgm':
			confirm_delete_file('bgms', 'bgm', 'BackgroundMusics', 'bgm.php', array());
			break;
			
		case 'delete_sfx':
			confirm_delete_file('sfxs', 'sfx', 'SoundEffects', 'sfx.php', array());
			break;
			
		case 'delete_image':
			confirm_delete_file('images', 'image', 'Images', 'image.php', array(
				array('Entities', 'spriteId'),
				array('Portals', 'spriteId'),
				array('Tiles', 'spriteId')
			));
			break;
			
		case 'delete_entity':
			$id = $_GET['id'];
			if (array_key_exists('confirm', $_GET) && $_GET['confirm'] === '1') {
				$id = $db->escaped($id);
				$s = $db->query("DELETE FROM Entities WHERE id='$id'");
				if ($s === FALSE) {
					echo 'An error occured.<br />';
				} else {
					header("Refresh: 5; URL=entity.php");
					echo 'Complete; Redirecting in 5 seconds...<br />';
				}
				echo '<a href="entity.php">Back</a>';
			} else {
				$num = get_reference_count('MapEntities', 'entityId', $id);
				echo "Deleting this entity will remove $num map references.<br/>\n";
				echo "Proceed?<br />\n";
				echo '<a href="submit.php?action=delete_entity&id=' . $id . '&confirm=1">Yes</a>';
				echo '<br/><br/>';
				echo '<a href="entity.php">No</a>';
			}
			break;
		
		case 'new_map_portal':
			$mapId = $db->escaped($_POST['map_id']);
			$portalId = $db->escaped($_POST['type']);
			$destMapId = $db->escaped($_POST['dest_map_id']);
			$x = $db->escaped($_POST['x']);
			$y = $db->escaped($_POST['y']);
			$destX = $db->escaped($_POST['dest_x']);
			$destY = $db->escaped($_POST['dest_y']);
			$s = $db->query("INSERT INTO MapPortals (portalId, mapId, x, y,
			destMapId, destX, destY) VALUES ('$portalId', '$mapId', '$x', '$y',
			'$destMapId', '$destX', '$destY')");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php?edit=$mapId");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php?edit='.$mapId.'">Back</a>';
			break;
		
		case 'new_map_entity':
			$mapId = $db->escaped($_POST['map_id']);
			$entityId = $db->escaped($_POST['type']);
			$entityLevel = $db->escaped($_POST['level']);
			$x = $db->escaped($_POST['x']);
			$y = $db->escaped($_POST['y']);
			$s = $db->query("INSERT INTO MapEntities (entityId, mapId, entityLevel, x, y)
			VALUES ($entityId, $mapId, $entityLevel, $x, $y)");
			if ($s === FALSE) {
				echo 'An error occured.<br />';
			} else {
				header("Refresh: 5; URL=map.php?edit=$mapId");
				echo 'Complete; Redirecting in 5 seconds...<br />';
			}
			echo '<a href="map.php?edit='.$mapId.'">Back</a>';
			break;
			
		case 'edit_map':
			$id = $db->escaped($_POST['id']);
			$cid = $db->escaped($_POST['cid']);
			$portal_count = (int) $_POST['portal_count'];
			$entity_count = (int) $_POST['entity_count'];
			$land_id = $db->escaped($_POST['land_id']);
			$portals = array();
			$entities = array();
			for ($i = 0; $i < $portal_count; $i++) {
				$p = array(
					'portalId' => $db->escaped($_POST['portal_type_' . $i]),
					'x' => $db->escaped($_POST['portal_x_' . $i]),
					'y' => $db->escaped($_POST['portal_y_' . $i]),
					'destMapId' => $db->escaped($_POST['portal_dest_' . $i]),
					'destX' => $db->escaped($_POST['portal_dest_x_' . $i]),
					'destY' => $db->escaped($_POST['portal_dest_y_' . $i])
				);
				$portals[$db->escaped($_POST['portal_id_' . $i])] = $p;
			}
			for ($i = 0; $i < $entity_count; $i++) {
				$e = array(
					'x' => $db->escaped($_POST['entity_x_' . $i]),
					'y' => $db->escaped($_POST['entity_y_' . $i]),
					'level' => $db->escaped($_POST['entity_level_' . $i]),
					'entityId' => $db->escaped($_POST['entity_type_' . $i])
				);
				$entities[$db->escaped($_POST['entity_id_' . $i])] = $e;
			}
			$db->query("UPDATE Maps SET cid='$cid', landId='$land_id' WHERE id='$id'");
			foreach ($portals as $p_id => $p) {
				$db->query("UPDATE MapPortals SET portalId='{$p['portalId']}',
				x='{$p['x']}', y='{$p['y']}', destMapId='{$p['destMapId']}',
				destX='{$p['destX']}', destY='{$p['destY']}' WHERE id='$p_id'");
			}
			foreach ($entities as $e_id => $e) {
				$db->query("UPDATE MapEntities SET entityId='{$e['entityId']}',
				entityLevel='{$e['level']}', x='{$e['x']}', y='{$e['y']}'
				WHERE id='$e_id'");
			}
			header("Refresh: 5; URL=map.php?edit=$id");
			echo 'Complete; Redirecting in 5 seconds...<br />';
			echo '<a href="map.php?edit='.$id.'">Back</a>';
			break;
		
		case 'edit_land':
			$id = $db->escaped($_POST['id']);
			$name = $db->escaped($_POST['name']);
			$cid = $db->escaped($_POST['cid']);
			$start_x = $db->escaped($_POST['start_x']);
			$start_y = $db->escaped($_POST['start_y']);
			$width = $db->escaped($_POST['width']);
			$height = $db->escaped($_POST['height']);
			$land_data = $_POST['land_data'];
			$db->query("UPDATE Lands SET name='$name', cid='$cid', startX='$start_x',
			startY='$start_y', width='$width', height='$height'");
			$tiles = string_to_land($land_data);
			break;
			
		case 'reset_all':
			destroy_dir('bgms');
			destroy_dir('images');
			destroy_dir('sfxs');
			mkdir('bgms');
			mkdir('images');
			mkdir('sfxs');
			rcopy('includes/bu/bgms', 'bgms');
			rcopy('includes/bu/images', 'images');
			rcopy('includes/bu/sfxs', 'sfxs');
			$f = fopen('includes/sql/test_data.sql', 'r');
			$data = fread($f, filesize('includes/sql/test_data.sql'));
			$statements = explode(';', $data);
			foreach ($statements as $s) {
				$db->query($s, true);
			}
			echo "DB has been reset to its defaults.<br />";
			echo "Uploaded files have been reset to their defaults.<br />";
			echo '<a href="index.php">Back</a>';
			break;
			
			
		default:
			echo "<h3>Invalid form parameters.</h3>";
			die();
			break;
	}

?>