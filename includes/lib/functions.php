<?php

/**
 * Functions for interacting with the database.
 *
 * Many functions return either a single array of associative arrays or a single
 * associative array. The exact format of the associative array depends on the item
 * requested, and the different formats are outlined below.
 *
 * Action:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID of the action)
 *			['cid'] => (int - The ID of the content pack that the action is defined in)
 *			['type'] => (string - the type/name of the action base)
 *			['params'] => Array (
 *				[0] => Array (
 *					['id'] => (int - The id of this param)
 *					['position'] => (int - The position in the argument list)
 *					['type'] => (string - The data type of this parameter)
 *					['name'] => (string - What to call this param)
 *					['value'] => (mixed - The value of this param)
 *				)
 *				[1] => Array (
 *					. . .
 *				)
 *				. . .
 *			)
 *		)
 *		. . .
 * )
 *
 * Entity:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID of this entity)
 *			['cid'] => (int - The ID of the content pack that this entity belongs to)
 *			['name'] => (string - The name of the entity)
 *			['sprite'] => (string - the filename of the sprite)
 *			['xp'] => (int - The amount of XP given on death)
 *			['hpBase']
 *			['hpGain']
 *			['mpBase']
 *			... (check schema for entity details)
 *			['luckGain']
 *			['actions'] => (Array(Action) - The actions that this entity knows)
 *
 * Tile:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID of the tile)
 *			['cid'] => (int - The ID of the content pack that this tile belongs to)
 *			['dataChar'] => (char - The character that represents this tile in editing)
 *			['name'] => (string - The name of this tile)
 *			['traversable'] => (bool - Whether the tile may be walked on)
 *			['sprite'] => (string - the filename of the sprite)
 *
 * Portal:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID)
 *			['cid'] => (int - The ID of the content pack that this portal is in)
 *			['name'] => (string - The name of the portal)
 *			['sprite'] => (string - the filename of the sprite)
 *
 * Image, BackgroundMusic, SoundEffect:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID)
 *			['cid'] => (int - The ID of the content pack)
 *			['filename'] => (string - The location on server of the image file)
 *			['customIndex'] => (string - The fake foreign key used in exported files)
 *
 * ContentPack:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID)
 *			['name'] => (string - The name of the content pack)
 *			['isBase'] => (bool - Whether this content pack is included in Yuuki)
 *			['spriteDir'] => (string - Where entity sprites are located)
 *			['tileDir'] => (string - Where tile sprites are located)
 *			['bgDir'] => (string - Where background images are located)
 *			['portalDir'] => (string - Where portal sprites are located)
 *
 * Land:
 * Array (
 *		[0] => Array (
 *			['id'], ['cid'], ['name'], ['startX'], ['startY'] - player start coords
 *			['width'], ['height'],
 *			['tiles']: Array (
 *				... (all fields of Tile, + ['x'] and ['y'])
 *				
 * Map:
 * Array (
 *		[0] => Array (
 *			['id'], ['landId'], ['cid'],
 *			['portals']: Array (
 *				Portal -format, but adds ['x'] ['y'] ['destMapId'] ['destX'] ['destY'] ['portalId'],
 *				['id'] is actually the map portal id.
 *			['entities']: Array (
 *				Entity array, but adds ['x'] ['y'] ['level'] ['entityId'],
 *				['id'] is actually the map entity id.
 *
 * ActionType:
 * Array (
 *		[0] => Array (
 *			['id'], ['name']
 */

/**
 * Gets all actions for a content pack.
 * $cid - The id of the content pack to get actions for; set to NULL for all
 * content packs.
 * Returns an array of Actions.
 */
function get_actions($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_actions' : 'get_actions_for_cid';
	$actions = $db->prepared_select($stmt, $args);
	set_action_params($actions);
	return $actions;
}

/**
 * Gets all entites for a content pack
 * $cid - The id of the content pack to get entities for; set to NULL for all
 * content packs.
 * Returns an array of Entity format arrays.
 */
function get_entities($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_entities' : 'get_entities_for_cid';
	$entities = $db->prepared_select($stmt, $args);
	foreach ($entities as &$e) {
		$e['actions'] = get_entity_actions($e['id']);
	}
	return $entities;
}

/**
 * Gets all tiles for a content pack
 * $cid - The id of the content pack to get tiles for; set to NULL for all
 * content packs.
 * Returns an array of Tile format arrays.
 */
function get_tiles($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_tiles' : 'get_tiles_for_cid';
	$tiles = $db->prepared_select($stmt, $args);
	return $tiles;
}

/**
 * Gets all tiles for a land.
 * $land_id - The id of the land to get tiles for.
 * Returns an array of Tile format arrays.
 */
function get_land_tiles_for_land_id($land_id) {
	global $db;
	return $db->prepared_select('get_land_tiles_for_land_id', array($land_id));
}

/**
 * Gets all portals for a content pack
 * $cid - The id of the content pack to get portals for; set to NULL for all
 * content packs.
 * Returns an array of Portal format arrays.
 */
function get_portals($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_portals' : 'get_portals_for_cid';
	$portals = $db->prepared_select($stmt, $args);
	return $portals;
}

/**
 * Gets all images for a content pack
 * $cid - The id of the content pack to get images for; set to NULL for all
 * content packs.
 * Returns an array of Image format arrays.
 */
function get_images($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_images' : 'get_images_for_cid';
	$images = $db->prepared_select($stmt, $args);
	return $images;
}

/**
 * Gets all background music for a content pack
 * $cid - The id of the content pack to get background music for; set to NULL for all
 * content packs.
 * Returns an array of BackgroundMusic format arrays.
 */
