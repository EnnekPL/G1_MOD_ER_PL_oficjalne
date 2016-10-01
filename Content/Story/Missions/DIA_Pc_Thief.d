var int Diego_After_Gamestart;
// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
//ScreenFadeEnabled = true;
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Nazywam siê Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Jestem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nie interesuje mnie kim jesteœ. Jesteœ tu nowy - a do mnie nale¿y dbanie o nowych. Na razie to tyle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Jeœli chcesz jeszcze trochê po¿yæ, s³uchaj siê mnie, ale oczywiœcie nie bêdê ci przeszkadza³ w ewentualnej próbie samobójstwa. To jak bêdzie?	
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_11_01"); //Mo¿e mi powiesz jak tutaj trafi³eœ? 
	//SetGhost(PC_THIEF, 60);
	SetGhost(WD_7046_GhostKinggardist, 60);
	//public
	public_str_cost = 1;
	public_dex_cost = 1;
	public_man_cost = 1;
	
	GoToOM = false;
	HeroCanBuy_GRDHARMOR = false;
	AutoHealth = false; //deaful setting
	po_buncie = true;
	HeroKnowsScattyThief = false;
	polowanieON = false;
	szpiegostwoON = false;
	oferta_fiska = false;
	DIA_FindNekSnaf_OFF = true;
	HeroKnowsSlyKillNek = false;
	przypakuj_Gorn = true;
	ItemUsed_FingersSecretBook = false;
	RobotnicyWhistlera = 0;
	PlanA = false;
	PlanB = false;
	PlanC = false;
	bractwoenter = false;
	HeroUseRuneB = false;
	listLearn = false;
	heroKnowsPoszukiwacze = false;
	LicznikExp = false; //wy³¹czony!!
	ruszajBartholo = false;
	przekupionyGRD = true;
	bractwoenter = true;
	OpinionOM = 0;
	przekupionyGRD = false;
	RockyRobiZaDoyle = false;
	PokonanyKharim = false;
	PokonanyPrzezKharim = false;
	PokonanyKirgo = false;
	PokonanyPrzezKirgo = false;
	Calash_gototavern = false; 
	Shrat_gototavern = false;
	
	//czas_ucieczki_scar = 30; to by³ test!
	//zmiennych w chuj :D, no w chuj rzeczywiœcie, VestaX pozdrawia!
	OpiniaOC = 0;
	OpiniaNC = 0;
	OpiniaSC = 0;
	OpiniaBC = 0;
	B_Kapitelwechsel(1); //WICHTIG!!!
	Wld_SendTrigger ("EVT_OW_STARTLOCKOUT_MOVER"); 
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Zosta³em przy³apany na kradzie¿y ³adunku rudy. (+3 zrêcznoœæ)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Mia³em ma³¹ sprzeczkê ze stra¿nikiem królewskim. (+3 si³a)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Królowi nie spodoba³y siê moje pogl¹dy.  (+3 mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Za niewinnoœæ.  (+1 do wszystkich atrybutów)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Dex_15_00"); //Zosta³em przy³apany na kradzie¿y ³adunku rudy.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Dex_15_01"); //Niestety, facet, który mi pomaga³ wyda³ mnie stra¿y i zebra³ ca³¹ nagrodê. 
	//PrintScreen	("Zrêcznoœæ +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintS_Ext ("Zrêcznoœæ + 3",COL_Olive) ;
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Str_15_00"); //Ujmê to tak: jeden z tych królewskich przydupasów mia³ trochê za d³ugi jêzyk.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Str_15_01"); //O wiele za d³ugi. 	
	//PrintScreen	("Si³a +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintS_Ext ("Si³a + 3",COL_Yellow) ;
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	//B_RaiseAttribute	(ATR_STRENGTH,	3);
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Man_15_00"); //Siedzia³em w karczmie i rozmawia³em o Królu i podatkach.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Man_15_01"); //Niestety za póŸno sobie przypomnia³em, ¿e ten kto mówi prawdê powinien mieæ szybkiego konia.
	//PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintS_Ext ("Mana + 3",COL_Blue) ;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	//B_RaiseAttribute	(ATR_MANA_MAX,	3);
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_All_15_00"); //Jestem niewinny!
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_01"); //Warto wiedzieæ jedno: Tutaj nikt nie jest niewinny.
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_02"); //Ludzie znajduj¹cy siê tutaj pope³nili niemal wszystkie mo¿liwe przestêpstwa.
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_03"); //Dam ci radê, ca³kowicie za darmo:
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_04"); //Jeœli ktoœ zapyta dlaczego tu jesteœ, powiedz mu, ¿e sprz¹tn¹³eœ kolesia, który zapyta³ dlaczego tu jesteœ.
	//PrintScreen	("Si³a, Zrêcznoœæ i Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	PrintS_Ext ("Si³a, Zrêcznoœæ i Mana +1",COL_Lime) ;
	//B_RaiseAttribute	(ATR_DEXTERITY,	1);
	//B_RaiseAttribute	(ATR_STRENGTH,	1);
	//B_RaiseAttribute	(ATR_MANA_MAX,	1);
	Info_ClearChoices(Info_Diego_Gamestart );


};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Dziêki za pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Jak sobie chcesz. Mi³o by³o ciê poznaæ.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Spotkamy siê w Starym Obozie.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "brama");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //ChodŸmy.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Trzymaj siê.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "Mam list do Arcymistrza Magów Ognia.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Mam list do Arcymistrza Magów Ognia.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Czy¿by...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Jakiœ mag da³ mi go zanim mnie tu wrzucono.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Twoje szczêœcie, ¿e nie mogê siê wiêcej pokazywaæ u magów. Ktoœ inny móg³by ci poder¿n¹æ gard³o za taki list.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //A to dlatego, ¿e magowie hojnie op³acaj¹ swoich kurierów, a wiêkszoœæ z tutejszych ludzi nic nie posiada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Na twoim miejscu trzyma³bym jêzyk za zêbami a¿ do chwili, gdy spotkasz któregoœ z magów. Chocia¿ w¹tpiê, ¿eby ci siê uda³o.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Dlaczego?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Magowie mieszkaj¹ w zamku, w Starym Obozie. Tylko ludzie Gomeza maj¹ tam wstêp.
	
	MIS_Massage = LOG_RUNNING;
	Log_CreateTopic		(CH1_Massage, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Massage, LOG_RUNNING);
    B_LogEntry                (CH1_Massage,"Jeden z Magów Ognia z Khorinis da³ mi list, który mam przekazaæ Arcymistrzowi Magów Ognia w Kolonii. Diego powiedzia³ mi, ¿e magowie mieszkaj¹ w zamku Starego Obozu i tylko ludzie Gomeza mog¹ tam wejœæ. Ostrzeg³ mnie, ¿ebym nikomu nie wspomina³ o liœcie, gdy¿ ka¿dy ze skazañców chcia³by otrzymaæ za niego nagrodê.");
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Dlaczego mi pomog³eœ?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Dlaczego mi pomog³eœ?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Bo potrzebowa³eœ pomocy. Gdyby nie ja, Bullit i jego ch³opcy mogliby ciê wykoñczyæ.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A ja jestem zbyt mi³y, ¿eby siê temu spokojnie przygl¹daæ. W koñcu przeby³em ca³¹ tê drogê po to, by z³o¿yæ ci propozycjê.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Propozycjê...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Tak. Po tym zajœciu z Bullitem i jego ludŸmi powinieneœ siê domyœliæ, ¿e przyda ci siê ochrona.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Ka¿dy, kto tu trafia ma wybór. W Kolonii s¹ trzy obozy i w koñcu bêdziesz musia³ do któregoœ do³¹czyæ.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jestem tu, by udowodniæ wszystkim nowym, ¿e najlepszym miejscem dla nich bêdzie Stary Obóz.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "A gdzie jest teraz Bullit?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //A gdzie jest teraz Bullit?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //On i pozostali przenosz¹ towary z zewn¹trz do Obozu. Tam go znajdziesz.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ale jeœli chcesz z nim walczyæ, radzê ci uwa¿aæ. To doœwiadczony wojownik.
	 Log_CreateTopic            (CH1_Bulit, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Bulit, LOG_RUNNING);
    B_LogEntry                     (CH1_Bulit,"Gdy zrzucono mnie do Kolonii, napad³a na mnie grupa Stra¿ników. Ich przywódca nazywa siê Bullit i przesiaduje w zamku w Starym Obozie. Jak tylko wykombinujê jak tam siê dostaæ, odp³acê siê temu sukinsynowi.");
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Dobra, co powinienem wiedzieæ o tym miejscu?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobra, co powinienem wiedzieæ o tym miejscu?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nazywamy je Koloni¹. Wiesz ju¿, ¿e wydobywamy rudê dla króla.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Có¿, w ka¿dym razie tak robi¹ ludzie ze Starego Obozu.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Wewn¹trz Bariery powsta³y trzy obozy. Najwiêkszy i najstarszy jest tak zwany Stary Obóz.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o Barierze.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Opowiedz mi jeszcze o Barierze.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nie ma za bardzo o czym mówiæ. Jest nie do sforsowania.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //A co siê stanie, jeœli po prostu spróbujê st¹d wyjœæ?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Ostatni, który tego spróbowa³ dotar³ na drug¹ stronê jako trup. Przez to przeklête magiczne pole mo¿na wejœæ, ale ju¿ nigdy siê st¹d nie wydostaniesz.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Jeœli jest st¹d jakieœ wyjœcie - znajdê je.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tak ci spieszno, ¿eby siê st¹d wyrwaæ? Dopiero co tu trafi³eœ!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co z pozosta³ymi obozami?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co z pozosta³ymi obozami?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Te dwa obozy zamieszkuj¹ szaleñcy, którzy próbuj¹ siê st¹d wydostaæ za wszelk¹ cenê.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //W zachodniej czêœci Kolonii znajduje siê Nowy Obóz. Rezyduj¹ tam magowie, którzy myœl¹, ¿e uda siê im wysadziæ Barierê, jak tylko zbior¹ dostatecznie du¿o rudy.	
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //No i s¹ jeszcze œwiry z Sekty, na wschodzie. Ich obóz znajduje siê na œrodku bagna. Oni z kolei czekaj¹ a¿ ich bóstwo pomo¿e im siê st¹d wydostaæ.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Wygl¹da na to, ¿e jeszcze trochê poczekaj¹.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Na twoim miejscu nie traci³bym czasu na zadawanie siê z szaleñcami.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_06"); //Gdzieœ w górach swój Obóz maj¹ Bandyci. Band¹ rz¹dzi Quentin. Nasze obozy niezbyt siê lubi¹. Je¿eli do nich do³¹czysz, bêdziesz musia³ siê z tym liczyæ. 

};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Opowiedz mi o Starym Obozie.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Opowiedz mi o Starym Obozie.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //To najwiêkszy i najpotê¿niejszy z trzech obozów. Gomez i jego ludzie kontroluj¹ kopalniê, a tym samym - ca³y handel ze Œwiatem Zewnêtrznym.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Raz w miesi¹cu Król przysy³a nam wszystko, czego potrzebujemy. Mamy staruszka w garœci, kapujesz?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Przysy³a nam broñ, chleb, miêso... wszystko.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ty te¿ mo¿esz mieæ w tym udzia³. Musisz tylko do³¹czyæ do ludzi Gomeza.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Kim jest Gomez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Kim jest Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez jest najpotê¿niejszym z Magnatów kieruj¹cych handlem rud¹. To on rz¹dzi w Starym Obozie i ma najwiêcej do powiedzenia w ca³ej Kolonii.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Za³ó¿my, ¿e chcia³bym do³¹czyæ do jego ludzi. Co powinienem zrobiæ?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Za³ó¿my, ¿e chcia³bym do³¹czyæ do jego ludzi. Co powinienem zrobiæ?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Przy bramie do zamku znajdziesz cz³owieka imieniem Thorus. Powiedz mu, ¿e Diego ciê przys³a³.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC, "Aby zostaæ przyjêtym w poczet ludzi Gomeza, muszê najpierw porozmawiaæ z Thorusem.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Jak dostanê siê do Starego Obozu?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak dostanê siê do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Pod¹¿aj t¹ œcie¿k¹. Stary Obóz to najbli¿sze, mniej wiêcej bezpieczne miejsce jakie napotkasz po drodze.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Pomiêdzy obozami krêci siê wiele groŸnych zwierz¹t. Radzi³bym ci postaraæ siê o jak¹œ broñ.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "Gdzie mogê znaleŸæ orê¿?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Gdzie mogê znaleŸæ orê¿?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Rozejrzyj siê trochê w pobli¿u Opuszczonej Kopalni. Na pewno znajdziesz tam coœ przydatnego.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Kopalniê nie trudno znaleŸæ. Le¿y parê metrów w dó³ kanionu.
};

