//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Blade_EXIT(C_INFO)
{
	npc             = SLD_704_Blade;
	nr              = 999;
	condition		= DIA_Blade_EXIT_Condition;
	information		= DIA_Blade_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Blade_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Blade_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Blade_GoToMine (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_GoToMine_Condition;
   information  = DIA_Blade_GoToMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_GoToMine_Condition()
{
    if (kapitel == 1) && (Npc_GetTrueGuild (hero ) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_GoToMine_Info()
{
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_01"); //Hej, zaczekaj!
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_02"); //Dopiero co tutaj trafi³eœ, tak? 
    AI_Output (other, self ,"DIA_Blade_GoToMine_15_03"); //Mo¿e...
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_04"); //Nazywam siê Kosa i mam dla ciebie propozycjê. Mogê ci pomóc zostaæ Kretem. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_05"); //Zostaj¹c cz³onkiem obozu zyskasz szacunek, pracê i Ÿród³o dochodu. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_06"); //Nie idŸ do Starego Obozu. Gomez to pod³y oszust i wyzyskiwacz. W Bractwie natomiast zrobi¹ ci pranie mózgu.
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_07"); //Nowy Obóz to najlepsze miejsce dla skazañców, którzy chc¹ czuæ choæ odrobinê wolnoœci w tym piekle.

    Info_ClearChoices		(DIA_Blade_GoToMine);
    Info_AddChoice		(DIA_Blade_GoToMine, "Opowiedz mi o tym ca³ym Nowym Obozie.", DIA_Blade_GoToMine_AboutNewCamp);
    Info_AddChoice		(DIA_Blade_GoToMine, "Nigdzie z tob¹ nie pójdê!", DIA_Blade_GoToMine_Nope);
    Info_AddChoice		(DIA_Blade_GoToMine, "Dobrze. ZaprowadŸ mnie do Kopalni.", DIA_Blade_GoToMine_LetsGo);
};

FUNC VOID DIA_Blade_GoToMine_AboutNewCamp()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_AboutNewCamp_15_01"); //Opowiedz mi o tym ca³ym Nowym Obozie.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_02"); //Nasz Obóz ró¿ni siê od innych miejsc w Kolonii. Tam mo¿esz robiæ co chcesz. Nikt ci nic nie ka¿e.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_03"); //Wspó³pracujemy z Magami Wody. Powiem ci w sekrecie, ¿e Arcymag Wody Saturas opracowa³ plan, który doprowadzi do zniszczenia Bariery.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_04"); //Aby to zrobiæ potrzebujemy magicznej rudy. Krety zajmuj¹ siê jej wydobyciem.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_05"); //W koñcu uda nam siê odzyskaæ wolnoœæ. Do³¹czaj¹c do nas dok³adasz cegie³kê do tego wielkiego przedsiêwziêcia!
};

FUNC VOID DIA_Blade_GoToMine_Nope()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_Nope_15_01"); //Nigdzie z tob¹ nie pójdê!
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_02"); //Nie wiesz w co siê pakujesz, ch³opcze. Wkrótce zrozumiesz.
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_03"); //Jakbyœ jednak zmieni³ zdanie, porozmawiaj z Mordragiem. To nasz cz³owiek w Starym Obozie.
    Info_ClearChoices		(DIA_Blade_GoToMine);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Blade_GoToMine_LetsGo()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_LetsGo_15_01"); //Dobrze. ZaprowadŸ mnie do Kopalni.
    AI_Output (self, other ,"DIA_Blade_GoToMine_LetsGo_03_02"); //Doskona³y wybór. Wyjaœniê ci wszystko na miejscu. Trzymaj siê blisko mnie.
    MIS_PathToFreeMine = LOG_RUNNING;

    Log_CreateTopic         (CH1_PathToFreeMine, LOG_MISSION);
    Log_SetTopicStatus      (CH1_PathToFreeMine, LOG_RUNNING);
    B_LogEntry              (CH1_PathToFreeMine,"Niejaki Kosa zaproponowa³ mi, ¿e zaprowadzi mnie do Wolnej Kopalni. Tam bêdê móg³ do³¹czyæ do Nowego Obozu - ponoæ to ostatni bastion wolnych ludzi w Kolonii - jako Kret. Postanowi³em skorzystaæ z propozycji i daæ siê zaprowadziæ. Mam nadziejê, ¿e nie zostanê oszukany.");
    Npc_ExchangeRoutine 	(self, "GUIDE");
	self.npctype = NPCTYPE_FRIEND;
    Info_ClearChoices		(DIA_Blade_GoToMine);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos		(self);
};

