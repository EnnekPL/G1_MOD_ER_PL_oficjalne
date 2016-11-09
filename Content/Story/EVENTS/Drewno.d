 func void Drewno_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Drewno;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};
// rutynadoylea LOCATION_11_12
/*
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

*/
//========================================
//-----------------> ENDEWOOD
//========================================

INSTANCE DIA_PC_Hero_ENDEWOOD (C_INFO)
{
   npc          = PC_Hero;
   nr           = 99;
   condition    = DIA_PC_Hero_ENDEWOOD_Condition;
   information  = DIA_PC_Hero_ENDEWOOD_Info;
   permanent	= true;
   description	= DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_ENDEWOOD_Condition()
{
    if (monolog == Drewno)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_ENDEWOOD_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WOODWORK1
//========================================

INSTANCE DIA_PC_Hero_WOODWORK1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_WOODWORK1_Condition;
   information  = DIA_PC_Hero_WOODWORK1_Info;
   permanent	= true;
   description	= "Tnij drewno.";
};

FUNC INT DIA_PC_Hero_WOODWORK1_Condition()
{
    if (monolog==Drewno)
	&& (Npc_HasItems (hero, ItMi_Wood_01) >=1)
	&& (hero.attribute[ATR_HITPOINTS] > 11)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_WOODWORK1_Info()
{
PrintScreen ("Poci¹³eœ ga³êzie!",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMi_Wood_01, 1);
CreateInvItems (hero, ItMi_Wood_02, 1);
hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 10;
if (hero.attribute[ATR_HITPOINTS] > 20) 
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,53,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
if (hero.attribute[ATR_HITPOINTS] < 11)
{
PrintScreen ("Jesteœ zbyt zmêczony, aby kontynuowaæ pracê!",-1,25,"font_old_10_red.tga",3); //fixed?
};
};

/*
//========================================
//-----------------> ENDEWOOD2
//========================================

INSTANCE DIA_PC_Hero_ENDEWOOD2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 99;
   condition    = DIA_PC_Hero_ENDEWOOD2_Condition;
   information  = DIA_PC_Hero_ENDEWOOD2_Info;
   permanent	= true;
   description	= "JESTEŒ ZBYT ZMÊCZONY";
};

FUNC INT DIA_PC_Hero_ENDEWOOD2_Condition()
{
    if (monolog == Drewno) && (hero.attribute[ATR_HITPOINTS] < 11)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_ENDEWOOD2_Info()
{
    AI_StopProcessInfos	(self);
self.aivar[AIV_INVINCIBLE]=FALSE;
};*/