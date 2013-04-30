<?php
require "includes/common.php";
	switch($_GET['action']){
		case 'new_bgm':
			//file uploading stuff here.
			
			//$filename = $some_other_file_name;
			//$id = $db->escaped($_POST['id']);
			//$cid = $db->escaped($_POST['cid']);
			//$customIndex = $db->escaped($_POST['customIndex'];
			//$q = query("INSERT INTO SoundEffects(id, cid, filename, customIndex) VALUES('$id','$cid','$filename','$customIndex')";
			
			break;
		case 'new_sfx':
			//fileuploading stuff here.
			
			//$filename = $some_other_file_name;
			//$id = $db->escaped($_POST['id']);
			//$cid = $db->escaped($_POST['cid']);
			//$customIndex = $db->escaped($_POST['customIndex'];
			//$q = query("INSERT INTO SoundEffects(id, cid, filename, customIndex) VALUES('$id','$cid','$filename','$customIndex')";
			
			break;
		case 'new_action':
			$id;
			$cid;
			$actionTypeId = $db->escaped($_POST['value']);
			$q = query("INSERT INTO Actions(id, cid, actionTypeId VALUES ('$id', '$cid', '$actionTypeId')");
			$db->query($q);
			break;
		case 'new_portal':
			//file uploading stuff here
			$filename = $some_file_name_idk;
			$spriteId = $db->escaped($some_sprite_id);
			$q = query("INSERT INTO Portals(id, cid, name, spriteId) VALUES ('','','$filename','$spriteId')");
			$db->query($q);
			break;
		case 'new_image':
			//uploading stuff here
			//$name = $db->escaped($some_file_name);
			//$cid = $db->escaped($_POST['contentpackname']);
			//$q = query("INSERT INTO Images(id, cid, filname, customIndex) VALUES ('', $cid, '$name', '')");
			$db->query($q);
			break;
		case 'new_tile':
			//file stuff needs to be done
			$name = $db->escaped($_POST['name']);
			$traversable = $db->escaped($_POST['traversable']);
			$datachar = $db->esavped($_POST['datachar']);
			//needs to be implemnted correctly
			$contentpacks = $db->escaped($_POST['']);
			
			$q = query("INSERT INTO Tiles (id, cid, dataChar, name, traversable, spriteId)
				VALUES ('', '', $datachar, '$name', '%$traversable', '$sprite')");
			$db->query($q);
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
			
		case 'new_content_packs':
			$name = $db->escaped($_POST['name']);
			$q = "INSERT INTO ContentPacks (name) VALUES ('$name')";
			$db->query($q);
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
			
		default:
			echo "<h3>Invalid form parameteres.</h3>";
			die();
			break;
	}
















?>