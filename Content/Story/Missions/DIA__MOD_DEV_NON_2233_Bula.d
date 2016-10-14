//========================================
//-----------------> Opcje
//========================================

INSTANCE DIA_Bula_Opcje (C_INFO)
{
   npc          = non_2233_Bula;
   nr           = 1;
   condition    = DIA_Bula_Opcje_Condition;
   information  = DIA_Bula_Opcje_Info;
   permanent	= true;
   description	= "opcje developerskie";
};

FUNC INT DIA_Bula_Opcje_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Bula_Opcje_Info()
{
    AI_Output (other, self ,"DIA_Bula_Opcje_15_01"); //NIE U¯YWAÆ BEZ POTRZEBY!
	Info_ClearChoices	(DIA_Bula_Opcje);
	Info_AddChoice		(DIA_Bula_Opcje,DIALOG_BACK									,DIA_Bula_OpcjeBACK);
	Info_AddChoice		(DIA_Bula_Opcje,"Zastosuj zmiany z 1.12 do zapisanej gry!",DIA_Bula_Opcje1);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- dia_WykonanoXD na true",DIA_Bula_DevMode1);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- B_Story_SoldiersValleyDefense",DIA_Bula_DevMode2);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- dia_DIA_Quentin_PrzejscieDalej na true",DIA_Bula_DevMode3);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- test Blizna Armor",DIA_Bula_DevMode4);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- MerdarionTalkSword = true",DIA_Bula_DevMode5);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- CronosTalkSword = true",DIA_Bula_DevMode6);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- MIS_Dostawy = LOG_SUCCESS",DIA_Bula_DevMode7);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- POINTS NC 50",DIA_Bula_DevMode8);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- JEBINJ TARGET",DIA_Bula_DevMode9);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- play video: utueiel die",DIA_Bula_DevMode10);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- teleport ai test",DIA_Bula_DevMode11);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- run: B_Story_FocusCorristoQuest",DIA_Bula_DevMode12);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- play video: fingers_alive",DIA_Bula_DevMode13);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- thompson quest cave",DIA_Bula_DevMode14);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- josep start zs_opetany",DIA_Bula_DevMode15);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- self set name",DIA_Bula_DevMode16);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- abel go away sprint",DIA_Bula_DevMode17);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- jacko away",DIA_Bula_DevMode18);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- AbMine_Soldiers",DIA_Bula_DevMode19);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- game_end",DIA_EXTRO_AVI);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- finish josep's problem",DIA_Bula_DevMode20);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- unlock: dostawy alkoholu",DIA_Bula_DevMode21);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- guild to none",DIA_Bula_DevMode22);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- guild to org",DIA_Bula_DevMode23);
	Info_AddChoice		(DIA_Bula_Opcje,"devmode -- rutyny do trialogów",DIA_Bula_DevMode24);
	//Info_AddChoice		(DIA_Bula_Opcje,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,DIA_Bula_Opcje2);
};

func void DIA_Bula_DevMode24 ()
{
	Npc_ExchangeRoutine (ORG_850_Wedge, "hanargument");
	Npc_ExchangeRoutine (STT_331_Fingers, "hanargument");
	Npc_ExchangeRoutine (VLK_517_Buddler, "meetscatty");
};

func void DIA_Bula_DevMode23 ()
{
	hero.guild = GIL_ORG;
	Npc_SetTrueGuild	(hero,GIL_ORG );
};

func void DIA_Bula_DevMode22 ()
{
	hero.guild = GIL_NONE;
	Npc_SetTrueGuild	(hero,GIL_NONE );
};

func void DIA_Bula_DevMode21 ()
{
devmode_dostawyalkoholu = true;
};

func void DIA_Bula_DevMode20 ()
{
	MIS_JosepZniknal = LOG_RUNNING;

    Log_CreateTopic            (CH1_JosepZniknal, LOG_MISSION);
    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_RUNNING);
    B_LogEntry                     (CH1_JosepZniknal,"Z obozu znikn¹³ jeden z myœliwych. Od Alexa dowiedzia³em siê, ¿e nazywa³ siê Josep i polowa³ w okolicach Nowego Obozu.");
	
	CreateInvItems (self, ItMiNugget, 300);
    B_GiveInvItems (self, other, ItMiNugget, 300);
    B_LogEntry                     (CH1_JosepZniknal,"Josep wróci³ do obozu. Alex by³ bardzo zadowolony z moich dokonañ.");

    Log_SetTopicStatus       (CH1_JosepZniknal, LOG_SUCCESS);
    MIS_JosepZniknal = LOG_SUCCESS;

    B_GiveXP (350);
	Npc_ExchangeRoutine (NON_5614_Josep, "camp");
	EquipItem (NON_5614_Josep, ItMw_1H_Scythe_01);
};

func void DIA_Bula_DevMode19 ()
{
	B_Kapitelwechsel (4);
	B_Story_AbMine_Soldiers ();
};

