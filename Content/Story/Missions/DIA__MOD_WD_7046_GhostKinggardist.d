//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_GhostKinggardist_EXIT(C_INFO)
{
	npc             = WD_7046_GhostKinggardist;
	nr              = 999;
	condition	= DIA_GhostKinggardist_EXIT_Condition;
	information	= DIA_GhostKinggardist_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_GhostKinggardist_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GhostKinggardist_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GhostKinggardist_HELLO1 (C_INFO)
{
   npc          = WD_7046_GhostKinggardist;
   nr           = 1;
   condition    = DIA_GhostKinggardist_HELLO1_Condition;
   information  = DIA_GhostKinggardist_HELLO1_Info;
   permanent	= FALSE;
   description	= "Czy ja dobrze widzê? Jesteœ duchem?";
};

FUNC INT DIA_GhostKinggardist_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GhostKinggardist_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_01"); //Czy ja dobrze widzê? Jesteœ duchem?
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_02"); //Dobrze widzisz, wojowniku. Co ciê tu przygna³o?
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_03"); //Przygoda? Przeznaczenie? Sam nie wiem...
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_04"); //Te¿ kiedyœ by³em wojownikiem, takim jak ty.
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_05"); //Co duch mo¿e robiæ w takim miejscu? 
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_06"); //A co duchy mog¹ robiæ? Mœciæ siê, albo czegoœ szukaæ. 
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_07"); //A ty, co tu robisz? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_08"); //Szukam... A gdy ju¿ odnajdê, bêdê móg³ odejœæ na zawsze...
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_09"); //Czego szukasz? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_10"); //Mo¿e najpierw opowiem ci, jak siê tutaj znalaz³em. Tak bêdzie ³atwiej ci zrozumieæ. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_11"); //Kilkanaœcie lat temu, kiedy Bariera jeszcze nie istnia³a to stra¿nicy królewscy dbali o porz¹dek w Górniczej Dolinie.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_12"); //Pilnowaliœmy wiêŸniów, zarz¹dzaliœmy w obozach i rozbijaliœmy bandyckie grupy atakuj¹ce konwoje. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_13"); //W³aœnie w tym miejscu, w tym, na którym stoimy dosz³o do zaciêtej walki pomiêdzy rabusiami i stra¿nikami królewskimi.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_14"); //A ja by³em jednym z nich... 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_15"); //Mam rozumieæ, ¿e nie uda³o ci siê prze¿yæ? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_16"); //Nie inaczej. Bandziory wziê³y nas z zaskoczenia. Pojawili siê jakby znik¹d. Szliœmy tym w¹skim w¹wozem, gdy nagle wyskoczyli na nas z góry.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_17"); //Bili w g³owy tym co mieli pod rêk¹. Ja zgin¹³em od uderzenia w ty³ g³owy m³otem kowalskim. Mój towarzysz zgin¹³ chwilê wczeœniej uderzony zwyk³ym pogrzebaczem. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_18"); //Nikt nie prze¿y³. Zabrali wszystko, co mieliœmy przy sobie. Wœród tych rzeczy znajdowa³ siê pewien tobo³ek. Jest w nim coœ dla mnie bardzo cennego. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_19"); //Nie odejdê w zaœwiaty bez tej rzeczy. 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_20"); //Wiesz, gdzie mo¿na jej szukaæ?
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_21"); //Nie. Bandyci natychmiast uciekli. W owych czasach niepisanym przywódc¹ bandziorów atakuj¹cych królewsk¹ stra¿ by³ niejaki Ruben. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_22"); //To jedna z najkrwawszych postaci znanych w tych okolicach. Jego ludzie zabijali i rabowali bez wyrzutów sumienia. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_23"); //Podobno mieli swoj¹ tajn¹ kryjówkê gdzieœ na skrajach Ziem Orków. Szukaj przy jeziorze u podnó¿y gór. 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_24"); //Myœlê, ¿e mówisz o jeziorze znajduj¹cym siê przy Nowym Obozie. Rozejrzê siê tam. 
	
	Wld_InsertNpc				(WD_7049_BanditGhost,"GHOST_OLDBANDIT");	
	
	
	MIS_GhostsOldStories = LOG_RUNNING;
	Log_CreateTopic		(Ch1_GhostsOldStories, LOG_MISSION); //fix
	Log_SetTopicStatus   (Ch1_GhostsOldStories, LOG_RUNNING);
    B_LogEntry               (Ch1_GhostsOldStories,"W lasach w okolicy Wie¿y Mgie³ spotka³em ducha stra¿nika królewskiego, który zosta³ zamordowany wraz z cz³onkami swojego oddzia³u przez bandytów jeszcze przed powstaniem Bariery. Duch poszukuje pewnego tobo³ka, który zabra³ mu przywódca bandytów, niejaki Ruben. Jeœli go odzyska, uwolniê jego umêczon¹ duszê. ");
};

//========================================
//-----------------> GiveBag
//========================================

INSTANCE DIA_GhostKinggardist_GiveBag (C_INFO)
{
   npc          		= WD_7046_GhostKinggardist;
   nr           		= 1;
   condition    	= DIA_GhostKinggardist_GiveBag_Condition;
   information  	= DIA_GhostKinggardist_GiveBag_Info;
   permanent	= FALSE;
   description	= "Odzyska³em twój tobo³ek. ";
};

FUNC INT DIA_GhostKinggardist_GiveBag_Condition()
{
    if (MIS_GhostsOldStories == LOG_RUNNING)
    && (Npc_HasItems (other, ItMi_GhostsBagSpecial) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_GhostKinggardist_GiveBag_Info()
{
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_01"); //Odzyska³em twój tobo³ek.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_02"); //Uda³o ci siê odnaleŸæ kryjówkê Rubena? 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_03"); //Tak, z Rubenem równie¿ mia³em w¹tpliw¹ 'przyjemnoœæ'. 
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_04"); //Jesteœ naprawdê wspania³ym wojownikiem. 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_05"); //Oto twoja zguba.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_06"); //Naprawdê dziêkujê. Teraz mogê odejœæ. Gdy nastêpnym razem siê tu zjawisz, ju¿ mnie tu nie bêdzie.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_07"); //Przyjmij ode mnie ten skromny dar. 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_08"); //Dziêkujê, powodzenia w lepszym œwiecie! 


	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+5;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+5;	
	hero.attribute[ATR_HITPOINTS_MAX] 	= hero.attribute[ATR_HITPOINTS_MAX]	+5;	
	PrintS_Ext ("Si³a, Zrêcznoœæ +1",COL_Lime) ;
	PrintS_Ext ("Mana, punkty ¿ycia +5",COL_Lime) ;
	B_LogEntry                    	(CH1_GhostsOldStories,"Zwróci³em duchowi tobo³ek. Chyba nigdy nie dowiem siê co by³o wewn¹trz. Mimo wszystko jestem zadowolony z otrzymanej nagrody. ");
    Log_SetTopicStatus       	(CH1_GhostsOldStories, LOG_SUCCESS);
    MIS_GhostsOldStories = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItMi_GhostsBagSpecial, 1);
    B_GiveXP (1000);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self, "away");
};