//========================================
//-----------------> NearbyNC
//========================================

INSTANCE DIA_Blade_NearbyNC (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_NearbyNC_Condition;
   information  = DIA_Blade_NearbyNC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_NearbyNC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_GoToMine))
    && (Npc_GetDistToWP (self, "OW_PATH_07_21") < 2000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_NearbyNC_Info()
{
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_01"); //Oto brama do Nowego Obozu, ostatniego wolnego miejsca w Kolonii. Tu mo¿esz czuæ siê swobodnie.
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_02"); //ChodŸ dalej. Kopalnia jest za Obozem.
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine 	(self, "GUIDE2");
};

//========================================
//-----------------> InFreeMineCamp
//========================================

INSTANCE DIA_Blade_InFreeMineCamp (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 2;
   condition    = DIA_Blade_InFreeMineCamp_Condition;
   information  = DIA_Blade_InFreeMineCamp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_InFreeMineCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_GoToMine))
    && (Npc_GetDistToWP (self, "OW_PATH_3004") < 2000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_InFreeMineCamp_Info()
{
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_01"); //Jesteœmy na miejscu. Tutaj znajduje siê tak zwany Kocio³. To zewnêtrzna czêœæ Kopalni.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_02"); //Co mam robiæ dalej? 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_03"); //Porozmawiaj ze Swineyem. To doœwiadczony górnik. On wyda ci spodnie i powie co robiæ dalej. 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_04"); //Moja rola tutaj siê koñczy.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_05"); //Dziêki...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_06"); //Ach, jeszcze jedno! Prawie zapomnia³em. Nie wchodŸ do wnêtrza Kopalni. 
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_07"); //CO?! Przecie¿ mam tam pracowaæ!
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_08"); //Kopalnia jest ju¿ obsadzona. Potrzebujemy ludzi na powierzchni. Trzeba przygotowywaæ podpory, kopaæ to, co jest na zewn¹trz...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_09"); //Roboty jest mnóstwo. Mamy swoje powody, ¿eby nie wpuszczaæ niektórych osób do Kopalni.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_10"); //Po prostu siê tym nie interesuj, a wszystko bêdzie w porz¹dku.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_11"); //No, idŸ ju¿. Poradzisz sobie!
    B_LogEntry                     (CH1_PathToFreeMine,"Kosa zaprowadzi³ mnie do Kopalni. Zasady które mi przedstawi³ s¹ dosyæ dziwne. Mam pracowaæ na zewn¹trz i nie interesowaæ siê wnêtrzem Kopalni. Od Swineya dostanê ekwipunek. ");
    Log_SetTopicStatus       (CH1_PathToFreeMine, LOG_SUCCESS);
    MIS_PathToFreeMine = LOG_SUCCESS;

    B_GiveXP (XP_GoToFreeMineCamp);
    Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npctype = NPCTYPE_MAIN;
    AI_StopProcessInfos	(self);
};


////////////////////////////////////////////////
//   About Recruit
////////////////////////////////////////////////

INSTANCE DIA_Blade_About_Recruit (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_About_Recruit_Condition;
   information  = DIA_Blade_About_Recruit_Info;
   permanent	= FALSE;
   description	= "Podobno mo¿esz mi pomóc.";
};

FUNC INT DIA_Blade_About_Recruit_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Will_ThompsonDED)) && (!Npc_KnowsInfo (hero, DIA_Will_Rekrut_Shrat))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_About_Recruit_Info()
{
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_01"); //Podobno mo¿esz mi pomóc.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_02"); //Czy¿by? A w czym?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_03"); //Podobno znasz siê na poszukiwaniu wiarygodnych pracowników.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_04"); //Hmm... Czego chcesz?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_05"); //Muszê zrekrutowaæ robotnika. Nie wiem od czego zacz¹æ poszukiwania.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_06"); //Nie wiem dlaczego mia³bym ci pomagaæ, ale jeœli potrzebujesz tylko robotnika to szukaj wœród Kopaczy lub Nowicjuszy. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_07"); //Proponowa³bym udaæ siê do Bractwa. Bramy w Starym Obozie s¹ strze¿one i ciê¿ko kogoœ stamt¹d wyprowadziæ. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_08"); //Wœród sekciarzy rozgl¹daj siê za kimœ, komu nie odpowiada ¿ycie w obozie. £atwiej bêdzie ci go namówiæ.
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_09"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_10"); //Dosta³eœ za darmo ca³kiem dobre rady. A teraz spadaj! 
   
    B_LogEntry               (CH2_GoldMine,"Kosa poleci³ mi szukaæ robotnika w obozie Bractwa.");
};


