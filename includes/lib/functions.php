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
 */

/**
 * Gets all actions for a content pack.
 * $cid - The id of the content pack to get actions for; set to NULL for all
 * content packs.
 * Returns an associative array of Actions.
 */
function get_actions($cid) {
	global $db;
	$actions = NULL;
	if (is_null($cid)) {
		$actions = $db->prepared_select('get_actions');
	} else {
		$actions = $db->prepared_select('get_actions_with_cid', array($cid));
	}
	foreach ($actions as $a) {
		$a['params'] = $db->prepared_select('get_action_params', array($a['id']));
	}
	return $actions;
}

/**
 * Gets all entites for a content pack
 * $cid - The id of the content pack to get entities for; set to NULL for all
 * content packs.
 * Returns an array of Entity format arrays.
 */
function get_entities($cid) {
	global $db;
	$col = NULL;
	$val = NULL;
	if (!is_null($cid)) {
		$col = 'cid';
		$val = $cid;
	}
	$result = $db->select("Entities", "*", $col, $val);
	$final_result = array();
	foreach ($r as $result) {
		$f = array();
	//	$f['
	}
}

function group_rows_by

// Sorts rows by $column
function sort_rows($rows, $column) {
	$sorted = array();
	foreach ($rows as $r) {
		$col = $r[$column];
		$sorted[$col][] = $r;
	}
	return $sorted;
}

?>