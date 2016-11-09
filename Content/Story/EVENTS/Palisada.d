 func void MurObronny_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = MurObronny;
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
//-----------------> PrzerwijR
//========================================

INSTANCE DIA_PC_Hero_PrzerwijR (C_INFO)
{
   npc          = PC_Hero;
   nr           = 99;
   condition    = DIA_PC_Hero_PrzerwijR_Condition;
   information  = DIA_PC_Hero_PrzerwijR_Info;
   permanent	= true;
   description	= DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_PrzerwijR_Condition()
{
    if (monolog == MurObronny)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_PrzerwijR_Info()
{
    AI_StopProcessInfos	(self);
	self.aivar[AIV_INVINCIBLE]=FALSE;
};

//========================================
//-----------------> NAPRAWAM1
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM1 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_NAPRAWAM1_Condition;
   information  = DIA_PC_Hero_NAPRAWAM1_Info;
   permanent	= false;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM1_Condition()
{
    if (monolog==MurObronny)
	&& (Npc_KnowsInfo (hero, DIA_Firn_Gwozdzie))
	&& (Npc_HasItems (hero, ItMiGwozdz) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM1_Info()
{
PrintScreen ("Ukoñczono 1/6",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

//========================================
//-----------------> NAPRAWAM2
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM2 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_NAPRAWAM2_Condition;
   information  = DIA_PC_Hero_NAPRAWAM2_Info;
   permanent	= FALSE;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM2_Condition()
{
    if (monolog==MurObronny)
    && (Npc_KnowsInfo (hero, DIA_PC_Hero_NAPRAWAM1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM2_Info()
{
PrintScreen ("Ukoñczono 2/6",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

//========================================
//-----------------> NAPRAWAM3
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM3 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_NAPRAWAM3_Condition;
   information  = DIA_PC_Hero_NAPRAWAM3_Info;
   permanent	= FALSE;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM3_Condition()
{
    if (monolog==MurObronny)
    && (Npc_KnowsInfo (hero, DIA_PC_Hero_NAPRAWAM2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM3_Info()
{
PrintScreen ("Ukoñczono 3/6",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

//========================================
//-----------------> NAPRAWAM4
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM4 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 4;
   condition    = DIA_PC_Hero_NAPRAWAM4_Condition;
   information  = DIA_PC_Hero_NAPRAWAM4_Info;
   permanent	= FALSE;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM4_Condition()
{
    if (monolog==MurObronny)
    && (Npc_KnowsInfo (hero, DIA_PC_Hero_NAPRAWAM3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM4_Info()
{
PrintScreen ("Ukoñczono 4/6",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

//========================================
//-----------------> NAPRAWAM5
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM5 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 5;
   condition    = DIA_PC_Hero_NAPRAWAM5_Condition;
   information  = DIA_PC_Hero_NAPRAWAM5_Info;
   permanent	= FALSE;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM5_Condition()
{
    if (monolog==MurObronny)
    && (Npc_KnowsInfo (hero, DIA_PC_Hero_NAPRAWAM4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM5_Info()
{
PrintScreen ("Ukoñczono 5/6",-1,1,"font_old_10_white.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

//========================================
//-----------------> NAPRAWAM6
//========================================

INSTANCE DIA_PC_Hero_NAPRAWAM6 (C_INFO)
{
   npc          = PC_Hero;
   nr           = 6;
   condition    = DIA_PC_Hero_NAPRAWAM6_Condition;
   information  = DIA_PC_Hero_NAPRAWAM6_Info;
   permanent	= FALSE;
   description	= "(Naprawiaj)";
};

FUNC INT DIA_PC_Hero_NAPRAWAM6_Condition()
{
    if (monolog==MurObronny)
    && (hero.attribute[ATR_HITPOINTS] >= 2)
    && (Npc_KnowsInfo (hero, DIA_PC_Hero_NAPRAWAM5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_NAPRAWAM6_Info()
{
Palisada_Mysliwych = true;
PrintScreen ("Ukoñczono 6/6",-1,1,"font_old_10_white.tga",1);
PrintScreen ("Robota skoñczona!",-1,1,"font_old_10_green.tga",1);
Npc_RemoveInvItems (hero, ItMiGwozdz, 5);
if (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] == hero.attribute[ATR_MANA_MAX])
{

} 
else 
{
PrintScreen ("Jesteœ trochê zmêczony!",-1,1,"font_old_10_red.tga",1);
PrintScreen ("Tracisz 1 punkt zdrowia!",-1,55,"font_old_10_red.tga",1);
};
};

