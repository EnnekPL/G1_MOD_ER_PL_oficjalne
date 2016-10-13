//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Bandyta33_EXIT(C_INFO)
{
	npc             	= BAN_1608_Kereth;
	nr              	= 999;
	condition		= DIA_Bandyta33_EXIT_Condition;
	information	= DIA_Bandyta33_EXIT_Info;
	permanent	= TRUE;
	description    = DIALOG_ENDE;
};

FUNC INT DIA_Bandyta33_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bandyta33_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Bandyta_HELLO1 (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_HELLO1_Condition;
   information  = DIA_Bandyta_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Bandyta_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Bandyta_HELLO1_03_02"); //Nazywam siê Kereth. 
    AI_Output (other, self ,"DIA_Bandyta_HELLO1_15_03"); //Czym siê zajmujesz?
    AI_Output (self, other ,"DIA_Bandyta_HELLO1_03_04"); //Obecnie nie mam zajêcia. Zreszt¹ nie mia³ bym teraz g³owy do niczego. 
};

//========================================
//-----------------> Quest
//========================================

INSTANCE DIA_Bandyta_Quest (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_Quest_Condition;
   information  = DIA_Bandyta_Quest_Info;
   permanent	= FALSE;
   description	= "Dlaczego nie mia³byœ g³owy?";
};

FUNC INT DIA_Bandyta_Quest_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Bandyta_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_Quest_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Quest_15_01"); //Dlaczego nie mia³byœ g³owy?
    AI_Output (self, other ,"DIA_Bandyta_Quest_03_02"); //Mój brat niedawno zmar³...
    AI_Output (other, self ,"DIA_Bandyta_Quest_15_03"); //Przykro mi.
    AI_Output (self, other ,"DIA_Bandyta_Quest_03_04"); //Nie to jest najgorsze. Ktoœ ci¹gle rozkopuje jego grób i nie wiem dlaczego. Mo¿e móg³byœ mi jakoœ pomóc?
	AI_Output (other, self ,"DIA_Bandyta_Quest_15_05"); //W jaki sposób?
	AI_Output (self, other ,"DIA_Bandyta_Quest_03_06"); //IdŸ na jego grób i poszukaj poszlak. Byæ mo¿e ja coœ przeoczy³em. Cholera, strasznie rozbity jestem.
	AI_Output (other, self ,"DIA_Bandyta_Quest_15_07"); //Gdzie jest jego grób?
	AI_Output (self, other ,"DIA_Bandyta_Quest_03_08"); //WyjdŸ z Obozu i udaj siê delikatnie na prawo. Tam go znajdziesz. 
	
	MIS_DestroyedGrave = LOG_RUNNING;

    Log_CreateTopic          (CH1_DestroyedGrave, LOG_MISSION);
    Log_SetTopicStatus      (CH1_DestroyedGrave, LOG_RUNNING);
    B_LogEntry             	  (CH1_DestroyedGrave,"Bandyta Kereth ma pewien problem. Ktoœ ci¹gle rozkopuje grób jego zmar³ego brata. Mam tam pójœæ i poszukaæ jakichœ poszlak. Grób znajdê na prawo od wyjœcia z Obozu Bandytów.");
	
	//Wld_InsertItem	   (ItMi_JoshSwordElement,"OW_PATH_190");
};

//========================================
//-----------------> FindSwordElement
//========================================

INSTANCE DIA_Bandyta_FindSwordElement (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_FindSwordElement_Condition;
   information  = DIA_Bandyta_FindSwordElement_Info;
   permanent	= FALSE;
   description	= "Znalaz³em fragment miecza.";
};

FUNC INT DIA_Bandyta_FindSwordElement_Condition()
{	
	if (MIS_DestroyedGrave == LOG_RUNNING) && (Npc_HasItems (other, ItMi_JoshSwordElement) >=1)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_FindSwordElement_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FindSwordElement_15_01"); //Znalaz³em fragment miecza. Faktycznie z tob¹ Ÿle. Jest ca³kiem du¿y. Nie wiem jak mog³eœ go nie zauwa¿yæ.
    AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_02"); //Poka¿ mi to. Mam taki podobny fragment. Nawet do siebie pasuj¹. Równie¿ zna³em go przy grobie. 
    AI_Output (other, self ,"DIA_Bandyta_FindSwordElement_15_03"); //Co to mo¿e znaczyæ?
    AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_04"); //Ktoœ widocznie niszczy grób przy u¿yciu swojej broni. To jakiœ kretyn. Po uderzeniu w kamieñ ostrze musia³o pêkn¹æ. 
	AI_Output (self, other ,"DIA_Bandyta_FindSwordElement_03_05"); //IdŸ do Puna i zapytaj czy pamiêta komu sprzedawa³ taki miecz. Mo¿e to bêdzie jakaœ wskazówka.
	
    B_LogEntry               (CH1_DestroyedGrave,"Bandyta Kereth ma pewien problem. Ktoœ ci¹gle rozkopuje grób jego zmar³ego brata. Mam tam pójœæ i poszukaæ jakichœ poszlak. Grób znajdê na prawo od wyjœcia z Obozu Bandytów.");
};

