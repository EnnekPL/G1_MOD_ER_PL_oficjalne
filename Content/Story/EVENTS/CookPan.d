func void COOKPAN_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = CookPan;
	var int smazone_mieso;
	var int ilosc_miesa;
	if (Npc_HasItems (hero, ItFoMuttonRaw) >=1)
	{
		ilosc_miesa = Npc_hasitems (hero, Itfomuttonraw);
		if (ilosc_miesa >0)
		{
			Npc_RemoveInvItems (hero, itfomuttonraw,ilosc_miesa);
			CreateInvItems (hero, itfomutton,ilosc_miesa);
			var string napis_mieso;
			napis_mieso = ConcatStrings (InttoString (ilosc_miesa)," sztuk miêsa usma¿ono.");
			PrintScreen (napis_mieso,-1,70,"font_old_20_white.tga",3);
		};
	};
	
	var int smazona_watrobka;
	var int ilosc_wotrobki;
	if (Npc_HasItems (hero, ItFo_MoleratW) >=1)
	{
		ilosc_wotrobki = Npc_hasitems (hero, ItFo_MoleratW);
		if (ilosc_wotrobki >0)
		{
			Npc_RemoveInvItems (hero, ItFo_MoleratW,ilosc_wotrobki);
			CreateInvItems (hero, ItFo_MoleratWS,ilosc_wotrobki);
			var string napis_watr;
			napis_watr = ConcatStrings (InttoString (ilosc_wotrobki)," sztuk w¹tróbki kretoszczura usma¿ono.");
			PrintScreen (napis_mieso,-1,75,"font_old_20_white.tga",3);
		};
	};
	};
	
	hero.aivar[AIV_INVINCIBLE]=FALSE;
};
