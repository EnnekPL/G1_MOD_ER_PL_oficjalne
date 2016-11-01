
const int	LP_PER_LEVEL				= 10;	// Lernpunkte pro Spieler-Stufe
const int	HP_PER_LEVEL				= 12;	// Lebenspunkte pro Spieler-Stufe
const int	XP_PER_LEVEL_UNCONSCIOUS	= 5;	// Erfahrungspunkte für das Besiegen eines Gegners (pro Level Gegners)
const int	XP_PER_LEVEL_DEAD			= 10;	// Erfahrungspunkte für das Töten eines Gegners (pro Level Gegners)

func void B_GiveXP (var int add_xp)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_GiveXP");

	if (hero.level == 0)
	{
		hero.exp_next = 500;
	};
	//----------------------------------------------------------------------------
	hero.exp = hero.exp + add_xp;

	//----------------------------------------------------------------------------
	var string msg;
	var string msg2;
	msg = NAME_XPGained;
	msg = ConcatStrings(msg,	IntToString(add_xp));
	msg2 = ConcatStrings("+ ",	IntToString(add_xp));
	//PrintScreen	(msg, -1,_YPOS_MESSAGE_XPGAINED,"font_old_10_white.tga",_TIME_MESSAGE_XPGAINED);
	//PrintS_Ext(msg, COL_White);
	var string s1;
	var string s2;
	var string s3;
	var string s4;
	var string s5;
	//,s2,s3,s4,s5;
	var string n1;
	var string n2;
	var string n3;
	
	s4	=IntToString(hero.exp);//z liczby jak¹ jest doœwiadczenie bohatera robimy ci¹g znaków (czyli z liczby tekst)
	s5	=IntToString(hero.exp_next);//to samo co wy¿ej tyle ze co do punktów wymaganych do zdobycia

	s1	=ConcatStrings ("Stan: ",s4); //tutaj ³¹czymy TEKST s4 czyli nasz exp w postaci tekstowej razem z wyrazem doœwiadczenia
	s2	=ConcatStrings (" / ", s5);//tutaj ³¹czymy nasz exp do zdobycia z wyrazem "na"

	s3	=ConcatStrings (s1,s2);//tutaj ³¹czymy 2 powy¿sze w ca³oœæ
	n1 = ConcatStrings (msg," (");
	n2 = ConcatStrings (n1,s3);
	n3 = ConcatStrings (n2,")");
	
	
	PrintS_Ext(n3, COL_White);
	
	//PrintScreen ( s3, -1, _YPOS_MESSAGE_XPGAINED+2, "Font_Old_10_White.TGA",_TIME_MESSAGE_XPGAINED);//tutaj wyœwietlamy s3 czyli ca³oœæ naszej pracy
	
/*	if hero.exp_next < 100
/	{
	PrintScreen	(msg2,20 ,93,"font_old_10_white.tga",5);
	}
	else if hero.exp_next > 1000
	{
	PrintScreen	(msg2,23 ,93,"font_old_10_white.tga",5);
	}
	else if hero.exp_next > 10000
	{
	PrintScreen	(msg2,25 ,93,"font_old_10_white.tga",5);
	}
	else if hero.exp_next > 100000
	{	
	PrintScreen	(msg2,26 ,93,"font_old_10_white.tga",5);
	}; */
	//----------------------------------------------------------------------------
	if ( hero.exp >= hero.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		hero.level = hero.level+1;
		hero.exp_next = hero.exp_next +((hero.level+1)*750);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX]+HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]+HP_PER_LEVEL;
		hero.LP = hero.LP + LP_PER_LEVEL;				//+ hero.level;
		//PrintScreen		(NAME_LevelUp, -1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",_TIME_MESSAGE_LEVELUP); //orginalana 	PrintScreen		(NAME_LevelUp, -1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",_TIME_MESSAGE_LEVELUP); 
		PrintS_Ext(NAME_LevelUp, COL_Lime);
		
		Snd_Play		("LevelUp");
	};
};

func void B_DeathXP()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_DeathXP");
	PrintGlobals		(PD_ZS_CHECK);
	
	if	C_NpcIsHuman(self)
	&&	Npc_WasInState(self, ZS_Unconscious)
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist bewußtloser Mensch!");
		// SN: keine XP für Finishing-Move!!!
	}
	else if (!self.aivar[AIV_WASDEFEATEDBYSC])
	{	
		PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		B_GiveXP (self.level * XP_PER_LEVEL_DEAD); 
	};
};
		
func void B_UnconciousXP()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_UnconciousXP");
	PrintGlobals	(PD_ZS_CHECK);
		
	//-------- Erfahrung nur beim ersten Sieg über Menschen --------
	if	!C_NpcIsHuman(self)
	||	!self.aivar[AIV_WASDEFEATEDBYSC]
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...erster Sieg!");
		if (self.npctype == npctype_ambient) && (Npc_GetGuildAttitude (self,hero) != ATT_HOSTILE)
		{
		B_GiveXP (self.level);
		}
		else
		{
		B_GiveXP (self.level * XP_PER_LEVEL_DEAD);		// die vollen XP beim Sieg vergeben, da finishing-Move keine XPs mehr ergibt!
		};
	};
};