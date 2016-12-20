///////////////////////////////////////////////////////////////
// 1.4.02
///////////////////////////////////////////////////////////////

func void ALCHEMIA_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	//***ALT** if	(Hlp_GetInstanceID (self)== Hlp_GetInstanceID (Hero)) // MH: geändert, damit kontrollierte NSCs nicht schlafen können!
	if ( (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))||(Hlp_GetInstanceID(self)==Hlp_GetInstanceID(rock)) ) 
	{	
	monolog = Alchemia;
	self.aivar[AIV_INVINCIBLE]=TRUE;
	Ai_ProcessInfos (her);
	};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_PC_Hero_EXIT(C_INFO)
{
	npc             = PC_Hero;
	nr              = 999;
	condition		= DIA_PC_Hero_EXIT_Condition;
	information		= DIA_PC_Hero_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_PC_Hero_EXIT_Condition()
{
	if (monolog == Alchemia)
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_EXIT_Info()
{
	self.aivar[AIV_INVINCIBLE]=FALSE;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LifePotions
//========================================

INSTANCE DIA_PC_Hero_LifePotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 1;
   condition    = DIA_PC_Hero_LifePotions_Condition;
   information  = DIA_PC_Hero_LifePotions_Info;
   permanent	= true;
   description	= "(Mikstury lecznicze)";
};

FUNC INT DIA_PC_Hero_LifePotions_Condition()
{
    if (monolog == Alchemia)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_LifePotions_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, 1x bagienne ziele, 1x cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
	if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
};

func void DIA_PC_Hero_LifePotions_FullRegenerate ()
{
	if (Npc_HasItems (hero, ItFo_Plants_Velayis_01) >=1)
	&& (Npc_HasItems (hero, ItFo_Plants_Herb_03) >=1)
	&& (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=3)
	&& (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Health_04);
    Npc_RemoveInvItems (hero, ItFo_Plants_Velayis_01, 1);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_03, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (20);
	Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, bagienne ziele, cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};

func void DIA_PC_Hero_LifePotions_back ()
{
Info_ClearChoices		(DIA_PC_Hero_LifePotions);
};
FUNC VOID DIA_PC_Hero_LifePotions_Esencja()
{
    if (Npc_HasItems (hero, ItFo_Plants_Herb_01) >=1)
&& (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Health_01);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_01, 1);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01, 1);
Print ("Uwarzy³eœ miksturê");
B_giveXP (5);
 Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, bagienne ziele, cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};

FUNC VOID DIA_PC_Hero_LifePotions_EsencjaV2()
{
    if (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=2)
&& (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1)
&& (Npc_HasItems (hero, ItMi_Alchemy_Zucker_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Health_01);
    Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 2);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Zucker_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
Print ("Uwarzy³eœ miksturê");
B_giveXP (5);
 Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, bagienne ziele, cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};
FUNC VOID DIA_PC_Hero_LifePotions_Wyciag()
{
    if (Npc_HasItems (hero, ItFo_Plants_Herb_02) >=1)
&& (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Health_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_02,1);
    Npc_RemoveInvItem  (hero, ItFo_Potion_Water_01);
Print ("Uwarzy³eœ miksturê");
B_giveXP (10);
 Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, 1x bagienne ziele, 1x cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
};
};

FUNC VOID DIA_PC_Hero_LifePotions_Eliksir()
{
    if (Npc_HasItems (hero, ItFo_Plants_Herb_03) >=1)
&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1)
    {
         CreateInvItem (hero, ItFo_Potion_Health_03);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_03,1);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
Print ("Uwarzy³eœ miksturê");
B_giveXP (15);
 Info_ClearChoices		(DIA_PC_Hero_LifePotions);
	Info_AddChoice		(DIA_PC_Hero_LifePotions, DIALOG_BACK, DIA_PC_Hero_LifePotions_back);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (Zio³a uzdrawiaj¹ce (ma³e), woda)", DIA_PC_Hero_LifePotions_Esencja);
	 Info_AddChoice		(DIA_PC_Hero_LifePotions, "Esencja lecznicza (2x Serafis, 1x bagienne ziele, 1x cukier)", DIA_PC_Hero_LifePotions_EsencjaV2);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Wyci¹g leczniczy (Zio³a uzdrawiaj¹ce (œrednie), woda)", DIA_PC_Hero_LifePotions_Wyciag);
    Info_AddChoice		(DIA_PC_Hero_LifePotions, "Eliksir uzdrawiaj¹cy (Zio³a uzdrawiaj¹ce (du¿e), alkohol)", DIA_PC_Hero_LifePotions_Eliksir);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_LifePotions, "Pe³nia ¿ycia", DIA_PC_Hero_LifePotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
};
};
//========================================
//-----------------> ManaPotions
//========================================

INSTANCE DIA_PC_Hero_ManaPotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 2;
   condition    = DIA_PC_Hero_ManaPotions_Condition;
   information  = DIA_PC_Hero_ManaPotions_Info;
   permanent	= true;
   description	= "(Mikstury many)";
};

FUNC INT DIA_PC_Hero_ManaPotions_Condition()
{
    if (monolog == Alchemia)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_ManaPotions_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Czarne ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	 Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x Jagody, 2x Serafis, sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
	if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
};

