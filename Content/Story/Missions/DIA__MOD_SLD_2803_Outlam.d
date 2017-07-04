// **************************************************
//						 EXIT 
// **************************************************

instance  SLD_2803_Outlam_Exit (C_INFO)
{
	npc			= SLD_2803_Outlam;
	nr			= 999;
	condition	= SLD_2803_Outlam_Exit_Condition;
	information	= SLD_2803_Outlam_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  SLD_2803_Outlam_Exit_Condition()
{
	return 1;
};

FUNC VOID  SLD_2803_Outlam_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////////////
// POGADUCHY
//////////////////////////////////////////////////////

// **************************************************
//				Animaltrophies
// **************************************************

instance  SLD_2803_Outlam_Creatures (C_INFO)
{
	npc			= SLD_2803_Outlam;
	nr			= 1;
	condition	= SLD_2803_Outlam_Creatures_Condition;
	information	= SLD_2803_Outlam_Creatures_Info;
	permanent	= 1;
	description = "Skoro jesteœ myœliwym, to pewnie mo¿esz mnie czegoœ nauczyæ.";
};                       

FUNC int  SLD_2803_Outlam_Creatures_Condition()
{
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  SLD_2803_Outlam_Creatures_Info()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_15_00"); //Skoro jesteœ myœliwym, to pewnie mo¿esz mnie czegoœ nauczyæ.
	var int wpis_Outlam;
	if (wpis_Outlam == false)
	{
	wpis_Outlam = 1;
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
    B_LogEntry      (GE_TeacherNC,"Outlam nauczy mnie oprawiaæ zwierzynê. Spotkam po drodze z Nowego Obozu do Kot³a.");
	}
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_01"); //Z pewnoœci¹, ale nie za darmo. 
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_02"); //Wprawny ³owca potrafi zdobyæ k³y, pazury i skórê zwierzyny. Nie jest to ³atwe, ale doœæ op³acalne.
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_06_03"); //Tak czy inaczej ka¿dy kupiec chêtnie je od ciebie odkupi.
		
		Info_ClearChoices(SLD_2803_Outlam_Creatures);
		Info_AddChoice   (SLD_2803_Outlam_Creatures, DIALOG_BACK 													,SLD_2803_Outlam_Creatures_BACK);
		Info_AddChoice   (SLD_2803_Outlam_Creatures, "Du¿o ¿¹dasz za swoje us³ugi." 				,SLD_2803_Outlam_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (SLD_2803_Outlam_Creatures, "Usuwanie k³ów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 		,SLD_2803_Outlam_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "Œci¹ganie futer (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"		,SLD_2803_Outlam_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "Usuwanie pazurów (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)" 	,SLD_2803_Outlam_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (SLD_2803_Outlam_Creatures, "Skórowanie gadów (koszt: 1 punkt umiejêtnoœci, 100 bry³ek rudy)"	,SLD_2803_Outlam_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_TaughtAll_06_00"); //Powiedzia³em ci ju¿ wszystko co wiem.
	};
};

func void SLD_2803_Outlam_Creatures_BACK()
{
	Info_ClearChoices(SLD_2803_Outlam_Creatures);
};

func void SLD_2803_Outlam_Creatures_PrettyMuch()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_PrettyMuch_15_00"); //Du¿o ¿¹dasz za swoje us³ugi.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_01"); //Byæ mo¿e, ale wiedza, któr¹ mogê ci przekazaæ pozwoli ci szybko odzyskaæ zainwestowan¹ kwotê.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_02"); //Wszystkie zwierzêta, które zabijesz nie wiedz¹c jak je oprawiæ, po prostu zgnij¹.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_03"); //A to najzwyklejsze marnotrawstwo. Za ich skórê móg³byœ zarobiæ sporo pieniêdzy.
	AI_Output (self, other,"SLD_2803_Outlam_Creatures_PrettyMuch_06_04"); //Na twoim miejscu spróbowa³bym mo¿liwie szybko posi¹œæ te umiejêtnoœci.
};

