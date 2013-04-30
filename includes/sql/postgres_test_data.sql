USE yuukicontent;

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
TRUNCATE TABLE ActionParameterValues;
TRUNCATE TABLE Actions;
TRUNCATE TABLE BackgroundMusics;
TRUNCATE TABLE SoundEffects;
TRUNCATE TABLE Images;
TRUNCATE TABLE ActionParameters;
TRUNCATE TABLE ActionTypes;
TRUNCATE TABLE ArgDataTypes;
TRUNCATE TABLE ContentPacks;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO ContentPacks (name, isBase, spriteDir, tileDir, portalDir)
VALUES ('BuiltIn', 'true', 'sprites/', 'tiles/', 'portals/');
INSERT INTO ContentPacks (name, isBase) VALUES ('test-ae1', 'false');
INSERT INTO ContentPacks (name, isBase) VALUES ('test-ah1', 'false');

INSERT INTO ArgDataTypes (name) VALUES ('integral');
INSERT INTO ArgDataTypes (name) VALUES ('decimal');
INSERT INTO ArgDataTypes (name) VALUES ('string');

INSERT INTO ActionTypes (name) VALUES ('Flee');
INSERT INTO ActionTypes (name) VALUES ('ItemUse');
INSERT INTO ActionTypes (name) VALUES ('BasicDefense');
INSERT INTO ActionTypes (name) VALUES ('BasicAttack');
INSERT INTO ActionTypes (name) VALUES ('Heal');

INSERT INTO ActionParameters (argDataTypeId, actionTypeId, position, name)
SELECT D.id, A.id, '1', 'duration'
FROM ArgDataTypes AS D, ActionTypes AS A
WHERE D.name = 'integral' AND A.name = 'BasicDefense';

INSERT INTO ActionParameters (argDataTypeId, actionTypeId, position, name)
SELECT D.id, A.id, '1', 'damage'
FROM ArgDataTypes AS D, ActionTypes AS A
WHERE D.name = 'decimal' AND A.name = 'BasicAttack';

INSERT INTO ActionParameters (argDataTypeId, actionTypeId, position, name)
SELECT D.id, A.id, '1', 'amount'
FROM ArgDataTypes AS D, ActionTypes AS A
WHERE D.name = 'decimal' AND A.name = 'Heal';

INSERT INTO ActionParameters (argDataTypeId, actionTypeId, position, name)
SELECT D.id, A.id, '2', 'cost'
FROM ArgDataTypes AS D, ActionTypes AS A
WHERE D.name = 'integral' AND A.name = 'Heal';

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

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '1'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'BasicDefense' AND P.name = 'duration' AND T2.name = T1.name
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '3.0'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'BasicAttack' AND P.name = 'damage' AND T2.name = T1.name
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '4.0'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'BasicAttack' AND P.name = 'damage' AND T2.name = T1.name
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'BasicAttack';

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '1.0'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'BasicAttack' AND P.name = 'damage' AND T2.name = T1.name
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO Actions (cid, actionTypeId)
SELECT C.id, T.id
FROM ContentPacks AS C, ActionTypes as T
WHERE C.name = 'BuiltIn' AND T.name = 'Heal';

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '50.0'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'Heal' AND P.name = 'amount' AND T2.name = T1.name
ORDER BY A.id DESC
LIMIT 1;

INSERT INTO ActionParameterValues (actionParameterId, actionId, paramValue)
SELECT P.id, A.id, '0'
FROM ActionParameters AS P
INNER JOIN ActionTypes AS T1
ON T1.id = P.actionTypeId,
Actions AS A
INNER JOIN ActionTypes AS T2
ON T2.id = A.actionTypeId
WHERE T1.name = 'Heal' AND P.name = 'cost' AND T2.name = T1.name
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
WHERE E.name = "Slime" AND A.id = '5';

INSERT INTO Portals (cid, name, spriteId)
SELECT C.id, 'teleporter', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'BuiltIn' AND I.customIndex = 'PORTAL_TELEPORTER';

INSERT INTO Portals (cid, name, spriteId)
SELECT C.id, 'zinger', I.id
FROM ContentPacks AS C, Images AS I
WHERE C.name = 'test-ae1' AND I.customIndex = 'PORTAL_ZINGER';

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