func void DIA_Bula_DevMode18 ()
{

	Stooges_Fled = TRUE;
	
	Npc_ExchangeRoutine (ORG_862_Jacko,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");
};

func void DIA_Bula_DevMode17 ()
{
	var c_npc abel;
	abel = Hlp_GetNpc(VLK_7003_Abel);
	AI_STANDUP (abel);
	
	CreateInvItem (Abel, ItFo_Potion_Haste_01);
	AI_USEITEM (Abel, ItFo_Potion_Haste_01);
	Npc_ExchangeRoutine (Abel,"run"); 
	AI_SetWalkmode(Abel, NPC_RUN);
	AI_GotoWP (ABel, "OW_PATH_266");
	
};

func void DIA_Bula_DevMode16 ()
{
self.name = "Nocturn";
};

func void DIA_Bula_DevMode15 ()
{
	var c_npc josep; josep = Hlp_GetNpc (NON_5614_Josep);
	Npc_ExchangeRoutine (josep, "camp");
};

func void DIA_Bula_DevMode14 ()
{
    AI_Output (other, NON_5636_Thompson ,"DIA_Thompson_TIMETODIE_15_01"); //Witaj ponownie Kopaczu, widzê ¿e twoje próby wybicia siê zdenerwowa³y pewnych ludzi.
	AI_Output (NON_5636_Thompson, other ,"DIA_Thompson_TIMETODIE_03_02"); //Pos³uchaj, nie wiem co on ci powiedzia³, ale chcê to wyjaœniæ. ChodŸ za mn¹. To nie jest dobre miejsce.
	Npc_ExchangeRoutine (NON_5636_Thompson, "guide");
	AI_StopProcessInfos (self);
	var c_npc bonie; bonie = Hlp_GetNpc (VLK_594_Bonie);
	var c_npc clayde; clayde = Hlp_GetNpc (VLK_595_Clayde);
	Npc_ExchangeRoutine (bonie, "cave");
	Npc_ExchangeRoutine (clayde, "cave");
	AI_Teleport (bonie,"POSLANIEC");
	AI_Teleport (clayde,"CAVE_SNIPES");
	//Niedorzecznoœci poprawione!
};

func void DIA_Bula_DevMode13 ()
{
	PlayVideo ("er_cutscene_fingersalive.bik"); 
};

func void DIA_Bula_DevMode12 ()
{
B_Story_FocusCorristoQuest ();
};

func void DIA_Bula_DevMode11 ()
{
AI_StopProcessInfos (self);
AI_Teleport (self,"OC1");
};

func void DIA_Bula_DevMode10 ()
{

	PlayVideo ("er_cutscene_uturiel.bik"); 
};

func void DIA_Bula_DevMode9 ()
{
Wld_PlayEffect("MFX_MASSDEATH_TARGET",hero,self, 0, 0, 0, TRUE);
};

func void DIA_Bula_DevMode8 ()
{
Points_NC = Points_NC + 100;
};

func void DIA_Bula_DevMode7 ()
{
	AI_Output (other, self ,"DIA_Bandyta_DostawaALL_15_01"); //Uda³o mi siê zanieœæ wszystkim karczmarzom alkohol.
    AI_Output (self, other ,"DIA_Bandyta_DostawaALL_15_02"); //No, to teraz masz trochê wolnego.
		
	B_LogEntry    (CH1_Dostawy,"Zanios³em wszystkim dostawy alkoholu.");
	Log_SetTopicStatus       (CH1_Dostawy, LOG_SUCCESS);
	MIS_Dostawy = LOG_SUCCESS;
	B_GiveXP (150);
	
	Wld_PlayEffect("SPAWN_GOLEM",hero,self, 0, 0, 0, TRUE);
};
func void DIA_Bula_OpcjeBACK ()
{
	Info_ClearChoices	(DIA_Bula_Opcje);
};
 
  func void DIA_Bula_DevMode6 ()
 {
	CronosTalk_Sword = true;
	CreateInvItem (hero,Tokas_Sword);
 };
 
 func void DIA_Bula_DevMode5 ()
 {
	MerdarionTalk_Sword = true;
	CreateInvItem (hero,Tokas_Sword);
 };
 
 func void DIA_Bula_Devmode4 ()
 {
     B_LogEntry                     (CH1_ZabojstwBlizny,"Dziwne... Mil zachowywa³ siê podejrzanie. Powiedzia³, ¿e je¿eli chcê dorobiæ muszê pogadaæ z Kos¹. Mo¿e od niego dowiem siê, dlaczego p³aszcz mia³ trafiæ do Blizny.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
	
	var c_npc blizna; blizna = Hlp_GetNpc (EBR_101_Scar);
	Npc_RemoveInvItems (blizna, EBR_ARMOR_H2, 1);
	CreateInvItems (blizna, BLIZNA_ARMOR_H,1);
	AI_EquipBestArmor (blizna);
	Mdl_SetVisualBody (blizna,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 79,  1, BLIZNA_ARMOR_H);
};

 func void DIA_Bula_DevMode3 ()
 {
	devmode_dia_DIA_Quentin_PrzejscieDalej = true;
 };
 
 func void DIA_Bula_DevMode2 ()
 {
	B_Story_SoldiersValleyDefense ();
 };
 
func void DIA_Bula_DevMode1 ()
{
	devmode_dia_WykonanoXD = 1;
};

func void DIA_Bula_Opcje1 ()
{
	Print ("Sprzeda¿ cukru u Briama");
	CreateInvItems  (BAN_1601_Briam,ItMi_Alchemy_Zucker_01,100);
	OpinionOM = 4;
	czas_ucieczki_scar2 = 5;
	Print ("Opinia w obozie przy kopalni na 4!");
	Info_ClearChoices	(DIA_Bula_Opcje);
	Info_AddChoice		(DIA_Bula_Opcje,DIALOG_BACK									,DIA_Bula_OpcjeBACK);
	Info_AddChoice		(DIA_Bula_Opcje,"Zastosuj zmiany z 1.12 do zapisanej gry!",DIA_Bula_Opcje1);
};
//========================================
//-----------------> animacjeTest
//========================================

INSTANCE DIA_Bula_animacjeTest (C_INFO)
{
   npc          = non_2233_Bula;
   nr           = 2;
   condition    = DIA_Bula_animacjeTest_Condition;
   information  = DIA_Bula_animacjeTest_Info;
   permanent	= true;
   description	= "(PRÓBUJ ANIMACJE)";
};

FUNC INT DIA_Bula_animacjeTest_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Bula_animacjeTest_Info()
{
    AI_Output (other, self ,"DIA_Bula_animacjeTest_15_01"); //SkonfiGuruj moda!
	Info_ClearChoices	(DIA_Bula_animacjeTest);
	Info_AddChoice		(DIA_Bula_animacjeTest,DIALOG_BACK									,DIA_Bula_animacjeTestBACK);
	Info_AddChoice		(DIA_Bula_animacjeTest,"s_Angel_S0 PODPALANIE",DIA_Bula_animacjeTest1);
	Info_AddChoice		(DIA_Bula_animacjeTest,"t_Angel_S0_2_Stand",DIA_Bula_animacjeTest2);
	Info_AddChoice		(DIA_Bula_animacjeTest,"Hum_Innos_A01",DIA_Bula_animacjeTest3);
	Info_AddChoice		(DIA_Bula_animacjeTest,"s_Angel_S1",DIA_Bula_animacjeTest4);
};
func void DIA_Bula_animacjeTestBACK ()
{
	Info_ClearChoices	(DIA_Bula_animacjeTest);
};
func void DIA_Bula_animacjeTest1 ()
{
	Print ("Wyœwietli³em, czy dzia³a to nie wiem. OGIE¯Ñ");
	Wld_PlayEffect("spellFX_Pyrokinesis", hero,self, 100, 100, 100, true ); 
	AI_PlayAni (hero, "s_Angel_S0");

};
func void DIA_Bula_animacjeTest2 ()
{
	Print ("Wyœwietli³em, czy dzia³a to nie wiem.");
	AI_PlayAni (hero, "t_Angel_S0_2_Stand");
};
func void DIA_Bula_animacjeTest3 ()
{
	Print ("Wyœwietli³em, czy dzia³a to nie wiem.");
	AI_PlayAni (hero, "Hum_Innos_A01");
};
func void DIA_Bula_animacjeTest4 ()
{
	Print ("Wyœwietli³em, czy dzia³a to nie wiem.");
	AI_PlayAni (hero, "s_Angel_S1");
};

//========================================
//-----------------> Test_otwieranie_podczas_dialogu
//========================================

INSTANCE DIA_Bula_ER_PLAC_WHEEL (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 300;
   condition    = DIA_Bula_ER_PLAC_WHEEL_Condition;
   information  = DIA_Bula_ER_PLAC_WHEEL_Info;
   permanent	= true;
   description	= "OTWIERANIE BRAMY PODCZAS DIALOGU";
};

FUNC INT DIA_Bula_ER_PLAC_WHEEL_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_ER_PLAC_WHEEL_Info()
{
	self.guild = GIL_GRD;
	Npc_SetTrueGuild (self,GIL_GRD);
	AI_GotoWP (self,"ER_PLAC_WHEEL");
	AI_UseMob(self,"WHEEL",1);
};

//========================================
//-----------------> printtest
//========================================

INSTANCE DIA_Bula_printtest (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 900;
   condition    = DIA_Bula_printtest_Condition;
   information  = DIA_Bula_printtest_Info;
   permanent	= true;
   description	= "TESTUJ PRINTA 10";
};

FUNC INT DIA_Bula_printtest_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_printtest_Info()
{
    CreateInvItems (self, ItMiNugget, 20);
    B_GiveInvItems (self, other, ItMiNugget, 20);
    B_GiveInvItems (other, self, ItMiNugget, 10);
    CreateInvItems (self, ItFo_Plants_Berrys_01, 10);
    B_GiveInvItems (self, other, ItFo_Plants_Berrys_01, 20);
    B_GiveInvItems (other, self, ItFo_Plants_Berrys_01, 10);
    B_GiveXP (300);
	

};

//========================================
//-----------------> printtest2
//========================================

INSTANCE DIA_Bula_printtest2 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 901;
   condition    = DIA_Bula_printtest2_Condition;
   information  = DIA_Bula_printtest2_Info;
   permanent	= true;
   description	= "TESTUJ PRINTA 100";
};

FUNC INT DIA_Bula_printtest2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_printtest2_Info()
{
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
    B_GiveInvItems (other, self, ItMiNugget, 100);
    CreateInvItems (self, ItFo_Plants_Berrys_01, 150);
    B_GiveInvItems (self, other, ItFo_Plants_Berrys_01, 150);
    B_GiveInvItems (other, self, ItFo_Plants_Berrys_01, 100);
    B_GiveXP (300);
};

//========================================
//-----------------> printtest23
//========================================

INSTANCE DIA_Bula_printtest23 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 902;
   condition    = DIA_Bula_printtest23_Condition;
   information  = DIA_Bula_printtest23_Info;
   permanent	= true;
   description	= "TESTUJ PRINTA 1000";
};