function get_bgm($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_bgm' : 'get_bgm_for_cid';
	$bgm = $db->prepared_select($stmt, $args);
	return $bgm;
}

/**
 * Gets all sound effects for a content pack
 * $cid - The id of the content pack to get sound effects for; set to NULL for all
 * content packs.
 * Returns an array of SoundEffect format arrays.
 */
function get_sfx($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_sfx' : 'get_sfx_for_cid';
	$sfx = $db->prepared_select($stmt, $args);
	return $sfx;
}

/**
 * Gets all action types.
 */
function get_action_types() {
	global $db;
	return $db->prepared_select('get_action_types');
}

/**
 * Gets content packs.
 * $id - The id of the content pack to get; set to null for all content packs.
 * Returns an array of ContentPack format arrays.
 */
function get_content_packs($id = NULL) {
	global $db;
	$args = (is_null($id)) ? NULL : array($id);
	$stmt = (is_null($id)) ? 'get_content_packs' : 'get_content_packs_for_id';
	$cps = $db->prepared_select($stmt, $args);
	return $cps;
}

/**
 * Gets all lands for a content pack
 * $cid - The id of the content pack to get lands for; set to NULL for all
 * content packs.
 * Returns an array of Land format arrays.
 */
function get_lands($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_lands' : 'get_lands_for_cid';
	$lands = $db->prepared_select($stmt, $args);
	foreach ($lands as &$l) {
		$l['tile'] = $db->prepared_select('get_land_tiles_for_land_id', array($l['id']));
	}
	return $lands;
}

/**
 * Returns the Land with the given id.
 */
function get_land_by_id($id) {
	global $db;
	return $db->prepared_select('get_lands_for_id', array($id));
}
 
/**
 * Gets all maps for a content pack
 * $cid - The id of the content pack to get maps for; set to NULL for all
 * content packs.
 * Returns an array of Map format arrays.
 */
function get_maps($cid = NULL) {
	global $db;
	$args = (is_null($cid)) ? NULL : array($cid);
	$stmt = (is_null($cid)) ? 'get_maps' : 'get_maps_for_cid';
	$maps = $db->prepared_select($stmt, $args);
	foreach ($maps as &$m) {
		$m['portals'] = $db->prepared_select('get_map_portals_for_map_id', array($m['id']));
		$m['entities'] = $db->prepared_select('get_map_entities_for_map_id', array($m['id']));
	}
	return $maps;
}

/**
 * Gets a map of a specific id.
 * $id - The id of the map to get.
 */
function get_map_by_id($id) {
	$maps = get_maps();
	foreach ($maps as $m) {
		if ($m['id'] == $id) {
			return $m;
		}
	}
	return NULL;
}

/**
 * Gets all actions for an entity.
 * $entity_id - The ID of the entity to get actions for.
 * Returns an array of Actions.
 */
function get_entity_actions($entity_id) {
	global $db;
	$actions = $db->prepared_select('get_actions_for_entity', array($entity_id));
	set_action_params($actions);
	return $actions;
}

/**
 * Sets the parameters of an array of actions.
 * $actions - The actions array to modify. Passed by reference.
 * Returns nothing; the passed in array is modified.
 */
function set_action_params(&$actions) {
	global $db;
	foreach ($actions as &$a) {
		$a['params'] = $db->prepared_select('get_action_params', array($a['id']));
	}
}

/**
 * Accepts an array of tile arrays and outputs the appropriate data string.
 * $land_id - The id of the land to do this for.
 * Returns the land data as a string.
 */
function land_to_string($land_id) {
	$tiles = get_land_tiles_for_land_id($land_id);
	$buffer = array();
	$max_x = 0;
	$max_y = 0;
	foreach ($tiles as $t) {
		$x = $t['x'];
		$y = $t['y'];
		$max_x = max($x, $max_x);
		$max_y = max($y, $max_y);
		if (!array_key_exists($x, $buffer)) {
			$buffer[$x] = array();
		}
		$buffer[$x][$y] = $t['dataChar'];
	}
	$land_str = "";
	for ($y = 0; $y < $max_y + 1; $y++) {
		for ($x = 0; $x < $max_x + 1; $x++) {
			$c = ' ';
			if (array_key_exists($x, $buffer) && array_key_exists($y, $buffer[$x])) {
				$c = $buffer[$x][$y];
			}
			$land_str .= $c;
		}
		if ($y + 1 < $max_y + 1) {
			$land_str .= "\n";
		}
	}
	return $land_str;
}

/**
 * Turns a land data string into a series of map tile objects.
 */
function string_to_land($land_data) {
	$ts = get_tiles();
	$tiles = array();
	foreach ($ts as $t) {
		$tiles[$t['dataChar']] = $t;
	}
	$rows = explode("\n", $land_data);
	$max_x = 0;
	foreach ($rows as $r) {
		$max_x = max($max_x, count($r) - 1);
	}
	$buffer = array();
	for ($x = 0; $x < count($rows); $y++) {
		$buffer[$y] = array();
		$pieces = str_split($rows[$y]);
		for ($x = 0; $x < $max_x + 1; $x++) {
			if (array_key_exists($pieces[$x], $tiles)) {
//				$buffer[$
			}
		}
	}
}

/**
 * Gets the number of rows in a table that refer to some id.
 * $table - The table to check.
 * $ref_col - The column that is a foreign key.
 * $ref_val - The id to which refs are being counted.
 * Returns the number of references.
 */
function get_reference_count($table, $ref_col, $ref_val) {
	global $db;
	$n = $db->prepared_select('get_reference_count', array($table, $ref_col, $ref_val));
	$n = $n[0];
	return $n['COUNT(*)'];
}

?>