<?php
require_once 'includes/common.php';
$request = (array_key_exists('request', $_GET)) ? $_GET['request'] : '';
switch ($request) {

	case 'action_params':
		$action_type_id = $_GET['action_type_id'];
		$params = $db->prepared_select('get_action_params_for_action_type_id', array($action_type_id));
		foreach ($params as $p) {
			echo "id='{$p['id']}',type='{$p['type']}',position='{$p['position']}',name='{$p['name']}'\n";
		}
		if (count($params) == 0) {
			echo '0';
		}
		break;
		
	default:
		echo '0';
		break;

}
?>