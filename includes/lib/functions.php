<?php

// Gets all actions for a content pack
// $cid - The id of the content pack to get actions for; set to NULL for all content packs.
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

?>