func void DIA_PC_Hero_ManaPotions_FullRegenerate ()
{
	if (Npc_HasItems (hero, ItFo_Plants_Bloodwood_01) >=1)
	&& (Npc_HasItems (hero, ItFo_Plants_mountainmoos_01) >=1)
	&& (Npc_HasItems (hero, ItFo_Plants_Nightshadow_02) >=3)
	&& (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Mana_04);
    Npc_RemoveInvItems (hero, ItFo_Plants_Bloodwood_01, 1);
    Npc_RemoveInvItems (hero, ItFo_Plants_mountainmoos_01, 1);
	 Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_02, 3);
	 Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (20);
    Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Krucze ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x jagody, 2x Serafis, 1x sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
        }
        else
        {
		Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};


func void DIA_PC_Hero_ManaPotions_Back ()
{
Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
};

FUNC VOID DIA_PC_Hero_ManaPotions_EsencjaM()
{
 if (Npc_HasItems (hero, ItFo_Plants_RavenHerb_02) >=1)
&& (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Mana_01);
    Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_02, 2);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (5);
    Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Krucze ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x jagody, 2x Serafis, 1x sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};
FUNC VOID DIA_PC_Hero_ManaPotions_EsencjaM2()
{
 if (Npc_HasItems (hero, ItFo_Plants_Berrys_01) >=4)
&& (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=2)
&& (Npc_HasItems (hero, ItMi_Alchemy_Salt_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Mana_01);
    Npc_RemoveInvItems (hero, ItFo_Plants_Berrys_01, 4);
    Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 2);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Salt_01, 1);
Print ("Uwarzy³eœ miksturê");
B_giveXP (5);
    Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Krucze ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x jagody, 2x Serafis, 1x sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};

FUNC VOID DIA_PC_Hero_ManaPotions_WyciagM()
{
 if (Npc_HasItems (hero, ItFo_Plants_Stoneroot_01) >=1)
&& (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Mana_01);
    Npc_RemoveInvItems (hero, ItFo_Plants_Stoneroot_01, 1);
    Npc_RemoveInvItem (hero, ItFo_Potion_Water_01);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (5);
    Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Krucze ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x jagody, 2x Serafis, 1x sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
        }
        else
        {
Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};

FUNC VOID DIA_PC_Hero_ManaPotions_EliksirM()
{
	if (Npc_HasItems (hero, ItFo_Plants_mountainmoos_01) >=1)
	&& (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1)
    {
    CreateInvItem (hero, ItFo_Potion_Mana_03);
    Npc_RemoveInvItem (hero, ItMi_Alchemy_Alcohol_01);
	Npc_RemoveInvItem (hero, ItFo_Plants_mountainmoos_01);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (5);
	Info_ClearChoices		(DIA_PC_Hero_ManaPotions);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, DIALOG_BACK, DIA_PC_Hero_ManaPotions_Back);
	
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (Krucze ziele, woda)", DIA_PC_Hero_ManaPotions_EsencjaM);
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Esencja magicznej energii (4x jagody, 2x Serafis, 1x sól)", DIA_PC_Hero_ManaPotions_EsencjaM2);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Wyci¹g magicznej energii (Twardzieñ, woda)", DIA_PC_Hero_ManaPotions_WyciagM);
    Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Eliksir many (Górski mech, alkohol)", DIA_PC_Hero_ManaPotions_EliksirM);
		if (HeroKnows_AlchemyFullRegenarate)
	{
	Info_AddChoice		(DIA_PC_Hero_ManaPotions, "Pe³nia many", DIA_PC_Hero_ManaPotions_FullRegenerate);
	};
        }
        else
        {
		Print ("Nie masz sk³adników");
            AI_StopProcessInfos	(self);
        };
};

//========================================
//-----------------> SpecialPotions
//========================================

INSTANCE DIA_PC_Hero_SpecialPotions (C_INFO)
{
   npc          = PC_Hero;
   nr           = 3;
   condition    = DIA_PC_Hero_SpecialPotions_Condition;
   information  = DIA_PC_Hero_SpecialPotions_Info;
   permanent	= true;
   description	= "(Mikstury specjalne)";
};

