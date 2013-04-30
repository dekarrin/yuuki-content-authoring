<?php require "includes/common.php" ?>
<html>
	<head>
		<title>YCAT :: Entities</title>
		<style>
			input[type="text"] {
				max-width: 70px;
			}
		</style>
<body>

	<h1>Entity</h1>
	<table border = 1>
		<tr><td>&nbsp;</td><td>Name</td><td>Sprite</td><td>Contentpacks</td><td>HP Base</td><td>HP gain</td><td>MP Base</td><td>MP Gain</td><td>Strenth Base</td><td>Strength Gain</td>
			<td>Defense Base</td><td>Defense Gain</td><td>Agility Base</td><td>Agility Gain</td><td>Accuracy Base</td><td>Accuracy Gain</td><td>Magic Base</td><td>Magic Gain</td>
			<td>Luck Base</td><td>Luck Gain</td><td>XP given on death</td></tr>
		<?php
			$usable_entities = get_entities();
			
			foreach($usable_entities as $u){
				$cps = get_content_packs($u['cid']);
				$c = $cps[0];
				echo "<tr>";
				echo "<td><a href=\"submit.php?action=delete_entity&id={$u['id']}\">X</a></td><td>{$u['name']}</td><td>{$u['sprite']}</td><td>{$c['name']}</td>
				<td>{$u['hpBase']}</td><td>{$u['hpGain']}</td><td>{$u['mpBase']}</td><td>{$u['mpGain']}</td>
				<td>{$u['strengthBase']}</td><td>{$u['strengthGain']}</td><td>{$u['defenseBase']}</td><td>{$u['defenseGain']}</td>
				<td>{$u['agilityBase']}</td><td>{$u['agilityGain']}</td><td>{$u['accuracyBase']}</td><td>{$u['accuracyGain']}</td>
				<td>{$u['magicBase']}</td><td>{$u['magicGain']}</td><td>{$u['luckBase']}</td><td>{$u['luckGain']}</td><td>{$u['xp']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	<form action = "submit.php?action=new_entity" method = "post">
		<table border="1">
			<tr>
				<th>Name</th>
				<th>Content Pack</th>
				<th>Sprite</th>
				<th>XP Value</th>
				<th>HP Base</th>
				<th>HP Gain</th>
				<th>MP Base</th>
				<th>MP Gain</th>
				<th>Strength Base</th>
				<th>Strength Gain</th>
				<th>Defense Base</th>
				<th>Defense Gain</th>
				<th>Agility Base</th>
				<th>Agility Gain</th>
				<th>Accuracy Base</th>
				<th>Accuracy Gain</th>
				<th>Magic Base</th>
				<th>Magic Gain</th>
				<th>Luck Base</th>
				<th>Luck Gain</th>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td><input type="text" name="name" /></td>
				<td><select name="cid">
<?php
$cps = get_content_packs();
foreach ($cps as $c) {
?>
					<option value="<?php echo $c['id']; ?>"><?php echo $c['name']; ?></option>
<?php
}
?>
				</select></td>
				<td><select name="spriteid">
<?php
$sprites = get_images();
foreach ($sprites as $s) {
?>
					<option value="<?php echo $s['id']; ?>"><?php echo $s['filename']; ?></option>
<?php
}
?>
				</option></td>
				<td><input type="text" name="xpgiven"></td>
				<td><input type="text" name="hpbase" /></td>
				<td><input type="text" name="hpgain" /></td>
				<td><input type="text" name="mpbase"></td>
				<td><input type="text" name="mpgain"></td>
				<td><input type="text" name="strengthbase"></td>
				<td><input type="text" name="strengthgain"></td>
				<td><input type="text" name="defensebase"></td>
				<td><input type="text" name="defensegain"></td>
				<td><input type="text" name="agilitybase"></td>
				<td><input type="text" name="agilitygain"></td>
				<td><input type="text" name="accuracybase"></td>
				<td><input type="text" name="accuracygain"></td>
				<td><input type="text" name="magicbase"></td>
				<td><input type="text" name="magicgain"></td>
				<td><input type="text" name="luckbase"></td>
				<td><input type="text" name="luckgain"></td>
				<td><input type="submit" value="Add Entity"></td>
			</tr>
		</table>
	</form>
	
	<a href="bgm.php">Backround Music</a>
		<a href="sfx.php">Sound Effects</a>
		<a href="contentpack.php">Content Packs</a>
		<a href="image.php">Image</a>
		<a href="action.php">Actions</a>
		<a href="portal.php">Portal</a>
		<a href="entity.php">Entity</a>
		<a href="tile.php">Tile</a>
		<a href="map.php">Map</a>
	
</body>
</html>