instance TRIA_BramaPlac (C_INFO)
{
    npc         = PC_THIEF;
    nr          = 10;
    condition   = TRIA_BramaPlac_condition;
    information = TRIA_BramaPlac_info;
    important   = true;
    permanent   = false;
};

func int TRIA_BramaPlac_condition()
{
	if (Npc_GetDistToWP(hero,"OW_PATH_1_16_6")<300)
	{
    return TRUE;
	};
};

func void TRIA_BramaPlac_info()
{
    var c_npc Diego;    	Diego = Hlp_GetNpc(PC_THIEF); // Ihm gehört der Dialog
    //var c_npc Robotnik;   	Robotnik = Hlp_GetNpc(VLK_2004_Robotnik);
    var c_npc Gardist; 		Gardist = Hlp_GetNpc(GRD_254_Orry);
	
    //TRIA_Invite(Robotnik);   // Lade Robotnik in diesen Dialog ein
	TRIA_Invite(Diego);
    TRIA_Invite(Gardist); // Lade Gardist in diesen Dialog ein
    TRIA_Start();         // Starte das Gespräch
    // Der Held und Diego müssen/dürfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Diego (self = Diego, other = Hero)
    TRIA_Next(Diego);

    DIAG_Reset();
	AI_Output (self, other, "TRIA_BramaPlac_0F"); //Zaraz to za³atwiê!
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_00"); //Cholera, ruszaæ siê ch³opaki!

    // Held redet nun mit Robotnik (self = Robotnik, other = Hero)
    //TRIA_Next(Robotnik);
	//DIAG_Reset();

	//AI_GotoNpc(self, other);
    //AI_TurnToNpc(self, Diego);
	
    //AI_Output (self, other, "TRIA_BramaPlac_01"); //Ju¿ siê robi!
	//AI_TurnAway (self,other);
	
    //AI_Output (self, other, "TRIA_BramaPlac_02"); //Ej, tam na górze. Otwieraæ!
	//AI_TurnToNpc (self,other);
    // Held soll sich während des nächsten Satzes verschwörerisch umsehen
   // DIAG("Nervous", 1, 2);

   // AI_Output (other, self, "TRIA_BramaPlac_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Geschäft?

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Gardist (self = Gardist, other = Hero)
    TRIA_Next(Gardist);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (self,PC_THIEF);
    AI_Output (self, other, "TRIA_BramaPlac_04"); //A kogó¿ my tu mamy, toæ to Diego. Myœla³em, ¿e zostaniesz chwilê d³u¿ej, dlatego zamkn¹³em.

    // Held redet nun wieder mit Diego (self = Diego, other = Hero)
    TRIA_Next(Diego);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_05"); //Nie, spodziewa³em siê przesy³ki z zewn¹trz, ale jej nie otrzyma³em. 
	AI_Output (self, other, "TRIA_BramaPlac_06"); //Bullit czêsto siê tu zjawia?

    //AI_TurnToNpc(other, self);

    // Kamerafahrt Ende
    TRIA_Cam("");

    // Diego soll zornig reagieren
	TRIA_Next(Gardist);
	DIAG_Reset();
    DIAG("Angry", 0, 4);
	AI_TurnToNpc (self,PC_THIEF);
    AI_Output (self, other, "TRIA_BramaPlac_07"); //Ta... Co jakiœ czas wpada.

    // Held soll sich jetzt wieder normal bewegen
	TRIA_Next(Diego);
    DIAG_Reset();
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_08"); //Bêdê siê musia³ tym zaj¹æ. No, otwieraj ju¿!
	TRIA_Next(gardist);
    DIAG_Reset();
	AI_TurnToNpc (self,PC_THIEF);
	AI_Output (self, other, "TRIA_BramaPlac_09"); //Robi siê!

    TRIA_Finish(); // und Ende
	
	Npc_ExchangeRoutine	(Diego, "start");
	Npc_ExchangeRoutine	(Gardist, "afterstart");
	Wld_SendUnTrigger ("EVT_OW_STARTLOCKOUT_MOVER"); 
	Wld_SetObjectRoutine (20,00,"EVT_OW_STARTLOCKOUT_MOVER",1);
	Wld_SetObjectRoutine (06,00,"EVT_OW_STARTLOCKOUT_MOVER",0);
	AI_StopProcessInfos (PC_THIEF);
};


// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Rozmawia³em z Thorusem.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Rozmawia³em z Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //I co ci powiedzia³?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Mówi, ¿e bêdê móg³ do³¹czyæ do Starego Obozu, jeœli TY uznasz, ¿e siê nadajê.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Widzê, ¿e czeka mnie dodatkowa robota.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Zaczynamy od razu?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Najpierw powinieneœ dowiedzieæ siê kilku rzeczy.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Co powinienem wiedzieæ, zanim zostanê przyjêty do Starego Obozu?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co powinienem wiedzieæ, zanim zostanê przyjêty do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Jeœli chcesz do nas nale¿eæ, musisz najpierw zaplusowaæ u kilku ludzi.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //W Zewnêtrznym Pierœcieniu mo¿esz spotkaæ paru wp³ywowych ludzi, g³ównie Cieni. Jeœli uda ci siê ich do siebie przekonaæ, twoje szanse wzrosn¹.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //PóŸniej czeka ciê test zaufania.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Oprócz tego musisz siê jeszcze wiele nauczyæ. Im wiêcej nowych umiejêtnoœci zdobêdziesz, tym cenniejszy bêdziesz dla nas.
	
	B_LogEntry( CH1_JoinOC, "Zanim zostanê przyjêty, muszê zjednaæ sobie kilku wp³ywowych ludzi z Zewnêtrznego Pierœcienia i przejœæ test zaufania.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Gdzie znajdê te wa¿ne osoby?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Gdzie znajdê te wa¿ne osoby?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Có¿, na jednego z nich w³aœnie patrzysz. Poza tym, jest jeszcze Thorus, jego ju¿ znasz.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co do pozosta³ych... sam musisz ich rozpoznaæ. Jeœli nie jesteœ w stanie tego zrobiæ, to i tak nie masz tu czego szukaæ.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Najlepiej przejdŸ siê po Zewnêtrznym Pierœcieniu i porozmawiaj z ludŸmi.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Kto mo¿e mnie czegoœ nauczyæ?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kto mo¿e mnie czegoœ nauczyæ?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Zacznij od R¹czki. To najzrêczniejszy cz³owiek w Obozie.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Miej oczy szeroko otwarte, a na pewno znajdziesz wielu ludzi, którzy zechc¹ ciê czegoœ nauczyæ.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Gdzie znajdê R¹czkê?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jego chata stoi nieco na uboczu, zaraz przy murach zamku. Id¹c st¹d udaj siê w stronê areny.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Przy zamkowej bramie pójdŸ w lewo. To w³aœnie droga do areny.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"R¹czka mo¿e mnie nauczyæ otwierania zamków i kradzie¿y kieszonkowej. Jego chata znajduje siê nieco na uboczu, niedaleko areny.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"Diego mo¿e mi pomóc w zwiêkszeniu mojej zwinnoœci i si³y.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Tak. Mogê ci pokazaæ, jak zwiêkszyæ swoj¹ si³ê lub zrêcznoœæ.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Jesteœ teraz o wiele silniejszy.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos³ugiwaæ siê ³ukiem i kusz¹.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Wróæ nied³ugo. Musisz siê jeszcze wiele nauczyæ.
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 1);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	Mod_KupAtrybut (hero, ATR_STRENGTH, 5);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 1);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	Mod_KupAtrybut (hero, ATR_DEXTERITY, 5);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************



// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Na czym polega test zaufania?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) ) && ((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK) || (Npc_GetTrueGuild (hero) == GIL_SFB) || (Npc_GetTrueGuild (hero) == GIL_STT) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Na czym polega test zaufania?
	/*if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_07"); //Wybra³eœ Gamala jako swojego opiekuna. Nie mogê opowiedzieæ ci o teœcie zaufania. Rób to, co ci kazano.
	Diego_BringList = LOG_FAILED;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_FAILED);
    B_LogEntry    		(CH1_BringList,"Diego powiedzia³, ¿e nie mogê wykonaæ testu zaufania, poniewa¿ obra³em Gamala jako swojego opiekuna. Muszê kroczyæ dalej œcie¿k¹, któr¹ obra³em.");
	}
	else if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_08"); //Po obozie chodz¹ s³uchy, ¿e widziano ciê z Bandytami. Wybacz, ale nie mogê ci zaufaæ. Szukaj swojego miejsca gdzieœ indziej.
	Diego_BringList = LOG_FAILED;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_FAILED);
    B_LogEntry    		(CH1_BringList,"Diego powiedzia³, ¿e nie mogê wykonaæ testu zaufania, poniewa¿ widziano mnie z Bandytami. Lepiej skupiê siê na zadaniach przez nich zlecanych, a nie bêdê próbowa³ mieszaæ siê w sprawy Starego Obozu.");
	}
	else
	{*/
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Bêdziesz siê musia³ wybraæ do Starej Kopalni. Tam znajdziesz faceta imieniem Ian. Od niego dostaniesz listê.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //To bardzo wa¿ny dokument. Zawiera spis wszystkich rzeczy, których potrzebuj¹ od nas ludzie z kopalni.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Postaramy siê, ¿eby dostarczono je z nastêpnym konwojem.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //¯aden problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //W³aœnie ¿e jest problem. Ta lista nie mo¿e wpaœæ w rêce ludzi z Nowego Obozu!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak ju¿ powiedzia³em: to bardzo wa¿na lista. Jeœli nie zawalisz - daleko tu zajdziesz.
	//er 1.4.5 - Lorenzo i przepustka
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_09"); //Jakiœ czas temu zmieni³y siê zasady wstêpu do Kopalni. Stra¿nik Artegor przepuszcza tylko Kopaczy i ludzi, którzy posiadaj¹ przepustkê. 
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_10"); //Gdzie tak¹ dostanê?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_11"); //Poproœ o ni¹ Lorenzo. To on organizuje zmiany w Kopalni i decyduje, kto tam trafia. Powiedz mu, ¿e masz ode mnie zadanie i ma ci wypisaæ przepustkê.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_12"); //Jego chata stoi tu¿ obok mojej. 
	
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_RUNNING);
    B_LogEntry    		(CH1_BringList,"Diego wys³a³ mnie do Starej Kopalni. Tam, od cz³owieka imieniem Ian, dostanê bardzo wa¿n¹ listê, która pod ¿adnym pozorem nie mo¿e wpaœæ w ³apy ludzi z Nowego Obozu. Zanim jednak siê tam udam, muszê zdobyæ przepustkê od Lorenzo.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
	//};
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Sk¹d pewnoœæ, ¿e Ian wyda j¹ komuœ takiemu jak JA?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if  (Diego_BringList == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Skoro ta lista jest taka wa¿na, sk¹d pewnoœæ, ¿e Ian wyda j¹ komuœ takiemu jak JA?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Bo powiesz mu, ¿e przys³a³ ciê Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Tak zrobiê.
	//AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_04"); //A tak poza tym do 
	
	B_LogEntry    (CH1_BringList,"Ian da mi listê, jeœli powiem mu, ¿e przysy³a mnie Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Gdzie znajdê Star¹ Kopalniê?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Gdzie znajdê Star¹ Kopalniê?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Porozmawiaj z Grahamem, to nasz kartograf. Powiedz mu, ¿e ja ciê przysy³am, i ¿e potrzebujesz mapy. Z niej dowiesz siê, gdzie le¿y kopalnia.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Graham mieszka na lewo od pó³nocnej bramy.
	
	B_LogEntry    (CH1_BringList,"Od Grahama dostanê mapê. Znajdê go na lewo od pó³nocnej bramy.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Mam listê od Iana.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Mam listê od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego bardzo siê ucieszy³, gdy wrêczy³em mu listê Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego ucieszy³ siê, gdy wrêczy³em mu listê od Iana. Chyba nie zauwa¿y³, ¿e Lares doda³ kilka rzeczy od siebie. A mo¿e rzeczywiœcie widzia³em dziwny b³ysk w jego oku?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobra robota! Zaczynasz mi siê naprawdê podobaæ!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Jak tam z moj¹ opini¹ w Obozie?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	(Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	((Npc_GetTrueGuild (hero) == GIL_NONE) || (Npc_GetTrueGuild (hero) == GIL_VLK))
	//&&	(!Npc_KnowsInfo(hero,DIA_PC_Thief_DIALOG ) )
	&&	(oldHeroGuild == 0)) || (talk_aboutOpinion_OC == true) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Jak tam z moj¹ opini¹ w Obozie?
	/*if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output(self, hero,"Info_Diego_JoinAnalyzeRefuse_11_01"); //Obra³eœ Gamala jako swojego opiekuna. Wykonuj polecenia zlecane ci przez TWOICH prze³o¿onych. Ja ju¿ do nich nie nale¿ê.
				
	Log_SetTopicStatus(CH1_JoinOC, LOG_FAILED);
	B_LogEntry(CH1_JoinOC, "Diego powiedzia³ mi, ¿ebym wykonywa³ polecenia swoich prze³o¿onych. Przyjmuj¹c propozycjê Gamala odrzuci³em pomoc Diego. Nie mogê wykonywaæ zadañ dla tych dwóch osób naraz.");
	}
	else if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output(self, hero,"Info_Diego_JoinAnalyzeRefuse_11_02"); //Podobno widziano ciê z Bandytami. Przykro mi, ale nie mo¿emy ci ju¿ ufaæ. Thorus by³by wœciek³y, gdybym próbowa³ ci pomóc do³¹czyæ do Obozu.
				
	Log_SetTopicStatus(CH1_JoinOC, LOG_FAILED);
	B_LogEntry(CH1_JoinOC, "Diego powiedzia³ mi, ¿e widziano mnie z Bandytami. Ludzie w Obozie stracili do mnie zaufanie.");
	}
	else
	{*/
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Rozmawia³em z kilkoma ludŸmi...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //I?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS) || (PokonanyKirgo == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty powiedzia³ mi, ¿e pokona³eœ Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED) || (PokonanyPrzezKirgo == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty powiedzia³ mi, ¿e pozwoli³eœ Kirgo spuœciæ sobie baty. Chyba nie jest tob¹ zachwycony.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING) 
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty powiedzia³ mi, ¿e nie mo¿e siê doczekaæ na twoj¹ walkê z Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED) || (PokonanyPrzezKharim == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale by³ pod wra¿eniem twojej œmia³oœci. Nie ka¿dy mia³by odwagê, ¿eby wyzwaæ Kharima. Choæby nawet z nim przegra³.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS) || (PokonanyKharim == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ale by³ pod wielkim wra¿eniem twojej walki z Kharimem. Bez przerwy opowiada jaki to z ciebie wojownik.
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //I nie mo¿e siê doczekaæ, kiedy staniesz do walki z Kharimem.
	};
	// -----------------------------------------------------------
	if (Npc_KnowsInfo(hero,DIA_THORUS_ZDRADA))  
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_04"); //Œwistak jest na ciebie wœciek³y. A ja na niego. Nie spodziewa³em siê, ¿e to on jest sprawc¹ wielkiej kradzie¿y sprzed lat.
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_05"); //Przez tyle lat podejrzewa³em R¹czkê.
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_06"); //Mimo wszystko nieŸle sobie poradzi³eœ. Jestem pod wra¿eniem!
	Points_OC = Points_OC + 5;
	}
	else if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Œwistak opowiedzia³ mi o tej historii z Fiskiem... Có¿, na twoim miejscu wzi¹³bym tê rudê i da³ nogê, ale tak, czy inaczej - Œwistak chyba bardzo ciê polubi³.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Rozmawia³em ze Œwistakiem. Zwia³eœ z jego rud¹, cwaniaku! Muszê przyznaæ, ¿e œmia³oœci ci nie brakuje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Œwistak czeka na swój miecz. Zdecyduj siê wreszcie czy zamierzasz mu go daæ, czy nie. W przeciwnym wypadku mo¿e pomyœleæ, ¿e zwia³eœ z jego rud¹!
	};
	// -----------------------------------------------------------
	if (MIS_TestOC == LOG_SUCCESS)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_01"); //Cavalorn jest pod wra¿eniem tego, ¿e uda³o ci siê zdaæ jego test. Mówi, ¿e potrafisz dzia³aæ dyskretnie.
	}
	else if (MIS_TestOC == LOG_RUNNING)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_02"); //Cavalorn nie mo¿e siê doczekaæ, a¿ ukoñczysz jego test i bêdzie ciê móg³ oceniæ. Lepiej siê pospiesz.
	}
	else
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_03"); //Cavalorn nigdy o tobie nie s³ysza³. Radzi³bym ci z nim pogadaæ. To wa¿ny Cieñ.
	};
	// -----------------------------------------------------------
	if (Npc_KnowsInfo(hero,DIA_THORUS_ICHTROJE))
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_03"); //Donios³eœ na Z³ego Thorusowi. Jestem pod wra¿eniem, ¿e uda³o ci siê znaleŸæ na niego haka. Jednak teraz przyjaŸnisz siê ze Skaz¹. 
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_04"); //To nie dzia³a pozytywnie na twoj¹ reputacjê w Obozie. 
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_05"); //Choæ w sumie Thorus i ja powinniœmy ci byæ w pewnym stopniu wdziêczni...
	Points_OC = Points_OC - 2;
	}
	else if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Z³y powiedzia³ mi, ¿e znalaz³eœ Neka. Wydawa³ siê byæ bardzo zadowolony.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Moim zdaniem Z³y myli siê co do Neka. By³ uci¹¿liwy, to fakt, ale nie wierzê, ¿eby zdezerterowa³ do Nowego Obozu.
	};
	
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		if (MIS_ChestAndPlate != LOG_SUCCESS)
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Mówi³em ci ju¿ o R¹czce! On mo¿e ciê wiele nauczyæ!
		}
		else
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_PlateAndChestFingers2"); //R¹czka jest na ciebie wœciek³y, bo pomog³eœ Kopaczowi Rono. Ci dwaj niezbyt siê lubi¹. 
		Points_OC = Points_OC - 1;
		};
	}
	else if (Fingers_Learnt == LOG_SUCCESS)  
	{
		////Plate And Chest
		if (MIS_ChestAndPlate != LOG_SUCCESS)
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //R¹czka powiedzia³ mi, ¿e trochê siê ju¿ nauczy³eœ, ale uwa¿a, ¿e móg³byœ byæ jeszcze lepszy.
		Points_OC = Points_OC + 3;
		}
		else
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_PlateAndChestFingers"); //R¹czka nieŸle siê na ciebie wœciek³ po tym jak pomog³eœ Kopaczowi Rono. Ci dwaj siê nie lubi¹.
		Points_OC = Points_OC - 1;
		};
		
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Muszê powa¿nie porozmawiaæ z Dexterem. Wykorzystuje ciê do za³atwiania w³asnych porachunków.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Ale jeœli chodzi o nasz test - nie ma ¿adnych przepisów. Jeœli uda ci siê dokonaæ czegoœ TAKIEGO, to bêdzie wielki krok do przodu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Naprawdê uda³o ci siê zdobyæ przepis Kaloma. Dexter jest pod wra¿eniem. Ja zreszt¹ te¿!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Ta sprawa z Mordragiem to nie lada wyzwanie. Niez³y z niego wojownik. Musisz porz¹dnie poæwiczyæ, jeœli chcesz go pokonaæ.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus uwa¿a, ¿e przyda siê nam ktoœ taki jak ty - to dla ciebie niezwykle korzystne.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus dosta³ ataku apopleksji. Zreszt¹ wcale mu siê nie dziwiê. Jak mo¿na A¯ TAK schrzaniæ robotê?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk powiedzia³ mi, ¿e go zaskoczy³eœ. W ka¿dym razie bêdzie po twojej stronie.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk bardzo siê na ciebie wkurzy³. Na twoim miejscu znalaz³bym kogoœ na miejsce Mordraga.
	};
	// ---------------MOD ER SPRAWA MORDRAGA2--------------------------------------------
	if (Npc_KnowsInfo (hero, DIA_STT_315_Sly_Sukces))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_01"); //Z³y powiedzia³, ¿e bardzo mu pomog³eœ oczyœciæ jego imiê. Bardzo ciê zachwala³.
		Points_OC = Points_OC + 10;
	};
	if (Npc_KnowsInfo (hero, DIA_Whistler_Zdrada2))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_02"); //Œwistak powiedzia³ mi, ¿e masz jaja. Uwa¿a, ¿e potrzebujemy takich ludzi.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_03"); //Pozostali Cienie byli pod wra¿eniem. Mieli podobne zdanie jak Œwistak.
		Points_OC = Points_OC + 15;
	};
	/*if (Npc_KnowsInfo (hero, Info_Thorus_Sukces234))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_04"); //Thorus powiedzia³, ¿e chêtnie by ciê zobaczy³ w stroju Stra¿nika.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_05"); //Pozostali Cienie byli pod wra¿eniem. Mieli podobne zdanie jak Œwistak.
		Points_OC = Points_OC + 15;
	};*/
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Uda³o ci siê zjednaæ wystarczaj¹co wiele osób.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Przeszed³eœ równie¿ test zaufania. IdŸ do Thorusa. Ju¿ go o wszystkim powiadomi³em. Pozwoli ci siê spotkaæ z Gomezem.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC, "Diego za³atwi³ mi audiencjê u Gomeza. Teraz muszê jeszcze zamieniæ s³owo z Thorusem. Wkrótce bêdê jednym z ludzi Gomeza!");
			}
			else
			{
				if ( Npc_KnowsInfo (hero,DIA_STT_315_Sly_Sukces) ) && (Npc_KnowsInfo (hero, DIA_Whistler_Zdrada2))
				{
				AI_Output (self, hero,"Info_Diego_Points_11_03"); //Wprawdzie nie przeszed³eœ testu, ale i tak zas³u¿y³eœ sobie na nasze zaufanie.
				Diego_GomezAudience = TRUE;
				} else
				{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ale musisz jeszcze przejœæ test zaufania.
				};
				
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //W sumie - ca³kiem nieŸle jak na ¿ó³todzioba.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Bierz siê do roboty. Przed tob¹ jeszcze daleka droga, jeœli chcesz do czegoœ dojœæ w tym obozie.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
	};