FUNC INT DIA_PC_Hero_SpecialPotions_Condition()
{
    if (monolog == Alchemia)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 2)
	//AlchemyKnows == TRUE) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_Info()
{
    Info_ClearChoices	(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (orkowe ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
	
};
FUNC VOID DIA_PC_Hero_SpecialPotions_BACK()
{
    Info_ClearChoices	(DIA_PC_Hero_SpecialPotions);
};

FUNC VOID DIA_PC_Hero_SpecialPotions_KING()
{
    if (Npc_HasItems (hero, ItFo_Plants_PapkaZziela) >=1) && (Npc_HasItems (hero, ItFo_Plants_Flameberry_01) >=2) && (Npc_HasItems (hero, ItFo_Plants_OrcHerb_02) >=1) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_01) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Master_01);
	Npc_RemoveInvItems (hero, ItFo_Plants_PapkaZziela, 1);
    Npc_RemoveInvItems (hero, ItFo_Plants_Flameberry_01, 2);
	Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_02, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_01, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_MAGE()
{
    if (Npc_HasItems (hero, ItFo_Plants_PapkaZziela) >=2) && (Npc_HasItems (hero, ItFo_Plants_OrcHerb_02) >=2) && (Npc_HasItems (hero, ItFo_Plants_Flameberry_01) >=3) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_01) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Master_02);
	Npc_RemoveInvItems (hero, ItFo_Plants_PapkaZziela, 2);
    Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_02, 2);
	Npc_RemoveInvItems (hero, ItFo_Plants_Flameberry_01, 3);
	Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_01, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_STRT1()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_ForestHerb) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1)
    {
	CreateInvItem (hero,ItFo_PotionTime_Strength_01);
    Npc_RemoveInvItem (hero, ItFo_ForestHerb);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_DEXT1()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_FieldHerb) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1)
    {
	CreateInvItem (hero,ItFo_PotionTime_Dex_01);
    Npc_RemoveInvItem (hero, ItFo_FieldHerb);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_MANT1()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_MountainHerb) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1)
    {
	CreateInvItem (hero,ItFo_PotionTime_Mana_01);
    Npc_RemoveInvItem (hero, ItFo_MountainHerb);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_MAST1()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_FieldHerb) >=2) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) && (Npc_HasItems (hero, ItFo_ForestHerb) >=2)
    {
	CreateInvItem (hero,ItFo_PotionTime_Master_01);
	Npc_RemoveInvItems (hero, ItFo_FieldHerb, 2);
	Npc_RemoveInvItems (hero, ItFo_ForestHerb, 2);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_HPT1()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=2) && (Npc_HasItems (hero, ItFo_SeaHerb) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) 
    {
	CreateInvItem (hero,ItFo_Potion_HealthTime_01);
	Npc_RemoveInvItems (hero, ItFo_SeaHerb, 1);
	//Npc_RemoveInvItems (hero, ItFo_FieldHerb, 2);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};
//KONIEC MIKSTURY CZASOWE
FUNC VOID DIA_PC_Hero_SpecialPotions_STR()
{
    if (Npc_HasItems (hero, ItFo_Plants_Flameberry_01) >=2) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_02) >=3) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Strength_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_02, 3);
    Npc_RemoveInvItems (hero, ItFo_Plants_Flameberry_01, 2);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
};

FUNC VOID DIA_PC_Hero_SpecialPotions_DEX()
{
    if (Npc_HasItems (hero, ItFo_Plants_OrcHerb_02) >=1) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_02) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Dex_02);
    Npc_RemoveInvItem (hero, ItFo_Plants_Nightshadow_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_OrcHerb_02, 1);
	Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };
   };