func void SLD_2803_Outlam_Creatures_Zahn()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_Zahn_15_00"); //Jak mogê zdobyæ k³y upolowanej zwierzyny?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie k³ów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Zahn_06_01"); //Przede wszystkim musisz uwa¿aæ, ¿eby k³y nie popêka³y podczas wyci¹gania. W tym celu wbij nó¿ w pobli¿u œrodka zêba i delikatnie go podwa¿aj.
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Zahn_06_02"); //Warto zabieraæ k³y wilków, cieniostworów i zêbaczy.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ zdobywania k³ów wilków, orkowych psów, zêbaczy, k¹saczy, ogarów i cieniostworów.");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_00"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_00"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Fell()
{
	AI_Output (other, self,"SLD_2803_Outlam_Creatures_Fell_15_00"); //Jak mogê zdobyæ skóry upolowanej zwierzyny? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiejêtnoœæ: Œci¹ganie futer", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Fell_06_01"); //Zaczynaj skórowanie od zadu, przesuwaj¹c siê stopniowo ku g³owie. Spróbuj kilka razy. To nie jest takie trudne, a futra potrafi¹ byæ bardzo cenne!
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Fell_06_02"); //Futra wilków i cieniostworów mo¿na wykorzystaæ do szycia odzie¿y. Badaj¹c futro zabitego zwierza ³atwo ocenisz, czy nadaje siê do dalszego wykorzystania.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ œci¹gania futer z wilków, orkowych psów, cieniostworów i trolli");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_01"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_01"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			Npc_RemoveInvItems (self, itminugget,50);
			PrintScreen	("Nowa umiejêtnoœæ: Zdobywanie pazurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"SLD_2803_Outlam_Creatures_Kralle_15_00"); //Poka¿ mi jak zdobyæ pazury upolowanej zwierzyny.  
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Kralle_06_01"); //Prawdê mówi¹c to dziecinnie proste, trzeba tylko znaæ odpowiedni¹ metodê. Wygnij pazury do przodu - nigdy do ty³u! I pod ¿adnym pozorem nie próbuj ich wyci¹gaæ!
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Kralle_06_02"); //Najlepiej pozyskiwaæ pazury jaszczurów. Od tej pory bêdziesz wiedzia³, które zwierzêta dostarczaj¹ dobrych pazurów.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ wyci¹gania pazurów jaszczurów, zêbaczy, topielców, k¹saczy i brzytew");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_02"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_02"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

func void SLD_2803_Outlam_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			Npc_RemoveInvItems (self, itminugget,100);
			PrintScreen	("Nowa umiejêtnoœæ: Skórowanie jaszczurów", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"SLD_2803_Outlam_Creatures_Haut_15_00"); //Na co powinienem zwracaæ uwagê zdzieraj¹c skórê z gadów?
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Haut_06_01"); //Skóry topielców i bagiennych wê¿y s¹ szczególnie cenne.
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_Haut_06_02"); //Jeœli przetniesz skórê na bokach, powinna sama odejœæ od miêsa. Myœlê, ¿e od tej pory poradzisz ju¿ sobie ze skórowaniem gadów.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Umiejêtnoœæ skórowania jaszczurów i b³otnych wê¿y");
		}
		else
		{
			AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEINE_LP_06_03"); //Musisz najpierw zdobyæ trochê wiêcej doœwiadczenia. Inaczej moja wiedza bêdzie bezu¿yteczna.
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"SLD_2803_Outlam_Creatures_KEIN_ERZ_06_03"); //Najpierw chcê zobaczyæ trochê rudy. W tej Kolonii nic nie ma za darmo!
	};
};

//////////////////////////////////////////////////////
// ZADANIA
//////////////////////////////////////////////////////

//========================================
//-----------------> CAVALORN_TEST
//========================================

