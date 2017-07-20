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
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_02"); //Dopiero co tutaj trafi�e�, tak? 
    AI_Output (other, self ,"DIA_Blade_GoToMine_15_03"); //Mo�e...
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_04"); //Nazywam si� Kosa i mam dla ciebie propozycj�. Mog� ci pom�c zosta� Kretem. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_05"); //Zostaj�c cz�onkiem obozu zyskasz szacunek, prac� i �r�d�o dochodu. 
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_06"); //Nie id� do Starego Obozu. Gomez to pod�y oszust i wyzyskiwacz. W Bractwie natomiast zrobi� ci pranie m�zgu.
    AI_Output (self, other ,"DIA_Blade_GoToMine_03_07"); //Nowy Ob�z to najlepsze miejsce dla skaza�c�w, kt�rzy chc� czu� cho� odrobin� wolno�ci w tym piekle.

    Info_ClearChoices		(DIA_Blade_GoToMine);
    Info_AddChoice		(DIA_Blade_GoToMine, "Opowiedz mi o tym ca�ym Nowym Obozie.", DIA_Blade_GoToMine_AboutNewCamp);
    Info_AddChoice		(DIA_Blade_GoToMine, "Nigdzie z tob� nie p�jd�!", DIA_Blade_GoToMine_Nope);
    Info_AddChoice		(DIA_Blade_GoToMine, "Dobrze. Zaprowad� mnie do Kopalni.", DIA_Blade_GoToMine_LetsGo);
};

FUNC VOID DIA_Blade_GoToMine_AboutNewCamp()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_AboutNewCamp_15_01"); //Opowiedz mi o tym ca�ym Nowym Obozie.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_02"); //Nasz Ob�z r�ni si� od innych miejsc w Kolonii. Tam mo�esz robi� co chcesz. Nikt ci nic nie ka�e.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_03"); //Wsp�pracujemy z Magami Wody. Powiem ci w sekrecie, �e Arcymag Wody Saturas opracowa� plan, kt�ry doprowadzi do zniszczenia Bariery.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_04"); //Aby to zrobi� potrzebujemy magicznej rudy. Krety zajmuj� si� jej wydobyciem.
    AI_Output (self, other ,"DIA_Blade_GoToMine_AboutNewCamp_03_05"); //W ko�cu uda nam si� odzyska� wolno��. Do��czaj�c do nas dok�adasz cegie�k� do tego wielkiego przedsi�wzi�cia!
};