#-- Going to the same place; multiple maps with same land
INSERT INTO MapPortals (portalId, mapId, x, y, destMapId, destX, destY)
SELECT P.id, M.id, '1', '7', M.id, '10', '7'
FROM Portals AS P
INNER JOIN ContentPacks AS PContents
ON PContents.id = P.cid,
Maps AS M
INNER JOIN Lands AS L
ON L.id = M.landId
WHERE P.name = 'teleporter' AND PContents.name = 'BuiltIn' AND
L.name = 'Myr\'kah';

#-- Going to the same place
INSERT INTO MapPortals (portalId, mapId, x, y, destMapId, destX, destY)
SELECT P.id, M.id, '1', '8', M.id, '10', '7'
FROM Portals AS P
INNER JOIN ContentPacks AS PContents
ON PContents.id = P.cid,
Maps AS M
INNER JOIN Lands AS L
ON L.id = M.landId
INNER JOIN ContentPacks AS MContents
ON MContents.id = M.cid
WHERE P.name = 'zinger' AND PContents.name = 'test-ae1' AND
L.name = 'Myr\'kah' AND MContents.name = 'test-ae1';

INSERT INTO MapPortals (portalId, mapId, x, y, destMapId, destX, destY)
SELECT P.id, M.id, '31', '4', M.id, '48', '3'
FROM Portals AS P
INNER JOIN ContentPacks AS PContents
ON PContents.id = P.cid,
Maps AS M
INNER JOIN Lands AS L
ON L.id = M.landId
INNER JOIN ContentPacks AS MContents
ON MContents.id = M.cid
WHERE P.name = 'teleporter' AND PContents.name = 'BuiltIn' AND
L.name = 'Houseville' AND MContents.name = 'test-ah1';

INSERT INTO MapPortals (portalId, mapId, x, y, destMapId, destX, destY)
SELECT P.id, Origins.id, '49', '5', Dests.id, '1', '1'
FROM Portals AS P
INNER JOIN ContentPacks AS PContents
ON PContents.id = P.cid,
Maps AS Origins
INNER JOIN Lands AS OLands
ON OLands.id = Origins.landId
INNER JOIN ContentPacks AS OContents
ON OContents.id = Origins.cid,
Maps AS Dests
INNER JOIN Lands AS DLands
ON DLands.id = Dests.landId
INNER JOIN ContentPacks AS DContents
ON DContents.id = Dests.cid
WHERE P.name = 'teleporter' AND PContents.name = 'BuiltIn' AND
OLands.name = 'Houseville' AND OContents.name = 'test-ah1' AND
DLands.name = 'Myr\'kah' AND DContents.name = 'test-ah1';

INSERT INTO MapPortals (portalId, mapId, x, y, destMapId, destX, destY)
SELECT P.id, Origins.id, '3', '4', Dests.id, '37', '7'
FROM Portals AS P
INNER JOIN ContentPacks AS PContents
ON PContents.id = P.cid,
Maps AS Origins
INNER JOIN Lands AS OLands
ON OLands.id = Origins.landId
INNER JOIN ContentPacks AS OContents
ON OContents.id = Origins.cid,
Maps AS Dests
INNER JOIN Lands AS DLands
ON DLands.id = Dests.landId
INNER JOIN ContentPacks AS DContents
ON DContents.id = Dests.cid
WHERE P.name = 'teleporter' AND PContents.name = 'BuiltIn' AND
OLands.name = 'Pony Land' AND OContents.name = 'test-ah1' AND
DLands.name = 'Houseville' AND DContents.name = 'test-ah1';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '9'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '10'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '11'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '12'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '13'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '14'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '15'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '16'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '17'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '18'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '19'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '20'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '21'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '22'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '23'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '24'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '25'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '26'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Myr\'kah' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Pony Land' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '0'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '1'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '2'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '3'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '4'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '5'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '27', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '28', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '29', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '30', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '44', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '45', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '46', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '47', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '48', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '49', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '50', '6'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'floor';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '7'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '0', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '1', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '2', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '3', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '4', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '5', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '6', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '7', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '8', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '9', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '10', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '11', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '12', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '13', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '14', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '15', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '16', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '17', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '18', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '19', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '20', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '21', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '22', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '23', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '24', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '25', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '26', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '31', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '32', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '33', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '34', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '35', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '36', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '37', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '38', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '39', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '40', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '41', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '42', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';

INSERT INTO LandTiles (landId, tileid, x, y)
SELECT L.id, T.id, '43', '8'
FROM Lands AS L, Tiles AS T
WHERE L.name = 'Houseville' AND T.name = 'wall';