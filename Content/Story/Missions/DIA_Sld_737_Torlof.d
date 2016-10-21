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
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_02"); //To �le trafi�e�. Chcesz si� szybko dosta� do Obozu?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_03"); //Raczej ja ci w tym nie pomog�. Jestem bardzo wymagaj�cy.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_04"); //Lee daje swoim ludziom zbyt du�o wolno�ci.
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_05"); //Zauwa�, �e walk� �wiczy tylko kilka os�b. A co je�eli Gomez zaatakuje?
    AI_Output (self, other ,"DIA_Torlof_PoparcieNajemnikow_03_06"); //Co wtedy? Wi�kszo�� ucieknie w g�ry do Obozu Bandyt�w.
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
   description	= "Chc� si� podj�� TWOJEGO zadania.";
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
    AI_Output (other, self ,"DIA_Torlof_YourHardQuest_15_01"); //Chc� si� podj�� TWOJEGO zadania.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_02"); //Naprawd�? Wiesz w co si� pakujesz?
    AI_Output (other, self ,"DIA_Torlof_YourHardQuest_15_03"); //Przesta� gada� bez sensu, powiedz co mam zrobi�.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_04"); //Och! Rozumiem... (drwi�co)
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_05"); //Od dawna obserwuj� postaw� Lewusa i Ry�owego Ksi�cia.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_06"); //Otrzymali troch� w�adzy od Laresa i panosz� si�, jakby ca�y Ob�z by� ich.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_07"); //Szczeg�lnie nie podoba mi si� to, jak wykorzystuj� zbieraczy.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_08"); //Zr�b co�, aby zbieraczom �y�o si� lepiej. Gdy us�ysz� co� dobrego o tobie, to ci� popr�.
    AI_Output (self, other ,"DIA_Torlof_YourHardQuest_03_09"); //Mam ju� do�� tych pata�ach�w. Powodzenia.
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Podj��em si� zadania Torlofa. Mam zrobi� co�, by zbieraczom �y�o si� lepiej. Mo�e pogada� z kt�rym� z nich?");
	B_LogEntry      (CH1_AwansJakoKret,"Podj��em si� zadania Torlofa. Mam zrobi� co�, by zbieraczom �y�o si� lepiej. Mo�e pogada� z kt�rym� z nich?");
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
   description	= "Mo�esz mi da� jakie� rady?";
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
    AI_Output (other, self ,"DIA_Torlof_Porady_15_01"); //Mo�esz mi da� jakie� rady?
    AI_Output (self, other ,"DIA_Torlof_Porady_03_02"); //Spr�buj porozmawia� ze zbieraczami. Mo�e czego� si� dowiesz.
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
   description	= "Przyszed�em w sprawie gorzelnika Jeremiasza...";
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
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_01"); //Przyszed�em w sprawie gorzelnika Jeremiasza...
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_03_02"); //O co chodzi?
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_03"); //Potrzebuj� kilku butelek alkoholu, jednak ten nie chce mi ich wyda� z twojego powodu.
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_15_04"); //M�g�by� przymkn�� oko przy nast�pnej rewizji?
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_03_05"); //Po co ci ten alkohol?

    Info_ClearChoices		(DIA_Torlof_Jeraemiah);
    Info_AddChoice		(DIA_Torlof_Jeraemiah, "Do picia.", DIA_Torlof_Jeraemiah_Picu);
    Info_AddChoice		(DIA_Torlof_Jeraemiah, "Zbieracze planuj� bunt.", DIA_Torlof_Jeraemiah_RyzowaDupa);
};

FUNC VOID DIA_Torlof_Jeraemiah_Picu()
{
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_Picu_15_01"); //Do picia.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_Picu_03_02"); //W takim razie...
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_Picu_03_03"); //...nie.
    Info_ClearChoices		(DIA_Torlof_Jeraemiah);//ocenzurowa�em g1210
	Jeremiah_AlcoGiv = false;
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_BuntZbieraczy,"K�amstwo nie wysz�o mi na dobre. Teraz musz� sam sko�owa� troch� czystej.");
};

FUNC VOID DIA_Torlof_Jeraemiah_RyzowaDupa()
{
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_RyzowaDupa_15_01"); //Zbieracze planuj� bunt.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_02"); //Po co wam w�dka do buntu?
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_03"); //Ju� opijacie zwyci�stwo?
    AI_Output (other, self ,"DIA_Torlof_Jeraemiah_RyzowaDupa_15_04"); //Nie, nie. Chcemy podmieni� ry��wk� bandzior�w na alkohol, �eby �atwiej ich pokona�. Upici nie b�d� w stanie dobrze walczy�.
    AI_Output (self, other ,"DIA_Torlof_Jeraemiah_RyzowaDupa_03_05"); //Rozumiem. Powiedz Jeremiaszowi, �e nie ma si� czego ba�.
    Info_ClearChoices		(DIA_Torlof_Jeraemiah);
	Jeremiah_AlcoGiv = true;
    B_LogEntry                     (CH1_BuntZbieraczy,"Dogada�em si� z Torlofem. Mog� wzi�� alkohol od Jeremiasza.");

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
    AI_Output (self, other ,"DIA_Torlof_WiemOBuncie_03_01"); //Nie musisz nic m�wi�. Ju� wiem.
    AI_Output (self, other ,"DIA_Torlof_WiemOBuncie_03_02"); //Dobra robota. Masz moje poparcie.
    //AI_Output (other, self ,"DIA_Torlof_WiemOBuncie_15_03"); //Dzi�ki. 
	
    //B_LogEntry                     (CH1_OpinionInNewCamp,"Torlof by� bardzo zadowolony z mojej pomocy buntownikom. Uda�o mi si� uzyska� jego poparcie.");
	B_LogEntry     (CH1_AwansJakoKret,"Torlof by� bardzo zadowolony z mojej pomocy buntownikom. Uda�o mi si� uzyska� jego poparcie.");

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