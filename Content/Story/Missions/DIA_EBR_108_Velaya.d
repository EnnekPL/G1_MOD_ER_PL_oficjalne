// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Velaya_EXIT(C_INFO)
{
	npc             = EBR_108_Velaya;
	nr              = 999;
	condition	= DIA_Velaya_EXIT_Condition;
	information	= DIA_Velaya_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Velaya_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Velaya_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Velaya_HELLO1 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 1;
   condition    = DIA_Velaya_HELLO1_Condition;
   information  = DIA_Velaya_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Velaya_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_01"); //Hej, co ty tu robisz? Nie s�dzi�am, �e po magnackich komnatach mog� si� pa��ta� inni skaza�cy.
    AI_Output (self, other ,"DIA_Velaya_HELLO1_03_02"); //Jestem Velaya, niewolnica Gomeza.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Velaya_HELLO2 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 2;
   condition    = DIA_Velaya_HELLO2_Condition;
   information  = DIA_Velaya_HELLO2_Info;
   permanent	= FALSE;
   description	= "Szuka�em ci�. Gdy zrzucali mnie do Kolonii, widzia�em jak spuszczono ci� za Barier� wraz z �adunkiem. ";
};

FUNC INT DIA_Velaya_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Velaya_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO2_15_01"); //Szuka�em ci�. Gdy zrzucali mnie do Kolonii, widzia�em jak spuszczono ci� za Barier� wraz z �adunkiem. 
    AI_Output (other, self ,"DIA_Velaya_HELLO2_03_02"); //Zastanawia�em si�, co si� z tob� sta�o. Stra�nicy m�wili, �e kobiety w Kolonii zostaj� niewolnicami.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_03"); //Tak, niestety. To przekl�te miejsce a� si� roi od przest�pc�w, kt�rzy nie wiedz� jak traktowa� damy. Ciesz� si�, �e przynajmniej p�ki co mog� zosta� tu, na g�rze.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_04"); //Sira i Serafia, gdy znudzi�y si� Gomezowi, zosta�y wys�ane do szorowania pod��g.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_05"); //Jednak ja nie zamierzam pozwala� si� wykorzystywa� facetom. Przyjdzie dzie�, gdy wszyscy zap�ac� mi za takie traktowanie.
    AI_Output (self, other ,"DIA_Velaya_HELLO2_03_06"); //Bardzo mi mi�o, �e si� mn� zainteresowa�e�. Od razu wida�, �e nie jeste� taki jak ci oble�ni skaza�cy.
	
	if MIS_Women == LOG_RUNNING
	{
	MIS_Women = LOG_SUCCESS;
	//Log_CreateTopic(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus   (CH1_Women, LOG_SUCCESS);
    B_LogEntry               (CH1_Women,"Pozna�em w ko�cu t� tajemnicz� kobiet� - nazywa si� Velaya. Opowiedzia�a mi swoj� histori�, o tym jak zosta�a nies�usznie oskar�ona przez S�dziego z Khorinis. My�l�, �e Velaya ma potencja�, o kt�rym kiedy� dowie si� ca�y �wiat. Ciesz� si�, �e jest ca�a i zdrowa.");
	b_givexp (100);
	};
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Velaya_HELLO3 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 3;
   condition    = DIA_Velaya_HELLO3_Condition;
   information  = DIA_Velaya_HELLO3_Info;
   permanent	= FALSE;
   description	= "Mam wra�enie, �e nies�usznie wrzucili ci� do Kolonii...";
};

FUNC INT DIA_Velaya_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO3_15_01"); //Mam wra�enie, �e nies�usznie wrzucili ci� do Kolonii...
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_02"); //Ech... nie chc� o tym gada�. Powiem ci tylko, �e mia�am kiedy� tendencje do ratowania �wiata. Chcia�am dobrze, ale kilku osobom si� to nie spodoba�o. 
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_03"); //Wrobili mnie w pewne przest�pstwo, a ja stawia�am op�r.
    AI_Output (self, other ,"DIA_Velaya_HELLO3_03_04"); //S�dzia z Khorinis nie chcia� mnie w og�le s�ucha�. To kawa� drania! Od razu wys�a� mnie za Barier�. 
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Velaya_HELLO4 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 4;
   condition    = DIA_Velaya_HELLO4_Condition;
   information  = DIA_Velaya_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o swoich kole�ankach?";
};

FUNC INT DIA_Velaya_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO4_15_01"); //Co mo�esz mi powiedzie� o swoich kole�ankach?
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_02"); //W�a�ciwie za dobrze ich nie znam. S� strasznie zapracowane i nie maj� czasu na pogaw�dki.
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_03"); //Serafia powiedzia�a mi jednak, �e gdy w zamku jest zbyt wiele kobiet, Magnaci wysy�aj� cz�� z nich do Obozu Bractwa jako prezent dla tamtejszego przyw�dcy. 
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_04"); //Pewnie ka�d� z nas to spotka, gdy znudzimy si� Gomezowi...
    AI_Output (self, other ,"DIA_Velaya_HELLO4_03_05"); //Co do moich kole�anek z do�u, to staraj si� ich nie zaczepia�. Nie mog� z nikim rozmawia� bez pozwolenia Gomeza.
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Velaya_HELLO5 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 5;
   condition    = DIA_Velaya_HELLO5_Condition;
   information  = DIA_Velaya_HELLO5_Info;
   permanent	= FALSE;
   description	= "Ruszam w dalsz� drog�. Mam nadziej�, �e jeszcze si� spotykamy.";
};

FUNC INT DIA_Velaya_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Velaya_HELLO2))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO3))
    && (Npc_KnowsInfo (hero, DIA_Velaya_HELLO4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO5_15_01"); //Ruszam w dalsz� drog�. Mam nadziej�, �e jeszcze si� spotykamy.
    AI_Output (self, other ,"DIA_Velaya_HELLO5_03_02"); //Te� mam tak� nadzieje. Mi�o si� z tob� rozmawia�o. Powodzenia na szlaku!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO6
//========================================

INSTANCE DIA_Velaya_HELLO6 (C_INFO)
{
   npc          = EBR_108_Velaya;
   nr           = 6;
   condition    = DIA_Velaya_HELLO6_Condition;
   information  = DIA_Velaya_HELLO6_Info;
   permanent	= FALSE;
   description	= "Zabi�em Gomeza. Teraz jeste�cie wolne!";
};

FUNC INT DIA_Velaya_HELLO6_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(ebr_100_gomez);
    if (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Velaya_HELLO6_Info()
{
    AI_Output (other, self ,"DIA_Velaya_HELLO6_15_01"); //Zabi�em Gomeza. Teraz jeste�cie wolne!
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_02"); //Dzi�ki Innosowi! Widz�, �e �wietny z ciebie wojownik. Jeszcze nikomu nie uda�o si� obali� Magnat�w.
    AI_Output (self, other ,"DIA_Velaya_HELLO6_03_03"); //W ko�cu zako�cz� si� rz�dy terroru.
    AI_StopProcessInfos	(self);
};