//************************************************************
// KONTYNUACJA ZADANIA OD MILA 
// POLOWANIE NA MAGNATÓW
//************************************************************

//========================================
//-----------------> HELLO1
//========================================
var int dia_blade_avbl;
INSTANCE DIA_Blade_HELLO1 (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_HELLO1_Condition;
   information  = DIA_Blade_HELLO1_Info;
   permanent	= true;
   description	= "Podobno mo¿na u ciebie dorobiæ...";
};

FUNC INT DIA_Blade_HELLO1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Mil_BliznaDed)) && (dia_blade_avbl == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_01"); //Podobno mo¿na u ciebie dorobiæ...
	if (Kapitel == 3)
	{
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_02"); //Dobrze, ¿e siê zjawi³eœ.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_03"); //Najpierw odpowiedz na moje pytania.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_04"); //Dlaczego tak wa¿ne by³o, aby Blizna otrzyma³ p³aszcz? I co ty masz z tym wspólnego?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_05"); //Ja tylko wykonujê zlecenie. A dok³adnie koordynujê wszystkie dzia³ania. Mój zleceniodawca kaza³ mi siê go pozbyæ, a ty mi w tym pomo¿esz.
    AI_Output (other, self ,"DIA_Blade_HELLO1_03_06"); //Kim jest twój zleceniodawca?
    AI_Output (self, other ,"DIA_Blade_HELLO1_15_07"); //Tego nie mogê ci zdradziæ.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_08"); //Powiedz mi chocia¿ o co chodzi z tym cholernym p³aszczem?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_09"); //To sposób oznaczenia celu. Cz³owiek, który dokona zabójstwa nigdy nie by³ w Starym Obozie. Nie zna Magnatów, a dziêki temu p³aszczowi ³atwo siê zorientuje, kogo ma sprz¹tn¹æ. 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_10"); //Zabójca, którego wybra³em do tej roboty to prawdziwy profesjonalista. Na kontynencie nale¿a³ do bandy Ortegi. Jednak, gdy trafi³ do Kolonii nie do³¹czy³ do ¿adnego obozu i ¿y³ w ukryciu. 
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_11"); //Odnalaz³em go, zaproponowa³em pracê, a on siê zgodzi³. 
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_12"); //Do jasnej cholery! Czemu akurat z futra jakiegoœ bia³ego wilka?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_13"); //O to ju¿ pytaj Mila. Mo¿e chcia³ ciê sprawdziæ?
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_14"); //Nie wa¿ne. Jak mam ci pomóc? I najwa¿niejsze: ile mi za to zap³acisz?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_15"); //Konkrety. Dobrze. Za robotê dostaniesz 500 bry³ek rudy. Zabójstwo Magnata to nie byle co.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_16"); //A co mam robiæ? 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_17"); //IdŸ do Starego Obozu i zobacz co siê tam dzieje. Potem wróæ jak najszybciej do mnie. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_18"); //Nie ma potrzeby. Mogê ci wszystko opowiedzieæ od razu. Stra¿nicy na zamku pij¹ piwo i objadaj¹ siê pieczonym miêsem, Magnaci debatuj¹ w sali Gomeza, Kopacze przesia...
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_19"); //Przestañ siê zgrywaæ i ruszaj siê. Muszê wiedzieæ jak wygl¹da sytuacja. Nie ma czasu. 
    B_LogEntry                     (CH3_ScarMurder,"Mam iœæ do Starego Obozu i zobaczyæ co siê tam dzieje. Kosa i jego pracownik ju¿ chyba podjêli jakieœ dzia³ania.");
    AI_StopProcessInfos	(self);
	DIA_Blade_HELLO1.permanent = 0;
	dia_blade_avbl = true;
	B_Story_ScarDie ();
	Scar_die = true; 
	}
	else
	{
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_17"); //Nic siê jeszcze nie zaczê³o. Czekamy na odpowiedni moment. PrzyjdŸ póŸniej. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_18"); //Nie rozumiem...
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_19"); //I bardzo dobrze! Na razie nie zaprz¹taj sobie tym g³owy.
	//DIA_Blade_HELLO1.permanent = 1;
	};
};