INSTANCE DIA_Outlam_CAVALORN_TEST (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_CAVALORN_TEST_Condition;
   information  = DIA_Outlam_CAVALORN_TEST_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o tym obozie?";
};

FUNC INT DIA_Outlam_CAVALORN_TEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Aidan_SZPIEGOWANIE)) && (MIS_TestOC == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_CAVALORN_TEST_Info()
{
    AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_01"); //Co mo¿esz mi powiedzieæ o tym obozie?
    AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_02"); //Co tu du¿o mówiæ. Polujemy tutaj za zgod¹ Lee.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_03"); //W Nowym Obozie jest zapotrzebowanie na miêso, tym bardziej, ¿e zbli¿a siê zima.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_04"); //Dlatego z grup¹ ch³opaków zamiast siedzieæ przed chat¹ i czekaæ na rozkazy Lee, czy Orika...
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_05"); //...postanowiliœmy wyjœæ z inicjatyw¹ i za³o¿yæ ten obóz.
	AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_06"); //Na co polujecie?
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_07"); //G³ównie na wilki i œcierwojady, czasami te¿ na dziki.
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_08"); //Miêso dostarczamy Silasowi do karczmy na jeziorze.
	AI_Output (other, self ,"DIA_Outlam_CAVALORN_TEST_15_09"); //Kto odpowiada za transport?
	AI_Output (self, other ,"DIA_Outlam_CAVALORN_TEST_03_10"); //Cyrus. Ka¿dego dnia wysy³a kogoœ z miêsem.
	B_LogEntry   (CH1_TestOC,"Od Outlama dowiedzia³em siê co nieco o obozie najemników-myœliwych. Podobno powsta³ niedawno za zgod¹ Lee. Najemnicy nie chcieli siedzieæ bezczynie, wiêc postanowili zaj¹æ siê czymœ po¿ytecznym. Poluj¹ g³ównie na wilki, œcierwojady i dziki. Zdobyte miêso transportowane jest do karczmy na jeziorze.");
};

//========================================
//-----------------> HELLO1
//========================================
INSTANCE DIA_Outlam_HELLO1 (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_HELLO1_Condition;
   information  = DIA_Outlam_HELLO1_Info;
   permanent	= FALSE;
   description	= "Wygl¹dasz na zamyœlonego.";
};

FUNC INT DIA_Outlam_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Outlam_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_01"); //Wygl¹dasz na zamyœlonego.
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_02"); //Bo tak rzeczywiœcie jest.
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_03"); //Nad czym tak rozmyœlasz?
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_04"); //Trzy dni temu spad³ mi na g³owê pamiêtnik. Wiem, ¿e to brzmi dziwnie, ale to prawda.
    AI_Output (other, self ,"DIA_Outlam_HELLO1_15_05"); //Pamiêtnik?
    AI_Output (self, other ,"DIA_Outlam_HELLO1_03_06"); //Nie mam pojêcia sk¹d siê tu wzi¹³. Próbujê rozwik³aæ tê zagadkê.

    MIS_FlyingBook = LOG_RUNNING;

    Log_CreateTopic            (CH1_FlyingBook, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FlyingBook, LOG_RUNNING);
    B_LogEntry                     (CH1_FlyingBook,"Myœliwemu Outlamowi spad³ na g³owê stary pamiêtnik. Zastanawia siê, jak to siê mog³o staæ...");
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Outlam_HELLO2 (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_HELLO2_Condition;
   information  = DIA_Outlam_HELLO2_Info;
   permanent	= FALSE;
   description	= "Daj mi ten pamiêtnik.";
};

FUNC INT DIA_Outlam_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Outlam_HELLO2_15_01"); //Daj mi ten pamiêtnik.
    AI_Output (self, other ,"DIA_Outlam_HELLO2_03_02"); //WeŸ go. Tylko uwa¿aj! Jest bardzo stary.
    CreateInvItems (self, Mis_PamietnikStarca, 1);
    B_GiveInvItems (self, other, Mis_PamietnikStarca, 1);
};
//========================================
//-----------------> Zagadka
//========================================

