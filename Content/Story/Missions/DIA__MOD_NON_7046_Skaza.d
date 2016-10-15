// *Script was make in Easy Dialog Maker (EDM)
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Skaza46_EXIT(C_INFO)
{
	npc             = NON_7046_Skazaniec;
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
   npc          = NON_7046_Skazaniec;
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
	AI_Output (self, other ,"DIA_Skaza_HELLO1_03_02"); //Dajcie mi wszyscy spokój!
    AI_Output (other, self ,"DIA_Skaza_HELLO1_15_03"); //Zosta³eœ pobity?
    AI_Output (self, other ,"DIA_Skaza_HELLO1_03_04"); //Nie, dosta³em piwo i bochenek chleba na przywitanie.
    AI_Output (self, other ,"DIA_Skaza_HELLO1_03_05"); //Jasne, ¿e mnie pobili.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_15_06"); //Pos³uchaj, w Starym Obozie nie jest tak Ÿle. Ten goœæ to oprych, nie przejmuj siê nim. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_03_07"); //Nie dam siê ju¿ wiêcej nabraæ!
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "Ruszysz dupê do Obozu, albo ci w tym pomogê!", DIA_Skaza_HELLO1_FAILED);
	Info_AddChoice		(DIA_Skaza_HELLO1, "Jak mam poprawiæ twoj¹ opiniê o Starym Obozie?", DIA_Skaza_HELLO1_OLDCAMP);
    
};

FUNC VOID DIA_Skaza_HELLO1_FAILED ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_FAILED_15_01"); //Ruszysz dupê do Obozu, albo ci w tym pomogê!
	AI_Output (self, other ,"DIA_Skaza_HELLO1_FAILED_03_02"); //Równie dobrze mo¿esz mnie zabiæ! No, proszê, zrób to! Poka¿ jacy jesteœcie mi³osierni! 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_FAILED_03_03"); //Mam doœæ tego przeklêtego miejsca! Sam sobie poradzê!
	//rutyna ¿e idzie do Obozu Bractwa
	Npc_ExchangeRoutine	(NON_7046_Skazaniec, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"GroŸby wobec nowego skazañca nie by³y zbyt dobrym pomys³em. Poszed³ w swoj¹ stronê. Thorus nie bêdzie zadowolony, a ja nie bêdê mia³ kogoœ, kto potwierdzi, ¿e za wszystkim stoi Bullit.");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_OLDCAMP ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_OLDCAMP_15_01"); //Jak mam poprawiæ twoj¹ opiniê o Starym Obozie?
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_02"); //Najlepiej odpowiedz na moje pytania.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_OLDCAMP_15_03"); //Zamieniam siê w s³uch. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_04"); //No dobrze...
	AI_Output (self, other ,"DIA_Skaza_HELLO1_OLDCAMP_03_05"); //Kim jest cz³owiek, który mnie pobi³? I co z nim nie tak, ¿e bije wszystkich wokó³? 
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "To Stra¿nik Bullit. Nie wiem jak ktoœ taki zosta³ Stra¿nikiem...", DIA_Skaza_HELLO1_HATE_BULLIT);
	Info_AddChoice		(DIA_Skaza_HELLO1, "To Bullit i jego powitanie. Radzê ci p³aciæ Stra¿nikom za ochronê.", DIA_Skaza_HELLO1_PAY_BULLIT);
};

FUNC VOID DIA_Skaza_HELLO1_HATE_BULLIT ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_HATE_BULLIT_15_01"); //To Stra¿nik Bullit. Nie wiem jak ktoœ taki zosta³ Stra¿nikiem...
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_02"); //Rozumiem, ró¿ne przypadki siê zdarzaj¹. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_HATE_BULLIT_15_03"); //Mogê ciê zapewniæ, ¿e ka¿dy inny Stra¿nik w Obozie jest wzorowym stró¿em prawa.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_04"); //Rozwia³eœ moje obawy, ale mam te¿ inne pytanie.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_06"); //Jak wygl¹da kwestia awansu w Obozie? W Khorinis by³em szanowanym rzemieœlnikiem. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_HATE_BULLIT_03_07"); //Myœlê, ¿e szybko móg³bym awansowaæ. 
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "W¹tpiê, ¿eby uda³o ci siê wybiæ...", DIA_Skaza_HELLO1_MONEY);
	Info_AddChoice		(DIA_Skaza_HELLO1, "W Starym Obozie masz wiele mo¿liwoœci.", DIA_Skaza_HELLO1_MORE);
};