FUNC INT DIA_Bula_printtest23_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_printtest23_Info()
{
    CreateInvItems (self, ItMiNugget, 1500);
    B_GiveInvItems (self, other, ItMiNugget, 1500);
    B_GiveInvItems (other, self, ItMiNugget, 1000);
    CreateInvItems (self, ItFo_Plants_Berrys_01, 1500);
    B_GiveInvItems (self, other, ItFo_Plants_Berrys_01, 1500);
    B_GiveInvItems (other, self, ItFo_Plants_Berrys_01, 1000);
    B_GiveXP (300);
	B_LogEntry                     (CH1_MagnackiePi4erscienie,"Odda³em pierœcienie Quentinowi.");
    Log_SetTopicStatus       (CH1_MagnackiePi4erscienie, LOG_SUCCESS);
    MIS_MagnackiePi4erscienie = LOG_SUCCESS;
};
var int lopek;
//========================================
//-----------------> Banditos
//========================================

INSTANCE DIA_Bula_Banditos (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 3;
   condition    = DIA_Bula_Banditos_Condition;
   information  = DIA_Bula_Banditos_Info;
   permanent	= TRUE;
   description	= "(ZOSTAÑ BANDYT¥)";
};

FUNC INT DIA_Bula_Banditos_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_Banditos_Info()
{
hero.guild = GIL_BAU;
Npc_SetTrueGuild (hero,GIL_BAU);
Print ("Jesteœ bandyt¹.");
lopek = true;
};
//========================================
//-----------------> GiveGuildGuru
//========================================

INSTANCE DIA_Bula_GiveGuildGuru (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 4;
   condition    = DIA_Bula_GiveGuildGuru_Condition;
   information  = DIA_Bula_GiveGuildGuru_Info;
   permanent	= TRUE;
   description	= "(ZOSTAÑ GURU)";
};

FUNC INT DIA_Bula_GiveGuildGuru_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_GiveGuildGuru_Info()
{

    print ("GURU - zmiana gildii");
		CreateInvItem		(other,GUR_ARMOR_m);

	Npc_SetTrueGuild (hero,GIL_GUR );
	hero.guild = GIL_GUR;
    B_GiveXP (1000);
};

//========================================
//-----------------> GiveGuildMagnat
//========================================

INSTANCE DIA_Bula_GiveGuildMagnat (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 4;
   condition    = DIA_Bula_GiveGuildMagnat_Condition;
   information  = DIA_Bula_GiveGuildMagnat_Info;
   permanent	= TRUE;
   description	= "(ZOSTAÑ MAGNATEM)";
};

FUNC INT DIA_Bula_GiveGuildMagnat_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_GiveGuildMagnat_Info()
{

    print ("Magnat - zmiana gildii");
		CreateInvItem		(other,EBR_ARMOR_L);

	
	Log_SetTopicStatus       (CH1_MagnatTrololo, LOG_SUCCESS);
    MIS_MagnatTrololo = LOG_SUCCESS;
	Npc_SetTrueGuild (hero,GIL_EBR );
	hero.guild = GIL_EBR;
    B_GiveXP (1000);
	liczba_straznikow = liczba_straznikow + 30; 
	przychody_obozu = 300;
	AI_EquipBestArmor	(other); 
};

//========================================
//-----------------> HELLO601
//========================================

INSTANCE DIA_Bula_HELLO601 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 5;
   condition    = DIA_Bula_HELLO601_Condition;
   information  = DIA_Bula_HELLO601_Info;
   permanent	= TRUE;
   description	= "(ZOSTAÑ STRA¯NIKIEM)";
};

FUNC INT DIA_Bula_HELLO601_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_HELLO601_Info()
{
    Npc_SetTrueGuild (hero,GIL_GRD);
    hero.guild = GIL_GRD;
    Print ("Stra¿nik - zmiana gildii");
	B_RaiseAttribute	(ATR_STRENGTH,	1);    
	B_RaiseAttribute	(ATR_DEXTERITY,	1);    
	B_RaiseAttribute	(ATR_MANA_MAX,	5);    
	B_RaiseAttribute	(ATR_HITPOINTS_MAX,	5);  
};


//========================================
//-----------------> Questy
//========================================

INSTANCE DIA_Bula_Questy (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 6;
   condition    = DIA_Bula_Questy_Condition;
   information  = DIA_Bula_Questy_Info;
   permanent	= TRUE;
   description	= "(MENAD¯ER ZADAÑ)";
};

