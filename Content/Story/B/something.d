

func void Mod_KupAtrybut (var C_NPC typ, var int ATR, var int AtrPlus)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;
	
	if 		(ATR == ATR_STRENGTH)	
	{	
	Typ_Atr = typ.attribute[ATR_STRENGTH];	
	}
	else if (ATR == ATR_DEXTERITY)	
	{	
	Typ_Atr = typ.attribute[ATR_DEXTERITY];	
	}
	else if (ATR == ATR_MANA_MAX)	
	{	
	Typ_Atr = typ.attribute[ATR_MANA_MAX];	
	};
	
	// --------- Steigern oder verbieten	
	var string AtrPlusSTRING; AtrPlusSTRING	= IntToString(AtrPlus);
	var string PrintSTRING; var string PrintSTRING2;   var string PrintSTRING3;  
	var string atrwartosc;
	
	var int koszt_punktu_str;
	var int koszt_punktu_dex;
	var int koszt_punktu_mana;
	//wyliczanie kosztów atrybutu SI£A
	if (typ.attribute[ATR_STRENGTH] >= 90)
	{
	koszt_punktu_str = 5;
	public_str_cost = 5;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 75)
	{
	koszt_punktu_str = 4;
	public_str_cost = 4;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 50)
	{
	koszt_punktu_str = 3;
	public_str_cost = 3;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 25)
	{
	koszt_punktu_str = 2;
	public_str_cost = 2;
	}
	else if (typ.attribute[ATR_STRENGTH] < 25)
	{
	koszt_punktu_str = 1;
	public_str_cost = 1;
	};
	//wyliczanie kosztów atrybutu ZRÊCZNOŒÆ
	if (typ.attribute[ATR_DEXTERITY] >= 90)
	{
	koszt_punktu_dex = 2;
	public_dex_cost = 2;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 75)
	{
	koszt_punktu_dex = 2;
	public_dex_cost = 2;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 50)
	{
	koszt_punktu_dex = 2;
	public_dex_cost = 2;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 25)
	{
	koszt_punktu_dex = 1;
	public_dex_cost = 1;
	}
	else if (typ.attribute[ATR_DEXTERITY] < 25)
	{
	koszt_punktu_dex = 1;
	public_dex_cost = 1;
	};
	//wyliczanie kosztów atrybutu MANA MAX
	if (typ.attribute[ATR_MANA_MAX] >= 90)
	{
	koszt_punktu_mana = 2;
	public_man_cost = 2;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 75)
	{
	koszt_punktu_mana = 2;
	public_man_cost = 2;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 50)
	{
	koszt_punktu_mana = 2;
	public_man_cost = 2;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 25)
	{
	koszt_punktu_mana = 1;
	public_man_cost = 1;
	}
	else if (typ.attribute[ATR_MANA_MAX] < 25)
	{
	koszt_punktu_mana = 1;
	public_man_cost = 1;
	};
	
	if 	(ATR == ATR_STRENGTH)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_str)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_str*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_str*10);
		
				typ.lp = typ.lp - AtrPlus*koszt_punktu_str;
				
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
		
				PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_STRENGTH]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);				
var string pri1;
var string pri2;
var string pri3;
var string pri4;
				pri1 = IntToString(typ.lp); //pozosta³e PN
				pri2 = IntToString(AtrPlus*koszt_punktu_str); //odjête PN
				pri3 = ConcatStrings ("Wykorzystano punktów nauki:",pri2);
				pri4 = ConcatStrings ("Pozosta³o punktów nauki:", pri1);
				
				PrintS_Ext(pri3, COL_RED);				
				PrintS_Ext(pri4, COL_Lime);			
				}
				else
				{
				
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};
	
	 
	if 	(ATR == ATR_DEXTERITY)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_dex)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_dex*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_dex*10);
		
				typ.lp = typ.lp - AtrPlus*koszt_punktu_dex;
				
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
		
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);			
				PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_DEXTERITY]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);				
