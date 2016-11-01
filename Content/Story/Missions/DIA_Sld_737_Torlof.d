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
	description = "Kim jesteœ?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Nazywam siê Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Bra³em udzia³ w buncie za³ogi na pok³adzie królewskiego okrêtu.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //To chyba nie by³ najlepszy pomys³. Wiêksza czêœæ za³ogi by³a po stronie kapitana.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //W ten sposób wyl¹dowa³em tutaj.
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
	description = "Chcia³bym do was do³¹czyæ.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Chcia³bym do was do³¹czyæ.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee przyjmuje tylko najlepszych ludzi, mo¿esz mi wierzyæ.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //I dopóki nie bêdziesz jednym z nich radzê ci dobrze ¿yæ z Laresem i jego zgraj¹.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Jeœli chcesz dobr¹ radê, ch³opcze: spróbuj zwin¹æ coœ ze Starego Obozu albo Starej Kopalni.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Kiedy ch³opcy uznaj¹, ¿e nie przepadasz za Gomezem, przestan¹ ci sprawiaæ k³opoty.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //A jak mam to zrobiæ?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Najpierw musisz zyskaæ ich zaufanie, a potem bêdziesz móg³ ich zrobiæ w konia!
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
	description = "Was kannst du mir über dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir über dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schlägereien.
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
   description	= "Szukam poparcia Najemników.";
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
    AI_Output (other, self ,"DIA_Torlof_PoparcieNajemnikow_15_01"); //Szukam poparcia Najemników.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_02"); //I pewnie stwierdzi³eœ, ¿e jestem kimœ wa¿nym?
	AI_Output (other, self ,"DIA_Torlof_PoparcieNajemnikow_15_03"); //A myli³em siê?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_04"); //Sam siê przekonaj. Bêdê mia³ dla ciebie zadanie. Akurat potrzebny mi ch³opiec na posy³ki.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_05"); //WeŸ mój topór i zanieœ go do Huana. Ten chytry Szkodnik obieca³ mi naprawdê.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_06"); //Do jutra chcê mieæ topór z powrotem. Inaczej pos¹dzê ciê o kradzie¿, a wiedz, ¿e bardzo nie lubiê z³odziei. 
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_07"); //Masz, pilnuj go jak oka w g³owie!
	
	//AI_UnequipWeapons (self);
	//AI_EquipBestRangedWeapon (self);
	CreateInvItems (self,Torlofs_Axt2,1);
	B_GiveInvItems (self, hero,Torlofs_Axt2,1);
	
	Npc_RemoveInvItems (self, Torlofs_Axt,1);
	CreateInvItems (self,ItMw_2H_Axe_Big_03,1);
	AI_EquipBestMeleeWeapon (self);
	self.flags = 2;
	
	B_LogEntry      (CH1_AwansJakoKret,"Podj¹³em siê zadania Torlofa. Mam zanieœæ jego topór do kowala Huana, którego znajdê w obozie.");
	
	MIS_TorlofsAxe = LOG_RUNNING;

    Log_CreateTopic          (CH1_TorlofsAxe, LOG_MISSION);
    Log_SetTopicStatus       (CH1_TorlofsAxe, LOG_RUNNING);
    B_LogEntry               (CH1_TorlofsAxe,"Torlof poprosi³ mnie, aby oddaæ jego topór do naprawy Szkodnikowi Huanowi. Szkodnika znajdê w obozowej kuŸni, a na naprawê orê¿a mam jeden dzieñ.");
	
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
   description	= "Mam twój topór.";
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
    AI_Output (other, self ,"DIA_Torlof_GiveAxe_15_01"); //Mam twój topór.
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_02"); //To œwietnie. Poka¿ mi go.
	B_GiveInvItems (hero, self, Torlofs_Axt2_Fixed,1);
	Npc_RemoveInvItems (self,Torlofs_Axt2_Fixed,1);
	AI_EquipBestMeleeWeapon (self);
	AI_Output (other, self ,"DIA_Torlof_GiveAxe_15_03"); //Jesteœ zadowolony?
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_04"); //Jak najbardziej. Huan to szumowina, ale kowal z niego bystry. Choæ pewnie nie najbystrzejszy.
    AI_Output (self, other ,"DIA_Torlof_GiveAxe_03_05"); //Dobrze siê spisa³eœ. Masz mój g³os.
    
	self.flags = 0;
	
	B_LogEntry      (CH1_AwansJakoKret,"Wykonuj¹c zadanie dla Torlofa, zyska³em jego poparcie.");
	
	MIS_TorlofsAxe = LOG_SUCCESS;

    Log_SetTopicStatus       (CH1_TorlofsAxe, LOG_SUCCESS);
    B_LogEntry               (CH1_TorlofsAxe,"Torlof odzyska³ swój topór. Pozytywnie zaopiniuje mnie u odpowiednich osób.");
	
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
    AI_Output (self, other ,"DIA_Torlof_AxeFailed_03_01"); //Bêdê ciê pra³ codziennie, a¿ do dnia w którym oddasz mi mój NAPRAWIONY topór.

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
   description	= "W karczmie s¹ jakieœ nieœcis³oœci.";
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
    AI_Output (other, self ,"DIA_Torlof_Confident_15_01"); //W karczmie s¹ jakieœ nieœcis³oœci.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_02"); //O czym ty mówisz?
	AI_Output (other, self ,"DIA_Torlof_Confident_15_03"); //Jeremiasz coœ kombinuje. Wyda³ kilka butelek trunku buntownikom.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_04"); //Zap³aci mi od tego spory podatek. Dziêki, kolego. Zajmê siê tym.
    AI_Output (self, other ,"DIA_Torlof_Confident_03_05"); //Masz tu coœ za fatygê. 
    
	CreateInvItems (self, itminugget, 25);
	B_GiveInvItems (self, hero, itminugget, 25);
	
	Quest_EliminateJeremiah = LOG_SCUCCESS;
	
	B_LogEntry    		(CH1_BuntZbieraczy,"Torlof powiedzia³, ¿e zajmie siê spraw¹ karczmy i alkoholu wydanego buntownikom. Lewus na pewno siê z tego ucieszy. Muszê z nim znów pogadaæ.");
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
   description	= "Mogê wam pomóc?";
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
    AI_Output (other, self ,"DIA_Torlof_iHelpYou_15_01"); //Mogê wam pomóc?
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_02"); //Akurat czekaliœmy na jeszcze jednego ochotnika.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_03"); //Idziemy w stronê Starego Obozu.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_04"); //W okolicy czai siê grupka Stra¿ników. Chcemy siê ich pozbyæ.
    AI_Output (self, other ,"DIA_Torlof_iHelpYou_03_05"); //Powiedz, gdy bêdziesz gotowy.
    MIS_helpSld1 = LOG_RUNNING;

    Log_CreateTopic          (CH1_helpSld1, LOG_MISSION);
    Log_SetTopicStatus       (CH1_helpSld1, LOG_RUNNING);
    B_LogEntry               (CH1_helpSld1,"Torlof wraz z grup¹ Najemników chce siê pozbyæ oddzia³u Stra¿ników zajmuj¹cego dolinê. Zdecydowa³em siê im pomóc. Mam siê zg³osiæ do Torlofa, gdy bêdê gotowy zaatakowaæ.");
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
   description	= "Mo¿emy zaczynaæ!";
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
    AI_Output (other, self ,"DIA_Torlof_Atack789_15_01"); //Mo¿emy zaczynaæ!
    AI_Output (self, other ,"DIA_Torlof_Atack789_03_02"); //IdŸ za mn¹!   
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
    AI_Output (self, other ,"DIA_Torlof_SuccesS_03_01"); //No, ju¿ po wszystkim. Wielkie dziêki za pomoc.
    AI_Output (self, other ,"DIA_Torlof_SuccesS_03_02"); //Oto twoje wynagrodzenie.
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
    B_LogEntry               (CH1_helpSld1,"Pokonaliœmy wszystkich Stra¿ników. Jako wynagrodzenie otrzyma³em 100 bry³ek rudy.");
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
    AI_Output (self, other ,"DIA_Torlof_HELLO13r23_03_01"); //Dobrze ciê widzieæ, m³ody. 
    AI_Output (other, self ,"DIA_Torlof_HELLO13r23_15_02"); //Dziêki za troskê.
    AI_Output (self, other ,"DIA_Torlof_HELLO13r23_03_03"); //Doprawdy, twardym cz³owiekiem jesteœ.
    AI_Output (other, self ,"DIA_Torlof_HELLO13r23_15_04"); //Powiem ci, ¿e to nie by³o takie trudne.
    AI_StopProcessInfos	(self);
};