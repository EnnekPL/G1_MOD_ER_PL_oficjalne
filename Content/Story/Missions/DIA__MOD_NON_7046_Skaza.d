// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Skaza46_EXIT(C_INFO)
{
	npc             = NON_7046_Skaza;
	nr              = 999;
	condition	= DIA_Skaza46_EXIT_Condition;
	information	= DIA_Skaza46_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Skaza46_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Skaza46_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Skaza_HELLO1 (C_INFO)
{
   npc          = NON_7046_Skaza;
   nr           = 1;
   condition    = DIA_Skaza_HELLO1_Condition;
   information  = DIA_Skaza_HELLO1_Info;
   permanent	= FALSE;
   description	= "Jestem ze Starego Obozu.";
};

FUNC INT DIA_Skaza_HELLO1_Condition()
{
    if (MIS_Odstraszeni == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Skaza_HELLO1_Info()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_15_01"); //Jestem ze Starego Obozu.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_03_02"); //Dajcie mi wszyscy spok�j!
    AI_Output (other, self ,"DIA_Skaza_HELLO1_15_03"); //Zosta�e� pobity?
    AI_Output (self, other ,"DIA_Skaza_HELLO1_03_04"); //Nie, dosta�em piwo i bochenek chleba na przywitanie.
    AI_Output (self, other ,"DIA_Skaza_HELLO1_03_05"); //Jasne, �e mnie pobili.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_15_06"); //Pos�uchaj, w Starym Obozie nie jest tak �le. Ten go�� to oprych, nie przejmuj si� nim. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_03_07"); //Nie dam si� ju� wi�cej nabra�!
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "Ruszysz dup� do Obozu, albo ci w tym pomog�!", DIA_Skaza_HELLO1_FAILED);
	Info_AddChoice		(DIA_Skaza_HELLO1, "Jak mam poprawi� twoj� opini� o Starym Obozie?", DIA_Skaza_HELLO1_OLDCAMP);
    
};

FUNC VOID DIA_Skaza_HELLO1_FAILED ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_FAILED_15_01"); //Ruszysz dup� do Obozu, albo ci w tym pomog�!
	AI_Output (self, other ,"DIA_Skaza_HELLO1_FAILED_03_02"); //R�wnie dobrze mo�esz mnie zabi�! No, prosz�, zr�b to! Poka� jacy jeste�cie mi�osierni! 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_FAILED_03_03"); //Mam do�� tego przekl�tego miejsca! Sam sobie poradz�!
	//rutyna �e idzie do Obozu Bractwa
	Npc_ExchangeRoutine	(NON_7046_Skaza, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Gro�by wobec nowego skaza�ca nie by�y zbyt dobrym pomys�em. Poszed� w swoj� stron�. Thorus nie b�dzie zadowolony, a ja nie b�d� mia� kogo�, kto potwierdzi, �e za wszystkim stoi Bullit.");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_OLDCAMP ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_OLDCAMP_15_01"); //Jak mam poprawi� twoj� opini� o Starym Obozie?
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_02"); //Najlepiej odpowiedz na moje pytania.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_OLDCAMP_15_03"); //Zamieniam si� w s�uch. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_04"); //No dobrze...
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_05"); //Kim jest cz�owiek, kt�ry mnie pobi�? I co z nim nie tak, �e bije wszystkich wok�? 
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "To Stra�nik Bullit. Nie wiem jak kto� taki zosta� Stra�nikiem...", DIA_Skaza_HELLO1_HATE_BULLIT);
	Info_AddChoice		(DIA_Skaza_HELLO1, "To Bullit i jego powitanie. Radz� ci p�aci� Stra�nikom za ochron�.", DIA_Skaza_HELLO1_PAY_BULLIT);
};

FUNC VOID DIA_Skaza_HELLO1_HATE_BULLIT ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_HATE_BULLIT_15_01"); //To Stra�nik Bullit. Nie wiem jak kto� taki zosta� Stra�nikiem...
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_02"); //Rozumiem, r�ne przypadki si� zdarzaj�. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_HATE_BULLIT_15_03"); //Mog� ci� zapewni�, �e ka�dy inny Stra�nik w Obozie jest wzorowym str�em prawa.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_04"); //Rozwia�e� moje obawy, ale mam te� inne pytanie.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_06"); //Jak wygl�da kwestia awansu w Obozie? W Khorinis by�em szanowanym rzemie�lnikiem. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_07"); //My�l�, �e szybko m�g�bym awansowa�. 
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "W�tpi�, �eby uda�o ci si� wybi�...", DIA_Skaza_HELLO1_MONEY);
	Info_AddChoice		(DIA_Skaza_HELLO1, "W Starym Obozie masz wiele mo�liwo�ci.", DIA_Skaza_HELLO1_MORE);
};