FUNC INT DIA_Bula_Questy_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_Questy_Info()
{
    Info_ClearChoices		(DIA_Bula_Questy);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Atak na plac wymian", DIA_Bula_Questy_Rozpierdol11);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Dostawa do Nowego Obozu", DIA_Bula_Questy_jaksinaBandytow);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Transport do kopalni", DIA_Bula_Questy_transport);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Dalsze losy bandytów", DIA_Bula_Questy_rozwalaakldjad);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Pomoc £owców orków", DIA_Bula_Questy_pomoclowcow2);
    Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Materia³y dla Rockiego", DIA_Bula_Questy_Wykonaamasjffa);
	Info_AddChoice		(DIA_Bula_Questy, "Wykonaj Kopacz", DIA_Bula_Questy_WykonaajKopacz);
	Info_AddChoice		(DIA_Bula_Questy, "Zacznij Poszukiwania R¹czki", DIA_Bula_Questy_StartFingers);
	Info_AddChoice		(DIA_Bula_Questy, "Zacznij Zemsta na Grimie", DIA_Bula_Questy_ZemstaGrim);
    Info_AddChoice		(DIA_Bula_Questy, DIALOG_BACK, DIA_Bula_Questy_BACK);
};

func void DIA_Bula_Questy_ZemstaGrim ()
{
    MIS_GrimOc = LOG_RUNNING;
    Log_CreateTopic          (CH1_GrimOc, LOG_MISSION);
    Log_SetTopicStatus       (CH1_GrimOc, LOG_RUNNING);
    B_LogEntry               (CH1_GrimOc,"Cavalorn zdradzi³ mi, ¿e to Grim podawa³ siê za mnie. Ten typ powoli zaczyna mnie irytowaæ. Pora ¿eby ktoœ siê za niego wzi¹³.");
	
	//Grim - zmiana eq
	B_ChangeGuild    (Vlk_580_Grim,GIL_STT); 
	AI_UnequipArmor (Vlk_580_Grim);
	AI_UnequipWeapons (Vlk_580_Grim);
	CreateInvItems (Vlk_580_Grim, ItMw_1H_Sword_02,1);
	CreateInvItems (Vlk_580_Grim, STT_ARMOR_M,1);
	EquipItem (Vlk_580_Grim, ItMw_1H_Sword_02);
	AI_EquipBestArmor (Vlk_580_Grim);
};

func void DIA_Bula_Questy_StartFingers ()
{
	MIS_HandDed = LOG_RUNNING;
	B_ExchangeRoutine (STT_329_Dexter,"csi");
	
	CreateInvItems 	  (STT_331_Fingers, ItMis_FingersSecretBook, 1);
	B_ExchangeRoutine (STT_331_Fingers,"ded");
	B_killnpc (STT_331_Fingers);
	
    Log_CreateTopic          (CH1_HandDed, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HandDed, LOG_RUNNING);
    B_LogEntry               (CH1_HandDed,"Diego poprosi³ mnie o zbadanie sprawy tajemniczego znikniêcia R¹czki. Œledztwo mam prowadziæ razem z Dexterem. Znajdê go w chacie R¹czki. Byæ mo¿e znalaz³ ju¿ jakieœ poszlaki. Na razie jedyn¹ moj¹ wskazówk¹ jest informacja, ¿e Diego otrzyma³ list z pogró¿kami z Nowego Obozu. Nie otrzyma³em jednak od niego tego dokumentu.");
};

func void DIA_Bula_Questy_WykonaajKopacz ()
{
	B_LogEntry                     (CH1_Kopacz,"Zanios³em 500 bry³ek rudy do Iana. Mam pogadaæ z Diego.");
    Log_SetTopicStatus       (CH1_Kopacz, LOG_SUCCESS);
    MIS_Kopacz = LOG_SUCCESS;
	kabelOm = false;
	puszcamDrake = true;
    B_GiveXP (XP_Mine500Ore);
    MIS_AwansCien = LOG_RUNNING;
	//B_GiveInvItems (other, self, ItMiNugget, 500);
    Log_CreateTopic          (CH1_AwansCien, LOG_MISSION);
    Log_SetTopicStatus       (CH1_AwansCien, LOG_RUNNING);
    B_LogEntry               (CH1_AwansCien,"Zanios³em 500 bry³ek rudy do Iana. Mam pogadaæ z Diego, jeœli chcê awansowaæ na Cienia.");
    AI_StopProcessInfos	(self);

};