FUNC VOID DIA_Blade_GoToMine_Nope()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_Nope_15_01"); //Nigdzie z tob� nie p�jd�!
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_02"); //Nie wiesz w co si� pakujesz, ch�opcze. Wkr�tce zrozumiesz.
    AI_Output (self, other ,"DIA_Blade_GoToMine_Nope_03_03"); //Jakby� jednak zmieni� zdanie, porozmawiaj z Mordragiem. To nasz cz�owiek w Starym Obozie.
    Info_ClearChoices		(DIA_Blade_GoToMine);
    Npc_ExchangeRoutine (self, "START");
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Blade_GoToMine_LetsGo()
{
    AI_Output (other, self ,"DIA_Blade_GoToMine_LetsGo_15_01"); //Dobrze. Zaprowad� mnie do Kopalni.
    AI_Output (self, other ,"DIA_Blade_GoToMine_LetsGo_03_02"); //Doskona�y wyb�r. Wyja�ni� ci wszystko na miejscu. Trzymaj si� blisko mnie.
    MIS_PathToFreeMine = LOG_RUNNING;

    Log_CreateTopic         (CH1_PathToFreeMine, LOG_MISSION);
    Log_SetTopicStatus      (CH1_PathToFreeMine, LOG_RUNNING);
    B_LogEntry              (CH1_PathToFreeMine,"Niejaki Kosa zaproponowa� mi, �e zaprowadzi mnie do Wolnej Kopalni. Tam b�d� m�g� do��czy� do Nowego Obozu - pono� to ostatni bastion wolnych ludzi w Kolonii - jako Kret. Postanowi�em skorzysta� z propozycji i da� si� zaprowadzi�. Mam nadziej�, �e nie zostan� oszukany.");
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
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_01"); //Oto brama do Nowego Obozu, ostatniego wolnego miejsca w Kolonii. Tu mo�esz czu� si� swobodnie.
    AI_Output (self, other ,"DIA_Blade_NearbyNC_03_02"); //Chod� dalej. Kopalnia jest za Obozem.
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
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_01"); //Jeste�my na miejscu. Tutaj znajduje si� tak zwany Kocio�. To zewn�trzna cz�� Kopalni.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_02"); //Co mam robi� dalej? 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_03"); //Porozmawiaj ze Swineyem. To do�wiadczony g�rnik. On wyda ci spodnie i powie co robi� dalej. 
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_04"); //Moja rola tutaj si� ko�czy.
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_05"); //Dzi�ki...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_06"); //Ach, jeszcze jedno! Prawie zapomnia�em. Nie wchod� do wn�trza Kopalni. 
    AI_Output (other, self ,"DIA_Blade_InFreeMineCamp_15_07"); //CO?! Przecie� mam tam pracowa�!
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_08"); //Kopalnia jest ju� obsadzona. Potrzebujemy ludzi na powierzchni. Trzeba przygotowywa� podpory, kopa� to, co jest na zewn�trz...
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_09"); //Roboty jest mn�stwo. Mamy swoje powody, �eby nie wpuszcza� niekt�rych os�b do Kopalni.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_10"); //Po prostu si� tym nie interesuj, a wszystko b�dzie w porz�dku.
    AI_Output (self, other ,"DIA_Blade_InFreeMineCamp_03_11"); //No, id� ju�. Poradzisz sobie!
    B_LogEntry                     (CH1_PathToFreeMine,"Kosa zaprowadzi� mnie do Kopalni. Zasady kt�re mi przedstawi� s� dosy� dziwne. Mam pracowa� na zewn�trz i nie interesowa� si� wn�trzem Kopalni. Od Swineya dostan� ekwipunek. ");
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
   description	= "Podobno mo�esz mi pom�c.";
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
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_01"); //Podobno mo�esz mi pom�c.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_02"); //Czy�by? A w czym?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_03"); //Podobno znasz si� na poszukiwaniu wiarygodnych pracownik�w.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_04"); //Hmm... Czego chcesz?
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_05"); //Musz� zrekrutowa� robotnika. Nie wiem od czego zacz�� poszukiwania.
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_06"); //Nie wiem dlaczego mia�bym ci pomaga�, ale je�li potrzebujesz tylko robotnika to szukaj w�r�d Kopaczy lub Nowicjuszy. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_07"); //Proponowa�bym uda� si� do Bractwa. Bramy w Starym Obozie s� strze�one i ci�ko kogo� stamt�d wyprowadzi�. 
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_08"); //W�r�d sekciarzy rozgl�daj si� za kim�, komu nie odpowiada �ycie w obozie. �atwiej b�dzie ci go nam�wi�.
    AI_Output (other, self ,"DIA_Blade_About_Recruit_15_09"); //Tylko tyle?
    AI_Output (self, other ,"DIA_Blade_About_Recruit_03_10"); //Dosta�e� za darmo ca�kiem dobre rady. A teraz spadaj! 
   
    B_LogEntry               (CH2_GoldMine,"Kosa poleci� mi szuka� robotnika w obozie Bractwa.");
};