//};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Co mam zrobiæ, kiedy stanê przed Gomezem?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mam zrobiæ, kiedy stanê przed Gomezem?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez podejmuje decyzje na podstawie instynktu. Jeœli spodoba mu siê twoja gêba - pozwoli ci zostaæ.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od tej pory musisz sobie radziæ sam - postaraj siê! Powodzenia!
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Mogê dostaæ tak¹ zbrojê jak twoja?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //A masz doœæ rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Zdob¹dŸ rudê, to dostaniesz zbrojê.
	};
};  

//========================================
//-----------------> GiveParcel
//========================================

INSTANCE DIA_PC_Thief_GiveParcel (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_GiveParcel_Condition;
   information  = DIA_PC_Thief_GiveParcel_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ przesy³kê.";
};

FUNC INT DIA_PC_Thief_GiveParcel_Condition()
{
    if (Npc_HasItems (other, ItMi_DiegoBag) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_GiveParcel_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_01"); //Chyba mam coœ co nale¿y do ciebie.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_03"); //Spójrz. Wspomina³eœ coœ o jakiejœ przesy³ce ze Œwiata Zewnêtrznego.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_04"); //Gdzie to znalaz³eœ?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_05"); //Mia³ to przy sobie Bullit.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_06"); //Chcesz powiedzieæ, ¿e pokona³eœ go w walce?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_07"); //To nieistotne.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_08"); //Jestem pod olbrzymim wra¿eniem! A z tym sukinsynem policzê siê póŸniej.
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_09"); //Mo¿e tak jakaœ nagroda?
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_10"); //Jasne, zas³u¿y³eœ.
    CreateInvItems (self, ItMiNugget, 50);
    B_GiveInvItems (self, other, ItMiNugget, 50);
	B_GiveInvItems (other, self, ItMi_DiegoBag, 1);
    B_GiveXP (150);
};





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej! Myœla³em, ¿e ju¿ nie ¿yjesz!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Parê razy te¿ mi siê tak wydawa³o.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Wiele siê wydarzy³o od naszego ostatniego spotkania. S³ysza³em, ¿e mia³eœ swój wk³ad w wielkie przywo³anie!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Widzê, ¿e jesteœ œwietnie poinformowany.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lepiej ni¿ myœlisz... Teraz szukasz kamienia ogniskuj¹cego?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Tak. Powinien byæ gdzieœ w pobli¿u.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Wiem, gdzie go mo¿na znaleŸæ. Jest tylko jeden problem.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumiem. Czego chcesz?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Widzê, ¿e szybko siê uczysz, ale nie o to mi chodzi³o.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nie? Wiêc có¿ to za problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //O, to ca³e trzy tony problemów!
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //ChodŸmy. Za chwilê sam zobaczysz.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,	"W pobli¿u pó³nocnego kamienia ogniskuj¹cego, niespodziewanie natkn¹³em siê na Diego. Ostrzeg³ mnie, ¿e coœ 'wielkiego' czeka na mnie na koñcu tego kanionu.");
	B_LogEntry		(CH3_TrollCanyon,	"Jakimœ cudem dowiedzia³ siê o moich dzia³aniach w Obozie Bractwa oraz o poszukiwaniach kamienia. Dalej pójdziemy razem.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Po lewej stronie tego kanionu znajdziesz wejœcie do jaskini, która prowadzi do kamienia.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Wszystko jasne. Jednak najpierw musimy siê jakoœ pozbyæ tamtego bydlaka.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Spróbuj znaleŸæ jakiœ jego s³aby punkt albo inny sposób na pokonanie tego trolla.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Œci¹gnê na siebie jego uwagê.

	B_LogEntry		(CH3_TrollCanyon,	"Na naszej drodze stan¹³ ogromny troll. Diego zamierza œci¹gn¹æ na siebie jego uwagê a ja mam znaleŸæ jakiœ s³aby punkt.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To by³o niesamowite. Niez³y jesteœ. Teraz mo¿esz iœæ po kamieñ ogniskuj¹cy.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ja dopilnujê, ¿ebyœmy nie mieli ju¿ wiêcej niemi³ych niespodzianek.

	B_LogEntry		(CH3_TrollCanyon,	"Pokonaliœmy trolla! Teraz mogê zaj¹æ siê ko³owrotem podnosz¹cym kratê przed platform¹ z kamieniem ogniskuj¹cym.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Ko³owrót chyba siê zaci¹³!
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Czekaj, mo¿e uda mi siê go naprawiæ!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //No, teraz powinno dzia³aæ!
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,	"Diego naprawi³ ko³owrót. Teraz nic ju¿ nie stanie mi na drodze.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //IdŸ po kamieñ. Zaczekam na ciebie tutaj!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Widzê, ¿e znalaz³eœ kamieñ! Œwietnie.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Chyba powinienem znowu zajrzeæ do Starego Obozu. Powodzenia!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Nie daj siê zabiæ!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Jeszcze siê zobaczymy.

	B_LogEntry		(CH3_TrollCanyon,	"Mam ju¿ kamieñ ogniskuj¹cy. Teraz pozosta³o tylko przekonaæ parê harpii, ¿e nie zamierzam go prêdko oddawaæ.");
	B_LogEntry		(CH3_TrollCanyon,	"Diego wraca do Starego Obozu. Pewnie siê jeszcze spotkamy...");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Ciii... B¹dŸ cicho!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Czeœæ, Diego. Rozmawia³em ju¿ z Miltenem po przeciwnej stronie Obozu.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dobrze, zatem wiesz ju¿, co siê sta³o.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //A s³ysza³eœ o planowanym ataku na Woln¹ Kopalniê?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Czeœæ, Diego. Co ma znaczyæ ta ca³a zabawa w chowanego?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Nic nie s³ysza³eœ?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //O czym?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //O zawaleniu siê Starej Kopalni, zamordowaniu Magów Ognia i planach ataku na Woln¹ Kopalniê.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //CO?! O czym ty mówisz?!
	};
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	MIS_RozwalaUBnadytow = LOG_RUNNING;
	Log_CreateTopic          (CH1_RozwalaUBnadytow, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
    B_LogEntry               (CH1_RozwalaUBnadytow,"Od Diego dowiedzia³em siê o niepokoj¹cej sytuacji w Kolonii. Zawalenie siê Starej Kopalni, zamordowanie Magów Ognia... To zbyt wiele na moj¹ g³owê. Quentin musi siê jak najszybciej o tym dowiedzieæ.");
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak mog³o dojœæ do zawalenia siê kopalni?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mog³o dojœæ do zawalenia siê kopalni?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z Kopaczy, któremu uda³o siê uratowaæ, powiedzia³, ¿e kopi¹c na najni¿szym poziomie trafili na podziemn¹ rzekê.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kiedy woda wdar³a siê do szybów, popêka³y podpory i runê³a ca³a górna czêœæ.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Tylko garstce ludzi uda³o siê wydostaæ na powierzchniê.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Co siê sta³o z Magami Ognia?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Co siê sta³o z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To d³uga historia.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Napad na Woln¹ Kopalniê?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Napad na Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To d³uga historia.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Opowiadaj...";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Opowiadaj, to nie pierwsza d³uga historia, której musia³em wys³uchaæ.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //No dobra. Na szczêœcie by³em w³aœnie w siedzibie Magnatów, kiedy dotar³y do nich wieœci o zawaleniu siê kopalni.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Kiedy Gomez dowiedzia³ siê o wypadku, oszala³ z wœciek³oœci. Wcale mu siê nie dziwiê - jego autorytet móg³ run¹æ w ka¿dej chwili, razem z kopalni¹.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Jasne. Kto kontroluje rudê, kontroluje ca³¹ Koloniê!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //No w³aœnie. Przecie¿ bez sta³ego nap³ywu rudy, handel ze Œwiatem Zewnêtrznym padnie raz - dwa.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Jeœli Gomez nie znajdzie szybko nowego Ÿród³a dochodu, ludzie przestan¹ go s³uchaæ.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //I dlatego postanowi³ najechaæ Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Có¿, obiektywnie rzecz bior¹c, to jedyna szansa Gomeza na zachowanie w³adzy.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Dwie godziny temu dwa tuziny Stra¿ników wyruszy³y w kierunku Wolnej Kopalni.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "To szaleñstwo! Muszê uprzedziæ Nowy Obóz.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To szaleñstwo! Muszê uprzedziæ Nowy Obóz.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //W takim razie lepiej siê pospiesz! Stra¿nicy s¹ ju¿ pewnie niedaleko Wolnej Kopalni.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Ale przecie¿ nie przedr¹ siê tak ³atwo przez obronne fortyfikacje Nowego Obozu!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Wcale nie musz¹ siê przez nie przedzieraæ. Kilka miesiêcy temu znaleŸliœmy œcie¿kê, która prowadzi przez góry wprost do Wolnej Kopalni. Nikt inny nie wie o jej istnieniu.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Widzia³em Stra¿ników pilnuj¹cych zamkniêtych bram.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Widzia³em Stra¿ników pilnuj¹cych zamkniêtych bram.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Trzymaj siê z dala od nich. Zaatakuj¹ ka¿dego, kto spróbuje dostaæ siê do Obozu.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Obawiaj¹ siê odwetu za napad na Woln¹ Kopalniê.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Ale co sta³o siê z Magami Ognia?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Ale co sta³o siê z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo i jego towarzysze byli jedynymi ludŸmi w obozie, którzy zachowali zimn¹ krew.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zabronili przeprowadzenia ataku i domagali siê pertraktacji z pozosta³ymi obozami.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //ZABRONILI Gomezowi przeprowadzenia ataku na Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //No w³aœnie. Corristo i jego ludzie byli zbyt zadufani w sobie. Gomez przesta³ im ufaæ i kaza³ ich zdradziecko zamordowaæ.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "I co teraz zamierzacie zrobiæ? To znaczy - ty i Milten?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //I co teraz zamierzacie zrobiæ? To znaczy - ty i Milten?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Zostaniemy tu jeszcze przez jakiœ czas. Bêdziemy ostrzegali innych przyjació³, ¿eby nie wpadli w ³apy Stra¿ników.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ale móg³byœ coœ dla nas zrobiæ.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Nie ma sprawy. O co chodzi?";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Nie ma sprawy. O co chodzi?
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //ZnajdŸ Lestera i Gorna. Musz¹ siê dowiedzieæ o tym, co siê tutaj wydarzy³o.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Powiedz im, ¿e spotkamy siê we czwórkê tam gdzie zwykle.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Jeœli znajdê ich przed tob¹, przeka¿ê im ostrze¿enie i wezwanie na spotkanie.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Dziêki, przyjacielu. Widzê, ¿e równy z ciebie goœæ. IdŸ ju¿. Jeszcze siê kiedyœ spotkamy.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_06"); //Ach, by³bym zapomnia³! Przypomnij te¿ Miltenowi. 
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_11_07"); //Jasne.
	MIS_4Friends = false;			
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Wszyscy Magowie Ognia zginêli. Sytuacja wymyka siê spod kontroli. Diego kaza³ mi powiadomiæ Lestera i Gorna, ¿e maj¹ siê spotkaæ z nim i z Miltenem (swoj¹ drog¹ jemu te¿ warto przypomnieæ) w tajemnym miejscu. Chyba nie robi¹ tego pierwszy raz!"); 
};

//#####################################################################################
//####### ROZDZIA£ 2-4
//####### ZADANIA
//#####################################################################################

//========================================
//-----------------> Quest_DeadHand
//========================================

INSTANCE DIA_PC_Thief_Quest_DeadHand (C_INFO)
{
   npc          = PC_Thief;
   nr           = 33;
   condition    = DIA_PC_Thief_Quest_DeadHand_Condition;
   information  = DIA_PC_Thief_Quest_DeadHand_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Thief_Quest_DeadHand_Condition()
{
    if (Kapitel == 2) && ((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_Quest_DeadHand_Info()
{
    AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_01"); //Zaczekaj, mam dla ciebie robotê. 
    AI_Output (other, self ,"DIA_PC_Thief_Quest_DeadHand_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_03"); //Zgin¹³ gdzieœ jeden z moich ludzi. Nazywa³ siê R¹czka. Na pewno go kojarzysz. Znikn¹³ z dnia na dzieñ.
	AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_04"); //Móg³byœ siê tym zaj¹æ? Przydzieli³em do tego zadania tak¿e Dextera. Powinno wam pójœæ sprawnie we dwóch.
    AI_Output (other, self ,"DIA_PC_Thief_Quest_DeadHand_15_05"); //Gdzie go znajdê? 
	AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_06"); //Zapewne jest ju¿ w chacie R¹czki i szuka poszlak. 
    MIS_HandDed = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_329_Dexter,"csi");
	
	//CreateInvItems 	  (STT_331_Fingers, ItMis_FingersSecretBook, 1);
	//R¹czka znika z mapy gry
	
    Log_CreateTopic          (CH1_HandDed, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HandDed, LOG_RUNNING);
    B_LogEntry               (CH1_HandDed,"Diego poprosi³ mnie o zbadanie sprawy tajemniczego znikniêcia R¹czki. Œledztwo mam prowadziæ razem z Dexterem. Znajdê go w chacie R¹czki. Byæ mo¿e znalaz³ ju¿ jakieœ poszlaki.");
	
	var C_NPC reka;
	reka = Hlp_GetNpc(STT_331_Fingers);
	AI_teleport (reka,"GAME_START");
	Npc_ExchangeRoutine (reka,"ded");
};

//========================================
//-----------------> FNGERS_PAST
//========================================

INSTANCE DIA_PC_Thief_FNGERS_PAST (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_FNGERS_PAST_Condition;
   information  = DIA_PC_Thief_FNGERS_PAST_Info;
   permanent	= FALSE;
   description	= "Czy R¹czka mia³ jakichœ wrogów? ";
};

FUNC INT DIA_PC_Thief_FNGERS_PAST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Dexter_CSI_SO))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_FNGERS_PAST_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_01"); //Czy R¹czka mia³ jakichœ wrogów? Szukamy kogoœ, komu mog³oby zale¿eæ na jego œmierci. 
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_02"); //Widzê, ¿e œledztwo zaczê³o siê na dobre.
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_03"); //Có¿, nie s³ysza³em, ¿eby R¹czka mia³ tu jakichœ wrogów. Choæ nie wykluczam, ¿e ktoœ móg³ go wreszcie przy³apaæ.
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_04"); //Przy³apaæ?
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_05"); //W koñcu to z³odziej. A w³aœciwie to mistrz z³odziei.
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_06"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_07"); //R¹czka dzia³a³ w Gildii Z³odziei w Khorinis. To bardzo silna i wp³ywowa organizacja podziemna. Na pewno wielu zaszli za skórê...
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_08"); //Byæ mo¿e ktoœ z nich te¿ trafi³ do Kolonii? 
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_09"); //To bardzo prawdopodobne. Jednak w dalszym ci¹gu to za ma³o, ¿eby cokolwiek ustaliæ. 
	
    B_LogEntry                     (CH1_HandDed,"R¹czka przed wrzuceniem za Barierê dzia³a³ w Gildii Z³odziei w Khorinis. Byæ mo¿e któryœ z jego dawniejszych wrogów równie¿ trafi³ za Barierê. Niestety ta informacja w niczym mi nie pomo¿e. ");
};

//========================================
//-----------------> NoWPyte
//========================================

INSTANCE DIA_PC_Thief_NoWPyte (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_NoWPyte_Condition;
   information  = DIA_PC_Thief_NoWPyte_Info;
   permanent	= FALSE;
   description	= "R¹czka nie ¿yje.";
};

FUNC INT DIA_PC_Thief_NoWPyte_Condition()
{
    if (Npc_KnowsInfo (hero, TRIA_KillFingers)) && (HeroPermitToKillFingers == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_NoWPyte_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_01"); //R¹czka nie ¿yje. Zamordowa³ go jeden ze Szkodników, niejaki Klin. Goœæ wyrównywa³ rachunki z czasów kiedy obaj byli na wolnoœci. 
    AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_02"); //Jak do tego doszed³eœ?
	AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_03"); //Z poszlak znajduj¹cych siê w chacie R¹czki dowiedzia³em siê, ¿e wyruszy³ do Nowego Obozu obrabowaæ karczmê. 
	AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_04"); //Zanim dokona³ kradzie¿y zosta³ rozpoznany przez Szkodnika o którym wspomina³em. Dosz³o miêdzy nimi do szarpaniny, w której nie wzi¹³em udzia³u. 
	AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_04"); //To niezbyt dobra informacje. Niech to pozostanie miêdzy nami. Skoro chata R¹czki jest wolna, mo¿esz siê tam tymczasowo rozgoœciæ.  
    AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_05"); //Dziêki. 
    AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_06"); //Masz tu trochê rudy w nagrodê. 
	
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
	
    B_LogEntry               (CH1_HandDed,"Powiedzia³em Diego o œmierci R¹czki. Mam nie wspominaæ nikomu tego o czym siê dowiedzia³em.");
    Log_SetTopicStatus       (CH1_HandDed, LOG_SUCCESS);
    MIS_HandDed = LOG_SUCCESS;

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (STT_329_Dexter,"start");
};

//========================================
//-----------------> FingersStayAlive
//========================================

INSTANCE DIA_PC_Thief_FingersStayAlive (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_FingersStayAlive_Condition;
   information  = DIA_PC_Thief_FingersStayAlive_Info;
   permanent	= FALSE;
   description	= "R¹czka wróci³ do Obozu.";
};

FUNC INT DIA_PC_Thief_FingersStayAlive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Fingers_FingersStayAlive)) && (MIS_HandDed == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_FingersStayAlive_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_01"); //R¹czka wróci³ do Obozu.
    AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_02"); //A gdzie siê podziewa³?
	AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_03"); //Spotka³em go w Nowym Obozie. Wpad³ w ma³e tarapaty, ale pomog³em mu siê z nich wykaraskaæ. 
	AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_04"); //Mo¿esz mi powiedzieæ co on tam do cholery robi³?
	AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_05"); //Pocz¹tkowo mia³ tylko okraœæ karczmê, ale przy okazji za³atwi³ te¿ pewn¹ sprawê z przesz³oœci. Najlepiej sam z nim o tym pogadaj. 
	AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_06"); //No dobra, sam siê dowiem. Dobrze siê spisa³eœ. Oto sakiewka z rud¹. 
	
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
	
    B_LogEntry               (CH1_HandDed,"Powiedzia³em Diego o tym, ¿e R¹czka wróci³ do Obozu. W nagrodê otrzyma³em 200 bry³ek rudy i zaskarbi³em sobie szacunek starego Cienia.");
    Log_SetTopicStatus       (CH1_HandDed, LOG_SUCCESS);
    MIS_HandDed = LOG_SUCCESS;

    B_GiveXP (325);
    AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (STT_329_Dexter,"start");
};