//========================================
//-----------------> ItsJens
//========================================

INSTANCE DIA_Bandyta_ItsJens (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_ItsJens_Condition;
   information  = DIA_Bandyta_ItsJens_Info;
   permanent	= FALSE;
   description	= "Gada³em z Punem.";
};

FUNC INT DIA_Bandyta_ItsJens_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Raeuber_SwordElement))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_ItsJens_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_01"); //Gada³em z Punem.
    AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_02"); //Coœ wiesz?
    AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_03"); //Sprzeda³ ten miecz Jensowi.
    AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_04"); //Wiedzia³em! Ten sukinsyn zawsze mi wadzi³. Najpewniej to on te¿ stoi za zabójstwem. 
	AI_Output (other, self ,"DIA_Bandyta_ItsJens_15_05"); //W jaki sposób w ogóle zgin¹³ twój brat?
	AI_Output (self, other ,"DIA_Bandyta_ItsJens_03_06"); //Czy to wa¿ne? To ta gnida zabi³a Rayana! IdŸ, spytaj czy ma jakieœ wyt³umaczenie.  
	
    B_LogEntry               (CH1_DestroyedGrave,"Wœciek³y Kereth kaza³ mi oskar¿yæ Jensa. Dowody wskazuj¹, ¿e to on rozkopuje grób. Co wiêcej Kereth twierdzi, ¿e stoi on tak¿e za morderstwem.");
};

//========================================
//-----------------> TalkWithJens
//========================================

INSTANCE DIA_Bandyta_TalkWithJens (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_TalkWithJens_Condition;
   information  = DIA_Bandyta_TalkWithJens_Info;
   permanent	= FALSE;
   description	= "Rozmawia³em z Jensem.";
};

FUNC INT DIA_Bandyta_TalkWithJens_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Jens_YourSwordPieces)) && (JensIsVictimOfKereth)
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_TalkWithJens_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_01"); //Rozmawia³em z Jensem.
    AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_03"); //Myœlê, ¿e jest winny. Próbowa³ mi sprzedaæ jak¹œ historyjkê, ¿e miecz ktoœ mu ukrad³ w przededniu zabójstwa.
	AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_04"); //S³ysza³em ju¿ takie rzeczy setki razy... 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_05"); //Widaæ, ¿e masz ³eb na karku, koleœ! Dobrze, ¿e spotka³em kogoœ takiego jak ty. 
	AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_06"); //Gdy Quentin siê o wszystkim dowie, Jensa spotka zas³u¿ona kara. Zrobi³eœ ju¿ dla mnie bardzo du¿o, ale muszê ciê prosiæ o...
	AI_Output (other, self ,"DIA_Bandyta_TalkWithJens_15_05"); //Poœwiadczenie Quentinowi?
	AI_Output (self, other ,"DIA_Bandyta_TalkWithJens_03_06"); //Tak, miejmy to ju¿ z g³owy. Po prostu powiedz mu co wiesz. 
	
    B_LogEntry               (CH1_DestroyedGrave,"Kereth pogratulowa³ mi, ¿e nie da³em siê nabraæ na historyjkê Jensa. Muszê jeszcze tylko opowiedzieæ wszystko Quentinowi. Liczê, ¿e Kereth nieŸle mnie wynagrodzi.");
};

//========================================
//-----------------> TalkWithQuentin
//========================================

INSTANCE DIA_Bandyta_TalkWithQuentin (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_TalkWithQuentin_Condition;
   information  = DIA_Bandyta_TalkWithQuentin_Info;
   permanent	= FALSE;
   description	= "Oszuka³eœ mnie!";
};

