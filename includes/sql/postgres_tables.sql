USE yuukicontent;

DROP TABLE IF EXISTS ActionParameterValues CASCADE;
DROP TABLE IF EXISTS EntityAbilities CASCADE;
DROP TABLE IF EXISTS MapEntities CASCADE;
DROP TABLE IF EXISTS MapPortals CASCADE;
DROP TABLE IF EXISTS LandTiles CASCADE;
DROP TABLE IF EXISTS SoundEffects CASCADE;
DROP TABLE IF EXISTS BackgroundMusics CASCADE;
DROP TABLE IF EXISTS Actions CASCADE;
DROP TABLE IF EXISTS Maps CASCADE;
DROP TABLE IF EXISTS Entities CASCADE;
DROP TABLE IF EXISTS Portals CASCADE;
DROP TABLE IF EXISTS Tiles CASCADE;
DROP TABLE IF EXISTS Images CASCADE;
DROP TABLE IF EXISTS Lands CASCADE;
DROP TABLE IF EXISTS ContentPacks CASCADE;
DROP TABLE IF EXISTS ActionParameters CASCADE;
DROP TABLE IF EXISTS ArgDataTypes CASCADE;
DROP TABLE IF EXISTS ActionTypes CASCADE;

CREATE TABLE ContentPacks
(
	id SERIAL,
	name VARCHAR(255) NOT NULL UNIQUE,
	isBase BOOLEAN NOT NULL,
	spriteDir VARCHAR(255) NOT NULL DEFAULT '',
	tileDir VARCHAR(255) NOT NULL DEFAULT '',
	bgDir VARCHAR(255) NOT NULL DEFAULT '',
	portalDir VARCHAR(255) NOT NULL DEFAULT '',
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE Lands
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	startX INTEGER(11) UNSIGNED NOT NULL,
	startY INTEGER(11) UNSIGNED NOT NULL,
	width INTEGER(11) UNSIGNED NOT NULL,
	height INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE ArgDataTypes
(
	id SERIAL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE ActionTypes
(
	id SERIAL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE ActionParameters
(
	id SERIAL,
	argDataTypeId INTEGER(11) UNSIGNED NOT NULL,
	actionTypeId INTEGER(11) UNSIGNED NOT NULL,
	position INTEGER(11) UNSIGNED NOT NULL,
	name VARCHAR(255) NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (argDataTypeId) REFERENCES ArgDataTypes (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actionTypeId) REFERENCES ActionTypes (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Images
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	filename VARCHAR(255) NOT NULL,
	customIndex VARCHAR(255) NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE SoundEffects
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	filename VARCHAR(255) NOT NULL,
	customIndex VARCHAR(255) NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE BackgroundMusics
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	filename VARCHAR(255) NOT NULL,
	customIndex VARCHAR(255) NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Actions
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	actionTypeId INTEGER(11) UNSIGNED NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actionTypeId) REFERENCES ActionTypes (id)
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Maps
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	landId INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (landId) REFERENCES Lands (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Entities
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	spriteId INTEGER(11) UNSIGNED NULL,
	xp INTEGER(11) UNSIGNED NOT NULL,
	hpBase INTEGER(11) UNSIGNED NOT NULL,
	hpGain INTEGER(11) UNSIGNED NOT NULL,
	mpBase INTEGER(11) UNSIGNED NOT NULL,
	mpGain INTEGER(11) UNSIGNED NOT NULL,
	strengthBase INTEGER(11) UNSIGNED NOT NULL,
	strengthGain INTEGER(11) UNSIGNED NOT NULL,
	defenseBase INTEGER(11) UNSIGNED NOT NULL,
	defenseGain INTEGER(11) UNSIGNED NOT NULL,
	agilityBase INTEGER(11) UNSIGNED NOT NULL,
	agilityGain INTEGER(11) UNSIGNED NOT NULL,
	accuracyBase INTEGER(11) UNSIGNED NOT NULL,
	accuracyGain INTEGER(11) UNSIGNED NOT NULL,
	magicBase INTEGER(11) UNSIGNED NOT NULL,
	magicGain INTEGER(11) UNSIGNED NOT NULL,
	luckBase INTEGER(11) UNSIGNED NOT NULL,
	luckGain INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (spriteId) REFERENCES Images (id)
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Portals
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	spriteId INTEGER(11) UNSIGNED NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (spriteId) REFERENCES Images (id)
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Tiles
(
	id SERIAL,
	cid INTEGER(11) UNSIGNED NOT NULL,
	dataChar CHAR(1) NOT NULL,
	name VARCHAR(255) NOT NULL,
	traversable BOOLEAN NOT NULL,
	spriteId INTEGER(11) UNSIGNED NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cid) REFERENCES ContentPacks (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (spriteId) REFERENCES Images (id)
		ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE ActionParameterValues
(
	id SERIAL,
	actionParameterId INTEGER(11) UNSIGNED NOT NULL,
	actionId INTEGER(11) UNSIGNED NOT NULL,
	paramValue VARCHAR(255) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (actionId) REFERENCES Actions (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actionParameterId) REFERENCES ActionParameters (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE EntityAbilities
(
	id SERIAL,
	entityId INTEGER(11) UNSIGNED NOT NULL,
	actionId INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (entityId) REFERENCES Entities (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (actionId) REFERENCES Actions (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE MapEntities
(
	id SERIAL,
	entityId INTEGER(11) UNSIGNED NOT NULL,
	mapId INTEGER(11) UNSIGNED NOT NULL,
	entityLevel INTEGER(11) UNSIGNED NOT NULL,
	x INTEGER(11) UNSIGNED NOT NULL,
	y INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (entityId) REFERENCES Entities (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (mapId) REFERENCES Maps (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE MapPortals
(
	id SERIAL,
	portalId INTEGER(11) UNSIGNED NOT NULL,
	mapId INTEGER(11) UNSIGNED NOT NULL,
	x INTEGER(11) UNSIGNED NOT NULL,
	y INTEGER(11) UNSIGNED NOT NULL,
	destMapId INTEGER(11) UNSIGNED NOT NULL,
	destX INTEGER(11) UNSIGNED NOT NULL,
	destY INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (portalId) REFERENCES Portals (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (mapId) REFERENCES Maps (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (destMapId) REFERENCES Maps (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE LandTiles
(
	id SERIAL,
	tileId INTEGER(11) UNSIGNED NOT NULL,
	landId INTEGER(11) UNSIGNED NOT NULL,
	x INTEGER(11) UNSIGNED NOT NULL,
	y INTEGER(11) UNSIGNED NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (tileId) REFERENCES Tiles (id)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (landId) REFERENCES Lands (id)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;