//========================================
//-----------------> SprawkaXD
//========================================

INSTANCE DIA_Pc_Thief_SprawkaXD (C_INFO)
{
   npc          = Pc_Thief;
   nr           = 1;
   condition    = DIA_Pc_Thief_SprawkaXD_Condition;
   information  = DIA_Pc_Thief_SprawkaXD_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Pc_Thief_SprawkaXD_Condition()
{
    if (Kapitel == 3)
    && C_NpcBelongsToOldCamp(hero)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pc_Thief_SprawkaXD_Info()
{
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_01"); //Ej! Mam dla ciebie zadanie.
    AI_Output (other, self ,"DIA_Pc_Thief_SprawkaXD_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_03"); //Ju¿ od kilku dni czekam na listê zamówieñ do kopalni.
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_04"); //Jednak pos³aniec nie przychodzi.
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_05"); //Móg³byœ go dla mnie poszukaæ?
    AI_Output (other, self ,"DIA_Pc_Thief_SprawkaXD_15_06"); //Jasne.
    MIS_Search_Poslaniec = LOG_RUNNING;
	CreateInvItem (VLK_507_Buddler, OldMineList2);
	B_ExchangeRoutine (VLK_507_Buddler,"trup");
	B_killnpc (VLK_507_Buddler);
	
    Log_CreateTopic            (CH1_Search_Poslaniec, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Search_Poslaniec, LOG_RUNNING);
    B_LogEntry                     (CH1_Search_Poslaniec,"Diego kaza³ mi odnaleŸæ pos³añca z kopalni. Ma przy sobiê liste zamówieñ na której zale¿y Cieniowi.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ListGive
//========================================

INSTANCE DIA_Pc_Thief_ListGive (C_INFO)
{
   npc          = Pc_Thief;
   nr           = 2;
   condition    = DIA_Pc_Thief_ListGive_Condition;
   information  = DIA_Pc_Thief_ListGive_Info;
   permanent	= FALSE;
   description	= "Mam twoj¹ listê.";
};

FUNC INT DIA_Pc_Thief_ListGive_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pc_Thief_SprawkaXD))
    && (Npc_HasItems (other, OldMineList2) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pc_Thief_ListGive_Info()
{
    AI_Output (other, self ,"DIA_Pc_Thief_ListGive_15_01"); //Mam twoj¹ listê.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_02"); //Poka¿ mi j¹!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_03"); //Wycwanili siê! 
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_04"); //No có¿. W ka¿dym razie dziêkujê.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_05"); //Gdzie by³ ten pos³aniec?
    AI_Output (other, self ,"DIA_Pc_Thief_ListGive_15_06"); //Zosta³ na obiedzie u zêbaczy.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_07"); //Rozumiem. WeŸ tê rudê.
    B_LogEntry                     (CH1_Search_Poslaniec,"Przy ciele pos³añca znalaz³em listê, któr¹ odda³em Diego.");
    Log_SetTopicStatus       (CH1_Search_Poslaniec, LOG_SUCCESS);
    MIS_Search_Poslaniec = LOG_SUCCESS;

    B_GiveXP (300);
    CreateInvItems (self, ItMiNugget, 120);
    B_GiveInvItems (self, other, ItMiNugget, 120);
	B_GiveInvItems (other, self, OldMineList2, 1);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GDZIE_PATROLE
//========================================

INSTANCE DIA_PC_THIEF_GDZIE_PATROLE (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 1;
   condition    = DIA_PC_THIEF_GDZIE_PATROLE_Condition;
   information  = DIA_PC_THIEF_GDZIE_PATROLE_Info;
   permanent	= FALSE;
   description	= "Czy wiesz w jakie miejsca w Kolonii Thorus wysy³a Stra¿ników na patrole?";
};

FUNC INT DIA_PC_THIEF_GDZIE_PATROLE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_DungeonGuard_HELLO3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_GDZIE_PATROLE_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_01"); //Czy wiesz w jakie miejsca w Kolonii Thorus wysy³a Stra¿ników na patrole?
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_02"); //Owszem. Thorus wysy³a swoje patrole najczêœciej w okolice placu wymian, lasu nieopodal Starej Kopalni, przez który transportowane s¹ konwoje oraz w rejony Nowego Obozu i Starej Kopalni. Jak wiesz, Stary Obóz jest w konflikcie z ludŸmi z Nowego Obozu, tak wiêc wysy³a w te okolice szpiegów.
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_03"); //Z tego co mi wiadomo Stra¿nicy nie zapuszczaj¹ siê na ziemie orków oraz w okolice wybrze¿a, gdy¿ s¹ to miejsca doœæ niebezpiecznie. 
    AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_04"); //Dziêkuje. Bardzo mi pomog³eœ.
	AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_05"); //W porz¹dku. Mogê jednak wiedzieæ w co siê znowu wpakowa³eœ?
	AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_06"); //Potrzebujê znaleŸæ jednego ze Stra¿ników, który wyruszy³ na misje nie oddawszy Magnatom klucza do piwnic zamkowych.
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_07"); //S¹dz¹c po twojej zbroi jesteœ jednym z ludzi Laresa. Pewnie pracujesz dla kogoœ w Nowym Obozie. Nie wiem co dok³adnie planujesz, ale b¹dŸ ostro¿ny. 
	B_LogEntry                     (CH1_Magazyny_OC,"Gomez wysy³a swoich ludzi w okolice placu wymian, lasu, nieopodal Starej Kopalni oraz w rejony Nowego Obozu. Tam powinienem szukaæ.");

    B_GiveXP (200);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HANDEL_MAGNAT
//========================================

INSTANCE DIA_PC_THIEF_HANDEL_MAGNAT (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 1;
   condition    = DIA_PC_THIEF_HANDEL_MAGNAT_Condition;
   information  = DIA_PC_THIEF_HANDEL_MAGNAT_Info;
   permanent	= FALSE;
   description	= "Który z Magnatów zajmuje siê handlem ze Œwiatem Zewnêtrznym?";
};

FUNC INT DIA_PC_THIEF_HANDEL_MAGNAT_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gerard_TROFEUM)) && (!Npc_KnowsInfo (hero, DIA_Bartholo_HANDEL_ZEW))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_HANDEL_MAGNAT_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_HANDEL_MAGNAT_15_01"); //Który z Magnatów zajmuje siê handlem ze Œwiatem Zewnêtrznym?
    AI_Output (self, other ,"DIA_PC_THIEF_HANDEL_MAGNAT_03_02"); //Bartholo, jednak Magnaci to zajêci i niecierpliwi ludzie, tak¿e radzê ci uwa¿aæ.
    B_LogEntry                     (CH1_SzponyTopielca,"Za handel ze Œwiatem Zewnêtrznym odpowiada Magnat Bartholo. Powinienem udaæ siê do niego.");
    AI_StopProcessInfos	(self);
};
//#####################################################################################
//####### ROZDZIA£ 5
//####### SPOTKANIE
//#####################################################################################
//========================================
//-----------------> You_Hero
//========================================