FUNC INT DIA_Bandyta_TalkWithQuentin_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Quentin_JensIsKiller))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_15_01"); //Oszuka³eœ mnie! Jens nie zabi³ twojego brata. 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_03_02"); //To twoja wina! Da³eœ im sobie wmówiæ, ¿e Jens jest niewinny. Zebra³eœ za ma³o dowodów.
	Info_ClearChoices	(DIA_Bandyta_TalkWithQuentin);
    Info_AddChoice		(DIA_Bandyta_TalkWithQuentin, "Zas³u¿y³eœ na porz¹dne lanie.", DIA_Bandyta_TalkWithQuentin_Fight);
    Info_AddChoice		(DIA_Bandyta_TalkWithQuentin, "Zapomnijmy o ca³ej sprawie.", DIA_Bandyta_TalkWithQuentin_Calm);
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Fight ()
{
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Fight_15_01"); //Przestañ traktowaæ mnie jak skoñczonego durnia! Dopilnujê, ¿ebyœ ju¿ nie wpad³ na pomys³ oszukiwania kogokolwiek. 
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Fight_03_02"); //No to spróbuj swoich si³! 
	
	CreateInvItems (self, itminugget,100);
	AI_StopProcessInfos	(self);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,""); 
};

FUNC VOID DIA_Bandyta_TalkWithQuentin_Calm ()
{
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_01"); //Zapomnijmy o ca³ej sprawie.
    AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_02"); //Dobry pomys³. Có¿, nie wysz³o to wszystko tak jak planowa³em... Gdybym móg³ pracowaæ przy u¿yciu narzêdzi Jensa zyska³bym nieco szacunku i niez³y dochód.
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_03"); //Dlaczego po prostu nie mogliœcie pracowaæ razem?
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_04"); //Jens nie chcia³ nikogo do siebie dopuœciæ. Wielokrotnie oferowa³em mu pomoc jednak nie przepada³ za mn¹ wiêc zawsze odmawia³. 
	AI_Output (other, self ,"DIA_Bandyta_TalkWithQuentin_Calm_15_05"); //Jeszcze jedna kwestia... Co tak naprawdê sta³o siê z twoim bratem? 
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_06"); //Nie mam pojêcia. Nie posun¹³bym siê przecie¿ do zabójstwa. To by³a jedyna osoba w tym cholernym miejscu, której mog³em ufaæ.
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_07"); //ZnaleŸliœmy go pewnego dnia martwego z drobnymi obra¿eniami. Mo¿e napad³ go jakiœ zwierz? Nie wiem, nie wiem...
	AI_Output (self, other ,"DIA_Bandyta_TalkWithQuentin_Calm_03_08"); //S³uchaj, widzê, ¿e jesteœ w porz¹dku. Masz tu 50 bry³ek rudy za tê nieudan¹ akcjê.
	
	CreateInvItems (self, itminugget,100);
	B_GiveINvItems (self,other,itminugget,50);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AngryKereth
//========================================

INSTANCE DIA_Bandyta_AngryKereth (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_AngryKereth_Condition;
   information  = DIA_Bandyta_AngryKereth_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bandyta_AngryKereth_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_BriamsEvidence))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_AngryKereth_Info()
{
    AI_Output (self, other ,"DIA_Bandyta_AngryKereth_03_01"); //Ty sukinsynu! Myœlisz, ¿e jesteœ cwany?   
    AI_Output (other, self ,"DIA_Bandyta_AngryKereth_15_02"); //Próbowa³eœ mnie oszukaæ, ale zostawi³eœ za sob¹ zbyt du¿o œladów.
    AI_Output (self, other ,"DIA_Bandyta_AngryKereth_03_03"); //Zaraz oberwiesz! 
	
	AI_StopProcessInfos	(self);
    CreateInvItems (other, ItMiNugget, 100);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};


