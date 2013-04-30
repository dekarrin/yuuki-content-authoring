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

$db->prepare('get_tiles',
'SELECT t.id, t.cid, t.dataChar, t.name, t.traversable, i.filename "sprite"
FROM Tiles AS t
INNER JOIN Images AS i
ON t.spriteId = i.id');

$db->prepare('get_tiles_for_cid',
'SELECT t.id, t.cid, t.dataChar, t.name, t.traversable, i.filename "sprite"
FROM Tiles AS t
INNER JOIN Images AS i
ON t.spriteId = i.id
WHERE t.cid = \'$1\'');

$db->prepare('get_land_tiles_for_land_id',
'SELECT t.id, t.cid, t.dataChar, t.name, t.traversable, i.filename "sprite",
lt.x, lt.y
FROM LandTiles AS lt
INNER JOIN Tiles AS t
ON t.id = lt.tileId
INNER JOIN Images AS i
ON t.spriteId = i.id
WHERE lt.landId = \'$1\'');

$db->prepare('get_portals',
'SELECT p.id, p.cid, p.name, i.filename "sprite"
FROM Portals AS p
INNER JOIN Images AS i
ON p.spriteId = i.id');

$db->prepare('get_portals_for_cid',
'SELECT p.id, p.cid, p.name, i.filename "sprite"
FROM Portals AS p
INNER JOIN Images AS i
ON p.spriteId = i.id
WHERE p.cid = \'$1\'');

$db->prepare('get_images',
'SELECT *
FROM Images');

$db->prepare('get_images_for_cid',
'SELECT *
FROM Images
WHERE cid = \'$1\'');

$db->prepare('get_bgm',
'SELECT *
FROM BackgroundMusics');

$db->prepare('get_bgm_for_cid',
'SELECT *
FROM BackgroundMusics
WHERE cid = \'$1\'');

$db->prepare('get_sfx',
'SELECT *
FROM SoundEffects');

$db->prepare('get_sfx_for_cid',
'SELECT *
FROM SoundEffects
WHERE cid = \'$1\'');

$db->prepare('get_content_packs',
'SELECT *
FROM ContentPacks');

$db->prepare('get_content_packs_for_id',
'SELECT *
FROM ContentPacks
WHERE id = \'$1\'');

$db->prepare('get_lands',
'SELECT *
FROM Lands');

$db->prepare('get_lands_for_cid',
'SELECT *
FROM Lands
WHERE cid = \'$1\'');

$db->prepare('get_lands_for_id',
'SELECT *
FROM Lands
WHERE id = \'$1\'');

$db->prepare('get_land_tiles_for_land_id',
'SELECT lt.x, lt.y, t.id, t.cid,
t.dataChar, t.name, t.traversable, i.filename
FROM LandTiles AS lt
INNER JOIN Tiles AS t
ON t.id = lt.tileId
INNER JOIN Images AS i
ON i.id = t.spriteId
WHERE lt.landId = \'$1\'');

$db->prepare('get_maps',
'SELECT *
FROM Maps');

$db->prepare('get_maps_for_cid',
'SELECT *
FROM Maps
WHERE cid = \'$1\'');

$db->prepare('get_map_portals_for_map_id',
'SELECT mp.x, mp.y, mp.destMapId, mp.destX,
mp.destY, mp.id, p.id "portalId", p.cid, p.name,
i.filename "sprite"
FROM MapPortals AS mp
INNER JOIN Portals AS p
ON mp.portalId = p.id
INNER JOIN Images AS i
ON p.spriteId = i.id
WHERE mp.mapId = \'$1\'');

$db->prepare('get_map_entities_for_map_id',
'SELECT e.id "entityId", e.cid, e.name, i.filename "sprite",
e.xp, e.hpBase, e.hpGain, e.mpBase, e.mpGain,
e.strengthBase, e.strengthGain, e.defenseBase,
e.defenseGain, e.agilityBase, e.agilityGain,
e.accuracyBase, e.accuracyGain, e.magicBase,
e.magicGain, e.luckBase, e.luckGain,
me.entityLevel "level", me.x, me.y, me.id
FROM MapEntities AS me
INNER JOIN Entities AS e
ON me.entityId = e.id
INNER JOIN Images AS i
ON e.spriteId = i.id
WHERE me.mapId = \'$1\'');

$db->prepare('get_action_types', 'SELECT * FROM ActionTypes');

$db->prepare('get_reference_count', 'SELECT COUNT(*) FROM $1 WHERE $2 = \'$3\'');
?>