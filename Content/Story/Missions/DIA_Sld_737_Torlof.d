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
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_02"); //To Ÿle trafi³eœ. Chcesz siê szybko dostaæ do Obozu?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_03"); //Raczej ja ci w tym nie pomogê. Jestem bardzo wymagaj¹cy.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_04"); //Lee daje swoim ludziom zbyt du¿o wolnoœci.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_05"); //Zauwa¿, ¿e walkê æwiczy tylko kilka osób. A co je¿eli Gomez zaatakuje?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_06"); //Co wtedy? Wiêkszoœæ ucieknie w góry do Obozu Bandytów.
};

//========================================
//-----------------> YourHardQuest
//========================================

INSTANCE DIA_Torlof_YourHardQuest (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 2;
   condition    = DIA_Torlof_YourHardQuest_Condition;
   information  = DIA_Torlof_YourHardQuest_Info;
   permanent	= FALSE;
   description	= "Chcê siê podj¹æ TWOJEGO zadania.";
};

FUNC INT DIA_Torlof_YourHardQuest_Condition()
{
if (MIS_OpinionInNewCamp == LOG_RUNNING)
&& (Npc_GetTrueGuild(hero) == GIL_SFB)   
&& (Npc_KnowsInfo (hero, DIA_Torlof_PoparcieNajemnikow))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_YourHardQuest_Info()
{
    AI_Output (other, self ,"DIA_Torlof_YourHardQuest_15_01"); //Chcê siê podj¹æ TWOJEGO zadania.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_02"); //Naprawdê? Wiesz w co siê pakujesz?
    AI_Output (other, self ,"DIA_Torlof_YourHardQuest_15_03"); //Przestañ gadaæ bez sensu, powiedz co mam zrobiæ.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_04"); //Och! Rozumiem... (drwi¹co)
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_05"); //Od dawna obserwujê postawê Lewusa i Ry¿owego Ksiêcia.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_06"); //Otrzymali trochê w³adzy od Laresa i panosz¹ siê, jakby ca³y Obóz by³ ich.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_07"); //Szczególnie nie podoba mi siê to, jak wykorzystuj¹ zbieraczy.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_08"); //Zrób coœ, aby zbieraczom ¿y³o siê lepiej. Gdy us³yszê coœ dobrego o tobie, to ciê poprê.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_09"); //Mam ju¿ doœæ tych pata³achów. Powodzenia.
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Podj¹³em siê zadania Torlofa. Mam zrobiæ coœ, by zbieraczom ¿y³o siê lepiej. Mo¿e pogadaæ z którymœ z nich?");
	B_LogEntry      (CH1_AwansJakoKret,"Podj¹³em siê zadania Torlofa. Mam zrobiæ coœ, by zbieraczom ¿y³o siê lepiej. Mo¿e pogadaæ z którymœ z nich?");
};

//========================================
//-----------------> Porady
//========================================

INSTANCE DIA_Torlof_Porady (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 3;
   condition    = DIA_Torlof_Porady_Condition;
   information  = DIA_Torlof_Porady_Info;
   permanent	= FALSE;
   description	= "Mo¿esz mi daæ jakieœ rady?";
};

FUNC INT DIA_Torlof_Porady_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torlof_YourHardQuest))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_Porady_Info()
{
    AI_Output (other, self ,"DIA_Torlof_Porady_15_01"); //Mo¿esz mi daæ jakieœ rady?
    AI_Output (self, other ,"DIA_Torlof_Porady_03_02"); //Spróbuj porozmawiaæ ze zbieraczami. Mo¿e czegoœ siê dowiesz.
};

//========================================
//-----------------> Jeraemiah
//========================================

INSTANCE DIA_Torlof_Jeraemiah (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_Jeraemiah_Condition;
   information  = DIA_Torlof_Jeraemiah_Info;
   permanent	= FALSE;
   description	= "Przyszed³em w sprawie gorzelnika Jeremiasza...";
};

FUNC INT DIA_Torlof_Jeraemiah_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jeremiah_HelpMe))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_Jeraemiah_Info()
{
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_01"); //Przyszed³em w sprawie gorzelnika Jeremiasza...
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_03"); //Potrzebujê kilku butelek alkoholu, jednak ten nie chce mi ich wydaæ z twojego powodu.
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_04"); //Móg³byœ przymkn¹æ oko przy nastêpnej rewizji?
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_03_05"); //Po co ci ten alkohol?

    Info_ClearChoices		(DIA_Torlof_Jeraemiah);
    Info_AddChoice		(DIA_Torlof_Jeraemiah, "Do picia.", DIA_Torlof_Jeraemiah_Picu);
    Info_AddChoice		(DIA_Torlof_Jeraemiah, "Zbieracze planuj¹ bunt.", DIA_Torlof_Jeraemiah_RyzowaDupa);
};

FUNC VOID DIA_Torlof_Jeraemiah_Picu()
{
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_Picu_15_01"); //Do picia.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_Picu_03_02"); //W takim razie...
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_Picu_03_03"); //...nie.
    Info_ClearChoices		(DIA_Torlof_Jeraemiah);//ocenzurowa³em g1210
	Jeremiah_AlcoGiv = false;
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_BuntZbieraczy,"K³amstwo nie wysz³o mi na dobre. Teraz muszê sam sko³owaæ trochê czystej.");
};

FUNC VOID DIA_Torlof_Jeraemiah_RyzowaDupa()
{
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_RyzowaDupa_15_01"); //Zbieracze planuj¹ bunt.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_02"); //Po co wam wódka do buntu?
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_03"); //Ju¿ opijacie zwyciêstwo?
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_RyzowaDupa_15_04"); //Nie, nie. Chcemy podmieniæ ry¿ówkê bandziorów na alkohol, ¿eby ³atwiej ich pokonaæ. Upici nie bêd¹ w stanie dobrze walczyæ.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_05"); //Rozumiem. Powiedz Jeremiaszowi, ¿e nie ma siê czego baæ.
    Info_ClearChoices		(DIA_Torlof_Jeraemiah);
	Jeremiah_AlcoGiv = true;
    B_LogEntry                     (CH1_BuntZbieraczy,"Dogada³em siê z Torlofem. Mogê wzi¹æ alkohol od Jeremiasza.");

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WiemOBuncie
//========================================

INSTANCE DIA_Torlof_WiemOBuncie (C_INFO)
{
   npc          = Sld_737_Torlof;
   nr           = 1;
   condition    = DIA_Torlof_WiemOBuncie_Condition;
   information  = DIA_Torlof_WiemOBuncie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Torlof_WiemOBuncie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torlof_YourHardQuest))
    && (MIS_BuntZbieraczy == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Torlof_WiemOBuncie_Info()
{
    AI_Output (self, other ,"DIA_Torlof_WiemOBuncie_03_01"); //Nie musisz nic mówiæ. Ju¿ wiem.
    AI_Output (self, other ,"DIA_Torlof_WiemOBuncie_03_02"); //Dobra robota. Masz moje poparcie.
    //AI_Output (other, self ,"DIA_Torlof_WiemOBuncie_15_03"); //Dziêki. 
	
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Torlof by³ bardzo zadowolony z mojej pomocy buntownikom. Uda³o mi siê uzyskaæ jego poparcie.");
	B_LogEntry     (CH1_AwansJakoKret,"Torlof by³ bardzo zadowolony z mojej pomocy buntownikom. Uda³o mi siê uzyskaæ jego poparcie.");

    B_GiveXP (350);
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