FUNC VOID DIA_Skaza_HELLO1_PAY_BULLIT ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_PAY_BULLIT_15_01"); //To Bullit i jego powitanie. Radz� ci p�aci� reszcie Stra�nik�w za ochron�.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_PAY_BULLIT_03_02"); //Ha ha! Wiedzia�em, �e to co m�wisz to tylko propaganda! Wszyscy w tym zawszonym Obozie s� tacy sami!
	AI_Output (self, other ,"DIA_Skaza_HELLO1_PAY_BULLIT_03_03"); //Poradz� sobie bez was!
	Npc_ExchangeRoutine	(NON_7046_Skaza, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Por�wnywanie wi�kszo�ci Stra�nik�w do Bullita by�o nierozs�dne. Skazaniec postanowi� wybra� inny ob�z. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_MONEY ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_01"); //W�tpi�, �eby uda�o ci si� wybi�, bez odpowiednio zasobnej sakiewki.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_02"); //Posta� Bullita jest �ywym dowodem na to, �e w Starym Obozie dominuje kolesiostwo i przekupstwa. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MONEY_03_03"); //Wiedzia�em, �e ten Ob�z nie jest dla mnie. Spadam st�d!
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_04"); //Zaczekaj! Nie chcia�em ci� zniech�ci�. Po prostu m�wi� jak jest.
	Npc_ExchangeRoutine	(NON_7046_Skaza, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"M�wienie ambitnemu skaza�cowi o braku mo�liwo�ci awansu w Starym Obozie nie by� zbyt rozs�dny. Nie mia�em z�ych ch�ci, ale go�� nie chcia� ju� ze mn� rozmawia�.");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_MORE ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_01"); //W Starym Obozie masz wiele mo�liwo�ci.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_02"); //Zakres obowi�zk�w ka�dego z mieszka�c�w Obozu zale�y od jego umiej�tno�ci i do�wiadczenia. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_03"); //Najlepiej zg�osi� si� do Diego. Po kilku formalno�ciach mo�na zacz�� prac�.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MORE_03_04"); //Brzmi �wietnie! 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MORE_03_05"); //Ostatnia rzecz o jak� ci� prosz�: opowiedz mi co� o przyw�dcach w tym Obozie.
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "Gomez to rozs�dny zarz�dca Obozu.", DIA_Skaza_HELLO1_SMARTGOMEZ);
	Info_AddChoice		(DIA_Skaza_HELLO1, "Gomez stara si� zacie�nia� wsp�prac� z kr�lem za wszelk� cen�.", DIA_Skaza_HELLO1_KING);
};

FUNC VOID DIA_Skaza_HELLO1_SMARTGOMEZ ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_01"); //Gomez to rozs�dny zarz�dca Obozu. Dba o porz�dek i wydajn� prac� w Obozie. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_02"); //Ponadto dzi�ki niemu Stary Ob�z jest najbezpieczniejszym miejscem w Kolonii. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_03"); //Ca�y Zewn�trzny Pier�cie� i zamek s� silnie strze�one, a transporty rudy tak rozplanowane, �e Bandyci nie s� w stanie nic nam zrobi�.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_04"); //Przekona�e� mnie. Udam si� do Starego Obozu. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_05"); //Doskonale. Musisz i�� wzd�u� �cie�ki prowadz�cej z tego miejsca. Okolica jest bezpieczna, wi�c nie musisz si� niczego obawia�. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_06"); //Naprawd� bardzo ci dzi�kuj�. Mog� ci si� jako� odwdzi�czy�?
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_07"); //Jak ju� b�dziesz w Obozie, to z pewno�ci� spotkasz zwierzchnika Stra�nik�w, nazywa si� Thorus. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_08"); //Powiedz mu, �e Bullit ci� pobi�, a ja ci pomog�em. Tego sukinsyna powinna spotka� sprawiedliwo��.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_09"); //Tak zrobi�. 
	Npc_ExchangeRoutine	(NON_7046_Skaza, "camp");
	B_GiveXP (200);
	MIS_Odstraszeni = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_SUCCESS);
    B_LogEntry               (CH1_Odstraszeni,"Uda�o mi si� tak odpowiedzie� na pytania �eby przekona� nowego skaza�ca, �e �ycie w Starym Obozie nie jest takie z�e. By� bardzo zadowolony i od razu poszed� do Obozu. Poprosi�em go �eby wspomnia� Thorusowi o Bullicie. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_KING ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_01"); //Gomez stara si� zacie�nia� wsp�prac� z kr�lem za wszelk� cen�. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_02"); //Najwa�niejsze s� kopalnie i sta�y dop�yw surowca. Reszta nas nie obchodzi. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_03"); //Je�eli Kopacze b�d� wydajnie pracowa�, a Bandyci w ko�cu zostan� wybici do nogi, czeka nas dobrobyt i spokojne �ycie. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_KING_03_04"); //Niezbyt mnie tym przekona�e�. Mo�e �ycie w waszym Obozie nie jest z�e, ale chc� to jeszcze przemy�le�. Do zobaczenia. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_05"); //Zaczekaj chwil�!
	Npc_ExchangeRoutine	(NON_7046_Skaza, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Nie uda�o mi si� przekona� skaza�ca do przy��czenia si� do Starego Obozu. Chyba powiedzia�em co� nie tak. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};