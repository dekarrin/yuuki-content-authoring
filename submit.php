<?php

	switch($_GET['action']){
		case 'new_entity':
			
			break;
		case 'new_bgm':
			
			break;
		case 'new_sfx':
			break;
		case 'new_action':
			$type =
			break;
		case 'new_portal':
			break;
		case 'new_image':
			break;
		case 'new_tile':
			//file stuff needs to be done
			$name = $db->escaped($_POST['name']);
			$traversable = $db->escaped($_POST['traversable']);
			$datachar = $db->esavped($_POST['datachar']);
			//needs to be implemnted correctly
			$contentpacks = $db->escaped($_POST['']);
			
			$q = query("INSERT INTO Tiles (id, cid, dataChar, name, traversable, spriteId) VALUES ('', '', $datachar, '$name', '%$traversable', '$sprite');
			break;
			
		case 'new_map':
			break;
		case 'new_entity':
			
			$hpb = $db->escaped($_POST['hpbase']);
			$hpg = $db->escaped($_POST['hpgain']);
			$mpb = $db->escaped($_POST['mpbase']);
			$mpg = $db->escaped($_POST['mpgain']);
			$strengthb = $db->escaped($_POST['strengthbase']);
			$strengthg = $db->escaped($_POST['strengthgain']);
			$defenseb = $db->escaped($_POST['defensebase']);
			$defenseg = $db->escaped($_POST['defensegain']);
			$agilityb = $db->escaped($_POST['agilitybase']);
			$agiltiyg = $db->escaped($_POST['agilitygain']);
			$accuracyb = $db->escaped($_POST['accuracybase']);
			$accuracyg = $db->escaped($_POST['accuracygain']);
			$magicb = $db->escaped($_POST['magicbase']);
			$magicb = $db->escaped($_POST['magicgain']);
			$luckb = $db->escaped($_POST['luckbase']);
			$luckg = $db->escaped($_POST['luckgain']);
			$xp = $db->escaped($_POST['xp']);
			
			//query may not be correct so sorry for shameful display
			$q = "INSERT INTO Entities(id, cid, name, sprite, xp, hpBase, 
				hpGain, mpBase, mpGain, strengthBase, strengthGain, defenseBase,
				defenseGain, agilityBase, agilityGain, accuracyBase, accuracyGain,
				magicBase, magicGain, luckBase, luckGain) VALUES ('$xp', '$hpb', '$hpg', '$mpb', '$mpg',
				'$strengthb', '$strengthg', '$defenseb', '$defenseg', '$agilityb', '$agilityg',
				'$accuracyb', '$accuracyg', '$magicb', '$magicg', '$luckb', '$luckg')";
			
			break;
		case 'new_content_packs':
			$name = $db->escaped($_POST['name']);
			$q = "INSERT INTO ContentPacks (name) VALUES ('$name')";
			$db->query($q);
			break;
	
	
	
	
	
	
	
	}
















?>