INSTANCE DIA_PC_THIEF_You_Hero (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 1;
   condition    = DIA_PC_THIEF_You_Hero_Condition;
   information  = DIA_PC_THIEF_You_Hero_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_THIEF_You_Hero_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ash_PODAREK_LESTER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_You_Hero_Info()
{
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_01"); //A wiêc przyby³eœ na nasze spotkanie!
    AI_Output (other, self ,"DIA_PC_THIEF_You_Hero_15_02"); //Czy¿bym by³ tu nieproszonym goœciem?
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_03"); //Ale¿ sk¹d! Rozmawialiœmy o tobie z Lesterem. Twoje dokonania s¹ naprawdê wspania³e.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_04"); //Od tej pory jesteœ oficjalnie jednym z nas. Mo¿esz na nas liczyæ w ka¿dej sytuacji.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_05"); //Jako znak mojej przyjaŸni chcê ci zaoferowaæ pewien miecz.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_06"); //To miecz mistrzowski, najlepszy z lekkich mieczy, jakie mo¿na zdobyæ w Myrtanie.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_07"); //Aby go u¿ywaæ, musisz byæ bardzo zwinny. Pamiêtaj, ¿e s³u¿ê pomoc¹, jeœli chcesz siê czegoœ nauczyæ.
	AI_Output (other, self ,"DIA_PC_THIEF_You_Hero_15_08"); //Dziêkujê, to wspania³y prezent.
	AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_09"); //Proszê, oto miecz.
    CreateInvItems (self, ItMw_Meisterdegen, 1);
    B_GiveInvItems (self, other, ItMw_Meisterdegen, 1);
	B_LogEntry                     (CH4_4Friends,"Diego podarowa³ mi miecz mistrzowski, najlepsz¹ broñ wymagaj¹c¹ zrêcznoœci, jak¹ kiedykolwiek stworzono w Myrtanie.");
	
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> WSZYSTKO
//========================================

INSTANCE DIA_PC_THIEF_WSZYSTKO (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 1;
   condition    = DIA_PC_THIEF_WSZYSTKO_Condition;
   information  = DIA_PC_THIEF_WSZYSTKO_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_THIEF_WSZYSTKO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_You_Hero))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_WSZYSTKO_Info()
{
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_01"); //Mam nadziejê, ¿e spodoba³y ci siê podarki.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_02"); //Jasne. Na pewno mi siê przydadz¹.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_03"); //Coœ czujê, ¿e spotka nas jeszcze wiele przygód.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_04"); //Co teraz planujecie?
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_05"); //Gorn z pewnoœci¹ zostanie tutaj razem z Lee i innymi Najemnikami. Ci ludzie wol¹ siê trzymaæ razem.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_06"); //Ja pójdê teraz na plac wymian. Mam tam pewn¹ sprawê do za³atwienia w zwi¹zku z moj¹ rud¹.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_07"); //A Milten i Lester pewnie ukryj¹ siê w jakimœ cichym miejscu i bêd¹ czekaæ na rozwój wydarzeñ.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_08"); //Cokolwiek siê stanie, ¿yczê wam powodzenia w waszych dzia³aniach.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_09"); //Ty równie¿ siê trzymaj, ch³opcze. 
    B_GIVEXP (500);
	B_LogEntry			(CH4_4Friends,		"Spotkanie siê odby³o, a ja sta³em siê jego oficjalnym goœciem. Diego, Lester, Milten i Gorn przyjêli mnie do swojego tajemniczego krêgu. To dla mnie wa¿ne prze¿ycie. Czujê, ¿e mogê polegaæ na tych ludziach i nasze drogi jeszcze nie raz siê skrzy¿uj¹. Otrzyma³em wspania³e podarki, które z pewnoœci¹ pomog¹ mi w moich kolejnych przygodach. Teraz ka¿dy musi iœæ w swoj¹ stronê. Tak¿e mnie czekaj¹ nowe wyzywania... "); 
	Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	MIS_4Friends = true;
};