//========================================
//-----------------> BACK_FROM_OC
//========================================

INSTANCE DIA_Blade_BACK_FROM_OC (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_BACK_FROM_OC_Condition;
   information  = DIA_Blade_BACK_FROM_OC_Info;
   permanent	= FALSE;
   description	= "By³em w Starym Obozie.";
};

FUNC INT DIA_Blade_BACK_FROM_OC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_THORUS_SCAR_DIE))
    //&& (Scar_die == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_BACK_FROM_OC_Info()
{
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_01"); //By³em w Starym Obozie.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_02"); //I co siê tam dzieje?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_03"); //Wszystko chyba posz³o zgodnie z planem. Blizna nie ¿yje, a Stra¿nicy szukaj¹ mordercy.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_04"); //ZnaleŸli go?!
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_05"); //Chyba nie. Przynajmniej tak wynika³o z rozmowy z Thorusem.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_06"); //Nie zjawi³ siê na miejscu spotkania. Pewnie ma k³opoty. Musisz mu pomóc.
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_07"); //Dlaczego ja?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_08"); //Jeœli go z³api¹, mo¿e zacz¹æ sypaæ, a wtedy wojnê ze Starym Obozem mam pewn¹. Gdyby Lee siê dowiedzia³ zabi³by nas od razu.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_09"); //IdŸ ponownie do Starego Obozu i odszukaj naszego cz³owieka. Razem musicie jakoœ uciec. 
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_10"); //Jak go poznam?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_11"); //Nazywa siê Snake. Powiedz mu, ¿e ja ciê przysy³am. 
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_12"); //Ale jeœli siê zdradzisz i powiesz, któremuœ z ludzi Gomeza, ¿e to ja ciê przysy³am, bêdziesz musia³ po sobie posprz¹taæ. Rozumiesz?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_13"); //Tak, nikt ma o niczym nie wiedzieæ.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_14"); //Dobrze, ¿e siê rozumiemy. A teraz idŸ, bo nie ma czasu do stracenia.
    B_LogEntry                     (CH3_ScarMurder,"Sytuacja nieco wymknê³a siê spod kontroli. Magnat nie ¿yje, ale to nie znaczy, ¿e sprawa jest zamkniêta. Snake, zabójca, którego wynaj¹³ Kosa najpewniej zosta³ w Starym Obozie i nie mo¿e uciec. Muszê mu pomóc, zanim Stra¿nicy go z³api¹ i ca³a akcja pójdzie na marne. Z poprzedniej rozmowy z Thorusem wiem, ¿e nasz cz³owiek powinien nosiæ zbroje Stra¿ników. Pewnie to dziêki niej jeszcze ¿yje. ");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SNAKESESCAPE
//========================================

INSTANCE DIA_Blade_SNAKESESCAPE (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_SNAKESESCAPE_Condition;
   information  = DIA_Blade_SNAKESESCAPE_Info;
   permanent	= FALSE;
   description	= "Snake uciek³ z obozu.";
};

FUNC INT DIA_Blade_SNAKESESCAPE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Snake_CELLAR))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_SNAKESESCAPE_Info()
{
    AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_01"); //Snake uciek³ z obozu.
    if (Snake_help == true)
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_02"); //Wiem, ju¿ siê z nim rozliczy³em. Bardzo sobie ciebie chwali³. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_03"); //Powiedzia³, ¿e chce siê z tob¹ spotkaæ w Kotle. Czeka tam na ciebie.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_04"); //A oto twoja ruda. Tak jak siê umawialiœmy, 500 bry³ek rudy. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_05"); //Chcesz przeliczyæ?
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_06"); //A powinienem?
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_07"); //Nie. Do zobaczenia.
        B_LogEntry                     (CH3_ScarMurder,"Odebra³em od Kosy nagrodê za pomoc w wykonaniu zadania. Snake chyba te¿ coœ dla mnie ma. Mam siê z nim spotkaæ w Kotle. Jeœli chcê dowiedzieæ siê wiêcej o sensie ca³ego tego zadania, powinienem pogadaæ z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
        B_GiveXP (500);
		CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    }
    else
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_08"); //Rozmawia³em ju¿ z nim. Nie by³ z ciebie zbyt zadowolony. Podobno zebra³o ci siê na oszczêdzanie Stra¿ników.
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_09"); //S³uchaj, uzna³em, ¿e œmieræ tego cz³owieka bêdzie zbêdna.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_10"); //Uczestnicz¹c w zabójstwie Magnata powinieneœ ka¿dego Stra¿nika, który ciê zdemaskowa³ uznawaæ za wroga...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_11"); //To tak na przysz³oœæ...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_12"); //Oto twoja ruda. 
        B_LogEntry                     (CH3_ScarMurder,"Odebra³em od Kosy nagrodê za pomoc w wykonaniu zadania. Jeœli chcê dowiedzieæ siê wiêcej o sensie ca³ego tego zadania, powinienem pogadaæ z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
		
        B_GiveXP (500);
        CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    };
	AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_13"); //Zaczekaj. Nie powiedzia³eœ mi kto za tym wszystkim stoi. Jaki to mia³o sens?
	AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_14"); //Porozmawiaj z Orikiem. Byæ mo¿e ci wszystko wyjaœni, ale nie gwarantujê tego.
    AI_StopProcessInfos	(self);
};