FUNC VOID DIA_PC_Hero_SpecialPotions_HP()
{
    if (Npc_HasItems (hero, ItFo_Plants_RavenHerb_01) >=8) && (Npc_HasItems (hero, ItFo_Plants_Herb_03) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_01) >=2)
    {
	CreateInvItem (hero,ItFo_Potion_Health_Perma_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_01,8);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_03, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_01, 2);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };   
   };
 FUNC VOID DIA_PC_Hero_SpecialPotions_EN()
{
    if (Npc_HasItems (hero, ItFo_Plants_Stoneroot_02) >=2) && (Npc_HasItems (hero, ItFo_Plants_RavenHerb_02) >=5) && (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Mana_Perma_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_Stoneroot_02,2);
    Npc_RemoveInvItems (hero, ItFo_Plants_RavenHerb_02, 5);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (50);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
 FUNC VOID DIA_PC_Hero_SpecialPotions_Q1()
{
    if (Npc_HasItems (hero, ItFo_Plants_Speed01) >=1) && (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=1) //&& (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Haste_01);
    Npc_RemoveInvItem (hero, ItFo_Plants_Speed01);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01, 1);
	//Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
 FUNC VOID DIA_PC_Hero_SpecialPotions_Q2()
{
    if (Npc_HasItems (hero, ItFo_GreenMushroom) >=1) && (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=1) //&& (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Haste_02);
    Npc_RemoveInvItem (hero, ItFo_GreenMushroom);
	Npc_RemoveInvItems (hero, ItFo_Potion_Water_01, 1);
    //Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
 FUNC VOID DIA_PC_Hero_SpecialPotions_Q3()
{
    if (Npc_HasItems (hero, ItFo_Plants_OrcHerb_01) >=1) && (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=1) //&& (Npc_HasItems (hero, ItMi_Alchemy_Syrianoil_01) >=1)
    {
	CreateInvItem (hero,ItFo_Potion_Haste_03);
    Npc_RemoveInvItem (hero, ItFo_GreenMushroom);
	Npc_RemoveInvItems (hero, ItFo_Potion_Water_01, 1);
	//Npc_RemoveInvItems (hero, ItMi_Alchemy_Syrianoil_01, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (Zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (Ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (Orkowe ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };    
   };
   
	//test na guru
	FUNC VOID DIA_PC_Hero_SpecialPotions_GUR()
	{
    if (Npc_HasItems (hero, ItFo_Mod_WolfBerrys) >=1) && (Npc_HasItems (hero, ItFo_Mod_Sage) >=1) && (Npc_HasItems (hero, ItFo_Mod_LightMushroom) >=1)
    {
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "1/8 soku z wilczej jagody", DIA_PC_Hero_SpecialPotions_GUR_18);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "1/2 soku z wilczej jagody", DIA_PC_Hero_SpecialPotions_GUR_12);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "1/4 soku z wilczej jagody ", DIA_PC_Hero_SpecialPotions_GUR_14);
    } 
	else 
	{
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };   
};
//FUNKCJE ZWI¥ZANE Z SOKIEM Z JAGÓD
func void DIA_PC_Hero_SpecialPotions_GUR_18 ()
{
Print ("Dobrze!");
B_GiveXP (100);
Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wyrzuæ wnêtrze liœci sza³wii", DIA_PC_Hero_SpecialPotions_GUR_WNE);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wyrzuæ krawêdzie liœci sza³wii", DIA_PC_Hero_SpecialPotions_GUR_ZEW);
};
func void DIA_PC_Hero_SpecialPotions_GUR_12 ()
{
Print ("le!");
Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
AI_StopProcessInfos	(self);  
};
func void DIA_PC_Hero_SpecialPotions_GUR_14 ()
{
Print ("le!");
Npc_RemoveInvItems (hero, ItFo_Mod_WolfBerrys,1);
AI_StopProcessInfos	(self);  
};
// FUNKCJE ZWI¥ZANE Z LIŒÆMI SZA£WII
func void DIA_PC_Hero_SpecialPotions_GUR_WNE ()
{
Print ("le!");
Npc_RemoveInvItems (hero, ItFo_Mod_Sage,1);
AI_StopProcessInfos	(self); 
};
func void DIA_PC_Hero_SpecialPotions_GUR_ZEW ()
{
	Print ("Dobrze!");
	B_GiveXP (100);
	Npc_RemoveInvItems (hero, ItFo_Mod_Sage,1);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
 	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wytnij górn¹ czêœæ kapelusza i dodaj", DIA_PC_Hero_SpecialPotions_GUR_KAPELUSZ);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wytnij doln¹ czêœæ kapelusza i dodaj", DIA_PC_Hero_SpecialPotions_GUR_SPOD);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wytnij nogê grzyba i dodaj do mikstury", DIA_PC_Hero_SpecialPotions_GUR_NOGA);
};
// FUNKCJE ZWI¥ZANE Z GRZYBEM 
func void  DIA_PC_Hero_SpecialPotions_GUR_KAPELUSZ ()
{
Print ("le! Utraci³eœ cenny grzyb!");
Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
AI_StopProcessInfos	(self); 
};
func void  DIA_PC_Hero_SpecialPotions_GUR_SPOD ()
{
Print ("Œwietnie! Teraz gotowanie!");
B_GiveXP (100);
Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
 	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Podgrzewaj 15 minut", DIA_PC_Hero_SpecialPotions_GUR_T15);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Podgrzewaj 13 minut", DIA_PC_Hero_SpecialPotions_GUR_T13);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Podgrzewaj 12 minut", DIA_PC_Hero_SpecialPotions_GUR_T12);
};
func void  DIA_PC_Hero_SpecialPotions_GUR_NOGA ()
{
Print ("le! Utraci³eœ cenny grzyb!");
Npc_RemoveInvItems (hero, ItFo_Mod_LightMushroom,1);
AI_StopProcessInfos	(self); 
};
// FUNKCJE ZWI¥ZANE Z GOTOWANIEM
func void DIA_PC_Hero_SpecialPotions_GUR_T15 ()
{
Print ("le! Rozgotowa³o siê!");
AI_StopProcessInfos	(self); 
}; 
func void DIA_PC_Hero_SpecialPotions_GUR_T13 ()
{
	Print ("Œwietnie! Uwarzy³eœ miksturê!");
	CreateInvItem (hero,ItFo_Potion_Clear);
  //  Npc_RemoveInvItems (hero, ItFo_Plants_Speed01,2);
  //  Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	//Print ("Uwarzy³eœ miksturê");
	B_giveXP (100);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
	AI_StopProcessInfos	(self); 
};
func void DIA_PC_Hero_SpecialPotions_GUR_T12 ()
{
Print ("le! Niedogotowane!");
AI_StopProcessInfos	(self); 
};
/* 	CreateInvItem (hero,ItFo_Potion_Haste_03);
    Npc_RemoveInvItems (hero, ItFo_Plants_Speed01,2);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (10);  */

