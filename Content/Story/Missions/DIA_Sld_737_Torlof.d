// ********************************
// 				EXIT
// ********************************
//sprawdzone przez gothic1210
instance DIA_Torlof_EXIT (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_Hallo_Condition;
	information	= DIA_Torlof_Hallo_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Nazywam si� Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Bra�em udzia� w buncie za�ogi na pok�adzie kr�lewskiego okr�tu.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //To chyba nie by� najlepszy pomys�. Wi�ksza cz�� za�ogi by�a po stronie kapitana.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //W ten spos�b wyl�dowa�em tutaj.
};

// ********************************
// 				Mitmachen
// ********************************

instance DIA_Torlof_Mitmachen (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 2;
	condition	= DIA_Torlof_Mitmachen_Condition;
	information	= DIA_Torlof_Mitmachen_Info;
	permanent	= 1;
	description = "Chcia�bym do was do��czy�.";
};                       

FUNC int DIA_Torlof_Mitmachen_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	||	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Chcia�bym do was do��czy�.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee przyjmuje tylko najlepszych ludzi, mo�esz mi wierzy�.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //I dop�ki nie b�dziesz jednym z nich radz� ci dobrze �y� z Laresem i jego zgraj�.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Je�li chcesz dobr� rad�, ch�opcze: spr�buj zwin�� co� ze Starego Obozu albo Starej Kopalni.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Kiedy ch�opcy uznaj�, �e nie przepadasz za Gomezem, przestan� ci sprawia� k�opoty.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //A jak mam to zrobi�?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Najpierw musisz zyska� ich zaufanie, a potem b�dziesz m�g� ich zrobi� w konia!
};

/*

// ********************************
// 				PERM
// ********************************

instance DIA_Torlof_PERM (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 3;
	condition	= DIA_Torlof_PERM_Condition;
	information	= DIA_Torlof_PERM_Info;
	permanent	= 1;
	description = "Was kannst du mir �ber dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir �ber dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schl�gereien.
};

*/

//========================================
//-----------------> PoparcieNajemnikow
//========================================

INSTANCE DIA_Torlof_PoparcieNajemnikow (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_PoparcieNajemnikow_Condition;
   information  = DIA_Torlof_PoparcieNajemnikow_Info;
   permanent	= FALSE;
   description	= "Szukam poparcia Najemnik�w.";
};

FUNC INT DIA_Torlof_PoparcieNajemnikow_Condition()
{
	if (MIS_OpinionInNewCamp == LOG_RUNNING)
    && (Npc_GetTrueGuild(hero) == GIL_SFB)    
	{
    return TRUE;
   };
};


FUNC VOID DIA_Torlof_PoparcieNajemnikow_Info()
{
    AI_Output (other, self ,"DIA_Torlof_PoparcieNajemnikow_15_01"); //Szukam poparcia Najemnik�w.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_02"); //I pewnie stwierdzi�e�, �e jestem kim� wa�nym?
	AI_Output (other, self ,"DIA_Torlof_PoparcieNajemnikow_15_03"); //A myli�em si�?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_04"); //Sam si� przekonaj. B�d� mia� dla ciebie zadanie. Akurat potrzebny mi ch�opiec na posy�ki.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_05"); //We� m�j top�r i zanie� go do Huana. Ten chytry Szkodnik obieca� mi naprawd�.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_06"); //Do jutra chc� mie� top�r z powrotem. Inaczej pos�dz� ci� o kradzie�, a wiedz, �e bardzo nie lubi� z�odziei. 
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_07"); //Masz, pilnuj go jak oka w g�owie!
	
	//AI_UnequipWeapons (self);
	//AI_EquipBestRangedWeapon (self);
	CreateInvItems (self,Torlofs_Axt2,1);
	B_GiveInvItems (self, hero,Torlofs_Axt2,1);
	
	Npc_RemoveInvItems (self, Torlofs_Axt,1);
	CreateInvItems (self,ItMw_2H_Axe_Big_03,1);
	AI_EquipBestMeleeWeapon (self);
	self.flags = 2;
	
	B_LogEntry      (CH1_AwansJakoKret,"Podj��em si� zadania Torlofa. Mam zanie�� jego top�r do kowala Huana, kt�rego znajd� w obozie.");
	
	MIS_TorlofsAxe = LOG_RUNNING;

    Log_CreateTopic          (CH1_TorlofsAxe, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TorlofsAxe, LOG_RUNNING);
    B_LogEntry               (CH1_TorlofsAxe,"Torlof poprosi� mnie, aby odda� jego top�r do naprawy Szkodnikowi Huanowi. Szkodnika znajd� w obozowej ku�ni, a na napraw� or�a mam jeden dzie�.");
	
	Day_TorlofAxe = wld_getday ();
};

