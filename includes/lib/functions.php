<?php

/**
 * Gets all actions for a content pack.
 * $cid - The id of the content pack to get actions for; set to NULL for all
 * content packs.
 * Returns an associative array of the following format:
 * Array (
 *		[0] => Array (
 *			['id'] => (int - The ID of the action)
 *			['cid'] => (int - The ID of the content pack that the action is defined in)
 *			['type'] => (string - the type of the action)
 *			['paramaters'] => Array (
 *				[0] => Array (
 *					['id'] => (int - The ID of the parameter)
 *					['actionId'] => (int - The ID of the action this paramter is a part of)
 *					['position'] => (int - The position of this parameter in the argument list)
 *					['paramValue'] => (numeric - The value of this parameter for this action)
 *				)
 *				[1] => Array (
 *					. . .
 *				)
 *				. . .
 *			)
 *		)
 *		. . .
 * )
 */
function get_actions($cid) {
	global $db;
	$col = NULL;
	$val = NULL;
	if (!is_null($cid)) {
		$col = 'cid';
		$val = $cid;
	}
	$result = $db->select("Actions", "*", $col, $val);
	$final_result = array();
	foreach ($r as $result) {
		$f = array();
		$f['id'] = $r['id'];
		$f['cid'] = $r['cid'];
		$f['type'] = $db->select('ActionTypes', 'name', 'id', $r['actionTypeId'], 1);
		$f['parameters'] = $db->select('ActionParameters', '*', 'actionId', $r['id']);
		$final_result[] = $f;
	}
	return $final_result;
}

// Gets all entites for a content pack
// $cid - The id of the content pack to get entities for; set to NULL for all content packs.
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

?>