FUNC VOID DIA_Bula_Questy_Rozpierdol11()
{
    AI_Output (other, self ,"DIA_Bula_Questy_Rozpierdol11_15_01"); //Wykonaj "Atak na plac wymian"
    B_LogEntry                     (CH1_Rozpierdol1,"Wykonano");
    Log_SetTopicStatus       (CH1_Rozpierdol1, LOG_SUCCESS);
    MIS_Rozpierdol1 = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_jaksinaBandytow()
{
    AI_Output (other, self ,"DIA_Bula_Questy_jaksinaBandytow_15_01"); //Wykonaj "Dostawa do Nowego Obozu"
    B_LogEntry                     (CH1_JaskiniaBandytow,"Wykonano");
    Log_SetTopicStatus       (CH1_JaskiniaBandytow, LOG_SUCCESS);
    MIS_JaskiniaBandytow = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_transport()
{
    AI_Output (other, self ,"DIA_Bula_Questy_transport_15_01"); //Wykonaj "Transport do kopalni"
    B_LogEntry                     (CH1_Rozpierdol2,"Wykonano");
    Log_SetTopicStatus       (CH1_Rozpierdol2, LOG_SUCCESS);
    MIS_Rozpierdol2 = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_rozwalaakldjad()
{
    AI_Output (other, self ,"DIA_Bula_Questy_rozwalaakldjad_15_01"); //Wykonaj "Dalsze losy bandytów"
    B_LogEntry                     (CH1_RozwalaUBnadytow,"Wykonano");
    Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_SUCCESS);
    MIS_RozwalaUBnadytow = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_pomoclowcow2()
{
    AI_Output (other, self ,"DIA_Bula_Questy_pomoclowcow2_15_01"); //Wykonaj "Pomoc £owców orków"
    B_LogEntry                     (CH1_SupportFromOrcHunters,"Wykonano");
    Log_SetTopicStatus       (CH1_SupportFromOrcHunters, LOG_SUCCESS);
    MIS_SupportFromOrcHunters = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_Wykonaamasjffa()
{
    AI_Output (other, self ,"DIA_Bula_Questy_Wykonaamasjffa_15_01"); //Wykonaj "Materia³y dla Rockiego"
    B_LogEntry                     (CH1_materials4Rocky,"Wykonano");
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_SUCCESS);
    MIS_materials4Rocky = LOG_SUCCESS;

    B_GiveXP (1000);
};

FUNC VOID DIA_Bula_Questy_BACK()
{
    Info_ClearChoices	(DIA_Bula_Questy);
};

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bula_EXIT(C_INFO)
{
	npc             = NON_2233_Bula;
	nr              = 999;
	condition	= DIA_Bula_EXIT_Condition;
	information	= DIA_Bula_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Bula_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bula_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> eq
//========================================

INSTANCE DIA_Bula_eq (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 6;
   condition    = DIA_Bula_eq_Condition;
   information  = DIA_Bula_eq_Info;
   permanent	= FALSE;
   description	= "(DAJ MI EKWIPUNEK)";
};

FUNC INT DIA_Bula_eq_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_eq_Info()
{
    CreateInvItems (self, ItMiNugget, 5000);
    B_GiveInvItems (self, other, ItMiNugget, 5000);
    CreateInvItems (self, ItArRuneLight, 1);
    B_GiveInvItems (self, other, ItArRuneLight, 1);
    CreateInvItems (self, ItArRuneTeleport1, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport1, 1);
    CreateInvItems (self, ItArRuneTeleport2, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport2, 1);
    CreateInvItems (self, ItArRuneTeleport3, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport3, 1);
    CreateInvItems (self, ItArRuneTeleport5, 1);
    B_GiveInvItems (self, other, ItArRuneTeleport5, 1);
    CreateInvItems (self, ItMw_1H_Sword_Long_05, 1);
    B_GiveInvItems (self, other, ItMw_1H_Sword_Long_05, 1);
    CreateInvItems (self, ItRw_Bow_Long_02, 1);
    B_GiveInvItems (self, other, ItRw_Bow_Long_02, 1);
    CreateInvItems (self, ItAmArrow, 5000);
    B_GiveInvItems (self, other, ItAmArrow, 5000);
    CreateInvItems (self, ItFo_Potion_Health_01, 50);
    B_GiveInvItems (self, other, ItFo_Potion_Health_01, 50);
	CreateInvItems (self, ItFoWine, 7);
    B_GiveInvItems (self, other, ItFoWine, 7);
    CreateInvItems (self, ItAt_Waran_01, 1);
    B_GiveInvItems (self, other, ItAt_Waran_01, 1);
    CreateInvItems (self, ItArScrollLight, 5);
    B_GiveInvItems (self, other, ItArScrollLight, 5);
    CreateInvItems (self, ItArScrollFireball, 30);
    B_GiveInvItems (self, other, ItArScrollFireball, 30);
    CreateInvItems (self, ItMi_Stuff_Pipe_01, 4);
    B_GiveInvItems (self, other, ItMi_Stuff_Pipe_01, 4);
    CreateInvItems (self, ItMi_Alchemy_Quicksilver_01, 3);
    B_GiveInvItems (self, other, ItMi_Alchemy_Quicksilver_01, 3);
};
//========================================
//-----------------> LicznikExp
//========================================

INSTANCE DIA_Bula_LicznikExp (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 7;
   condition    = DIA_Bula_LicznikExp_Condition;
   information  = DIA_Bula_LicznikExp_Info;
   permanent	= FALSE;
   description	= "(W£¥CZ LICZNIK EXP)";
};

FUNC INT DIA_Bula_LicznikExp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_LicznikExp_Info()
{
    LicznikExp = true;
};

//========================================
//-----------------> OffExp
//========================================

INSTANCE DIA_Bula_OffExp (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 8;
   condition    = DIA_Bula_OffExp_Condition;
   information  = DIA_Bula_OffExp_Info;
   permanent	= FALSE;
   description	= "(WY£¥CZ LICZNIK EXP)";
};

FUNC INT DIA_Bula_OffExp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_OffExp_Info()
{
    LicznikExp = false;
};
//========================================
//-----------------> Funkcje
//========================================

INSTANCE DIA_Bula_Funkcje (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 9;
   condition    = DIA_Bula_Funkcje_Condition;
   information  = DIA_Bula_Funkcje_Info;
   permanent	= TRUE;
   description	= "(AKTYWUJ FUNKCJE)";
};

FUNC INT DIA_Bula_Funkcje_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_Funkcje_Info()
{
    Info_ClearChoices		(DIA_Bula_Funkcje);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja zadania: TRANSPORT DO KOPALNI", DIA_Bula_Funkcje_Rozpierdol11);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja zadania: ATAK NA PLAC WYMIAN", DIA_Bula_Funkcje_jaksinaBandytow);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja anulowania zadañ Mordraga w SO", DIA_Bula_Funkcje_transport);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja zadania: OCHRONIARZ HANDLARZA", DIA_Bula_Funkcje_rozwalaakldjad);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja anulowania przy³¹czeñ", DIA_Bula_Funkcje_pomoclowcow2);
    Info_AddChoice		(DIA_Bula_Funkcje, "Funkcja: zmiana twarzy 1", DIA_Bula_Funkcje_Wykonaamasjffa);
    Info_AddChoice		(DIA_Bula_Funkcje, DIALOG_BACK, DIA_Bula_Funkcje_BACK);
};

FUNC VOID DIA_Bula_Funkcje_Rozpierdol11()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_Rozpierdol11_15_01"); //Startuj funkcjê!
    BAN_1605_Rocky.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (BAN_1605_Rocky,"atak2");
	/*GRD_5054_Gardist.guild = GIL_MOLERAT;
	GRD_5053_Gardist.guild = GIL_MOLERAT;
	GRD_5055_Eskorta.guild = GIL_MOLERAT;
	VLK_5089_Tragaz.guild = GIL_MOLERAT;
	VLK_5088_Tragaz.guild = GIL_MOLERAT;
	VLK_5090_Tragaz.guild = GIL_MOLERAT;*/
	  Npc_ExchangeRoutine (GRD_5054_Gardist,"las");
	  B_ChangeGuild    (GRD_5054_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5053_Gardist,"las");
	  B_ChangeGuild    (GRD_5053_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5055_Eskorta,"las");
	  B_ChangeGuild    (GRD_5055_Eskorta,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5089_Tragaz,"las");
	  B_ChangeGuild    (VLK_5089_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5090_Tragaz,"las");
	  B_ChangeGuild    (VLK_5090_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5088_Tragaz,"las"); //1.24
	  B_ChangeGuild    (VLK_5088_Tragaz,GIL_DMB);
	  /*
		Npc_SetTarget(GRD_5054_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5054_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5053_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5053_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5055_Eskorta,BAN_1605_Rocky);
		AI_StartState(GRD_5055_Eskorta,ZS_ATTACK,1,"");
    Npc_SetTempAttitude	(GRD_5054_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5053_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5055_Eskorta,	ATT_HOSTILE);
    Npc_SetTempAttitude	(VLK_5089_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5090_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5088_Tragaz,	ATT_HOSTILE);*/
};

FUNC VOID DIA_Bula_Funkcje_jaksinaBandytow()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_jaksinaBandytow_15_01"); //Startuj funkcjê!
	ORG_867_Raeuber.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (ORG_867_Raeuber,"atak1");
	Npc_ExchangeRoutine (GRD_2001_Stra¿nik,"bijacz");
	Npc_ExchangeRoutine (GRD_2002_Stra¿nik,"bijacz");
	B_ChangeGuild    (GRD_2005_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (VLK_2004_Robotnik,GIL_DMB);
	B_ChangeGuild    (GRD_2001_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2002_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2003_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2002_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2001_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2003_Stra¿nik,GIL_DMB);
	B_ChangeGuild    (GRD_2005_Stra¿nik,GIL_DMB);

	B_ChangeGuild    (VLK_2004_Robotnik,GIL_DMB);
	B_ChangeGuild    (GRD_254_Orry,GIL_DMB);
	B_ChangeGuild    (GRD_281_Gardist,GIL_DMB);
	Npc_ExchangeRoutine (GRD_254_Orry,"OMFull");
	Npc_ExchangeRoutine (GRD_281_Gardist,"start2");
};

FUNC VOID DIA_Bula_Funkcje_transport()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_transport_15_01"); //Startuj funkcjê!
   	Problem_ZLY = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problem ze Z³ym! ", 1,-1,"font_new_10_red.tga",2);	
 	 B_LogEntry                     (CH1_Problem_ZLY,"Wybra³em siê z Mordragiem do Nowego Obozu porzucaj¹c jego problemy z Cieniami.");
	Log_SetTopicStatus       (CH1_Problem_ZLY, LOG_FAILED);

	MordragProblemOC = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Problemy Mordraga! ", 1,48,"font_new_10_red.tga",2);	
	 B_LogEntry                     (CH1_MordragProblemOC,"Wybra³em siê z Mordragiem do Nowego Obozu porzucaj¹c jego problemy z Cieniami.");
	Log_SetTopicStatus       (CH1_MordragProblemOC, LOG_FAILED);
};