/*
//========================================
//-----------------> Szefu
//========================================

INSTANCE DIA_Bandyta_Szefu (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_Szefu_Condition;
   information  = DIA_Bandyta_Szefu_Info;
   permanent	= FALSE;
   description	= "To ty dowodzisz kopalni¹?";
};

FUNC INT DIA_Bandyta_Szefu_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_Szefu_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Szefu_15_01"); //To ty dowodzisz kopalni¹?
    AI_Output (self, other ,"DIA_Bandyta_Szefu_03_02"); //Tak, na zlecenie Quentina.
    AI_Output (other, self ,"DIA_Bandyta_Szefu_15_03"); //Kopacze sprawiaj¹ problemy?
    AI_Output (self, other ,"DIA_Bandyta_Szefu_03_04"); //Raczej nie.
    AI_Output (self, other ,"DIA_Bandyta_Szefu_03_05"); //Jest spokojnie. Tylko te przeklête pe³zacze.
};

//========================================
//-----------------> Help
//========================================

INSTANCE DIA_Bandyta_Help (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 2;
   condition    = DIA_Bandyta_Help_Condition;
   information  = DIA_Bandyta_Help_Info;
   permanent	= FALSE;
   description	= "Mogê jakoœ pomóc?";
};

FUNC INT DIA_Bandyta_Help_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Bandyta_Help_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_Help_15_01"); //Mogê jakoœ pomóc?
    AI_Output (self, other ,"DIA_Bandyta_Help_03_02"); //Oczywiœcie. Krêcisz siê tu i tam. 
    AI_Output (self, other ,"DIA_Bandyta_Help_03_03"); //Za³atw nam dwa ko³a zêbate. Tylko takie du¿e.
    AI_Output (other, self ,"DIA_Bandyta_Help_15_04"); //Gdzie je znajdê?
    AI_Output (self, other ,"DIA_Bandyta_Help_03_05"); //Bêdziesz musia³ poprosiæ jakiegoœ rzemieœlnika, ¿eby ci je wyrobi³.
    AI_Output (self, other ,"DIA_Bandyta_Help_03_06"); //Powiedz, ¿e chcesz ko³o z z¹bkiem na dwa palce.
    AI_Output (other, self ,"DIA_Bandyta_Help_15_07"); //Po co wam te ko³a zêbate?
    AI_Output (self, other ,"DIA_Bandyta_Help_03_08"); //Chcemy naprawiæ stare machiny stoj¹ce w kopalni.
    AI_Output (self, other ,"DIA_Bandyta_Help_03_09"); //To znacznie przyspieszy³oby wydobycie.
    MIS_NoweKola = LOG_RUNNING;
	CreateInvItems (Org_843_Sharky, BigGear, 1);
    Log_CreateTopic            (CH1_NoweKola, LOG_MISSION);
    Log_SetTopicStatus       (CH1_NoweKola, LOG_RUNNING);
    B_LogEntry                     (CH1_NoweKola,"Kereth kaza³ przynieœæ sobie dwa du¿e ko³a zêbate.");
};



//========================================
//-----------------> FindKolo
//========================================

INSTANCE DIA_Bandyta_FindKolo (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 1;
   condition    = DIA_Bandyta_FindKolo_Condition;
   information  = DIA_Bandyta_FindKolo_Info;
   permanent	= FALSE;
   description	= "Mam ko³a.";
};

FUNC INT DIA_Bandyta_FindKolo_Condition()
{
    if (Npc_HasItems (other, BigGear) >=2)
    && (Npc_KnowsInfo (hero, DIA_Bandyta_Help))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_FindKolo_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_FindKolo_15_01"); //Mam ko³a.
    AI_Output (self, other ,"DIA_Bandyta_FindKolo_03_02"); //Dobra, daj mi je.
    AI_Output (self, other ,"DIA_Bandyta_FindKolo_03_03"); //Oto twoja ruda.
    B_GiveInvItems (other, self, BigGear, 2);
    CreateInvItems (self, ItMiNugget, 30);
    B_GiveInvItems (self, other, ItMiNugget, 30);
    B_LogEntry                     (CH1_NoweKola,"Zanios³em ko³a Kerethowi. Maszyny w kopalni mog¹ wróciæ do pracy.");
    Log_SetTopicStatus       (CH1_NoweKola, LOG_SUCCESS);
    MIS_NoweKola = LOG_SUCCESS;

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};
*/

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Bandyta_HELLO2 (C_INFO)
{
   npc          = BAN_1608_Kereth;
   nr           = 2;
   condition    = DIA_Bandyta_HELLO2_Condition;
   information  = DIA_Bandyta_HELLO2_Info;
   permanent	= FALSE;
   description	= "Szukam kogoœ do ochrony kopalni z³ota.";
};

FUNC INT DIA_Bandyta_HELLO2_Condition()
{
    if (MIS_KopalniaZlota == LOG_RUNNING)  && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bandyta_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Bandyta_HELLO2_15_01"); //Szukam kogoœ do ochrony kopalni z³ota.
    AI_Output (self, other ,"DIA_Bandyta_HELLO2_03_02"); //Kopalnia z³ota? Gdzie?
    AI_Output (other, self ,"DIA_Bandyta_HELLO2_15_03"); //Do koñca nie wiem.
    AI_Output (other, self ,"DIA_Bandyta_HELLO2_15_04"); //Jakiœ goœæ z Nowego Obozu proponuje udzia³ w zyskach za pomoc.
    AI_Output (self, other ,"DIA_Bandyta_HELLO2_03_05"); //Wchodzê w to. 
    AI_Output (other, self ,"DIA_Bandyta_HELLO2_15_06"); //Spotkajmy siê w karczmie w Nowym Obozie.
	Npc_ExchangeRoutine (self, "karczma");
    B_LogEntry                     (CH1_KopalniaZlota,"Kereth bêdzie chroni³ kopalniê.");

    B_GiveXP (300);
};