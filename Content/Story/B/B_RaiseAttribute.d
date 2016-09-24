func void B_RaiseAttribute (var int attribute,	var int value)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_RaiseAttribute");

	//-------- Anhebung --------
	Npc_ChangeAttribute	(self,	attribute,	value);

	//-------- Bildschirmausgabe --------
	var string msg;
	var string posiadane_pkt;
	var string msg2;
	var string msg3;
	if		(attribute == ATR_STRENGTH)			
	{	
	msg = ConcatStrings(NAME_RaiseStrength	, IntToString(value));
	posiadane_pkt =  IntToString(hero.attribute[ATR_STRENGTH]);
	}
	else if	(attribute == ATR_DEXTERITY)		{	msg = ConcatStrings(NAME_RaiseDexterity , IntToString(value));	posiadane_pkt =  IntToString(hero.attribute[ATR_DEXTERITY]); }
	else if	(attribute == ATR_MANA_MAX)			{	msg = ConcatStrings(NAME_RaiseManaMax	, IntToString(value)); posiadane_pkt =  IntToString(hero.attribute[ATR_MANA_MAX]); }
	else if	(attribute == ATR_HITPOINTS_MAX)	{	msg = ConcatStrings(NAME_RaiseHealthMax , IntToString(value)); posiadane_pkt =  IntToString(hero.attribute[ATR_HITPOINTS_MAX]); 	};

	
	//PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
	//PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
	msg2 = ConcatStrings(msg, " = ");
	msg3 = ConcatStrings(msg2, posiadane_pkt);
	if (attribute == ATR_STRENGTH)
	{
	PrintS_Ext		(msg3, COL_Yellow);
	}
	else if (attribute == ATR_DEXTERITY)
	{
	PrintS_Ext		(msg3, COL_Olive);
	}
	else if (attribute == ATR_MANA_MAX)
	{
	PrintS_Ext		(msg3, COL_Blue);
	}
	else if (attribute == ATR_HITPOINTS_MAX)
	{
	PrintS_Ext		(msg3, COL_Red);
	};
};