FUNC VOID DIA_Bula_Funkcje_rozwalaakldjad()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_rozwalaakldjad_15_01"); //Startuj funkcjê!
    GRD_7008_Tukash.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (GRD_7008_Tukash,"atak");
	Npc_ExchangeRoutine (ORG_810_Organisator,"przydupas");
	Npc_ExchangeRoutine (ORG_807_Organisator,"przydupas");
	Npc_ExchangeRoutine (ORG_828_Bruce,"handel");
	B_SetPermAttitude	(GRD_7008_Tukash,	ATT_FRIENDLY);
 B_LogEntry                     (CH1_OchroniarzOM,"Tukash postanowi³, ¿e od razu zaatakujemy przeciwników.");

	Npc_SetPermAttitude (ORG_810_Organisator, ATT_ANGRY);
	Npc_SetPermAttitude (ORG_807_Organisator, ATT_ANGRY);
	Npc_SetPermAttitude (ORG_828_Bruce, ATT_ANGRY);
};

FUNC VOID DIA_Bula_Funkcje_pomoclowcow2()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_pomoclowcow2_15_01"); //Startuj funkcjê!
HeroJoinToBAN ();
};

FUNC VOID DIA_Bula_Funkcje_Wykonaamasjffa()
{
    AI_Output (other, self ,"DIA_Bula_Funkcje_Wykonaamasjffa_15_01"); //Twarz1
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	5,			0,			"Hum_Head_Pony",	18, 			0,			-1);
};

FUNC VOID DIA_Bula_Funkcje_BACK()
{
    Info_ClearChoices	(DIA_Bula_Funkcje);
};

//if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))

//========================================
//-----------------> LearnFireMaster
//========================================

INSTANCE DIA_Bula_LearnFireMaster (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 10;
   condition    = DIA_Bula_LearnFireMaster_Condition;
   information  = DIA_Bula_LearnFireMaster_Info;
   permanent	= FALSE;
   description	= "Nauka: Alchemia";
};