//************************************************************
// KONTYNUACJA ZADANIA OD MILA 
// POLOWANIE NA MAGNAT�W
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
   description	= "Podobno mo�na u ciebie dorobi�...";
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
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_01"); //Podobno mo�na u ciebie dorobi�...
	if (Kapitel == 3)
	{
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_02"); //Dobrze, �e si� zjawi�e�.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_03"); //Najpierw odpowiedz na moje pytania.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_04"); //Dlaczego tak wa�ne by�o, aby Blizna otrzyma� p�aszcz? I co ty masz z tym wsp�lnego?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_05"); //Ja tylko wykonuj� zlecenie. A dok�adnie koordynuj� wszystkie dzia�ania. M�j zleceniodawca kaza� mi si� go pozby�, a ty mi w tym pomo�esz.
    AI_Output (other, self ,"DIA_Blade_HELLO1_03_06"); //Kim jest tw�j zleceniodawca?
    AI_Output (self, other ,"DIA_Blade_HELLO1_15_07"); //Tego nie mog� ci zdradzi�.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_08"); //Powiedz mi chocia� o co chodzi z tym cholernym p�aszczem?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_09"); //To spos�b oznaczenia celu. Cz�owiek, kt�ry dokona zab�jstwa nigdy nie by� w Starym Obozie. Nie zna Magnat�w, a dzi�ki temu p�aszczowi �atwo si� zorientuje, kogo ma sprz�tn��. 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_10"); //Zab�jca, kt�rego wybra�em do tej roboty to prawdziwy profesjonalista. Na kontynencie nale�a� do bandy Ortegi. Jednak, gdy trafi� do Kolonii nie do��czy� do �adnego obozu i �y� w ukryciu. 
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_11"); //Odnalaz�em go, zaproponowa�em prac�, a on si� zgodzi�. 
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_12"); //Do jasnej cholery! Czemu akurat z futra jakiego� bia�ego wilka?!
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_13"); //O to ju� pytaj Mila. Mo�e chcia� ci� sprawdzi�?
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_14"); //Nie wa�ne. Jak mam ci pom�c? I najwa�niejsze: ile mi za to zap�acisz?
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_15"); //Konkrety. Dobrze. Za robot� dostaniesz 500 bry�ek rudy. Zab�jstwo Magnata to nie byle co.
    AI_Output (other, self ,"DIA_Blade_HELLO1_15_16"); //A co mam robi�? 
    AI_Output (self, other ,"DIA_Blade_HELLO1_03_17"); //Id� do Starego Obozu i zobacz co si� tam dzieje. Potem wr�� jak najszybciej do mnie. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_18"); //Nie ma potrzeby. Mog� ci wszystko opowiedzie� od razu. Stra�nicy na zamku pij� piwo i objadaj� si� pieczonym mi�sem, Magnaci debatuj� w sali Gomeza, Kopacze przesia...
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_19"); //Przesta� si� zgrywa� i ruszaj si�. Musz� wiedzie� jak wygl�da sytuacja. Nie ma czasu. 
    B_LogEntry                     (CH3_ScarMurder,"Mam i�� do Starego Obozu i zobaczy� co si� tam dzieje. Kosa i jego pracownik ju� chyba podj�li jakie� dzia�ania.");
    AI_StopProcessInfos	(self);
	DIA_Blade_HELLO1.permanent = 0;
	dia_blade_avbl = true;
	B_Story_ScarDie ();
	Scar_die = true; 
	}
	else
	{
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_17"); //Nic si� jeszcze nie zacz�o. Czekamy na odpowiedni moment. Przyjd� p�niej. 
	AI_Output (other, self ,"DIA_Blade_HELLO1_15_18"); //Nie rozumiem...
	AI_Output (self, other ,"DIA_Blade_HELLO1_03_19"); //I bardzo dobrze! Na razie nie zaprz�taj sobie tym g�owy.
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
   description	= "By�em w Starym Obozie.";
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
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_01"); //By�em w Starym Obozie.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_02"); //I co si� tam dzieje?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_03"); //Wszystko chyba posz�o zgodnie z planem. Blizna nie �yje, a Stra�nicy szukaj� mordercy.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_04"); //Znale�li go?!
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_05"); //Chyba nie. Przynajmniej tak wynika�o z rozmowy z Thorusem.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_06"); //Nie zjawi� si� na miejscu spotkania. Pewnie ma k�opoty. Musisz mu pom�c.
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_07"); //Dlaczego ja?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_08"); //Je�li go z�api�, mo�e zacz�� sypa�, a wtedy wojn� ze Starym Obozem mam pewn�. Gdyby Lee si� dowiedzia� zabi�by nas od razu.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_09"); //Id� ponownie do Starego Obozu i odszukaj naszego cz�owieka. Razem musicie jako� uciec. 
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_10"); //Jak go poznam?
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_11"); //Nazywa si� Snake. Powiedz mu, �e ja ci� przysy�am. 
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_12"); //Ale je�li si� zdradzisz i powiesz, kt�remu� z ludzi Gomeza, �e to ja ci� przysy�am, b�dziesz musia� po sobie posprz�ta�. Rozumiesz?
    AI_Output (other, self ,"DIA_Blade_BACK_FROM_OC_15_13"); //Tak, nikt ma o niczym nie wiedzie�.
    AI_Output (self, other ,"DIA_Blade_BACK_FROM_OC_03_14"); //Dobrze, �e si� rozumiemy. A teraz id�, bo nie ma czasu do stracenia.
    B_LogEntry                     (CH3_ScarMurder,"Sytuacja nieco wymkn�a si� spod kontroli. Magnat nie �yje, ale to nie znaczy, �e sprawa jest zamkni�ta. Snake, zab�jca, kt�rego wynaj�� Kosa najpewniej zosta� w Starym Obozie i nie mo�e uciec. Musz� mu pom�c, zanim Stra�nicy go z�api� i ca�a akcja p�jdzie na marne. Z poprzedniej rozmowy z Thorusem wiem, �e nasz cz�owiek powinien nosi� zbroje Stra�nik�w. Pewnie to dzi�ki niej jeszcze �yje. ");
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
   description	= "Snake uciek� z obozu.";
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
    AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_01"); //Snake uciek� z obozu.
    if (Snake_help == true)
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_02"); //Wiem, ju� si� z nim rozliczy�em. Bardzo sobie ciebie chwali�. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_03"); //Powiedzia�, �e chce si� z tob� spotka� w Kotle. Czeka tam na ciebie.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_04"); //A oto twoja ruda. Tak jak si� umawiali�my, 500 bry�ek rudy. 
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_05"); //Chcesz przeliczy�?
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_06"); //A powinienem?
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_07"); //Nie. Do zobaczenia.
        B_LogEntry                     (CH3_ScarMurder,"Odebra�em od Kosy nagrod� za pomoc w wykonaniu zadania. Snake chyba te� co� dla mnie ma. Mam si� z nim spotka� w Kotle. Je�li chc� dowiedzie� si� wi�cej o sensie ca�ego tego zadania, powinienem pogada� z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
        B_GiveXP (500);
		CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    }
    else
    {
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_08"); //Rozmawia�em ju� z nim. Nie by� z ciebie zbyt zadowolony. Podobno zebra�o ci si� na oszcz�dzanie Stra�nik�w.
        AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_09"); //S�uchaj, uzna�em, �e �mier� tego cz�owieka b�dzie zb�dna.
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_10"); //Uczestnicz�c w zab�jstwie Magnata powiniene� ka�dego Stra�nika, kt�ry ci� zdemaskowa� uznawa� za wroga...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_11"); //To tak na przysz�o��...
        AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_12"); //Oto twoja ruda. 
        B_LogEntry                     (CH3_ScarMurder,"Odebra�em od Kosy nagrod� za pomoc w wykonaniu zadania. Je�li chc� dowiedzie� si� wi�cej o sensie ca�ego tego zadania, powinienem pogada� z Orikiem.");
		Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
		MIS_ScarMurder = LOG_SUCCESS;
		
        B_GiveXP (500);
        CreateInvItems (self, ItMiNugget, 500);
        B_GiveInvItems (self, other, ItMiNugget, 500);
    };
	AI_Output (other, self ,"DIA_Blade_SNAKESESCAPE_15_13"); //Zaczekaj. Nie powiedzia�e� mi kto za tym wszystkim stoi. Jaki to mia�o sens?
	AI_Output (self, other ,"DIA_Blade_SNAKESESCAPE_03_14"); //Porozmawiaj z Orikiem. By� mo�e ci wszystko wyja�ni, ale nie gwarantuj� tego.
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
    AI_Output (self, other ,"DIA_Blade_DalszePlany2_03_02"); //Teraz nic. Czekamy. Przyjd� tu o p�nocy. Tylko si� nie sp�nij.
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
    AI_Output (self, other ,"DIA_Blade_Next_03_02"); //B�d� cicho. Musisz koniecznie dosta� si� na plac zamkowy.
    AI_Output (self, other ,"DIA_Blade_Next_03_03"); //Gdy ju� b�dziesz na placu, id� w kierunku siedziby Magnat�w. Na pewno zaczepi� ci� Stra�nicy.
    AI_Output (self, other ,"DIA_Blade_Next_03_04"); //Powiedz im, �e chc� si� spotka� z Blizn� w pobli�u kaplicy Innosa. Najlepiej natychmiast.
    AI_Output (self, other ,"DIA_Blade_Next_03_05"); //Wed�ug instrukcji, kt�re otrzyma�em musisz powiedzie�, �e nazywam si� Spike. To chyba jego dawny przyjaciel.
    AI_Output (self, other ,"DIA_Blade_Next_15_06"); //Je�eli Stra�nicy jednak nie b�d� ci� zaczepia�, to id� mu to powiedz osobi�cie.
	AI_Output (self, other ,"DIA_Blade_Next_03_07"); //Id� ju�.
	
	B_LogEntry                     (CH3_ScarMurder,"Mam powiedzie� Bli�nie, �e Stra�nik Spike chce si� z nim spotka� przy kaplicy Innosa.");
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
   description	= "Stra�nicy id� tu razem z Blizn�!";
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
	AI_Output (other, self ,"DIA_Blade_Guardnians_15_01"); //Stra�nicy id� tu razem z Blizn�!
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_02"); //Cholera jasna. Ale spapra�e�! Mia� przyj�� sam!
    AI_Output (other, self ,"DIA_Blade_Guardnians_15_03"); //Co teraz zrobimy? Potrzebny nam plan! Szybko.
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_04"); //Ja musz� zabi� Blizn�. Postaram si� to zrobi� szybko. Mam specjalny miecz.
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_05"); //Ty postaraj si� prze�y�. Wypij szybko t� mikstur�. Zwi�kszy twoj� si��. 
    AI_Output (self, other ,"DIA_Blade_Guardnians_03_06"); //Musimy jako� sobie poradzi�.
    B_LogEntry                     (CH3_ScarMurder,"Cholera... spapra�em spraw�. Blizna idzie w naszym kierunku wraz z dwoma najlepszymi Stra�nikami. Musz� prze�y� i odci�gn�� uwag� Stra�nik�w. Z naciskiem na prze�y�.");

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
    AI_Output (self, other ,"DIA_Blade_Wygrana_03_01"); //Cholera, uda�o nam si�! Spadamy! Ruszaj si�.
    B_LogEntry                     (CH3_ScarMurder,"Uda�o nam si�. Musimy ucieka� z Obozu.");
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
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_01"); //Ju� po wszystkim. 
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_02"); //Dobra robota!
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_03"); //Masz racj�. To by�o co� wyj�tkowego. Orik b�dzie zadowolony.
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_04"); //Orik?
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_05"); //Cholera, wygada�em si�. 
    AI_Output (other, self ,"DIA_Blade_QuestSukces_15_06"); //Wyja�nisz mi to?
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_07"); //Nie, lepiej niech Orik sam ci to powie.
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_08"); //Ja mia�em ci tylko zap�aci� za robot�. Tak jak si� umawiali�my: 1000 bry�ek rudy.
    AI_Output (self, other ,"DIA_Blade_QuestSukces_03_09"); //Uwa�aj przez jaki� czas na Stra�nik�w. Lepiej nie wchod� do obozu.
    CreateInvItems (self, ItMiNugget, 1000);
    B_GiveInvItems (self, other, ItMiNugget, 1000);
    B_LogEntry               (CH3_ScarMurder,"Blizna nie �yje. Okazuje si�, �e za sznurki poci�ga� Orik. Ciekawe co ma do tego Magnata.");
    Log_SetTopicStatus       (CH3_ScarMurder, LOG_SUCCESS);
    MIS_ScarMurder = LOG_SUCCESS;
	czas_ucieczki_scar2 = 300;
    B_GiveXP (XP_ZabojstwoBlizny);
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	Mdl_SetVisualBody (SLD_704_Blade,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_H);
};


