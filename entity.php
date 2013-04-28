<?php require "includes/common.php" ?>
<html>
<body>

	<h1>Entity</h1>
	<table border = 1>
		<tr><td>ID</td><td>Name</td><td>Sprite</td><td>Contentpacks</td><td>HP Base</td><td>HP gain</td><td>MP Base</td><td>MP Gain</td><td>Strenth Base</td><td>Strength Gain</td>
			<td>Defense Base</td><td>Defense Gain</td><td>Agility Base</td><td>Agility Gain</td><td>Accuracy Base</td><td>Accuracy Gain</td><td>Magic Base</td><td>Magic Gain</td>
			<td>Luck Base</td><td>Luck Gain</td><td>XP given on death</td></tr>
		<?php
			$usable_entities = get_entities();
			
			foreach($usable_entities as $u){
				echo "<tr>";
				echo "<td>{$u['id']}</td><td>{$u['name']}</td><td>{$u['spriteId']}</td><td>{$u['cid']}</td>{$u['hpbase']}<td>{$u['hpgain']}</td><td>{$u['mpbase']}</td>
				<td>{$u['strengthbase']}</td><td></td><td>{$u['strengthgain']}</td><td>{$u['defensebase']}</td><td>{$u['defensegain']}</td><td>{$u['agilitybase']}</td>
				<td>{$u['agilitygain']}</td><td>{$u['accuracybase']}</td><td>{$u['accuracygain']}</td><td>{$u['magicbase']}</td><td>{$u['magicgain']}</td><td><{$u['luckbase']}/td>
				<td>{$u['luckgain']}</td><td>{$u['xp']}</td>";
				echo "</tr>";
			}
		?>
	</table>
	<form>
	
		HP Base<input type="text" name="hpbase"><br>
		HP Gain <input type="text" name="hpgain"><br>
		MP Base: <input type="text" name="mpbase"><br>
		MP Gain: <input type="text" name="mpgain"><br>
		Strength Base: <input type="text" name="strengthbase"><br>
		Strength Gain: <input type="text" name="strengthgain"><br>
		Defense Base: <input type="text" name="defensebase"><br>La
		Defense Gain: <input type="text" name="defensegain"><br>
		Agility Base: <input type="text" name="agilitybase"><br>
		Agility Gain: <input type="text" name="agilitygain"><br>
		Accuracy Base: <input type="text" name="accuracybase"><br>
		Accuracy Gain: <input type="text" name="accuracygain"><br>
		Magic Base: <input type="text" name="magicbase"><br>
		Magci Gain: <input type="text" name="magicgain"><br>
		Lucky Base: <input type="text" name="luckbase"><br>
		Lucky Gain: <input type="text" name="luckgain"><br>
		Mame: <input type="text" name="name"><br>
		XP Given on Death: <input type="text" name="xpgiven"><br>
		
		
		<input type="submit" value="Submit">
	</form>
	
</body>
</html>