//========================================
//-----------------> CALA_PRAWDA
//========================================

INSTANCE DIA_PC_THIEF_CALA_PRAWDA (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 1;
   condition    = DIA_PC_THIEF_CALA_PRAWDA_Condition;
   information  = DIA_PC_THIEF_CALA_PRAWDA_Info;
   permanent	= FALSE;
   description	= "Zawsze siê tutaj spotykacie?";
};

FUNC INT DIA_PC_THIEF_CALA_PRAWDA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_You_Hero))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_CALA_PRAWDA_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_CALA_PRAWDA_15_01"); //Zawsze siê tutaj spotykacie?
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_02"); //Zazwyczaj tak, choæ s¹ jeszcze inne miejsca. 
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_03"); //Jednak teraz krêci siê w ich pobli¿u zbyt wiele osób. Ca³e to zamieszanie w Kolonii... Wiesz, jak jest.
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_04"); //Tutaj nikt nie zagl¹da. Myœliwi boj¹ siê orków oraz nieumar³ych, którzy ponoæ s¹ w okolicy.
    AI_Output (other, self ,"DIA_PC_THIEF_CALA_PRAWDA_15_05"); //Spokojnie, grota jest pusta. Zajêliœmy siê ni¹ z Miltenem. 
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_06"); //Wiedzia³em, ¿e mo¿na na tobie polegaæ, nawet jeœli nie chcesz pomóc, he he.
};

//========================================
//-----------------> KILL_GOMEZ
//========================================

INSTANCE DIA_PC_THIEF_KILL_GOMEZ (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 2;
   condition    = DIA_PC_THIEF_KILL_GOMEZ_Condition;
   information  = DIA_PC_THIEF_KILL_GOMEZ_Info;
   permanent	= FALSE;
   description	= "Czy mogê ci w czymœ pomóc?";
};

FUNC INT DIA_PC_THIEF_KILL_GOMEZ_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_You_Hero)) && (KAPITEL == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_KILL_GOMEZ_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_01"); //Czy mogê ci w czymœ pomóc?
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_02"); //Owszem. Nie zamierzam odpuœciæ maj¹tku i s³awy.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_03"); //Niestety teraz jestem niepo¿¹dan¹ osob¹ w Starym Obozie i nie mogê dostaæ siê do œrodka.
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_04"); //I co w zwi¹zku z tym?
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_05"); //Sta³eœ siê potê¿ny przyjacielu. ZnajdŸ sposób na dostanie siê do zamku.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_06"); //Gdy to zrobisz, idŸ do siedziby Magnatów i poder¿nij Gomezowi gard³o.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_07"); //Przy okazji wyœlij do Beliara jego przydupasów.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_08"); //Nigdy za nimi jakoœ nie przepada³em.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_09"); //Wierz mi, wszyscy ludzie na tym skorzystaj¹. A z œwiata zostanie usuniêty kolejny tyran.
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_10"); //Skoro tak, to spróbujê.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_11"); //Œwietnie.
    MIS_Upadek_Gomeza = LOG_RUNNING;

    Log_CreateTopic            (CH5_Upadek_Gomeza, LOG_MISSION);
    Log_SetTopicStatus       (CH5_Upadek_Gomeza, LOG_RUNNING);
    B_LogEntry                     (CH5_Upadek_Gomeza,"Diego poprosi³ mnie, abym znalaz³ jakiœ sposób na dostanie siê do zamku w Starym Obozie. Gdy ju¿ mi siê uda, mam poder¿n¹æ gard³o Gomezowi.");
};

//========================================
//-----------------> SZEF_CIENI
//========================================

INSTANCE DIA_PC_THIEF_SZEF_CIENI (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 3;
   condition    = DIA_PC_THIEF_SZEF_CIENI_Condition;
   information  = DIA_PC_THIEF_SZEF_CIENI_Info;
   permanent	= FALSE;
   description	= "W jaki sposób zosta³eœ przywódc¹ Cieni?";
};

FUNC INT DIA_PC_THIEF_SZEF_CIENI_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_You_Hero))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_SZEF_CIENI_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_SZEF_CIENI_15_01"); //W jaki sposób zosta³eœ przywódc¹ Cieni?
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_02"); //W bardzo prosty. Gdy mnie tutaj wrzucono, od razu u¿y³em ca³ego swego sprytu by do³¹czyæ do Starego Obozu.
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_03"); //W doœæ krótkim czasie sta³em siê praw¹ rêk¹ Greva - by³ego przywódcy Cieni.
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_04"); //Po œmierci szefa zaj¹³em jego miejsce. Ludzie bardzo siê cieszyli z tego powodu.
    AI_Output (other, self ,"DIA_PC_THIEF_SZEF_CIENI_15_05"); //Czemu?
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_06"); //Bo Grev nie grzeszy³ przebieg³oœci¹. Kierowa³ siê g³ównie okrucieñstwem, a jego pomys³y by³y szalone.
};

//========================================
//-----------------> ALFONSO
//========================================

INSTANCE DIA_PC_THIEF_ALFONSO (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 4;
   condition    = DIA_PC_THIEF_ALFONSO_Condition;
   information  = DIA_PC_THIEF_ALFONSO_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi wiêcej o Grevu.";
};