//========================================
//-----------------> GiveAxe
//========================================

INSTANCE DIA_Torlof_GiveAxe (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_GiveAxe_Condition;
   information  = DIA_Torlof_GiveAxe_Info;
   permanent	= FALSE;
   description	= "Mam tw�j top�r.";
};

FUNC INT DIA_Torlof_GiveAxe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Huan_GetOreStab)) && (MIS_TorlofsAxe == LOG_RUNNING) && (Npc_HasItems (hero,Torlofs_Axt2_Fixed) == 1)
	{
    return TRUE;
   };
};


FUNC VOID DIA_Torlof_GiveAxe_Info()
{
    AI_Output (other, self ,"DIA_Torlof_GiveAxe_15_01"); //Mam tw�j top�r.
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_02"); //To �wietnie. Poka� mi go.
	B_GiveInvItems (hero, self, Torlofs_Axt2_Fixed,1);
	Npc_RemoveInvItems (self,Torlofs_Axt2_Fixed,1);
	AI_EquipBestMeleeWeapon (self);
	AI_Output (other, self ,"DIA_Torlof_GiveAxe_15_03"); //Jeste� zadowolony?
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_04"); //Jak najbardziej. Huan to szumowina, ale kowal z niego bystry. Cho� pewnie nie najbystrzejszy.
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_05"); //Dobrze si� spisa�e�. Masz m�j g�os.
    
	self.flags = 0;
	
	B_LogEntry      (CH1_AwansJakoKret,"Wykonuj�c zadanie dla Torlofa, zyska�em jego poparcie.");
	
	MIS_TorlofsAxe = LOG_SUCCESS;

    Log_SetTopicStatus       (CH1_TorlofsAxe, LOG_SUCCESS);
    B_LogEntry               (CH1_TorlofsAxe,"Torlof odzyska� sw�j top�r. Pozytywnie zaopiniuje mnie u odpowiednich os�b.");
	
	B_GiveXP (200);
};

//========================================
//-----------------> AxeFailed
//========================================