FUNC INT DIA_Bula_LearnFireMaster_Condition()
{
   if (AlchemyKnows == false){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_LearnFireMaster_Info()
{
    AI_Output (self, other ,"DIA_Bula_LearnFireMaster_03_01"); //test !!
	Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 5);
	AlchemyKnows = true;
};
//========================================
//-----------------> LearnFireMaster
//========================================

INSTANCE DIA_Bula_KURWAMACJAPIE (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 10;
   condition    = DIA_Bula_KURWAMACJAPIE_Condition;
   information  = DIA_Bula_KURWAMACJAPIE_Info;
   permanent	= true;
   description	= "Steh";
};

FUNC INT DIA_Bula_KURWAMACJAPIE_Condition()
{
   if (AlchemyKnows == false){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_KURWAMACJAPIE_Info()
{
    AI_Output (self, other ,"DIA_Bula_KURWAMACJAPIE_03_01"); //test !!
    B_LogEntry                     (CH2_Plates,"Odnalaz³em tabliczki dla Steha.");
    Log_SetTopicStatus       (CH2_Plates, LOG_SUCCESS);
    MIS_Plates = LOG_SUCCESS;
	var int ilosc_tabliczek;
	ilosc_tabliczek = Npc_hasitems (hero, BlackPlate01);
    B_GiveInvItems (hero,self,BlackPlate01,ilosc_tabliczek);
    B_GiveXP (ilosc_tabliczek*100);
    CreateInvItems (self, ItMiNugget, ilosc_tabliczek*10); //1.24 fixed
    B_GiveInvItems (self, other, ItMiNugget, ilosc_tabliczek*10);
	CreateInvItems (self, BlackPlateSTR, 1);
    B_GiveInvItems (self, other, BlackPlateSTR, 1);
};
//-----------------> LearnFireMaster
//========================================

INSTANCE DIA_Bula_KURWAMACJAPIE2 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 10;
   condition    = DIA_Bula_KURWAMACJAPIE2_Condition;
   information  = DIA_Bula_KURWAMACJAPIE2_Info;
   permanent	= true;
   description	= "Quentin Kurwa";
};

FUNC INT DIA_Bula_KURWAMACJAPIE2_Condition()
{
   if (AlchemyKnows == false){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_KURWAMACJAPIE2_Info()
{
    AI_Output (self, other ,"DIA_Bula_KURWAMACJAPIE2_03_01"); //test !!
	    B_LogEntry                     (CH1_MagnackiePi4erscienie,"Odda³em pierœcienie Quentinowi.");
    Log_SetTopicStatus       (CH1_MagnackiePi4erscienie, LOG_SUCCESS);
    MIS_MagnackiePi4erscienie = LOG_SUCCESS;

    B_GiveXP (400);
	Npc_RemoveInvItems (hero, EBR_Ring1, 1);
	Npc_RemoveInvItems (hero, EBR_Ring2, 1);
	Npc_RemoveInvItems (hero, EBR_Ring3, 1);
	PrintScreen	("3 przedmioty oddane", -1,_YPOS_MESSAGE_GIVEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_GIVEN);
    CreateInvItems (self, ItMiNugget, 350);
    B_GiveInvItems (self, other, ItMiNugget, 350);
    AI_StopProcessInfos	(self);

};
//========================================
//-----------------> LearnReg
//========================================

INSTANCE DIA_Bula_LearnReg (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 11;
   condition    = DIA_Bula_LearnReg_Condition;
   information  = DIA_Bula_LearnReg_Info;
   permanent	= FALSE;
   description	= "Nauka: Kowalstwo";
};

FUNC INT DIA_Bula_LearnReg_Condition()
{
   if (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) != 5){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_LearnReg_Info()
{
    AI_Output (self, other ,"DIA_Bula_LearnReg_03_01"); //Test!
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 5);
	//AlchemyKnows = true;
};
//-----------------> LearnReg
//========================================

INSTANCE DIA_Bula_LearnRegP1 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 11;
   condition    = DIA_Bula_LearnRegP1_Condition;
   information  = DIA_Bula_LearnRegP1_Info;
   permanent	= FALSE;
   description	= "Nauka: Kowalstwo POZIOM 1";
};

FUNC INT DIA_Bula_LearnRegP1_Condition()
{
   if (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) != 1){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_LearnRegp1_Info()
{
    AI_Output (self, other ,"DIA_Bula_LearnReg_03_01"); //Test!
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	//AlchemyKnows = true;
};
//-----------------> LearnReg
//========================================

INSTANCE DIA_Bula_LearnRegP2 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 11;
   condition    = DIA_Bula_LearnRegP2_Condition;
   information  = DIA_Bula_LearnRegP2_Info;
   permanent	= FALSE;
   description	= "Nauka: Kowalstwo POZIOM 2";
};

FUNC INT DIA_Bula_LearnRegP2_Condition()
{
   if (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) == 1){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_LearnRegp2_Info()
{
    AI_Output (self, other ,"DIA_Bula_LearnReg_03_01"); //Test!
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 2);
	//AlchemyKnows = true;
};
//-----------------> LearnReg
//========================================

INSTANCE DIA_Bula_LearnRegP4 (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 11;
   condition    = DIA_Bula_LearnRegP4_Condition;
   information  = DIA_Bula_LearnRegP4_Info;
   permanent	= FALSE;
   description	= "Nauka: Kowalstwo POZIOM 2";
};

FUNC INT DIA_Bula_LearnRegP4_Condition()
{
   if (Npc_GetTalentSkill(other, NPC_TALENT_REGENERATE) == 2){
    return TRUE;
    };
};


FUNC VOID DIA_Bula_LearnRegp4_Info()
{
    AI_Output (self, other ,"DIA_Bula_LearnReg_03_01"); //Test!
	Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 4);
	//AlchemyKnows = true;
};
//========================================
//-----------------> SendTrigerPalisada
//========================================

INSTANCE DIA_Bula_SendTrigerPalisada (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 12;
   condition    = DIA_Bula_SendTrigerPalisada_Condition;
   information  = DIA_Bula_SendTrigerPalisada_Info;
   permanent	= TRUE;
   description	= "Ustaw palisadê w Obozie Bandytów";
};

FUNC INT DIA_Bula_SendTrigerPalisada_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_SendTrigerPalisada_Info()
{
    AI_Output (other, self ,"DIA_Bula_SendTrigerPalisada_15_01"); //Ustaw palisadê w Obozie Bandytów!
    Wld_SendTrigger("PULAPKA1");
	//Wld_SendTrigger("EVT_AM_LOB_GATE_BIG"); //do zmiany
};

//========================================
//-----------------> TEST_CHEST
//========================================

INSTANCE DIA_Bula_TEST_CHEST (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 12;
   condition    = DIA_Bula_TEST_CHEST_Condition;
   information  = DIA_Bula_TEST_CHEST_Info;
   permanent	= TRUE;
   description	= "JOOINT";
};

FUNC INT DIA_Bula_TEST_CHEST_Condition()
{
	if ((Mob_HasItems ("NC_CHESTBAL", MegaJoint)) >= 1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bula_TEST_CHEST_Info()
{
print ("dat script");
};


//========================================
//-----------------> NOWA_NAUKA_SILY
//========================================

INSTANCE DIA_Bula_NOWA_NAUKA_SILY (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 15;
   condition    = DIA_Bula_NOWA_NAUKA_SILY_Condition;
   information  = DIA_Bula_NOWA_NAUKA_SILY_Info;
   permanent	= TRUE;
   description	= "NOWA NAUKA SI£Y";
};

FUNC INT DIA_Bula_NOWA_NAUKA_SILY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_NOWA_NAUKA_SILY_Info()
{
	//CZOJSES
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

func void DIA_Bula_NOWA_NAUKA_SILY_STR1 ()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

func void DIA_Bula_NOWA_NAUKA_SILY_STR3 ()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 3);
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

func void DIA_Bula_NOWA_NAUKA_SILY_STR5 ()
{
Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

func void DIA_Bula_NOWA_NAUKA_SILY_STR7 ()
{
Mod_KupAtrybut (hero, ATR_STRENGTH, 7);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

func void DIA_Bula_NOWA_NAUKA_SILY_STR10 ()
{
Mod_KupAtrybut (hero, ATR_STRENGTH, 10);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_SILY);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 1 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 3 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 5 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 7 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_SILY,"si³a 10 KURWY",DIA_Bula_NOWA_NAUKA_SILY_STR10);
};

//========================================
//-----------------> NOWA_NAUKA_ZREKI
//========================================

INSTANCE DIA_Bula_NOWA_NAUKA_ZREKI (C_INFO)
{
   npc          = NON_2233_Bula;
   nr           = 15;
   condition    = DIA_Bula_NOWA_NAUKA_ZREKI_Condition;
   information  = DIA_Bula_NOWA_NAUKA_ZREKI_Info;
   permanent	= TRUE;
   description	= "NOWA NAUKA ZRÊKI";
};

FUNC INT DIA_Bula_NOWA_NAUKA_ZREKI_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bula_NOWA_NAUKA_ZREKI_Info()
{
	//CZOJSES
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};

func void DIA_Bula_NOWA_NAUKA_ZREKI_STR1 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};

func void DIA_Bula_NOWA_NAUKA_ZREKI_STR3 ()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 3);
	Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};

func void DIA_Bula_NOWA_NAUKA_ZREKI_STR5 ()
{
Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};

func void DIA_Bula_NOWA_NAUKA_ZREKI_STR7 ()
{
Mod_KupAtrybut (hero, ATR_DEXTERITY, 7);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};

func void DIA_Bula_NOWA_NAUKA_ZREKI_STR10 ()
{
Mod_KupAtrybut (hero, ATR_DEXTERITY, 10);
Info_ClearChoices	(DIA_Bula_NOWA_NAUKA_ZREKI);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 1 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR1);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 3 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR3);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 5 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR5);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 7 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR7);
	Info_AddChoice		(DIA_Bula_NOWA_NAUKA_ZREKI,"zrêcznoœæ 10 KURWY",DIA_Bula_NOWA_NAUKA_ZREKI_STR10);
};
//========================================
//-----------------> SKILLS1H
//========================================

INSTANCE DIA_Bula_SKILLS1H (C_INFO)
{
   npc          = non_2233_Bula;
   nr           = 1;
   condition    = DIA_Bula_SKILLS1H_Condition;
   information  = DIA_Bula_SKILLS1H_Info;
   permanent	= true;
   description	= "Nauka walki broni¹ jednorêczn¹.";
};

FUNC INT DIA_Bula_SKILLS1H_Condition()
{
    return TRUE;
};


FUNC VOID DIA_Bula_SKILLS1H_Info()
{
	Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};
	//if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 9) 
	//{
	//Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 10, 1000 bry³ek rudy, 10 PN",testy_1h10);
	//};
};

func void DIA_Bula_SKILLS1HBACK ()
{
	Info_ClearChoices	(DIA_Bula_SKILLS1H);
};

