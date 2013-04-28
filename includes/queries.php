<?php
// Prepares queries on DB object.

// Assumes DB object has already been created and connected, and is stored in global
// variable called '$db'.

$db->prepare('get_actions',
'SELECT a.id, a.cid, at.name "type"
FROM Actions AS a
INNER JOIN ActionTypes AS at
ON at.id = a.actionTypeId
ORDER BY a.id');

$db->prepare('get_actions_for_cid',
'SELECT a.id, a.cid, at.name "type"
FROM Actions AS a
INNER JOIN ActionTypes AS at
ON at.id = a.actionTypeId
WHERE a.cid = \'$1\'
ORDER BY a.id');

$db->prepare('get_action_params',
'SELECT apv.id, ap.position, adt.name "type",
ap.name, apv.paramValue "value"
FROM ActionParameterValues AS apv
INNER JOIN ActionParameters AS ap
ON ap.id = apv.actionParameterId
INNER JOIN ArgDataTypes AS adt
ON adt.id = ap.argDataTypeId
WHERE actionId = \'$1\'
ORDER BY ap.position');

$db->prepare('get_entities',
'SELECT e.id, e.cid, e.name, i.filename "sprite",
e.xp, e.hpBase, e.hpGain, e.mpBase, e.mpGain,
e.strengthBase, e.strengthGain, e.defenseBase,
e.defenseGain, e.agilityBase, e.agilityGain,
e.accuracyBase, e.accuracyGain, e.magicBase,
e.magicGain, e.luckBase, e.luckGain
FROM Entities AS e
INNER JOIN Images AS i
ON e.spriteId = i.id');

$db->prepare('get_entities_for_cid',
'SELECT e.id, e.cid, e.name, i.filename "sprite",
e.xp, e.hpBase, e.hpGain, e.mpBase, e.mpGain,
e.strengthBase, e.strengthGain, e.defenseBase,
e.defenseGain, e.agilityBase, e.agilityGain,
e.accuracyBase, e.accuracyGain, e.magicBase,
e.magicGain, e.luckBase, e.luckGain
FROM Entities AS e
INNER JOIN Images AS i
ON e.spriteId = i.id
WHERE e.cid = \'$1\'');

$db->prepare('get_actions_for_entity',
'SELECT a.id, a.cid, at.name "type"
FROM Actions AS a
INNER JOIN ActionTypes AS at
ON at.id = a.actionTypeId
WHERE a.id IN (
	SELECT actionId
	FROM EntityAbilities
	WHERE entityId = \'$1\'
)
ORDER BY a.id;');
?>