INSTANCE DIA_Torlof_AxeFailed (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_AxeFailed_Condition;
   information  = DIA_Torlof_AxeFailed_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Torlof_AxeFailed_Condition()
{
    if (MIS_TorlofsAxe == LOG_RUNNING) && (Day_TorlofAxe != wld_getday ()) && self.aivar[AIV_DEALDAY] <= Wld_GetDay()
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_AxeFailed_Info()
{
    AI_Output (self, other ,"DIA_Torlof_AxeFailed_03_01"); //B�d� ci� pra� codziennie, a� do dnia w kt�rym oddasz mi m�j NAPRAWIONY top�r.

    AI_StopProcessInfos	(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
};

/////////////////////////////////////////////
//		Confident
/////////////////////////////////////////////

INSTANCE DIA_Torlof_Confident (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_Confident_Condition;
   information  = DIA_Torlof_Confident_Info;
   permanent	= FALSE;
   description	= "W karczmie s� jakie� nie�cis�o�ci.";
};

FUNC INT DIA_Torlof_Confident_Condition()
{
    if (Quest_EliminateJeremiah == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_Confident_Info()
{
    AI_Output (other, self ,"DIA_Torlof_Confident_15_01"); //W karczmie s� jakie� nie�cis�o�ci.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_02"); //O czym ty m�wisz?
	AI_Output (other, self ,"DIA_Torlof_Confident_15_03"); //Jeremiasz co� kombinuje. Wyda� kilka butelek trunku buntownikom.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_04"); //Zap�aci mi od tego spory podatek. Dzi�ki, kolego. Zajm� si� tym.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_05"); //Masz tu co� za fatyg�. 
    
	CreateInvItems (self, itminugget, 25);
	B_GiveInvItems (self, hero, itminugget, 25);
	
	Quest_EliminateJeremiah = LOG_SCUCCESS;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Torlof powiedzia�, �e zajmie si� spraw� karczmy i alkoholu wydanego buntownikom. Lewus na pewno si� z tego ucieszy. Musz� z nim zn�w pogada�.");
};

//========================================
//-----------------> iHelpYou
//========================================

INSTANCE DIA_Torlof_iHelpYou (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_iHelpYou_Condition;
   information  = DIA_Torlof_iHelpYou_Info;
   permanent	= FALSE;
   description	= "Mog� wam pom�c?";
};

FUNC INT DIA_Torlof_iHelpYou_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_FindFriend2)) || (MIS_TorlofNeedHelp == LOG_RUNNING) || (go_help_torlof == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_iHelpYou_Info()
{
    AI_Output (other, self ,"DIA_Torlof_iHelpYou_15_01"); //Mog� wam pom�c?
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_02"); //Akurat czekali�my na jeszcze jednego ochotnika.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_03"); //Idziemy w stron� Starego Obozu.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_04"); //W okolicy czai si� grupka Stra�nik�w. Chcemy si� ich pozby�.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_05"); //Powiedz, gdy b�dziesz gotowy.
    MIS_helpSld1 = LOG_RUNNING;

    Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    B_LogEntry               (CH1_helpSld1,"Torlof wraz z grup� Najemnik�w chce si� pozby� oddzia�u Stra�nik�w zajmuj�cego dolin�. Zdecydowa�em si� im pom�c. Mam si� zg�osi� do Torlofa, gdy b�d� gotowy zaatakowa�.");
};

//========================================
//-----------------> Atack789
//========================================

INSTANCE DIA_Torlof_Atack789 (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_Atack789_Condition;
   information  = DIA_Torlof_Atack789_Info;
   permanent	= FALSE;
   description	= "Mo�emy zaczyna�!";
};

FUNC INT DIA_Torlof_Atack789_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torlof_iHelpYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_Atack789_Info()
{
    AI_Output (other, self ,"DIA_Torlof_Atack789_15_01"); //Mo�emy zaczyna�!
    AI_Output (self, other ,"DIA_Torlof_Atack789_03_02"); //Id� za mn�!   
	AI_StopProcessInfos	(self);
	Sld_737_Torlof.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (Sld_737_Torlof,"atak");
	BAN_1613_Doyle.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (BAN_1613_Doyle,"pomoc");
	SLD_702_Soeldner.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (SLD_702_Soeldner,"atak"); 
	SLD_703_Soeldner.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (SLD_703_Soeldner,"atak"); 
	SLD_706_Soeldner.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (SLD_706_Soeldner ,"atak"); 
	B_Story_SoldiersFollowPlayer ();
	//SLD_707_Soeldner.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (SLD_707_Soeldner,"atak");   
};

//========================================
//-----------------> SuccesS
//========================================

INSTANCE DIA_Torlof_SuccesS (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 2;
   condition    = DIA_Torlof_SuccesS_Condition;
   information  = DIA_Torlof_SuccesS_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torlof_SuccesS_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torlof_Atack789))
    && (Npc_IsDead(GRD_3355_Gardist))
    && (Npc_IsDead(GRD_3358_Gardist))
    && (Npc_IsDead(GRD_3357_Gardist))
    && (Npc_IsDead(GRD_3359_Gardist))
    && (Npc_IsDead(GRD_3356_Gardist))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_SuccesS_Info()
{
    AI_Output (self, other ,"DIA_Torlof_SuccesS_03_01"); //No, ju� po wszystkim. Wielkie dzi�ki za pomoc.
    AI_Output (self, other ,"DIA_Torlof_SuccesS_03_02"); //Oto twoje wynagrodzenie.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry               (CH1_helpSld1,"Pokonali�my wszystkich Stra�nik�w. Jako wynagrodzenie otrzyma�em 100 bry�ek rudy.");
    Log_SetTopicStatus       (CH1_helpSld1, LOG_SUCCESS);
    MIS_helpSld1 = LOG_SUCCESS;
	
	Sld_737_Torlof.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_702_Soeldner.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_703_Soeldner.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_706_Soeldner.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_707_Soeldner.aivar[AIV_PARTYMEMBER] = FALSE;
	SLD_732_Soeldner.aivar[AIV_PARTYMEMBER] = FALSE;
	
	Npc_ExchangeRoutine (SLD_702_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_703_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_706_Soeldner ,"obrona"); 
	Npc_ExchangeRoutine (SLD_707_Soeldner,"obrona"); 
	Npc_ExchangeRoutine (SLD_737_Torlof,"obrona"); 
	Npc_ExchangeRoutine (SLD_732_Soeldner,"obrona"); 
	BAN_1613_Doyle.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (BAN_1613_Doyle,"wojna");
    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO13r23
//========================================

INSTANCE DIA_Torlof_HELLO13r23 (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_HELLO13r23_Condition;
   information  = DIA_Torlof_HELLO13r23_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torlof_HELLO13r23_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_IHaveStone))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_HELLO13r23_Info()
{
    AI_Output (self, other ,"DIA_Torlof_HELLO13r23_03_01"); //Dobrze ci� widzie�, m�ody. 
    AI_Output (other, self ,"DIA_Torlof_HELLO13r23_15_02"); //Dzi�ki za trosk�.
    AI_Output (self, other ,"DIA_Torlof_HELLO13r23_03_03"); //Doprawdy, twardym cz�owiekiem jeste�.
    AI_Output (other, self ,"DIA_Torlof_HELLO13r23_15_04"); //Powiem ci, �e to nie by�o takie trudne.
    AI_StopProcessInfos	(self);
};