func void DIA_PC_Hero_SpecialPotions_PLAGUE ()
{
if (Npc_HasItems (hero, ItFo_Plants_OrcHerb_02) >=1) && (Npc_HasItems (hero, ItFo_Plants_Nightshadow_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_mountainmoos_01) >=1)
    {
	CreateInvItem (hero,ItMis_Drug);
    Npc_RemoveInvItem (hero, ItFo_Plants_OrcHerb_02);
    Npc_RemoveInvItems (hero, ItFo_Plants_Nightshadow_01, 1);
	Npc_RemoveInvItems (hero, ItFo_Plants_mountainmoos_01, 1);
	Print ("Uwarzy³eœ miksturê");
	B_giveXP (150);
	Info_ClearChoices		(DIA_PC_Hero_SpecialPotions);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, DIALOG_BACK, DIA_PC_Hero_SpecialPotions_BACK);
	if (HeroKnows_AlchemySprintPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Ma³a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Œrednia mikstura szybkoœci (ciemny grzyb, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q2);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Du¿a mikstura szybkoœci (zêbate ziele, Serafis, woda)", DIA_PC_Hero_SpecialPotions_Q3);
	};
	if (HeroKnows_AlchemyPermPotions1)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura si³y ", DIA_PC_Hero_SpecialPotions_STR);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura zrêcznoœci", DIA_PC_Hero_SpecialPotions_DEX);
	};
	if (HeroKnows_AlchemyPermPotions2)
	{
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura ¿ycia ", DIA_PC_Hero_SpecialPotions_HP);
    Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura energii", DIA_PC_Hero_SpecialPotions_EN);
	};
	if (HeroKnows_AlchemyClarityMixture)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Mikstura oczyszczenia ", DIA_PC_Hero_SpecialPotions_GUR);
	};
	if (HeroKnows_AlchemyAganistPlague)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Lekarstwo na zarazê", DIA_PC_Hero_SpecialPotions_PLAGUE);
	};
	if (HeroKnows_AlchemyTimedPotions)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar si³y", DIA_PC_Hero_SpecialPotions_STRT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar zwinnoœci", DIA_PC_Hero_SpecialPotions_DEXT1); 
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar many", DIA_PC_Hero_SpecialPotions_MANT1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar potêgi", DIA_PC_Hero_SpecialPotions_MAST1);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Wywar ¿ycia", DIA_PC_Hero_SpecialPotions_HPT1);
	};
	if (HeroKnows_AlchemyPotionsPower)
	{
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój potêgi", DIA_PC_Hero_SpecialPotions_KING);
	Info_AddChoice		(DIA_PC_Hero_SpecialPotions, "Napój w³adzy", DIA_PC_Hero_SpecialPotions_MAGE); 
	};
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};

//========================================
//-----------------> Alcohol
//========================================

INSTANCE DIA_PC_Hero_Alcohol (C_INFO)
{
   npc          = PC_Hero;
   nr           = 100;
   condition    = DIA_PC_Hero_Alcohol_Condition;
   information  = DIA_PC_Hero_Alcohol_Info;
   permanent	= true;
   description	= "(Gorza³ka)";
};