INSTANCE DIA_Outlam_Zagadka (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_Zagadka_Condition;
   information  = DIA_Outlam_Zagadka_Info;
   permanent	= FALSE;
   description	= "Chyba rozwi¹za³em zagadkê.";
};

FUNC INT DIA_Outlam_Zagadka_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_HELLO2))
    && (Npc_HasItems (other, Mis_KrysztalzKotla) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_Zagadka_Info()
{
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_01"); //Chyba rozwi¹za³em zagadkê.
    AI_Output (self, other ,"DIA_Outlam_Zagadka_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_03"); //W górach znalaz³em szcz¹tki starszego mê¿czyzny. Mia³ przy magiczny kryszta³. Wed³ug pamiêtnika, kilka lat temu ukrad³ go z Kot³a.
    AI_Output (other, self ,"DIA_Outlam_Zagadka_15_04"); //Przypuszczam, ¿e to jego pamiêtnik. Po prostu przywia³ go tu wiatr. 
    AI_Output (self, other ,"DIA_Outlam_Zagadka_03_05"); //W górach ³atwo o wiatr. To co mówisz ma sens. W nagrodê mo¿esz zachowaæ kryszta³.
    B_LogEntry                     (CH1_FlyingBook,"Tajemnica rozwi¹zana. Pamiêtnik nale¿a³ do starca z gór, który przed laty ukrad³ magiczny kryszta³ z Wolnej Kopalni.");
    Log_SetTopicStatus       (CH1_FlyingBook, LOG_SUCCESS);
    MIS_FlyingBook = LOG_SUCCESS;

    B_GiveXP (150);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KOCIOL
//========================================

INSTANCE DIA_Outlam_KOCIOL (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_KOCIOL_Condition;
   information  = DIA_Outlam_KOCIOL_Info;
   permanent	= FALSE;
   description	= "Wiesz coœ na temat dostaw do Kot³a?";
};

FUNC INT DIA_Outlam_KOCIOL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OKYL_WORK_FIND))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_KOCIOL_Info()
{
    AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_01"); //Wiesz coœ na temat dostaw do Kot³a?
    if (Npc_KnowsInfo (hero, DIA_Cyrus_DOSTAWY))
    {
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_02"); //Cyrus kaza³ mi na ciebie uwa¿aæ. Mówi³, ¿e o to spytasz! OdejdŸ.
		
		B_LogEntry         (CH1_Scams,"Cyrus dowiedzia³ siê, ¿e wêszê i namówi³ przeciwko mnie swoich towarzyszy. Nie mam szans na wykonanie tego zadania.");
		Log_SetTopicStatus (CH1_Scams, LOG_FAILED);
		MIS_Scams = LOG_FAILED;
    }
    else
    {
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_03"); //O co ci konkretnie chodzi? Dostawy jak dostawy. Nic szczególnego. Trochê jedzenia, zió³, pochodni.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_04"); //Podobno strasznie siê spóŸniacie z dostarczeniem tych "drobnych" rzeczy do kopalni, pomimo i¿ Okyl kilkakrotnie was upomina³.
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_05"); //Pos³uchaj, ja nie jestem za to odpowiedzialny. Nie chcê mieæ zatargów z Okylem.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_06"); //Bêdziesz mia³, je¿eli nie powiesz mi czegoœ wiêcej.
        AI_Output (self, other ,"DIA_Outlam_KOCIOL_03_07"); //Dobra, dobra. Cyrus spotyka siê z Nowicjuszem, na którego wo³aj¹ Isidro. Nic wiêcej nie wiem.
        AI_Output (other, self ,"DIA_Outlam_KOCIOL_15_08"); //Tyle na razie mi wystarczy.
        B_LogEntry                     (CH1_Scams,"Cyrus spotyka siê z Nowicjuszem imieniem Isidro. Najpewniej maj¹ razem jakieœ interesy.");
    };
    AI_StopProcessInfos	(self);
};