FUNC VOID testy_1h1 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_01"); //M¹dra decyzja. Najbli¿sze trzy lekcje obejm¹ podstawy z którymi powinieneœ siê zapoznaæ.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_02"); //Bronie jednorêczne s¹ znacznie l¿ejsze ni¿ dwurêczne, a przez to równie¿ znacznie szybsze. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_03"); //Istnieje podzia³ na lekkie bronie jednorêczne i te ciê¿sze. Ciê¿sze wymagaj¹ pewniejszego chwytu, ale te¿ wiêcej si³y.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_04"); //Jeœli chcesz p³ynnie walczyæ ciê¿k¹ jednorêczn¹, poza technik¹ bêdziesz te¿ musia³ poznaæ tajniki balansowania cia³em.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_05"); //O du¿ej sile w ³apie ju¿ nawet nie mówiê. To oczywiste, ¿e ¿eby szybko wymachiwaæ takim ciê¿arem bêdziesz musia³ posiadaæ wiêcej si³y ni¿ potrzeba do podniesienia dobrego dwurêcznego miecza.
		
		B_GiveInvItems(other,self,itminugget,100);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};
};

FUNC VOID testy_1h2 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 200)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_06"); //Poka¿ mi jak trzymasz miecz.
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_07"); //Tak jak myœla³em. Zadajesz mniejsze obra¿enia ni¿ faktycznie móg³byœ zadaæ przy obecnej sile i za³o¿onej broni. 
		AI_RemoveWeapon (other);
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_08"); //Nie atakuj, gdy jesteœ zbyt daleko. Jeœli za bardzo siê wychylisz do oddalonego przeciwnika, mo¿esz straciæ równowagê i siê przewróciæ.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_09"); //Staraj siê atakowaæ z ró¿nych stron, aby zmyliæ przeciwnika. Pamiêtaj, aby blokowaæ uderzenia, jeœli nie bêdziesz w stanie zrobiæ uniku.
		B_GiveInvItems(other,self,itminugget,200);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};
};

FUNC VOID testy_1h3 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 300)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 3, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_10"); //Pamiêtasz o balansowaniu cia³em? A o odpowiedniej odleg³oœci od przeciwnika? 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_11"); //Spróbuj wyczuæ ile si³y musisz u¿yæ, aby broñ uderza³a mocno, a przy tym nie polecia³a bez³adnie przed siebie. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_12"); //Gdy to opanujesz, bêdziemy mogli pomyœleæ nad ³¹czeniem po sobie uderzeñ. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_13"); //Poka¿ mi jeszcze jak wyci¹gasz broñ. Robisz jakieœ postêpy?
		AI_DrawWeapon (other);
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_14"); //Rêce opadaj¹... Nie dwiema, tylko jedn¹! Omówimy to na nastêpnej lekcji.
		AI_RemoveWeapon (other);
		B_GiveInvItems(other,self,itminugget,300);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
	Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};
};

FUNC VOID testy_1h4 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 400)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 4, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
		B_GiveInvItems(other,self,itminugget,400);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};

FUNC VOID testy_1h5 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 5, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_15"); //¯eby zadaæ wiêksze obra¿enia musisz trafiaæ w newralgiczne punkty twojego przeciwnika. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_16"); //Ciê¿ko siê tego nauczyæ. Wszystko zale¿y od postury i pancerza. Najlepiej atakowaæ koñczyny i g³owê.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_17"); //Naturalnie walka z cz³owiekiem ró¿ni siê od walki ze zwierzêciem.
			B_GiveInvItems(other,self,itminugget,500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};

FUNC VOID testy_1h6 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 600)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 6, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_18"); //Pamiêtasz jak na pierwszej lekcji omawialiœmy podzia³ na bronie ciê¿kie i te l¿ejsze?
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_19"); //Myœlê, ¿e jesteœ ju¿ wystarczaj¹co silny, aby walczyæ ciê¿kimi jednorêczniakami. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_20"); //O czym musisz pamiêtaæ? O odpowiednim wyczuciu równowagi ostrza, a tak¿e o treningu si³owym, który jest tutaj kluczowy.
		B_GiveInvItems(other,self,itminugget,600);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};

FUNC VOID testy_1h7 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 7, 10))
		{
		AI_Output (self, other,"DIA_Bagietka_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
		AI_Output (self, other,"DIA_Bagietka_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
		AI_Output (self, other,"DIA_Bagietka_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
		B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};

FUNC VOID testy_1h8 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1500)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 8, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_21"); //Robisz postêpy. Skup siê na kolejnych ciosach. £¹cz je coraz szybciej i pewniej.
		B_GiveInvItems(other,self,itminugget,1500);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};

FUNC VOID testy_1h9 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 2000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 9, 10))
		{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_22"); //Chc¹c najboleœniej zraniæ przeciwnika musisz dobrze wymierzyæ cios. Gdy masz szansê staraj siê trafiaæ w g³owê lub barki.
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_23"); //S³abe punkty to tak¿e ³¹cznia zbroi. Jeœli przeciwnik ma na sobie skórzan¹ zbrojê to po prostu bij w brzuch. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_24"); //Skórzane pancerze ³atwo siê rozcina. 
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_npc_25"); //Przypomnij sobie jeszcze raz to wszystko, czego ciê nauczy³em i stosuj siê do tego. 
		B_GiveInvItems(other,self,itminugget,2000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};	
Info_ClearChoices	(DIA_Bula_SKILLS1H);
	Info_AddChoice		(DIA_Bula_SKILLS1H,DIALOG_BACK,DIA_Bula_SKILLS1HBACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 1, 100 bry³ek rudy, 10 PN",testy_1h1);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 2, 200 bry³ek rudy, 10 PN",testy_1h2);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 2) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 3, 300 bry³ek rudy, 10 PN",testy_1h3);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 3) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 4, 400 bry³ek rudy, 10 PN",testy_1h4);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 4) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 5, 500 bry³ek rudy, 10 PN",testy_1h5);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 5) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 6, 600 bry³ek rudy, 10 PN",testy_1h6);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 6) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 7, 1000 bry³ek rudy, 10 PN",testy_1h7);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 7) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 8, 1500 bry³ek rudy, 10 PN",testy_1h8);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 8) 
	{
	Info_AddChoice		(DIA_Bula_SKILLS1H,"Broñ jednorêczna, poziom 9, 2000 bry³ek rudy, 10 PN",testy_1h9);
	};	
};






FUNC VOID testy_1h10 ()
{
	AI_Output (other,self,"DIA_Bagietka_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	if (Npc_HasItems(other,itminugget) >= 1000)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 10, 10))
		{
			AI_Output (self,other,"DIA_Bagietka_TRAIN_1H_MASTER"); //To ju¿ nasz ostatnia lekcja. Nauczê ciê walczyæ z niespotykan¹ dot¹d p³ynnoœci¹.
			
			B_GiveInvItems(other,self,itminugget,1000);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Bagietka_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};		
};
	