FUNC INT DIA_PC_Hero_Alcohol_Condition()
{
if (monolog == Alchemia)
 && (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Alcohol_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
	//if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01 >= 1))
	//{
	//Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wzmocniony alkohol ", DIA_PC_Hero_Alcohol_QuestAlco);
//};
};

FUNC VOID DIA_PC_Hero_Alcohol_BACK()
{
    Info_ClearChoices	(DIA_PC_Hero_Alcohol);
};

FUNC VOID DIA_PC_Hero_Alcohol_NalewkaApple()
{
    if (Npc_HasItems (hero, ItFoApple) >=5) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=2) 
    {
	CreateInvItem (hero,ItFoNalewkaApple);
    Npc_RemoveInvItems (hero, ItFoApple,5);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 2);
	Print ("Przygotowa³eœ nalewkê!");
	B_giveXP (10);
    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Nalewkaberrys()
{
    if (Npc_HasItems (hero, ItFoApple) >=10) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=2) 
    {
	CreateInvItem (hero,ItFoNalewkaApple);
    Npc_RemoveInvItems (hero, ItFo_Plants_Berrys_01,10);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 2);
	Print ("Przygotowa³eœ nalewkê!");
	B_giveXP (10);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Nalewkaplants()
{
    if (Npc_HasItems (hero, ItFo_ForestHerb) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=2) && (Npc_HasItems (hero, ItFo_MountainHerb) >=2) 
    {
	CreateInvItem (hero,ItFoNalewkaApple);
    Npc_RemoveInvItems (hero, ItFo_ForestHerb,1);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 2);
	Npc_RemoveInvItems (hero, ItFo_MountainHerb,1);
	Print ("Przygotowa³eœ nalewkê!");
	B_giveXP (25);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Honey1()
{
    if (Npc_HasItems (hero, ItFo_Honey) >=3) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) 
    {
	CreateInvItem (hero,ItFoHoneyAlco);
    Npc_RemoveInvItems (hero, ItFo_Honey,3);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Print ("Przygotowa³eœ miód pitny!");
	B_giveXP (25);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_HoneyBeer()
{
    if (Npc_HasItems (hero, ItFo_Honey) >=2) && (Npc_HasItems (hero, ItFoBeer) >=2) 
    {
	CreateInvItem (hero,ItFoHoneyAlco);
    Npc_RemoveInvItems (hero, ItFo_Honey,2);
    Npc_RemoveInvItems (hero, ItFoBeer, 2);
	Print ("Przygotowa³eœ piwo miodowe!");
	B_giveXP (25);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Bimber()
{
    if (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1) && (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=5) 
    {
	CreateInvItem (hero,ItFoHoneyAlco);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01,1);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 5);
	Print ("Przygotowa³eœ bimber!");
	B_giveXP (25);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Absynt()
{
    if (Npc_HasItems (hero, ItFo_Plants_Seraphis_01) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=5) 
    {
	CreateInvItem (hero,ItFoHoneyAlco);
    Npc_RemoveInvItems (hero, ItFo_Plants_Seraphis_01,1);
    Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 5);
	Print ("Przygotowa³eœ absynt!");
	B_giveXP (25);
    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_Sztylet()
{
    if (Npc_HasItems (hero, ItFo_Plants_Trollberrys_01) >=1) && (Npc_HasItems (hero, ItMi_Plants_Swampherb_01) >=1) 
    {
	CreateInvItem (hero,ItFoCiosSztyletu);
    Npc_RemoveInvItems (hero, ItFo_Plants_Trollberrys_01,1);
    Npc_RemoveInvItems (hero, ItMi_Plants_Swampherb_01, 1);
	Print ("Przygotowa³eœ Cios sztyletu!");
	B_giveXP (40);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_RiceAlco()
{
    if (Npc_HasItems (hero, ItFo_Potion_Water_01) >=4) && (Npc_HasItems (hero, ItFoRice) >=3)  && (Npc_HasItems (hero, ItMi_Alchemy_Zucker_01) >=1) 
    {
	CreateInvItem (hero,ItFoBooze);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01,4);
    Npc_RemoveInvItems (hero, ItFoRice, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Zucker_01,1);
	Print ("Przygotowa³eœ ry¿ówkê!");
	B_giveXP (30);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Alcohol_VinoAlco()
{
    if (Npc_HasItems (hero, ItFo_Potion_Water_01) >=2) && (Npc_HasItems (hero, ItFo_wineberrys_01) >=3)  && (Npc_HasItems (hero, ItMi_Alchemy_Zucker_01) >=1) 
    {
	CreateInvItem (hero,ItFoWine);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01,2);
    Npc_RemoveInvItems (hero, ItFo_wineberrys_01, 3);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Zucker_01,1);
	Print ("Przygotowa³eœ wino!");
	B_giveXP (30);
    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte1) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jab³kowa", DIA_PC_Hero_Alcohol_NalewkaApple);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka jagodowa", DIA_PC_Hero_Alcohol_Nalewkaberrys);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte3) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Nalewka zio³owa", DIA_PC_Hero_Alcohol_Nalewkaplants);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Absynt"	, DIA_PC_Hero_Alcohol_Absynt);
	};
	if (Npc_HasItems (hero, ItWr_SpiritsRecipte2) >=1)
	{	
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Miód pitny"		, DIA_PC_Hero_Alcohol_Honey1);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Piwo miodowe"	, DIA_PC_Hero_Alcohol_HoneyBeer);
	};
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Bimber"	, DIA_PC_Hero_Alcohol_Bimber);
	if (Npc_HasItems (hero, ItWr_NiczymCiosSztyletu) >=1)
	{
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Cios sztyletu"	, DIA_PC_Hero_Alcohol_Sztylet);
	};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};
/*
func void DIA_PC_Hero_Alcohol_QuestAlco ()
{
    if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1)  && (Npc_HasItems (hero, ItMi_Alchemy_Zucker_01) >=1) 
    {
	CreateInvItem (hero,ItMi_Alchemy_Alcohol_02);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01,1);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01, 1);
	Npc_RemoveInvItems (hero, ItMi_Alchemy_Zucker_01,1);
	Print ("Ulepszy³eœ alkohol!");
	B_giveXP (120);
	    Info_ClearChoices		(DIA_PC_Hero_Alcohol);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, DIALOG_BACK, DIA_PC_Hero_Alcohol_BACK);
    Info_AddChoice		(DIA_PC_Hero_Alcohol, "Ry¿ówka (cukier, 3 miski ry¿u, 4 butelki wody)", DIA_PC_Hero_Alcohol_RiceAlco);
	Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wino	   (cukier, 3 winogrona, 2 butelki wody)", DIA_PC_Hero_Alcohol_VinoAlco);
	//if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01 >= 1))
	//{
	//Info_AddChoice		(DIA_PC_Hero_Alcohol, "Wzmocniony alkohol (cukier, woda)", DIA_PC_Hero_Alcohol_QuestAlco);
	//};
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };    
}; */
//========================================
//-----------------> Trucizny
//========================================

INSTANCE DIA_PC_Hero_Trucizny (C_INFO)
{
   npc          = PC_Hero;
   nr           = 6;
   condition    = DIA_PC_Hero_Trucizny_Condition;
   information  = DIA_PC_Hero_Trucizny_Info;
   permanent	= true;
   description	= "(Trucizny)";
};

FUNC INT DIA_PC_Hero_Trucizny_Condition()
{
	if (monolog == Alchemia)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)     
	{
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Trucizny_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Trucizny);
	Info_AddChoice		(DIA_PC_Hero_Trucizny, DIALOG_BACK, DIA_PC_Hero_Trucizny_Back);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "S³aba trucizna (truj¹cy grzyb, woda)", DIA_PC_Hero_Trucizny_Little);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Zwyk³a trucizna (truj¹cy grzyb, alkohol)", DIA_PC_Hero_Trucizny_Medium);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Silna trucizna (truj¹cy grzyb, siarka)", DIA_PC_Hero_Trucizny_Large);
};
func void DIA_PC_Hero_Trucizny_Back ()
{
Info_ClearChoices		(DIA_PC_Hero_Trucizny);
};
FUNC VOID DIA_PC_Hero_Trucizny_Little()
{
	if (Npc_HasItems (hero, ItFo_Potion_Water_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_mushroom_03) >=1)  
    {
	CreateInvItem (hero,ItMi_Alchemy_trucizna_01);
    Npc_RemoveInvItems (hero, ItFo_Potion_Water_01,1);
    Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_03, 1);
	Print ("Przygotowa³eœ truciznê!");
	B_giveXP (15);
	    Info_ClearChoices		(DIA_PC_Hero_Trucizny);
	Info_AddChoice		(DIA_PC_Hero_Trucizny, DIALOG_BACK, DIA_PC_Hero_Trucizny_Back);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "S³aba trucizna (truj¹cy grzyb, woda)", DIA_PC_Hero_Trucizny_Little);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Zwyk³a trucizna (truj¹cy grzyb, alkohol)", DIA_PC_Hero_Trucizny_Medium);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Silna trucizna (truj¹cy grzyb, siarka)", DIA_PC_Hero_Trucizny_Large);
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Trucizny_Medium()
{
	if (Npc_HasItems (hero, ItMi_Alchemy_Alcohol_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_mushroom_03) >=1)  
    {
	CreateInvItem (hero,ItMi_Alchemy_trucizna_02);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Alcohol_01,1);
    Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_03, 1);
	Print ("Przygotowa³eœ truciznê");
	B_giveXP (15);
	    Info_ClearChoices		(DIA_PC_Hero_Trucizny);
	Info_AddChoice		(DIA_PC_Hero_Trucizny, DIALOG_BACK, DIA_PC_Hero_Trucizny_Back);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "S³aba trucizna (truj¹cy grzyb, woda)", DIA_PC_Hero_Trucizny_Little);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Zwyk³a trucizna (truj¹cy grzyb, alkohol)", DIA_PC_Hero_Trucizny_Medium);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Silna trucizna (truj¹cy grzyb, siarka)", DIA_PC_Hero_Trucizny_Large);
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Trucizny_Large()
{
	if (Npc_HasItems (hero, ItMi_Alchemy_Sulphur_01) >=1) && (Npc_HasItems (hero, ItFo_Plants_mushroom_03) >=1)  
    {
	CreateInvItem (hero,ItMi_Alchemy_trucizna_03);
    Npc_RemoveInvItems (hero, ItMi_Alchemy_Sulphur_01,1);
    Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_03, 1);
	Print ("Przygotowa³eœ truciznê");
	B_giveXP (30);
	    Info_ClearChoices		(DIA_PC_Hero_Trucizny);
	Info_AddChoice		(DIA_PC_Hero_Trucizny, DIALOG_BACK, DIA_PC_Hero_Trucizny_Back);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "S³aba trucizna (truj¹cy grzyb, woda)", DIA_PC_Hero_Trucizny_Little);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Zwyk³a trucizna (truj¹cy grzyb, alkohol)", DIA_PC_Hero_Trucizny_Medium);
    Info_AddChoice		(DIA_PC_Hero_Trucizny, "Silna trucizna (truj¹cy grzyb, siarka)", DIA_PC_Hero_Trucizny_Large);
    } else {
	Print ("Nie masz sk³adników!");
    AI_StopProcessInfos	(self);         
   };     
};

