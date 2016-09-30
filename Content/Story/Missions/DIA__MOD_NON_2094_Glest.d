//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Glest_EXIT(C_INFO)
{
	npc             = NON_2094_Glest;
	nr              = 999;
	condition	= DIA_Glest_EXIT_Condition;
	information	= DIA_Glest_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Glest_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Glest_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//dialog nie jest wykorzystywany, poniewa¿ Glest nie jest ju¿ spawnowany w Old_camp
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Glest_HELLO1 (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_HELLO1_Condition;
   information  = DIA_Glest_HELLO1_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Glest_HELLO1_Condition()
{
    if (kapitel < 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Glest_HELLO1_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Glest_HELLO1_03_02"); //Nie najgorzej. Kilka dni temu wróci³em z kopalni. Mogê sobie teraz trochê odpocz¹æ.  
};
//koniec

//========================================
//-----------------> First
//========================================

INSTANCE DIA_Glest_First (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 1;
   condition    = DIA_Glest_First_Condition;
   information  = DIA_Glest_First_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Glest_First_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_First_Info()
{
    AI_Output (self, other ,"DIA_Glest_First_03_01"); //Co ty tu robisz? Nie wygl¹dasz mi na jednego z ludŸi Gomeza.
	AI_Output (other, self ,"DIA_Glest_First_15_02"); //Bo nim nie jestem.
    AI_Output (self, other ,"DIA_Glest_First_03_03"); //W takim razie uciekaj st¹d, póki mo¿esz siê ruszaæ!
    AI_Output (other, self ,"DIA_Glest_First_15_04"); //Niby dlaczego?
    AI_Output (self, other ,"DIA_Glest_First_03_05"); //To miejsce jest przeklête. Krêci siê tu pe³no tych przeklêtych o¿ywieñców. Wybili nasz ekspedycjê do nogi!
    AI_Output (self, other ,"DIA_Glest_First_03_06"); //Kilku stra¿ników na marne próbuje z nimi walczyæ. Na razie zdobyliœmy most, ale zosta³a nam ju¿ tylko garstka ludzi. 
    AI_Output (other, self ,"DIA_Glest_First_15_07"); //Akurat ¿ycie Stra¿ników nie bardzo mnie martwi...
    AI_Output (self, other ,"DIA_Glest_First_03_08"); //To nie jest teraz istotne. Teoretycznie jesteœmy wrogami, a jednak nie zabi³eœ mnie. 
    AI_Output (other, self ,"DIA_Glest_First_15_09"); //Byæ mo¿e masz informacje, które mog¹ mi siê przydaæ. Co ci siê tak w ogóle sta³o? Uciek³eœ z wnêtrza kopalni?
    AI_Output (self, other ,"DIA_Glest_First_03_10"); //Tak, ale solidnie oberwa³em. 
    AI_Output (self, other ,"DIA_Glest_First_03_11"); //Mówiê ci: nie idŸ dalej pod ¿adnym pozorem! Czai siê tam wy³¹cznie œmieræ. 
    AI_Output (other, self ,"DIA_Glest_First_15_12"); //Mam tam kilka spraw do za³atwienia. Wiesz mo¿e sk¹d siê bior¹ o¿ywieñcy? 
	AI_Output (self, other ,"DIA_Glest_First_03_13"); //Wen¹trz kopalni jest olbrzymia sala. Widzia³em tam jakiegoœ maga w czarnych szatach. W rêku dzier¿y³ piêkny kamieñ. 
	AI_Output (self, other ,"DIA_Glest_First_03_14"); //Wydaje mi siê, ¿e to dziêki niemu udaje mu siê przyzywaæ tyle nieumar³ych. 
	AI_Output (other, self ,"DIA_Glest_First_15_15"); //Bêdê siê musia³ z nim rozprawiæ. Postaraj siê dotrzeæ do kogoœ, kto bêdzie ci w stanie pomóc. 
	AI_Output (self, other ,"DIA_Glest_First_03_16"); //Dziêkujê, nie bêdê ci ju¿ wchodzi³ w drogê. 
 
	//exp
    B_GiveXP (500);
	
	//spawn zombie 2x
	Wld_InsertNpc		(Zombie,"CAMP02"); 
	Wld_InsertNpc		(Zombie,"OW_PATH_1_16"); 
	
	//zadanie - wpis dla bandyty
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	B_LogEntry                     (CH1_OdbijanieOpKop,"Zaraz po zejœciu na dó³ spotka³em rannego Kopacza. Dowiedzia³em siê, ¿e Stra¿nicy których wys³a³ Gomez zostali niemal¿e wybici przez hordy o¿ywieñców wype³zaj¹cych spod ziemi. Kopacz twierdzi i¿ widzia³ jakiegoœ nekromantê dzier¿¹cego potê¿ny artefakt, dziêki któremu mo¿e on przywo³ywaæ nieumar³ych. Jeœli to prawda, bêdê siê musia³ z nim zmierzyæ.");
	}
	else 
	{
	B_LogEntry                     (CH1_PomocQuentinowi,"Zaraz po zejœciu na dó³ spotka³em rannego Kopacza. Dowiedzia³em siê, ¿e Stra¿nicy których wys³a³ Gomez zostali niemal¿e wybici przez hordy o¿ywieñców wype³zaj¹cych spod ziemi. Kopacz twierdzi i¿ widzia³ jakiegoœ nekromantê dzier¿¹cego potê¿ny artefakt, dziêki któremu mo¿e on przywo³ywaæ nieumar³ych. Jeœli to prawda, bêdê siê musia³ z nim zmierzyæ.");
	};
	
	};

/*
//========================================
//-----------------> ISerachartef
//========================================

INSTANCE DIA_Glest_ISerachartef (C_INFO)
{
   npc          = NON_2094_Glest;
   nr           = 2;
   condition    = DIA_Glest_ISerachartef_Condition;
   information  = DIA_Glest_ISerachartef_Info;
   permanent	= FALSE;
   description	= "Szukam pewnego artefaktu.";
};

FUNC INT DIA_Glest_ISerachartef_Condition()
{
    if (MIS_CorristoEvil == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Glest_ISerachartef_Info()
{
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_01"); //Szukam pewnego artefaktu.
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_02"); //Artefaktu, powiadasz? Po to tutaj przyszed³eœ?
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_03"); //Miêdzy innymi. Wiesz coœ o nim?
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_04"); //Czy to przez to cholerstwo zjawiaj¹ siê tu o¿ywieñcy?
    AI_Output (other, self ,"DIA_Glest_ISerachartef_15_05"); //Byæ mo¿e. Wiesz gdzie znajdê ten artefakt?
    AI_Output (self, other ,"DIA_Glest_ISerachartef_03_06"); //Nie, ale o¿ywieñcy nadchodz¹ z wnêtrza kopalni. Twoje magiczne œwiecide³ko musi gdzieœ tam byæ. 
    B_LogEntry                     (CH4_CorristoEvil,"Glest twierdzi, ¿e artefakt znajdê na samym dnie kopalni, bo to w³aœnie stamt¹d wychodz¹ o¿ywieñcy.");
	//CreateInvItems (self, Focus_Corristo, 1);
    //B_GiveInvItems (self, other, Focus_Corristo, 1); 1.4 ultra fix
};
*/