FUNC INT DIA_PC_THIEF_ALFONSO_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_SZEF_CIENI))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_ALFONSO_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_ALFONSO_15_01"); //Opowiedz mi wiêcej o Grevu.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_02"); //By³ jednym z przyjació³ samego Gomeza jeszcze z czasów, gdy nie by³o Bariery.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_03"); //Skumali siê pracuj¹c w kopalni, a po wielkim buncie Gomez wyznaczy³ go na przywódcê Cieni.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_04"); //Jego kariera nie trwa³a jednak d³ugo.
    AI_Output (other, self ,"DIA_PC_THIEF_ALFONSO_15_05"); //Dlaczego?
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_06"); //Pewnego razu totalnie mu odbi³o.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_07"); //Postanowi³ przekraœæ siê pod os³on¹ nocy do œwi¹tyni Magów Ognia i poder¿n¹æ we œnie gard³o samemu Xardasowi.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_08"); //Xardas oczywiœcie na to nie pozwoli³. Wœciek³ siê niemi³osiernie.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_09"); //Dorwa³ Greva i nie zawaha³ siê u¿yæ na nim swoich czarów. Huk by³, jakby czarny troll dosta³ rui.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_10"); //NieŸle rozsadzi³o biednego Greva. A w³aœciwe to rozsmarowa³o... Tak, po ca³ym Zewnêtrznym Pierœcieniu. 
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_11"); //Xardas oskar¿y³ o wszystko Thorusa, bo to jego zadaniem by³o pilnowanie porz¹dku.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_12"); //Od tamtej pory Thorus ma na pieñku z magami, mimo ¿e Xardas wkrótce po tym opuœci³ Stary Obóz.
};

//========================================
//-----------------> MINES
//========================================

INSTANCE DIA_PC_THIEF_MINES (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 5;
   condition    = DIA_PC_THIEF_MINES_Condition;
   information  = DIA_PC_THIEF_MINES_Info;
   permanent	= FALSE;
   description	= "Co myœlisz o sytuacji w kopalniach?";
};

FUNC INT DIA_PC_THIEF_MINES_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_PC_THIEF_You_Hero))
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_THIEF_MINES_Info()
{
    AI_Output (other, self ,"DIA_PC_THIEF_MINES_15_01"); //Co myœlisz o sytuacji w kopalniach?
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_02"); //No có¿, nie do koñca wierzê, ¿e Stara Kopalnia zawali³a siê w ca³oœci.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_03"); //Z pewnoœci¹ zawali³o siê tylko wejœcie, a nap³ywaj¹ca do kopalni woda szybko usta³a.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_04"); //Za jakiœ czas pewnie bêdzie mo¿na z powrotem eksploatowaæ z³o¿a w Starej Kopalni.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_05"); //Je¿eli chodzi o Woln¹ Kopalniê, to Gomez nieŸle namiesza³.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_06"); //Nowy Obóz nigdy nie chcia³ zagarn¹æ wiêcej kopalñ poza w³asn¹. Zachowanie Gomeza jest nie w porz¹dku, choæ zrozumia³e.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_07"); //Jeœli chodzi o Opuszczon¹ Kopalniê, to nie wiem zbyt wiele.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_08"); //Podobno Stra¿nicy odkopali wejœcie i szukaj¹ z³ó¿ rudy.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_09"); //Z tego co wiem zainteresowali siê ni¹ te¿ Bandyci Quentina.
};


//#####################################################################################
//####### ROZDZIA£ 1
//####### WEJŒCIE DO OBOZU JAKO BANDYTA
//#####################################################################################
//========================================
//-----------------> BANDYTA_WARN
//========================================

INSTANCE DIA_PC_Thief_BANDYTA_WARN (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_BANDYTA_WARN_Condition;
   information  = DIA_PC_Thief_BANDYTA_WARN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_PC_Thief_BANDYTA_WARN_Condition()
{
	var C_ITEM	armor_bandyty2;			armor_bandyty2 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance_bandyty2;	armorInstance_bandyty2	= Hlp_GetInstanceID		(armor_bandyty2);
	if (armorInstance_bandyty2 == BAU_ARMOR_L) || (armorInstance_bandyty2 == BAU_ARMOR_M) || (armorInstance_bandyty2 == BAU_ARMOR_H)
	&& (Npc_GetTrueGuild(other) == GIL_BAU)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_BANDYTA_WARN_Info()
{
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_01"); //No nieŸle siê wpakowa³eœ! Jesteœ teraz Bandyt¹.
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_WARN_15_02"); //Ciszej, do diab³a!
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_03"); //Pos³uchaj: nie powinno ciê tu byæ. Najlepiej pojawiaj siê w Obozie tylko gdy MUSISZ. Mo¿esz byæ spokojny. 
	AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_04"); //Ja ciê nie wydam, ale Stra¿nicy na pewno zaczn¹ ciê wypytywaæ o pancerz. By³oby dobrze, gdybyœ go zdejmowa³.
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_05"); //Aha, i jak ju¿ ciê ktoœ zapyta to mów, ¿e nie masz przynale¿noœci, albo, ¿e mieszkasz u myœliwych. Cokolwiek byle nie prawdê. I nie próbuj tu wszczynaæ ¿adnych burd.
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_06"); //Stra¿nicy s¹ ciêci na Szkodników i Nowicjuszy, ale Bandytów nienawidz¹ i to cholernie nienawidz¹. B¹dŸ ostro¿ny i pamiêtaj o czym ci mówi³em.
};

// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> BANDYTA_ZAMEK
//========================================

INSTANCE DIA_PC_Thief_BANDYTA_ZAMEK (C_INFO)
{
   npc          = PC_Thief;
   nr           = 1;
   condition    = DIA_PC_Thief_BANDYTA_ZAMEK_Condition;
   information  = DIA_PC_Thief_BANDYTA_ZAMEK_Info;
   permanent	= FALSE;
   description	= "Muszê dostaæ siê do zamku. Mo¿esz mi pomóc?";
};

FUNC INT DIA_PC_Thief_BANDYTA_ZAMEK_Condition()
{
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
    if (Npc_KnowsInfo (hero, DIA_Thorus_BANDYTA_GATE))
	&& (Npc_GetTrueGuild(other) == GIL_BAU)
	&& (wache212.aivar[AIV_PASSGATE] == false) 
	&& (wache213.aivar[AIV_PASSGATE] == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_BANDYTA_ZAMEK_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_ZAMEK_15_01"); //Muszê dostaæ siê do zamku. Mo¿esz mi pomóc?
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_ZAMEK_03_02"); //Jesteœ pewien, ¿e chcesz tam wejœæ? W zamku a¿ roi siê od Stra¿ników.
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_ZAMEK_15_03"); //Mimo wszystko muszê tam wejœæ. Masz jakiœ pomys³ na przekonanie Stra¿ników?
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_ZAMEK_03_04"); //Hmm... Mogê porozmawiaæ z Thorusem, jednak bêdê potrzebowa³ 500 bry³ek rudy na poniesienie ewentualnych kosztów.
	B_LogEntry			(CH1_WejscieDoZamku,"Diego zaproponowa³ mi pomoc. Za 500 bry³ek rudy spróbuje za³atwiæ mi wstêp.");
};

//========================================
//-----------------> BANDYTA_PRZEKUPSTWO_GATE
//========================================

INSTANCE DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE (C_INFO)
{
   npc          = PC_Thief;
   nr           = 2;
   condition    = DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_Condition;
   information  = DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_Info;
   permanent	= FALSE;
   description	= "Oto ruda.";
};

FUNC INT DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_Condition()
{
    if (Npc_HasItems (hero, ItMiNugget)>=500)
	&& (Npc_KnowsInfo (hero, DIA_PC_Thief_BANDYTA_ZAMEK))
	&& (Npc_GetTrueGuild(other) == GIL_BAU) //fix if 1210
    {
    return TRUE;
    };
};


FUNC VOID DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_Info()
{
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_15_01"); //Oto ruda.
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_03_02"); //W porz¹dku. Zajmê siê wszystkim.
	B_giveinvitems (hero,self, ItMiNugget, 500);
	B_LogEntry			(CH1_WejscieDoZamku,"Zap³aci³em Diego. Ciekawe czy uda mu siê coœ wskóraæ.");
};

//#####################################################################################
//####### OPCJE GRY
//####### CONFIG
//#####################################################################################
INSTANCE DIA_PC_THIEF_CONFIG (C_INFO)
{
   npc          = PC_THIEF;
   nr           = 998;
   condition    = DIA_PC_THIEF_CONFIG_Condition;
   information  = DIA_PC_THIEF_CONFIG_Info;
   permanent	= TRUE;
   description	= "(Ustawienia)";
};

FUNC INT DIA_PC_THIEF_CONFIG_Condition()
{
if (kapitel == 10)
{
    return TRUE;
};
};
FUNC VOID DIA_PC_THIEF_CONFIG_Info()
{
    Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wróæ", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "WskaŸnik doœwiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);
};

FUNC VOID DIA_PC_THIEF_CONFIG_BACK()
{
    Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
};

FUNC VOID DIA_PC_THIEF_CONFIG_AUT_HEAL()
{
    if (AutoHealth == true)
    {
        AutoHealth = false;
        PrintScreen	("Wy³¹czono automatyczne leczenie! ", -1,-1,"font_new_10_red.tga",2);
    }
    else
    {
        AutoHealth = true;
         PrintScreen	("W³¹czono automatyczne leczenie! ", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    };
	  Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wróæ", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "WskaŸnik doœwiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);
};

FUNC VOID DIA_PC_THIEF_CONFIG_EXP_INFO()
{
    if (LicznikExp == true)
    {
        LicznikExp = false;
        PrintScreen	("Wy³¹czono wskaŸnik doœwiadczenia! ",-1,-1,"font_new_10_red.tga",2);
    }
    else
    {
        LicznikExp = true;
        PrintScreen	("W³¹czono wskaŸnik doœwiadczenia! ", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    };
  Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wróæ", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "WskaŸnik doœwiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);

};