////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////   POPRZEDNIA WERSJA ZADANIA
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> DalszePlany2
//========================================

INSTANCE DIA_Blade_DalszePlany2 (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_DalszePlany2_Condition;
   information  = DIA_Blade_DalszePlany2_Info;
   permanent	= FALSE;
   description	= "Co teraz?";
};

FUNC INT DIA_Blade_DalszePlany2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_HELLO1))
    && (Npc_GetDistToWP (self, "OC_ROUND_2") < 1000)
    && (!Npc_KnowsInfo (hero, DIA_Blade_Next))
    && (!Wld_IsTime     (00,00,02,00))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_DalszePlany2_Info()
{
    AI_Output (other, self ,"DIA_Blade_DalszePlany2_15_01"); //Co teraz?
    AI_Output (self, other ,"DIA_Blade_DalszePlany2_03_02"); //Teraz nic. Czekamy. PrzyjdŸ tu o pó³nocy. Tylko siê nie spóŸnij.
};


//========================================
//-----------------> Next
//========================================

INSTANCE DIA_Blade_Next (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_Next_Condition;
   information  = DIA_Blade_Next_Info;
   permanent	= FALSE;
   description	= "Co dalej?";
};

FUNC INT DIA_Blade_Next_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_HELLO1))
    && (Npc_GetDistToWP (self, "OC_ROUND_2") < 1000)
	&& (Wld_IsTime     (00,00,02,00)) //poprawka czasowa 
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_Next_Info()
{
    AI_Output (other, self ,"DIA_Blade_Next_15_01"); //Co dalej?
    AI_Output (self, other ,"DIA_Blade_Next_03_02"); //B¹dŸ cicho. Musisz koniecznie dostaæ siê na plac zamkowy.
    AI_Output (self, other ,"DIA_Blade_Next_03_03"); //Gdy ju¿ bêdziesz na placu, idŸ w kierunku siedziby Magnatów. Na pewno zaczepi¹ ciê Stra¿nicy.
    AI_Output (self, other ,"DIA_Blade_Next_03_04"); //Powiedz im, ¿e chcê siê spotkaæ z Blizn¹ w pobli¿u kaplicy Innosa. Najlepiej natychmiast.
    AI_Output (self, other ,"DIA_Blade_Next_03_05"); //Wed³ug instrukcji, które otrzyma³em musisz powiedzieæ, ¿e nazywam siê Spike. To chyba jego dawny przyjaciel.
    AI_Output (self, other ,"DIA_Blade_Next_15_06"); //Je¿eli Stra¿nicy jednak nie bêd¹ ciê zaczepiaæ, to idŸ mu to powiedz osobiœcie.
	AI_Output (self, other ,"DIA_Blade_Next_03_07"); //IdŸ ju¿.
	
	B_LogEntry                     (CH3_ScarMurder,"Mam powiedzieæ BliŸnie, ¿e Stra¿nik Spike chce siê z nim spotkaæ przy kaplicy Innosa.");
	var C_NPC kosa	; kosa 	= Hlp_GetNpc (SLD_704_Blade	);
	Npc_RemoveInvItems (kosa, ItMw_1H_Mace_War_03, 1);
	EquipItem (kosa, egzekutor_killer);
	CreateInvItems (kosa, ItMw_1H_Mace_War_03, 1);
	Npc_ExchangeRoutine (kosa, "KAPLICA");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Guardnians
//========================================

INSTANCE DIA_Blade_Guardnians (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_Guardnians_Condition;
   information  = DIA_Blade_Guardnians_Info;
   permanent	= FALSE;
   description	= "Stra¿nicy id¹ tu razem z Blizn¹!";
};

FUNC INT DIA_Blade_Guardnians_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Scar_Sike))
    && (guardians_scar == true)
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_Guardnians_Info()
{
	AI_Output (other, self ,"DIA_Blade_Guardnians_15_01"); //Stra¿nicy id¹ tu razem z Blizn¹!
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_02"); //Cholera jasna. Ale spapra³eœ! Mia³ przyjœæ sam!
    AI_Output (other, self ,"DIA_Blade_Guardnians_15_03"); //Co teraz zrobimy? Potrzebny nam plan! Szybko.
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_04"); //Ja muszê zabiæ Bliznê. Postaram siê to zrobiæ szybko. Mam specjalny miecz.
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_05"); //Ty postaraj siê prze¿yæ. Wypij szybko tê miksturê. Zwiêkszy twoj¹ si³ê. 
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_06"); //Musimy jakoœ sobie poradziæ.
    B_LogEntry                     (CH3_ScarMurder,"Cholera... spapra³em sprawê. Blizna idzie w naszym kierunku wraz z dwoma najlepszymi Stra¿nikami. Muszê prze¿yæ i odci¹gn¹æ uwagê Stra¿ników. Z naciskiem na prze¿yæ.");

    CreateInvItems (self, ItFo_PotionTime_Master_01, 1);
    B_GiveInvItems (self, other, ItFo_PotionTime_Master_01, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Wygrana
//========================================

INSTANCE DIA_Blade_Wygrana (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 1;
   condition    = DIA_Blade_Wygrana_Condition;
   information  = DIA_Blade_Wygrana_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_Wygrana_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_Next))
    && (Npc_KnowsInfo (hero, DIA_Scar_Sike))
    && (Npc_IsDead(Ebr_101_Scar))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_Wygrana_Info()
{
    AI_Output (self, other ,"DIA_Blade_Wygrana_03_01"); //Cholera, uda³o nam siê! Spadamy! Ruszaj siê.
    B_LogEntry                     (CH3_ScarMurder,"Uda³o nam siê. Musimy uciekaæ z Obozu.");
	czas_ucieczki_scar = 20;
    B_GiveXP (300);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(SLD_704_Blade,"TOOC");

};

//========================================
//-----------------> QuestSukces
//========================================

INSTANCE DIA_Blade_QuestSukces (C_INFO)
{
   npc          = SLD_704_Blade;
   nr           = 2;
   condition    = DIA_Blade_QuestSukces_Condition;
   information  = DIA_Blade_QuestSukces_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Blade_QuestSukces_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Blade_Wygrana)) && (Npc_GetDistToWP (self, "OC_ROUND_2") < 1000) && (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Blade_QuestSukces_Info()
{
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_01"); //Ju¿ po wszystkim. 
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_02"); //Dobra robota!
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_03"); //Masz racjê. To by³o coœ wyj¹tkowego. Orik bêdzie zadowolony.
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_04"); //Orik?
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_05"); //Cholera, wygada³em siê. 
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_06"); //Wyjaœnisz mi to?
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_07"); //Nie, lepiej niech Orik sam ci to powie.
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_08"); //Ja mia³em ci tylko zap³aciæ za robotê. Tak jak siê umawialiœmy: 1000 bry³ek rudy.
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_09"); //Uwa¿aj przez jakiœ czas na Stra¿ników. Lepiej nie wchodŸ do obozu.
    CreateInvItems (self, ItMiNugget, 1000);
    B_GiveInvItems (self, other, ItMiNugget, 1000);
    B_LogEntry               (CH3_ScarMurder,"Blizna nie ¿yje. Okazuje siê, ¿e za sznurki poci¹ga³ Orik. Ciekawe co ma do tego Magnata.");
    Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
    MIS_ScarMurder = LOG_SUCCESS;
	czas_ucieczki_scar2 = 300;
    B_GiveXP (XP_ZabojstwoBlizny);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	Mdl_SetVisualBody (SLD_704_Blade,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_H);
};


