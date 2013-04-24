SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE LandTiles;
TRUNCATE TABLE MapPortals;
TRUNCATE TABLE MapEntities;
TRUNCATE TABLE EntityAbilities;
TRUNCATE TABLE Tiles;
TRUNCATE TABLE Portals;
TRUNCATE TABLE Entities;
TRUNCATE TABLE Maps;
TRUNCATE TABLE Lands;
TRUNCATE TABLE ActionParameters;
TRUNCATE TABLE Actions;
TRUNCATE TABLE BackgroundMusics;
TRUNCATE TABLE SoundEffects;
TRUNCATE TABLE Images;
TRUNCATE TABLE ActionTypes;
TRUNCATE TABLE ContentPacks;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO ContentPacks (name, isBase, spriteDir, tileDir, portalDir)
VALUES ('BuiltIn', 'true', 'sprites/', 'tiles/', 'portals/');
INSERT INTO ContentPacks (name, isBase) VALUES ('test-ae1', 'false');
INSERT INTO ContentPacks (name, isBase) VALUES ('test-ah1', 'false');

INSERT INTO ActionTypes (name) VALUES ('Flee');
INSERT INTO ActionTypes (name) VALUES ('ItemUse');
INSERT INTO ActionTypes (name) VALUES ('BasicDefense');
INSERT INTO ActionTypes (name) VALUES ('BasicAttack');
INSERT INTO ActionTypes (name) VALUES ('Heal');

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'joshua_tree.jpg', 'BG_INTRO_SCREEN'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player.png', 'SPRITE_PLAYER'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_no.png', 'SPRITE_PLAYER_N'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_so.png', 'SPRITE_PLAYER_S'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_ea.png', 'SPRITE_PLAYER_E'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_we.png', 'SPRITE_PLAYER_W'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_ne.png', 'SPRITE_PLAYER_NE'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_nw.png', 'SPRITE_PLAYER_NW'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_se.png', 'SPRITE_PLAYER_SE'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/player_sw.png', 'SPRITE_PLAYER_SW'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'sprites/slime.png', 'SPRITE_SLIME'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'tiles/wall.png', 'TILE_WALL'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'tiles/floor.png', 'TILE_FLOOR'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'tiles/void.png', 'TILE_VOID'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'portals/teleporter.png', 'PORTAL_TELEPORTER'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Images (cid, filename, customIndex)
SELECT id, 'zinger.png', 'PORTAL_ZINGER'
FROM ContentPacks WHERE name = 'test-ae1';

INSERT INTO SoundEffects (cid, filename, customIndex)
SELECT id, 'slash.mp3', 'SFX_TEST'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO SoundEffects (cid, filename, customIndex)
SELECT id, 'strike.mp3', 'HIT'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO SoundEffects (cid, filename, customIndex)
SELECT id, 'menu_click.mp3', 'BUTTON_HIT'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO SoundEffects (cid, filename, customIndex)
SELECT id, 'menu_hover.mp3', 'MENU_HOVER'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO BackgroundMusics (cid, filename, customIndex)
SELECT id, 'worldmap.mp3', 'BGM_MAIN_MENU'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO BackgroundMusics (cid, filename, customIndex)
SELECT id, 'insidia.mp3', 'BGM_BATTLE'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO BackgroundMusics (cid, filename, customIndex)
SELECT id, 'treacherousslopes.mp3', 'BGM_OVERWORLD'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'Flee';

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'ItemUse';

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicDefense';

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '1', '1'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'BasicDefense'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '1', '3.0'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'BasicAttack'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '1', '4.0'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'BasicAttack'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '1', '1.0'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'BasicAttack'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'Heal';

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '1', '50.0'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'Heal'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO ActionParameters (actionId, position, paramValue)
SELECT A.id, '2', '0.0'
FROM Actions AS A
INNER JOIN ActionTypes AS T
ON A.actionTypeId = T.id
WHERE T.name = 'Heal'
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Lands (cid, name, startX, startY, width, height)
SELECT id, 'Myr\'kah', '1', '1', '29', '27'
FROM ContentPacks WHERE name = 'BuiltIn';

INSERT INTO Maps (cid, landId)
SELECT C.id, L.id
FROM ContentPacks AS C, Lands AS L
WHERE C.name = 'BuiltIn' AND L.name = 'Myr\'kah';