///**********************************************
//*****   OUTLAM - HANDEL
///*****************************************************
//========================================
//-----------------> TRADE_ASK
//========================================

INSTANCE DIA_Outlam_TRADE_ASK (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_TRADE_ASK_Condition;
   information  = DIA_Outlam_TRADE_ASK_Info;
   permanent	= FALSE;
   description	= "Handlujesz? ";
};

FUNC INT DIA_Outlam_TRADE_ASK_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Outlam_TRADE_ASK_Info()
{
    AI_Output (other, self ,"DIA_Outlam_TRADE_ASK_15_01"); //Handlujesz? 
    AI_Output (self, other ,"DIA_Outlam_TRADE_ASK_03_02"); //Jasne. Mogê ci sprzedaæ trochê trofeów. 
Log_CreateTopic (GE_TraderOW,LOG_NOTE);
	B_LogEntry (GE_TraderOW,"Outlam sprzedaje trofea myœliwskie i przydatne przedmioty. Znajdê go w ma³ym przyczó³ku myœliwych za Nowym Obozem.");
};
//========================================
//-----------------> TRADE_DIA
//========================================

INSTANCE DIA_Outlam_TRADE_DIA (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 2;
   condition    = DIA_Outlam_TRADE_DIA_Condition;
   information  = DIA_Outlam_TRADE_DIA_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chcê coœ kupiæ.";
};

FUNC INT DIA_Outlam_TRADE_DIA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Outlam_TRADE_ASK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_TRADE_DIA_Info()
{
    AI_Output (other, self ,"DIA_Outlam_TRADE_DIA_15_01"); //Chcê coœ kupiæ.
    AI_Output (self, other ,"DIA_Outlam_TRADE_DIA_03_02"); //No dawaj. A mo¿e chcesz coœ sprzedaæ?
};

//#####################################################################################
//####### ROZDZIA£ 5
//####### ZASTÊPSTWO DLA GORNA
//#####################################################################################
//========================================
//-----------------> CALL_OF_DUTY
//========================================

INSTANCE DIA_Outlam_CALL_OF_DUTY (C_INFO)
{
   npc          = SLD_2803_Outlam;
   nr           = 1;
   condition    = DIA_Outlam_CALL_OF_DUTY_Condition;
   information  = DIA_Outlam_CALL_OF_DUTY_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Lee. Myœliwi-najemnicy maj¹ zaj¹æ siê obron¹ Wolnej Kopalni.";
};

FUNC INT DIA_Outlam_CALL_OF_DUTY_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Lee_OBRONA_WK))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Outlam_CALL_OF_DUTY_Info()
{
    AI_Output (other, self ,"DIA_Outlam_CALL_OF_DUTY_15_01"); //Przysy³a mnie Lee. Myœliwi-najemnicy maj¹ zaj¹æ siê obron¹ Wolnej Kopalni.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_02"); //No tak, mog³em siê domyœliæ.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_03"); //Nasz obóz znajduje siê na tyle blisko Wolnej Kopalni, ¿e Lee na pewno to wykorzysta.
    AI_Output (self, other ,"DIA_Outlam_CALL_OF_DUTY_03_04"); //Ale skoro taka jest wola szefa, to udamy siê tam.
    AI_Output (other, self ,"DIA_Outlam_CALL_OF_DUTY_15_05"); //Œwietnie.
    B_LogEntry                     (CH5_ObronaWK,"Ludzie Outlama udali siê do Wolnej Kopalni. ");

    B_GiveXP (200);
	//rutyny
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (SLD_2803_Outlam,"FMCstart");
	Npc_ExchangeRoutine (SLD_2805_Najemnik,"FMCstart");
	Npc_ExchangeRoutine (SLD_2802_Soldier,"FMCstart");
};