FUNC VOID DIA_Skaza_HELLO1_PAY_BULLIT ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_PAY_BULLIT_15_01"); //To Bullit i jego powitanie. Radzê ci p³aciæ reszcie Stra¿ników za ochronê.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_PAY_BULLIT_03_02"); //Ha ha! Wiedzia³em, ¿e to co mówisz to tylko propaganda! Wszyscy w tym zawszonym Obozie s¹ tacy sami!
	AI_Output (self, other ,"DIA_Skaza_HELLO1_PAY_BULLIT_03_03"); //Poradzê sobie bez was!
	Npc_ExchangeRoutine	(NON_7046_Skazaniec, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Porównywanie wiêkszoœci Stra¿ników do Bullita by³o nierozs¹dne. Skazaniec postanowi³ wybraæ inny obóz. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_MONEY ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_01"); //W¹tpiê, ¿eby uda³o ci siê wybiæ, bez odpowiednio zasobnej sakiewki.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_02"); //Postaæ Bullita jest ¿ywym dowodem na to, ¿e w Starym Obozie dominuje kolesiostwo i przekupstwa. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MONEY_03_03"); //Wiedzia³em, ¿e ten Obóz nie jest dla mnie. Spadam st¹d!
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MONEY_15_04"); //Zaczekaj! Nie chcia³em ciê zniechêciæ. Po prostu mówiê jak jest.
	Npc_ExchangeRoutine	(NON_7046_Skazaniec, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Mówienie ambitnemu skazañcowi o braku mo¿liwoœci awansu w Starym Obozie nie by³ zbyt rozs¹dny. Nie mia³em z³ych chêci, ale goœæ nie chcia³ ju¿ ze mn¹ rozmawiaæ.");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_MORE ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_01"); //W Starym Obozie masz wiele mo¿liwoœci.
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_02"); //Zakres obowi¹zków ka¿dego z mieszkañców Obozu zale¿y od jego umiejêtnoœci i doœwiadczenia. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_MORE_15_03"); //Najlepiej zg³osiæ siê do Diego. Po kilku formalnoœciach mo¿na zacz¹æ pracê.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MORE_03_04"); //Brzmi œwietnie! 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_MORE_03_05"); //Ostatnia rzecz o jak¹ ciê proszê: opowiedz mi coœ o przywódcach w tym Obozie.
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    Info_AddChoice		(DIA_Skaza_HELLO1, "Gomez to rozs¹dny zarz¹dca Obozu.", DIA_Skaza_HELLO1_SMARTGOMEZ);
	Info_AddChoice		(DIA_Skaza_HELLO1, "Gomez stara siê zacieœniaæ wspó³pracê z królem za wszelk¹ cenê.", DIA_Skaza_HELLO1_KING);
};

FUNC VOID DIA_Skaza_HELLO1_SMARTGOMEZ ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_01"); //Gomez to rozs¹dny zarz¹dca Obozu. Dba o porz¹dek i wydajn¹ pracê w Obozie. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_02"); //Ponadto dziêki niemu Stary Obóz jest najbezpieczniejszym miejscem w Kolonii. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_03"); //Ca³y Zewnêtrzny Pierœcieñ i zamek s¹ silnie strze¿one, a transporty rudy tak rozplanowane, ¿e Bandyci nie s¹ w stanie nic nam zrobiæ.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_04"); //Przekona³eœ mnie. Udam siê do Starego Obozu. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_05"); //Doskonale. Musisz iœæ wzd³u¿ œcie¿ki prowadz¹cej z tego miejsca. Okolica jest bezpieczna, wiêc nie musisz siê niczego obawiaæ. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_06"); //Naprawdê bardzo ci dziêkujê. Mogê ci siê jakoœ odwdziêczyæ?
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_07"); //Jak ju¿ bêdziesz w Obozie, to z pewnoœci¹ spotkasz zwierzchnika Stra¿ników, nazywa siê Thorus. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_SMARTGOMEZ_15_08"); //Powiedz mu, ¿e Bullit ciê pobi³, a ja ci pomog³em. Tego sukinsyna powinna spotkaæ sprawiedliwoœæ.
	AI_Output (self, other ,"DIA_Skaza_HELLO1_SMARTGOMEZ_03_09"); //Tak zrobiê. 
	Npc_ExchangeRoutine	(NON_7046_Skazaniec, "camp");
	B_GiveXP (200);
	MIS_Odstraszeni = LOG_SUCCESS;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_SUCCESS);
    B_LogEntry               (CH1_Odstraszeni,"Uda³o mi siê tak odpowiedzieæ na pytania ¿eby przekonaæ nowego skazañca, ¿e ¿ycie w Starym Obozie nie jest takie z³e. By³ bardzo zadowolony i od razu poszed³ do Obozu. Poprosi³em go ¿eby wspomnia³ Thorusowi o Bullicie. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Skaza_HELLO1_KING ()
{
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_01"); //Gomez stara siê zacieœniaæ wspó³pracê z królem za wszelk¹ cenê. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_02"); //Najwa¿niejsze s¹ kopalnie i sta³y dop³yw surowca. Reszta nas nie obchodzi. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_03"); //Je¿eli Kopacze bêd¹ wydajnie pracowaæ, a Bandyci w koñcu zostan¹ wybici do nogi, czeka nas dobrobyt i spokojne ¿ycie. 
	AI_Output (self, other ,"DIA_Skaza_HELLO1_KING_03_04"); //Niezbyt mnie tym przekona³eœ. Mo¿e ¿ycie w waszym Obozie nie jest z³e, ale chcê to jeszcze przemyœleæ. Do zobaczenia. 
	AI_Output (other, self ,"DIA_Skaza_HELLO1_KING_15_05"); //Zaczekaj chwilê!
	Npc_ExchangeRoutine	(NON_7046_Skazaniec, "bractwo");
	MIS_Odstraszeni = LOG_FAILED;
    Log_SetTopicStatus       (CH1_Odstraszeni, LOG_FAILED);
    B_LogEntry               (CH1_Odstraszeni,"Nie uda³o mi siê przekonaæ skazañca do przy³¹czenia siê do Starego Obozu. Chyba powiedzia³em coœ nie tak. ");
	Info_ClearChoices	(DIA_Skaza_HELLO1);
    AI_StopProcessInfos	(self);
};