INSERT INTO Maps (cid, landId)
SELECT C.id, L.id
FROM ContentPacks AS C, Lands AS L
WHERE C.name = 'test-ah1' AND L.name = 'Myr\'kah';

INSERT INTO Maps (cid, landId)
SELECT C.id, L.id
FROM ContentPacks AS C, Lands AS L
WHERE C.name = 'test-ae1' AND L.name = 'Myr\'kah';

INSERT INTO Lands (cid, name, startX, startY, width, height)
SELECT id, 'Pony Land', '1', '1', '7', '6'
FROM ContentPacks WHERE name = 'test-ah1';

INSERT INTO Maps (cid, landId)
SELECT C.id, L.id
FROM ContentPacks AS C, Lands AS L
WHERE C.name = 'test-ah1' AND L.name = 'Pony Land';

INSERT INTO Lands (cid, name, startX, startY, width, height)
SELECT id, 'Houseville', '4', '3', '51', '9'
FROM ContentPacks WHERE name = 'test-ah1';

INSERT INTO Maps (cid, landId)
SELECT C.id, L.id
FROM ContentPacks AS C, Lands AS L
WHERE C.name = 'test-ah1' AND L.name = 'Houseville';

INSERT INTO Entities (cid, name, spriteId, xp, hpBase, hpGain, mpBase,
mpGain, strengthBase, strengthGain, defenseBase, defenseGain, agilityBase,
agilityGain, accuracyBase, accuracyGain, magicBase, magicGain, luckBase, luckGain)
SELECT C.id, '__PLAYER', I.id, NULL,
'0', '1', #hp
'0', '1', #mp
'5', '1', #str
'5', '1', #def
'5', '1', #agl
'5', '1', #acc
'5', '1', #mag
'5', '1' #luk
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'SPRITE_PLAYER';

INSERT INTO EntityAbilities (actionId, entityId)
SELECT A.id, E.id FROM Actions AS A, Entities AS E
WHERE E.name = "__PLAYER" AND A.id = '2';

INSERT INTO EntityAbilities (actionId, entityId)
SELECT A.id, E.id FROM Actions AS A, Entities AS E
WHERE E.name = "__PLAYER" AND A.id = '3';

INSERT INTO EntityAbilities (actionId, entityId)
SELECT A.id, E.id FROM Actions AS A, Entities AS E
WHERE E.name = "__PLAYER" AND A.id = '4';

INSERT INTO Entities (cid, name, spriteId, xp, hpBase, hpGain, mpBase,
mpGain, strengthBase, strengthGain, defenseBase, defenseGain, agilityBase,
agilityGain, accuracyBase, accuracyGain, magicBase, magicGain, luckBase, luckGain)
SELECT C.id, 'Slime', I.id, '3',
'80', '15', #hp
'0', '0', #mp
'5', '0', #str
'5', '0', #def
'3', '0', #agl
'6', '0', #acc
'2', '0', #mag
'4', '0' #luk
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'SPRITE_SLIME';

INSERT INTO EntityAbilities (actionId, entityId)
SELECT A.id, E.id FROM Actions AS A, Entities AS E
WHERE E.name = "__PLAYER" AND A.id = '5';

INSERT INTO Portals (cid, name, spriteId)
SELECT C.id, 'teleporter', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'PORTAL_TELEPORTER';

INSERT INTO Portals (cid, name, spriteId)
SELECT C.id, 'zinger', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'test-ah1' AND I.customIndex = 'PORTAL_ZINGER';

INSERT INTO Tiles (cid, dataChar, name, traversable, spriteId)
SELECT C.id, '#', 'wall', 'false', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'TILE_WALL';

INSERT INTO Tiles (cid, dataChar, name, traversable, spriteId)
SELECT C.id, '.', 'floor', 'true', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'TILE_FLOOR';

INSERT INTO MapEntities (entityId, mapId, entityLevel, x, y)
SELECT E.id, M.id, '3', '9', '4'
FROM Entities AS E, Maps AS M
INNER JOIN Lands AS L
ON M.landId = L.id
WHERE E.name = 'Slime' AND L.name = 'Myr\'kah';

INSERT INTO MapPortals (portalId, mapId, x, y, destMapId