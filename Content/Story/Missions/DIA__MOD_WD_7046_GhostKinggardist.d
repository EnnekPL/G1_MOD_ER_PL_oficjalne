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
   description	= "Czy ja dobrze widz�? Jeste� duchem?";
};

FUNC INT DIA_GhostKinggardist_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GhostKinggardist_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_01"); //Czy ja dobrze widz�? Jeste� duchem?
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_02"); //Dobrze widzisz, wojowniku. Co ci� tu przygna�o?
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_03"); //Przygoda? Przeznaczenie? Sam nie wiem...
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_04"); //Te� kiedy� by�em wojownikiem, takim jak ty.
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_05"); //Co duch mo�e robi� w takim miejscu? 
    AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_06"); //A co duchy mog� robi�? M�ci� si�, albo czego� szuka�. 
    AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_07"); //A ty, co tu robisz? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_08"); //Szukam... A gdy ju� odnajd�, b�d� m�g� odej�� na zawsze...
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_09"); //Czego szukasz? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_10"); //Mo�e najpierw opowiem ci, jak si� tutaj znalaz�em. Tak b�dzie �atwiej ci zrozumie�. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_11"); //Kilkana�cie lat temu, kiedy Bariera jeszcze nie istnia�a to stra�nicy kr�lewscy dbali o porz�dek w G�rniczej Dolinie.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_12"); //Pilnowali�my wi�ni�w, zarz�dzali�my w obozach i rozbijali�my bandyckie grupy atakuj�ce konwoje. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_13"); //W�a�nie w tym miejscu, w tym, na kt�rym stoimy dosz�o do zaci�tej walki pomi�dzy rabusiami i stra�nikami kr�lewskimi.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_14"); //A ja by�em jednym z nich... 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_15"); //Mam rozumie�, �e nie uda�o ci si� prze�y�? 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_16"); //Nie inaczej. Bandziory wzi�y nas z zaskoczenia. Pojawili si� jakby znik�d. Szli�my tym w�skim w�wozem, gdy nagle wyskoczyli na nas z g�ry.
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_17"); //Bili w g�owy tym co mieli pod r�k�. Ja zgin��em od uderzenia w ty� g�owy m�otem kowalskim. M�j towarzysz zgin�� chwil� wcze�niej uderzony zwyk�ym pogrzebaczem. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_18"); //Nikt nie prze�y�. Zabrali wszystko, co mieli�my przy sobie. W�r�d tych rzeczy znajdowa� si� pewien tobo�ek. Jest w nim co� dla mnie bardzo cennego. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_19"); //Nie odejd� w za�wiaty bez tej rzeczy. 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_20"); //Wiesz, gdzie mo�na jej szuka�?
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_21"); //Nie. Bandyci natychmiast uciekli. W owych czasach niepisanym przyw�dc� bandzior�w atakuj�cych kr�lewsk� stra� by� niejaki Ruben. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_22"); //To jedna z najkrwawszych postaci znanych w tych okolicach. Jego ludzie zabijali i rabowali bez wyrzut�w sumienia. 
	AI_Output (self, other ,"DIA_GhostKinggardist_HELLO1_03_23"); //Podobno mieli swoj� tajn� kryj�wk� gdzie� na skrajach Ziem Ork�w. Szukaj przy jeziorze u podn�y g�r. 
	AI_Output (other, self ,"DIA_GhostKinggardist_HELLO1_15_24"); //My�l�, �e m�wisz o jeziorze znajduj�cym si� przy Nowym Obozie. Rozejrz� si� tam. 
	
	Wld_InsertNpc				(WD_7049_BanditGhost,"GHOST_OLDBANDIT");	
	
	
	MIS_GhostsOldStories = LOG_RUNNING;
	Log_CreateTopic		(Ch1_GhostsOldStories, LOG_MISSION); //fix
	Log_SetTopicStatus   (Ch1_GhostsOldStories, LOG_RUNNING);
    B_LogEntry               (Ch1_GhostsOldStories,"W lasach w okolicy Wie�y Mgie� spotka�em ducha stra�nika kr�lewskiego, kt�ry zosta� zamordowany wraz z cz�onkami swojego oddzia�u przez bandyt�w jeszcze przed powstaniem Bariery. Duch poszukuje pewnego tobo�ka, kt�ry zabra� mu przyw�dca bandyt�w, niejaki Ruben. Je�li go odzyska, uwolni� jego um�czon� dusz�. ");
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
   description	= "Odzyska�em tw�j tobo�ek. ";
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
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_01"); //Odzyska�em tw�j tobo�ek.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_02"); //Uda�o ci si� odnale�� kryj�wk� Rubena? 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_03"); //Tak, z Rubenem r�wnie� mia�em w�tpliw� 'przyjemno��'. 
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_04"); //Jeste� naprawd� wspania�ym wojownikiem. 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_05"); //Oto twoja zguba.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_06"); //Naprawd� dzi�kuj�. Teraz mog� odej��. Gdy nast�pnym razem si� tu zjawisz, ju� mnie tu nie b�dzie.
    AI_Output (self, other ,"DIA_GhostKinggardist_GiveBag_03_07"); //Przyjmij ode mnie ten skromny dar. 
    AI_Output (other, self ,"DIA_GhostKinggardist_GiveBag_15_08"); //Dzi�kuj�, powodzenia w lepszym �wiecie! 


	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+5;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+5;	
	hero.attribute[ATR_HITPOINTS_MAX] 	= hero.attribute[ATR_HITPOINTS_MAX]	+5;	
	PrintS_Ext ("Si�a, Zr�czno�� +1",COL_Lime) ;
	PrintS_Ext ("Mana, punkty �ycia +5",COL_Lime) ;
	B_LogEntry                    	(CH1_GhostsOldStories,"Zwr�ci�em duchowi tobo�ek. Chyba nigdy nie dowiem si� co by�o wewn�trz. Mimo wszystko jestem zadowolony z otrzymanej nagrody. ");
    Log_SetTopicStatus       	(CH1_GhostsOldStories, LOG_SUCCESS);
    MIS_GhostsOldStories = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItMi_GhostsBagSpecial, 1);
    B_GiveXP (1000);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self, "away");
};