//========================================
//-----------------> Tyton_Alch
//========================================

INSTANCE DIA_PC_Hero_Tyton_Alch (C_INFO)
{
   npc          = PC_Hero;
   nr           = 7;
   condition    = DIA_PC_Hero_Tyton_Alch_Condition;
   information  = DIA_PC_Hero_Tyton_Alch_Info;
   permanent	= true;
   description	= "(Tytoñ)";
};

FUNC INT DIA_PC_Hero_Tyton_Alch_Condition()
{
	if (monolog == Alchemia)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_FIREMASTER) >= 1)     
	{
    return TRUE;
    };
};


FUNC VOID DIA_PC_Hero_Tyton_Alch_Info()
{
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
};
func void DIA_PC_Hero_Tyton_Alch_Back ()
{
Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
};
FUNC VOID DIA_PC_Hero_Tyton_Alch_Little()
{
	if (Npc_HasItems (hero, ItMi_Tuton) >=1) && (Npc_HasItems (hero, ItFoApple) >=1)  
    {
	CreateInvItem (hero,ItMi_Tuton_1);
    Npc_RemoveInvItems (hero, ItMi_Tuton,1);
    Npc_RemoveInvItems (hero, ItFoApple, 1);
	Print ("Przygotowa³eœ tytoñ!");
	B_giveXP (15);
	    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Tyton_Alch_Medium()
{
	if (Npc_HasItems (hero, ItMi_Tuton) >=1) && (Npc_HasItems (hero, ItFo_Plants_mushroom_02) >=1)  
    {
	CreateInvItem (hero,ItMi_Tuton_2);
    Npc_RemoveInvItems (hero, ItMi_Tuton,1);
    Npc_RemoveInvItems (hero, ItFo_Plants_mushroom_02, 1);
	Print ("Przygotowa³eœ tytoñ!");
	B_giveXP (15);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};

FUNC VOID DIA_PC_Hero_Tyton_Alch_Large()
{
	if (Npc_HasItems (hero, ItMi_Tuton) >=1) && (Npc_HasItems (hero, ItFo_Honey) >=1)  
    {
	CreateInvItem (hero,ItMi_Tuton_3);
    Npc_RemoveInvItems (hero, ItMi_Tuton,1);
    Npc_RemoveInvItems (hero, ItFo_Honey, 1);
	Print ("Przygotowa³eœ tytoñ!");
	B_giveXP (15);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
FUNC VOID DIA_PC_Hero_Tyton_Alch_Ziolo()
{
	if (Npc_HasItems (hero, ItMi_Tuton) >=1) && (Npc_HasItems (hero, ItFo_Plants_Herb_01) >=1)  
    {
	CreateInvItem (hero,ItMi_Tuton_4);
    Npc_RemoveInvItems (hero, ItMi_Tuton,1);
    Npc_RemoveInvItems (hero, ItFo_Plants_Herb_01, 1);
	Print ("Przygotowa³eœ tytoñ!");
	B_giveXP (15);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
//quest GRAVO
FUNC VOID DIA_PC_Hero_Tyton_Alch_QUEST1()
{
	if (Npc_HasItems (hero, ItMi_Tuton_1) >=1) && (Npc_HasItems (hero, ItMiJoint_1) >=1)  
    {
	CreateInvItem (hero,ItMiJoint_Apple);
    Npc_RemoveInvItems (hero, ItMi_Tuton_1,1);
    Npc_RemoveInvItems (hero, ItMiJoint_1, 1);
	Print ("Przygotowa³eœ jointa!");
	B_giveXP (15);
	    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
FUNC VOID DIA_PC_Hero_Tyton_Alch_QUEST2()
{
	if (Npc_HasItems (hero, ItMi_Tuton_2) >=1) && (Npc_HasItems (hero, ItMiJoint_1) >=1)  
    {
	CreateInvItem (hero,ItMiJoint_Honey);
    Npc_RemoveInvItems (hero, ItMi_Tuton_2,1);
    Npc_RemoveInvItems (hero, ItMiJoint_1, 1);
	Print ("Przygotowa³eœ jointa!");
	B_giveXP (15);
	    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
FUNC VOID DIA_PC_Hero_Tyton_Alch_QUEST3()
{
	if (Npc_HasItems (hero, ItMi_Tuton_4) >=1) && (Npc_HasItems (hero, ItMiJoint_1) >=1)  
    {
	CreateInvItem (hero,ItMiJoint_Mush);
    Npc_RemoveInvItems (hero, ItMi_Tuton_4,1);
    Npc_RemoveInvItems (hero, ItMiJoint_1, 1);
	Print ("Przygotowa³eœ jointa!");
	B_giveXP (15);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
FUNC VOID DIA_PC_Hero_Tyton_Alch_QUEST4()
{
	if (Npc_HasItems (hero, ItMi_Tuton_3) >=1) && (Npc_HasItems (hero, ItMiJoint_1) >=1)  
    {
	CreateInvItem (hero,ItMiJoint_Plant);
    Npc_RemoveInvItems (hero, ItMi_Tuton_3,1);
    Npc_RemoveInvItems (hero, ItMiJoint_1, 1);
	Print ("Przygotowa³eœ jointa!");
	B_giveXP (15);
    Info_ClearChoices		(DIA_PC_Hero_Tyton_Alch);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, DIALOG_BACK, DIA_PC_Hero_Tyton_Alch_Back);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ jab³kowy (zwyk³y tytoñ, jab³ko)", DIA_PC_Hero_Tyton_Alch_Little);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Tytoñ grzybowy (zwyk³y tytoñ, gorzki chleb)", DIA_PC_Hero_Tyton_Alch_Medium);
    Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy tytoñ  (zwyk³y tytoñ, miód)", DIA_PC_Hero_Tyton_Alch_Large);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy tytoñ  (zwyk³y tytoñ, ma³e zio³a uzdrawiaj¹ce)", DIA_PC_Hero_Tyton_Alch_Ziolo);
	//jointy quest
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Jab³kowy Nowicjusz (jab³kowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST1);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Miodowy Nowicjusz (miodowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST2);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Grzybowy Nowicjusz (grzybowy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST3);
	Info_AddChoice		(DIA_PC_Hero_Tyton_Alch, "Zio³owy Nowicjusz (zio³owy tytoñ, Zielony Nowicjusz)", DIA_PC_Hero_Tyton_Alch_QUEST4);
    } else {
	Print ("Nie masz sk³adników");
    AI_StopProcessInfos	(self);         
   };     
};
