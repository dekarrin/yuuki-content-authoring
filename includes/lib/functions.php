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
 *				['portal']: Portal array
 *				['x'] ['y'] ['destMapId'] ['destX'] ['destY']
 *			['entities']: Array (
 *				['entity']: Entity array
 *				['x'] ['y'] ['level']
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

?>