var string pri1d;
var string pri2d;
var string pri3d;
var string pri4d;
				pri1d = IntToString(typ.lp); //pozosta³e PN
				pri2d = IntToString(AtrPlus*koszt_punktu_dex); //odjête PN
				pri3d = ConcatStrings ("Wykorzystano punktów nauki:",pri2d);
				pri4d = ConcatStrings ("Pozosta³o punktów nauki:", pri1d);
				
				PrintS_Ext(pri3d, COL_RED);				
				PrintS_Ext(pri4d, COL_Lime);			
				}
				else
				{
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};

		if 	(ATR == ATR_MANA_MAX)	
	{	
		if (Typ_Atr + AtrPlus <= 100)
		{
			if (typ.lp >= AtrPlus*koszt_punktu_mana)
			{
				if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*koszt_punktu_mana*10) 
				{
				B_GiveInvItems  (hero, self, itminugget, AtrPlus*koszt_punktu_mana*10);
		
				typ.lp = typ.lp - AtrPlus*koszt_punktu_mana;
				
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
		
				//PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);	
				PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
				
				PrintSTRING2 = ConcatStrings(PrintString, " = ");
				atrwartosc =  IntToString(hero.attribute[ATR_MANA_MAX]);
				PrintSTRING3 = ConcatStrings(PrintSTRING2, atrwartosc);
				PrintS_Ext(PrintSTRING3, COL_Lime);				
var string pri1m;
var string pri2m;
var string pri3m;
var string pri4m;
				pri1m = IntToString(typ.lp); //pozosta³e PN
				pri2m = IntToString(AtrPlus*koszt_punktu_mana); //odjête PN
				pri3m = ConcatStrings ("Wykorzystano punktów nauki:",pri2m);
				pri4m = ConcatStrings ("Pozosta³o punktów nauki:", pri1m);
				
				PrintS_Ext(pri3m, COL_RED);				
				PrintS_Ext(pri4m, COL_Lime);			
				//PrintScreen	(pri3m, -1,53,"FONT_OLD_10_WHITE.TGA",2);
				//PrintScreen	(pri4m, -1,56,"FONT_OLD_10_WHITE.TGA",2);
				}
				else
				{
				PrintS_Ext("Za ma³o rudy!", COL_RED);	
				};
		}
		else
		{
		B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
	PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
	B_Say (self, other, "$NOLEARNOVERMAX");
	};
	};
	
	
	//wyliczanie kosztów atrybutu SI£A
	if (typ.attribute[ATR_STRENGTH] >= 90)
	{
	koszt_punktu_str = 5;
	public_str_cost = 5;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 75)
	{
	koszt_punktu_str = 4;
	public_str_cost = 4;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 50)
	{
	koszt_punktu_str = 3;
	public_str_cost = 3;
	}
	else if (typ.attribute[ATR_STRENGTH] >= 25)
	{
	koszt_punktu_str = 2;
	public_str_cost = 2;
	}
	else if (typ.attribute[ATR_STRENGTH] < 25)
	{
	koszt_punktu_str = 1;
	public_str_cost = 1;
	};
	//wyliczanie kosztów atrybutu ZRÊCZNOŒÆ
	if (typ.attribute[ATR_DEXTERITY] >= 90)
	{
	koszt_punktu_dex = 5;
	public_dex_cost = 5;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 75)
	{
	koszt_punktu_dex = 4;
	public_dex_cost = 4;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 50)
	{
	koszt_punktu_dex = 3;
	public_dex_cost = 3;
	}
	else if (typ.attribute[ATR_DEXTERITY] >= 25)
	{
	koszt_punktu_dex = 2;
	public_dex_cost = 2;
	}
	else if (typ.attribute[ATR_DEXTERITY] < 25)
	{
	koszt_punktu_dex = 1;
	public_dex_cost = 1;
	};
	//wyliczanie kosztów atrybutu MANA MAX
	if (typ.attribute[ATR_MANA_MAX] >= 90)
	{
	koszt_punktu_mana = 3;
	public_man_cost = 3;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 75)
	{
	koszt_punktu_mana = 2;
	public_man_cost = 2;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 50)
	{
	koszt_punktu_mana = 2;
	public_man_cost = 2;
	}
	else if (typ.attribute[ATR_MANA_MAX] >= 25)
	{
	koszt_punktu_mana = 1;
	public_man_cost = 1;
	}
	else if (typ.attribute[ATR_MANA_MAX] < 25)
	{
	koszt_punktu_mana = 1;
	public_man_cost = 1;
	};
	/*
	if (!(typ.lp < AtrPlus*2))
	{
		if (Npc_HasItems (hero, ItmiNugget) >=AtrPlus*10) 
		{
		B_GiveInvItems      (hero, self, ItmiNugget, AtrPlus*10);
		if (Typ_Atr + AtrPlus <= 100)
		{	
			typ.lp = typ.lp - AtrPlus*2;
						
			if (ATR == ATR_STRENGTH)
			{
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
				PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if (ATR == ATR_DEXTERITY)
			{
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
				PrintScreen	(PrintSTRING, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			}
			else if (ATR == ATR_MANA_MAX)
			{
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
				PrintScreen	(PrintString, -1,-1,"FONT_OLD_20_WHITE.TGA",1);
			};
		}
		else
		{
			PrintS_Ext("100 punktów to wartoœæ maksymalna!", COL_RED);	
			B_Say (self, other, "$NOLEARNOVERMAX");
		};
		}
		else
		{
		PrintS_Ext("Za ma³o rudy!", COL_RED);	
		};
	}
	else 
	{
	PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
	B_Say (self, other, "$NOLEARNNOPOINTS");
	};*/
};
