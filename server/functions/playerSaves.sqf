private["_uid"];
while {true} do {
	if (doPlayerSaves) then {
		_uid = getPlayerUID player;
		diag_log "################################";
		diag_log format ["##### Save DB File Called For %1", _uid];
		[_uid, _uid, "Health", damage player] call fn_SaveToServer;
		[_uid, _uid, "Side", str(side player)] call fn_SaveToServer;
		[_uid, _uid, "Account Name", name player] call fn_SaveToServer;

		{
			_keyName = _x select 0;
			_value = _x select 1;
			[_uid, _uid, _keyName, _value] call fn_SaveToServer;
		} forEach call mf_inventory_all;

		[_uid, _uid, "Vest", vest player] call fn_SaveToServer;
		[_uid, _uid, "Uniform", uniform player] call fn_SaveToServer;	
		[_uid, _uid, "Backpack", backpack player] call fn_SaveToServer;
		[_uid, _uid, "Goggles", goggles player] call fn_SaveToServer;
		[_uid, _uid, "HeadGear", headgear player] call fn_SaveToServer;

		[_uid, _uid, "UniformItems", uniformItems player] call fn_SaveToServer;
		[_uid, _uid, "VestItems", vestItems player] call fn_SaveToServer;
		[_uid, _uid, "BackpackItems", backpackItems player] call fn_SaveToServer;
		
		[_uid, _uid, "Position", getPosATL vehicle player] call fn_SaveToServer;
		[_uid, _uid, "Direction", direction vehicle player] call fn_SaveToServer;
		//[_uid, _uid, "Stance", getMove vehicle player] call fn_SaveToServer;

		[_uid, _uid, "PrimaryWeapon", primaryWeapon player] call fn_SaveToServer;
		[_uid, _uid, "PrimaryWeaponItems", primaryWeaponItems player] call fn_SaveToServer;
		[_uid, _uid, "PrimaryWeaponMagazine", primaryWeaponMagazine player] call fn_SaveToServer;

		[_uid, _uid, "SecondaryWeapon", SecondaryWeapon player] call fn_SaveToServer;
		[_uid, _uid, "SecondaryWeaponItems", secondaryWeaponItems player] call fn_SaveToServer;
		[_uid, _uid, "SecondaryWeaponMagazine", secondaryWeaponMagazine player] call fn_SaveToServer;

		[_uid, _uid, "HandgunWeapon", handgunWeapon player] call fn_SaveToServer;
		[_uid, _uid, "HandgunItems", handgunItems player] call fn_SaveToServer;
		[_uid, _uid, "HandgunMagazine", handgunMagazine player] call fn_SaveToServer;

		[_uid, _uid, "Items", items player] call fn_SaveToServer;
		[_uid, _uid, "AssignedItems", assignedItems player] call fn_SaveToServer;
		
		magsWithAmmoCounts = [];
		{
			_class = _x select 0;
			_count = _x select 1;
			_elem = [_class, _count];
			magsWithAmmoCounts set [count magsWithAmmoCounts, _elem];
		} forEach (magazinesAmmoFull player);

		[_uid, _uid, "MagazinesWithAmmoCount", magsWithAmmoCounts] call fn_SaveToServer;
		[_uid, _uid, "Weapons", Weapons player] call fn_SaveToServer;
		
		hungerLevel = player getVariable "hungerLevel";
		thirstLevel = player getVariable "thirstLevel";
		moneyLevel = player getVariable "cmoney";
		[_uid, _uid, "Hunger", hungerLevel] call fn_SaveToServer;
		[_uid, _uid, "Thirst", thirstLevel] call fn_SaveToServer;
		[_uid, _uid, "Money", moneyLevel] call fn_SaveToServer;
		//player globalChat "Player saved!";
	};
	sleep 0.5;
	if (deleteDBFile) then {
		_uid = getPlayerUID player;
		diag_log "################################";
		diag_log format ["##### Delete DB File Called For %1", _uid];
		[_uid, _uid] call fn_DeleteFromDB;
		deleteDBFile = false;
	};

	sleep 10;
};