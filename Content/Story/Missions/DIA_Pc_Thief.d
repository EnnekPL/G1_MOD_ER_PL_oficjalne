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
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Nazywam si� Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Jestem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nie interesuje mnie kim jeste�. Jeste� tu nowy - a do mnie nale�y dbanie o nowych. Na razie to tyle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Je�li chcesz jeszcze troch� po�y�, s�uchaj si� mnie, ale oczywi�cie nie b�d� ci przeszkadza� w ewentualnej pr�bie samob�jstwa. To jak b�dzie?	
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_11_01"); //Mo�e mi powiesz jak tutaj trafi�e�? 
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
	LicznikExp = false; //wy��czony!!
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
	
	//czas_ucieczki_scar = 30; to by� test!
	//zmiennych w chuj :D, no w chuj rzeczywi�cie, VestaX pozdrawia!
	OpiniaOC = 0;
	OpiniaNC = 0;
	OpiniaSC = 0;
	OpiniaBC = 0;
	B_Kapitelwechsel(1); //WICHTIG!!!
	Wld_SendTrigger ("EVT_OW_STARTLOCKOUT_MOVER"); 
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Zosta�em przy�apany na kradzie�y �adunku rudy. (+3 zr�czno��)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Mia�em ma�� sprzeczk� ze stra�nikiem kr�lewskim. (+3 si�a)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Kr�lowi nie spodoba�y si� moje pogl�dy.  (+3 mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Za niewinno��.  (+1 do wszystkich atrybut�w)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Dex_15_00"); //Zosta�em przy�apany na kradzie�y �adunku rudy.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Dex_15_01"); //Niestety, facet, kt�ry mi pomaga� wyda� mnie stra�y i zebra� ca�� nagrod�. 
	//PrintScreen	("Zr�czno�� +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintS_Ext ("Zr�czno�� + 3",COL_Olive) ;
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Str_15_00"); //Ujm� to tak: jeden z tych kr�lewskich przydupas�w mia� troch� za d�ugi j�zyk.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Str_15_01"); //O wiele za d�ugi. 	
	//PrintScreen	("Si�a +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	PrintS_Ext ("Si�a + 3",COL_Yellow) ;
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	//B_RaiseAttribute	(ATR_STRENGTH,	3);
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Man_15_00"); //Siedzia�em w karczmie i rozmawia�em o Kr�lu i podatkach.
	AI_Output(hero,self,"CM_Info_Diego_Gamestart_Choice_Man_15_01"); //Niestety za p�no sobie przypomnia�em, �e ten kto m�wi prawd� powinien mie� szybkiego konia.
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
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_01"); //Warto wiedzie� jedno: Tutaj nikt nie jest niewinny.
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_02"); //Ludzie znajduj�cy si� tutaj pope�nili niemal wszystkie mo�liwe przest�pstwa.
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_03"); //Dam ci rad�, ca�kowicie za darmo:
	AI_Output(self,hero,"CM_Info_Diego_Gamestart_Choice_All_11_04"); //Je�li kto� zapyta dlaczego tu jeste�, powiedz mu, �e sprz�tn��e� kolesia, kt�ry zapyta� dlaczego tu jeste�.
	//PrintScreen	("Si�a, Zr�czno�� i Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	PrintS_Ext ("Si�a, Zr�czno�� i Mana +1",COL_Lime) ;
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
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Dzi�ki za pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Jak sobie chcesz. Mi�o by�o ci� pozna�.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Spotkamy si� w Starym Obozie.
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
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Chod�my.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Trzymaj si�.
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
	description = "Mam list do Arcymistrza Mag�w Ognia.";
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
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Mam list do Arcymistrza Mag�w Ognia.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Czy�by...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Jaki� mag da� mi go zanim mnie tu wrzucono.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Twoje szcz�cie, �e nie mog� si� wi�cej pokazywa� u mag�w. Kto� inny m�g�by ci poder�n�� gard�o za taki list.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //A to dlatego, �e magowie hojnie op�acaj� swoich kurier�w, a wi�kszo�� z tutejszych ludzi nic nie posiada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Na twoim miejscu trzyma�bym j�zyk za z�bami a� do chwili, gdy spotkasz kt�rego� z mag�w. Chocia� w�tpi�, �eby ci si� uda�o.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Dlaczego?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Magowie mieszkaj� w zamku, w Starym Obozie. Tylko ludzie Gomeza maj� tam wst�p.
	
	MIS_Massage = LOG_RUNNING;
	Log_CreateTopic		(CH1_Massage, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Massage, LOG_RUNNING);
    B_LogEntry                (CH1_Massage,"Jeden z Mag�w Ognia z Khorinis da� mi list, kt�ry mam przekaza� Arcymistrzowi Mag�w Ognia w Kolonii. Diego powiedzia� mi, �e magowie mieszkaj� w zamku Starego Obozu i tylko ludzie Gomeza mog� tam wej��. Ostrzeg� mnie, �ebym nikomu nie wspomina� o li�cie, gdy� ka�dy ze skaza�c�w chcia�by otrzyma� za niego nagrod�.");
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
	description = "Dlaczego mi pomog�e�?";
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
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Dlaczego mi pomog�e�?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Bo potrzebowa�e� pomocy. Gdyby nie ja, Bullit i jego ch�opcy mogliby ci� wyko�czy�.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A ja jestem zbyt mi�y, �eby si� temu spokojnie przygl�da�. W ko�cu przeby�em ca�� t� drog� po to, by z�o�y� ci propozycj�.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Propozycj�...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Tak. Po tym zaj�ciu z Bullitem i jego lud�mi powiniene� si� domy�li�, �e przyda ci si� ochrona.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Ka�dy, kto tu trafia ma wyb�r. W Kolonii s� trzy obozy i w ko�cu b�dziesz musia� do kt�rego� do��czy�.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jestem tu, by udowodni� wszystkim nowym, �e najlepszym miejscem dla nich b�dzie Stary Ob�z.
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
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //On i pozostali przenosz� towary z zewn�trz do Obozu. Tam go znajdziesz.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ale je�li chcesz z nim walczy�, radz� ci uwa�a�. To do�wiadczony wojownik.
	 Log_CreateTopic            (CH1_Bulit, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Bulit, LOG_RUNNING);
    B_LogEntry                     (CH1_Bulit,"Gdy zrzucono mnie do Kolonii, napad�a na mnie grupa Stra�nik�w. Ich przyw�dca nazywa si� Bullit i przesiaduje w zamku w Starym Obozie. Jak tylko wykombinuj� jak tam si� dosta�, odp�ac� si� temu sukinsynowi.");
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
	description = "Dobra, co powinienem wiedzie� o tym miejscu?";
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
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobra, co powinienem wiedzie� o tym miejscu?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nazywamy je Koloni�. Wiesz ju�, �e wydobywamy rud� dla kr�la.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //C�, w ka�dym razie tak robi� ludzie ze Starego Obozu.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Wewn�trz Bariery powsta�y trzy obozy. Najwi�kszy i najstarszy jest tak zwany Stary Ob�z.
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
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nie ma za bardzo o czym m�wi�. Jest nie do sforsowania.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //A co si� stanie, je�li po prostu spr�buj� st�d wyj��?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Ostatni, kt�ry tego spr�bowa� dotar� na drug� stron� jako trup. Przez to przekl�te magiczne pole mo�na wej��, ale ju� nigdy si� st�d nie wydostaniesz.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Je�li jest st�d jakie� wyj�cie - znajd� je.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tak ci spieszno, �eby si� st�d wyrwa�? Dopiero co tu trafi�e�!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co z pozosta�ymi obozami?";
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
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co z pozosta�ymi obozami?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Te dwa obozy zamieszkuj� szale�cy, kt�rzy pr�buj� si� st�d wydosta� za wszelk� cen�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //W zachodniej cz�ci Kolonii znajduje si� Nowy Ob�z. Rezyduj� tam magowie, kt�rzy my�l�, �e uda si� im wysadzi� Barier�, jak tylko zbior� dostatecznie du�o rudy.	
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //No i s� jeszcze �wiry z Sekty, na wschodzie. Ich ob�z znajduje si� na �rodku bagna. Oni z kolei czekaj� a� ich b�stwo pomo�e im si� st�d wydosta�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Wygl�da na to, �e jeszcze troch� poczekaj�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Na twoim miejscu nie traci�bym czasu na zadawanie si� z szale�cami.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_06"); //Gdzie� w g�rach sw�j Ob�z maj� Bandyci. Band� rz�dzi Quentin. Nasze obozy niezbyt si� lubi�. Je�eli do nich do��czysz, b�dziesz musia� si� z tym liczy�. 

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
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //To najwi�kszy i najpot�niejszy z trzech oboz�w. Gomez i jego ludzie kontroluj� kopalni�, a tym samym - ca�y handel ze �wiatem Zewn�trznym.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Raz w miesi�cu Kr�l przysy�a nam wszystko, czego potrzebujemy. Mamy staruszka w gar�ci, kapujesz?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Przysy�a nam bro�, chleb, mi�so... wszystko.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ty te� mo�esz mie� w tym udzia�. Musisz tylko do��czy� do ludzi Gomeza.
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
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez jest najpot�niejszym z Magnat�w kieruj�cych handlem rud�. To on rz�dzi w Starym Obozie i ma najwi�cej do powiedzenia w ca�ej Kolonii.
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
	description = "Za��my, �e chcia�bym do��czy� do jego ludzi. Co powinienem zrobi�?";
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
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Za��my, �e chcia�bym do��czy� do jego ludzi. Co powinienem zrobi�?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Przy bramie do zamku znajdziesz cz�owieka imieniem Thorus. Powiedz mu, �e Diego ci� przys�a�.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC, "Aby zosta� przyj�tym w poczet ludzi Gomeza, musz� najpierw porozmawia� z Thorusem.");
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
	description = "Jak dostan� si� do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak dostan� si� do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Pod��aj t� �cie�k�. Stary Ob�z to najbli�sze, mniej wi�cej bezpieczne miejsce jakie napotkasz po drodze.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Pomi�dzy obozami kr�ci si� wiele gro�nych zwierz�t. Radzi�bym ci postara� si� o jak�� bro�.
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
	description = "Gdzie mog� znale�� or�?";
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
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Gdzie mog� znale�� or�?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Rozejrzyj si� troch� w pobli�u Opuszczonej Kopalni. Na pewno znajdziesz tam co� przydatnego.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Kopalni� nie trudno znale��. Le�y par� metr�w w d� kanionu.
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
    var c_npc Diego;    	Diego = Hlp_GetNpc(PC_THIEF); // Ihm geh�rt der Dialog
    //var c_npc Robotnik;   	Robotnik = Hlp_GetNpc(VLK_2004_Robotnik);
    var c_npc Gardist; 		Gardist = Hlp_GetNpc(GRD_254_Orry);
	
    //TRIA_Invite(Robotnik);   // Lade Robotnik in diesen Dialog ein
	TRIA_Invite(Diego);
    TRIA_Invite(Gardist); // Lade Gardist in diesen Dialog ein
    TRIA_Start();         // Starte das Gespr�ch
    // Der Held und Diego m�ssen/d�rfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Diego (self = Diego, other = Hero)
    TRIA_Next(Diego);

    DIAG_Reset();
	AI_Output (self, other, "TRIA_BramaPlac_0F"); //Zaraz to za�atwi�!
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_00"); //Cholera, rusza� si� ch�opaki!

    // Held redet nun mit Robotnik (self = Robotnik, other = Hero)
    //TRIA_Next(Robotnik);
	//DIAG_Reset();

	//AI_GotoNpc(self, other);
    //AI_TurnToNpc(self, Diego);
	
    //AI_Output (self, other, "TRIA_BramaPlac_01"); //Ju� si� robi!
	//AI_TurnAway (self,other);
	
    //AI_Output (self, other, "TRIA_BramaPlac_02"); //Ej, tam na g�rze. Otwiera�!
	//AI_TurnToNpc (self,other);
    // Held soll sich w�hrend des n�chsten Satzes verschw�rerisch umsehen
   // DIAG("Nervous", 1, 2);

   // AI_Output (other, self, "TRIA_BramaPlac_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Gesch�ft?

    // Held soll sich jetzt wieder normal bewegen
	
    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Gardist (self = Gardist, other = Hero)
    TRIA_Next(Gardist);
	DIAG_Reset();
	AI_GotoNpc(self, other);
    DIAG("No", 0, 1);
	AI_TurnToNpc (self,PC_THIEF);
    AI_Output (self, other, "TRIA_BramaPlac_04"); //A kog� my tu mamy, to� to Diego. My�la�em, �e zostaniesz chwil� d�u�ej, dlatego zamkn��em.

    // Held redet nun wieder mit Diego (self = Diego, other = Hero)
    TRIA_Next(Diego);
	DIAG_Reset();
    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_05"); //Nie, spodziewa�em si� przesy�ki z zewn�trz, ale jej nie otrzyma�em. 
	AI_Output (self, other, "TRIA_BramaPlac_06"); //Bullit cz�sto si� tu zjawia?

    //AI_TurnToNpc(other, self);

    // Kamerafahrt Ende
    TRIA_Cam("");

    // Diego soll zornig reagieren
	TRIA_Next(Gardist);
	DIAG_Reset();
    DIAG("Angry", 0, 4);
	AI_TurnToNpc (self,PC_THIEF);
    AI_Output (self, other, "TRIA_BramaPlac_07"); //Ta... Co jaki� czas wpada.

    // Held soll sich jetzt wieder normal bewegen
	TRIA_Next(Diego);
    DIAG_Reset();
	AI_TurnToNpc(self, GRD_254_Orry);
    AI_Output (self, other, "TRIA_BramaPlac_08"); //B�d� si� musia� tym zaj��. No, otwieraj ju�!
	TRIA_Next(gardist);
    DIAG_Reset();
	AI_TurnToNpc (self,PC_THIEF);
	AI_Output (self, other, "TRIA_BramaPlac_09"); //Robi si�!

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
	description = "Rozmawia�em z Thorusem.";
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
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Rozmawia�em z Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //I co ci powiedzia�?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //M�wi, �e b�d� m�g� do��czy� do Starego Obozu, je�li TY uznasz, �e si� nadaj�.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Widz�, �e czeka mnie dodatkowa robota.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Zaczynamy od razu?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Najpierw powiniene� dowiedzie� si� kilku rzeczy.
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
	description = "Co powinienem wiedzie�, zanim zostan� przyj�ty do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co powinienem wiedzie�, zanim zostan� przyj�ty do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Je�li chcesz do nas nale�e�, musisz najpierw zaplusowa� u kilku ludzi.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //W Zewn�trznym Pier�cieniu mo�esz spotka� paru wp�ywowych ludzi, g��wnie Cieni. Je�li uda ci si� ich do siebie przekona�, twoje szanse wzrosn�.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //P�niej czeka ci� test zaufania.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Opr�cz tego musisz si� jeszcze wiele nauczy�. Im wi�cej nowych umiej�tno�ci zdob�dziesz, tym cenniejszy b�dziesz dla nas.
	
	B_LogEntry( CH1_JoinOC, "Zanim zostan� przyj�ty, musz� zjedna� sobie kilku wp�ywowych ludzi z Zewn�trznego Pier�cienia i przej�� test zaufania.");
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
	description = "Gdzie znajd� te wa�ne osoby?";
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
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Gdzie znajd� te wa�ne osoby?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //C�, na jednego z nich w�a�nie patrzysz. Poza tym, jest jeszcze Thorus, jego ju� znasz.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co do pozosta�ych... sam musisz ich rozpozna�. Je�li nie jeste� w stanie tego zrobi�, to i tak nie masz tu czego szuka�.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Najlepiej przejd� si� po Zewn�trznym Pier�cieniu i porozmawiaj z lud�mi.
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
	description = "Kto mo�e mnie czego� nauczy�?";
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
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kto mo�e mnie czego� nauczy�?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Zacznij od R�czki. To najzr�czniejszy cz�owiek w Obozie.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Miej oczy szeroko otwarte, a na pewno znajdziesz wielu ludzi, kt�rzy zechc� ci� czego� nauczy�.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Gdzie znajd� R�czk�?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jego chata stoi nieco na uboczu, zaraz przy murach zamku. Id�c st�d udaj si� w stron� areny.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Przy zamkowej bramie p�jd� w lewo. To w�a�nie droga do areny.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"R�czka mo�e mnie nauczy� otwierania zamk�w i kradzie�y kieszonkowej. Jego chata znajduje si� nieco na uboczu, niedaleko areny.");
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
	description = "Mo�esz mnie czego� nauczy�?";
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
		B_LogEntry		(GE_TeacherOC,	"Diego mo�e mi pom�c w zwi�kszeniu mojej zwinno�ci i si�y.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Tak. Mog� ci pokaza�, jak zwi�kszy� swoj� si�� lub zr�czno��.
	
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
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Jeste� teraz o wiele silniejszy.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos�ugiwa� si� �ukiem i kusz�.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Wr�� nied�ugo. Musisz si� jeszcze wiele nauczy�.
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
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_07"); //Wybra�e� Gamala jako swojego opiekuna. Nie mog� opowiedzie� ci o te�cie zaufania. R�b to, co ci kazano.
	Diego_BringList = LOG_FAILED;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_FAILED);
    B_LogEntry    		(CH1_BringList,"Diego powiedzia�, �e nie mog� wykona� testu zaufania, poniewa� obra�em Gamala jako swojego opiekuna. Musz� kroczy� dalej �cie�k�, kt�r� obra�em.");
	}
	else if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_08"); //Po obozie chodz� s�uchy, �e widziano ci� z Bandytami. Wybacz, ale nie mog� ci zaufa�. Szukaj swojego miejsca gdzie� indziej.
	Diego_BringList = LOG_FAILED;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_FAILED);
    B_LogEntry    		(CH1_BringList,"Diego powiedzia�, �e nie mog� wykona� testu zaufania, poniewa� widziano mnie z Bandytami. Lepiej skupi� si� na zadaniach przez nich zlecanych, a nie b�d� pr�bowa� miesza� si� w sprawy Starego Obozu.");
	}
	else
	{*/
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //B�dziesz si� musia� wybra� do Starej Kopalni. Tam znajdziesz faceta imieniem Ian. Od niego dostaniesz list�.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //To bardzo wa�ny dokument. Zawiera spis wszystkich rzeczy, kt�rych potrzebuj� od nas ludzie z kopalni.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Postaramy si�, �eby dostarczono je z nast�pnym konwojem.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //�aden problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //W�a�nie �e jest problem. Ta lista nie mo�e wpa�� w r�ce ludzi z Nowego Obozu!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak ju� powiedzia�em: to bardzo wa�na lista. Je�li nie zawalisz - daleko tu zajdziesz.
	//er 1.4.5 - Lorenzo i przepustka
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_09"); //Jaki� czas temu zmieni�y si� zasady wst�pu do Kopalni. Stra�nik Artegor przepuszcza tylko Kopaczy i ludzi, kt�rzy posiadaj� przepustk�. 
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_10"); //Gdzie tak� dostan�?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_11"); //Popro� o ni� Lorenzo. To on organizuje zmiany w Kopalni i decyduje, kto tam trafia. Powiedz mu, �e masz ode mnie zadanie i ma ci wypisa� przepustk�.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_12"); //Jego chata stoi tu� obok mojej. 
	
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic 	(CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus	(CH1_BringList,LOG_RUNNING);
    B_LogEntry    		(CH1_BringList,"Diego wys�a� mnie do Starej Kopalni. Tam, od cz�owieka imieniem Ian, dostan� bardzo wa�n� list�, kt�ra pod �adnym pozorem nie mo�e wpa�� w �apy ludzi z Nowego Obozu. Zanim jednak si� tam udam, musz� zdoby� przepustk� od Lorenzo.");
    
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
	description = "Sk�d pewno��, �e Ian wyda j� komu� takiemu jak JA?";
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
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Skoro ta lista jest taka wa�na, sk�d pewno��, �e Ian wyda j� komu� takiemu jak JA?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Bo powiesz mu, �e przys�a� ci� Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Tak zrobi�.
	//AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_04"); //A tak poza tym do 
	
	B_LogEntry    (CH1_BringList,"Ian da mi list�, je�li powiem mu, �e przysy�a mnie Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Gdzie znajd� Star� Kopalni�?";
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
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Gdzie znajd� Star� Kopalni�?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Porozmawiaj z Grahamem, to nasz kartograf. Powiedz mu, �e ja ci� przysy�am, i �e potrzebujesz mapy. Z niej dowiesz si�, gdzie le�y kopalnia.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Graham mieszka na lewo od p�nocnej bramy.
	
	B_LogEntry    (CH1_BringList,"Od Grahama dostan� map�. Znajd� go na lewo od p�nocnej bramy.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Mam list� od Iana.";
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
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Mam list� od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego bardzo si� ucieszy�, gdy wr�czy�em mu list� Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego ucieszy� si�, gdy wr�czy�em mu list� od Iana. Chyba nie zauwa�y�, �e Lares doda� kilka rzeczy od siebie. A mo�e rzeczywi�cie widzia�em dziwny b�ysk w jego oku?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobra robota! Zaczynasz mi si� naprawd� podoba�!

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
	description = "Jak tam z moj� opini� w Obozie?";
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
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Jak tam z moj� opini� w Obozie?
	/*if (MIS_EasyJoinOC == LOG_RUNNING) || (MIS_EasyJoinOC == LOG_SUCCESS)
	{
	AI_Output(self, hero,"Info_Diego_JoinAnalyzeRefuse_11_01"); //Obra�e� Gamala jako swojego opiekuna. Wykonuj polecenia zlecane ci przez TWOICH prze�o�onych. Ja ju� do nich nie nale��.
				
	Log_SetTopicStatus(CH1_JoinOC, LOG_FAILED);
	B_LogEntry(CH1_JoinOC, "Diego powiedzia� mi, �ebym wykonywa� polecenia swoich prze�o�onych. Przyjmuj�c propozycj� Gamala odrzuci�em pomoc Diego. Nie mog� wykonywa� zada� dla tych dw�ch os�b naraz.");
	}
	else if (MIS_DraxTest == LOG_SUCCESS)
	{
	AI_Output(self, hero,"Info_Diego_JoinAnalyzeRefuse_11_02"); //Podobno widziano ci� z Bandytami. Przykro mi, ale nie mo�emy ci ju� ufa�. Thorus by�by w�ciek�y, gdybym pr�bowa� ci pom�c do��czy� do Obozu.
				
	Log_SetTopicStatus(CH1_JoinOC, LOG_FAILED);
	B_LogEntry(CH1_JoinOC, "Diego powiedzia� mi, �e widziano mnie z Bandytami. Ludzie w Obozie stracili do mnie zaufanie.");
	}
	else
	{*/
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Rozmawia�em z kilkoma lud�mi...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //I?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS) || (PokonanyKirgo == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty powiedzia� mi, �e pokona�e� Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED) || (PokonanyPrzezKirgo == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty powiedzia� mi, �e pozwoli�e� Kirgo spu�ci� sobie baty. Chyba nie jest tob� zachwycony.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING) 
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty powiedzia� mi, �e nie mo�e si� doczeka� na twoj� walk� z Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED) || (PokonanyPrzezKharim == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale by� pod wra�eniem twojej �mia�o�ci. Nie ka�dy mia�by odwag�, �eby wyzwa� Kharima. Cho�by nawet z nim przegra�.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS) || (PokonanyKharim == true)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ale by� pod wielkim wra�eniem twojej walki z Kharimem. Bez przerwy opowiada jaki to z ciebie wojownik.
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //I nie mo�e si� doczeka�, kiedy staniesz do walki z Kharimem.
	};
	// -----------------------------------------------------------
	if (Npc_KnowsInfo(hero,DIA_THORUS_ZDRADA))  
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_04"); //�wistak jest na ciebie w�ciek�y. A ja na niego. Nie spodziewa�em si�, �e to on jest sprawc� wielkiej kradzie�y sprzed lat.
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_05"); //Przez tyle lat podejrzewa�em R�czk�.
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_06"); //Mimo wszystko nie�le sobie poradzi�e�. Jestem pod wra�eniem!
	Points_OC = Points_OC + 5;
	}
	else if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //�wistak opowiedzia� mi o tej historii z Fiskiem... C�, na twoim miejscu wzi��bym t� rud� i da� nog�, ale tak, czy inaczej - �wistak chyba bardzo ci� polubi�.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Rozmawia�em ze �wistakiem. Zwia�e� z jego rud�, cwaniaku! Musz� przyzna�, �e �mia�o�ci ci nie brakuje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //�wistak czeka na sw�j miecz. Zdecyduj si� wreszcie czy zamierzasz mu go da�, czy nie. W przeciwnym wypadku mo�e pomy�le�, �e zwia�e� z jego rud�!
	};
	// -----------------------------------------------------------
	if (MIS_TestOC == LOG_SUCCESS)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_01"); //Cavalorn jest pod wra�eniem tego, �e uda�o ci si� zda� jego test. M�wi, �e potrafisz dzia�a� dyskretnie.
	}
	else if (MIS_TestOC == LOG_RUNNING)
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_02"); //Cavalorn nie mo�e si� doczeka�, a� uko�czysz jego test i b�dzie ci� m�g� oceni�. Lepiej si� pospiesz.
	}
	else
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Cavalorn_11_03"); //Cavalorn nigdy o tobie nie s�ysza�. Radzi�bym ci z nim pogada�. To wa�ny Cie�.
	};
	// -----------------------------------------------------------
	if (Npc_KnowsInfo(hero,DIA_THORUS_ICHTROJE))
	{
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_03"); //Donios�e� na Z�ego Thorusowi. Jestem pod wra�eniem, �e uda�o ci si� znale�� na niego haka. Jednak teraz przyja�nisz si� ze Skaz�. 
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_04"); //To nie dzia�a pozytywnie na twoj� reputacj� w Obozie. 
	AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_05"); //Cho� w sumie Thorus i ja powinni�my ci by� w pewnym stopniu wdzi�czni...
	Points_OC = Points_OC - 2;
	}
	else if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Z�y powiedzia� mi, �e znalaz�e� Neka. Wydawa� si� by� bardzo zadowolony.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Moim zdaniem Z�y myli si� co do Neka. By� uci��liwy, to fakt, ale nie wierz�, �eby zdezerterowa� do Nowego Obozu.
	};
	
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		if (MIS_ChestAndPlate != LOG_SUCCESS)
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //M�wi�em ci ju� o R�czce! On mo�e ci� wiele nauczy�!
		}
		else
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_PlateAndChestFingers2"); //R�czka jest na ciebie w�ciek�y, bo pomog�e� Kopaczowi Rono. Ci dwaj niezbyt si� lubi�. 
		Points_OC = Points_OC - 1;
		};
	}
	else if (Fingers_Learnt == LOG_SUCCESS)  
	{
		////Plate And Chest
		if (MIS_ChestAndPlate != LOG_SUCCESS)
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //R�czka powiedzia� mi, �e troch� si� ju� nauczy�e�, ale uwa�a, �e m�g�by� by� jeszcze lepszy.
		Points_OC = Points_OC + 3;
		}
		else
		{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_PlateAndChestFingers"); //R�czka nie�le si� na ciebie w�ciek� po tym jak pomog�e� Kopaczowi Rono. Ci dwaj si� nie lubi�.
		Points_OC = Points_OC - 1;
		};
		
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Musz� powa�nie porozmawia� z Dexterem. Wykorzystuje ci� do za�atwiania w�asnych porachunk�w.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Ale je�li chodzi o nasz test - nie ma �adnych przepis�w. Je�li uda ci si� dokona� czego� TAKIEGO, to b�dzie wielki krok do przodu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Naprawd� uda�o ci si� zdoby� przepis Kaloma. Dexter jest pod wra�eniem. Ja zreszt� te�!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Ta sprawa z Mordragiem to nie lada wyzwanie. Niez�y z niego wojownik. Musisz porz�dnie po�wiczy�, je�li chcesz go pokona�.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus uwa�a, �e przyda si� nam kto� taki jak ty - to dla ciebie niezwykle korzystne.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus dosta� ataku apopleksji. Zreszt� wcale mu si� nie dziwi�. Jak mo�na A� TAK schrzani� robot�?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk powiedzia� mi, �e go zaskoczy�e�. W ka�dym razie b�dzie po twojej stronie.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk bardzo si� na ciebie wkurzy�. Na twoim miejscu znalaz�bym kogo� na miejsce Mordraga.
	};
	// ---------------MOD ER SPRAWA MORDRAGA2--------------------------------------------
	if (Npc_KnowsInfo (hero, DIA_STT_315_Sly_Sukces))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_01"); //Z�y powiedzia�, �e bardzo mu pomog�e� oczy�ci� jego imi�. Bardzo ci� zachwala�.
		Points_OC = Points_OC + 10;
	};
	if (Npc_KnowsInfo (hero, DIA_Whistler_Zdrada2))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_02"); //�wistak powiedzia� mi, �e masz jaja. Uwa�a, �e potrzebujemy takich ludzi.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_03"); //Pozostali Cienie byli pod wra�eniem. Mieli podobne zdanie jak �wistak.
		Points_OC = Points_OC + 15;
	};
	/*if (Npc_KnowsInfo (hero, Info_Thorus_Sukces234))
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_04"); //Thorus powiedzia�, �e ch�tnie by ci� zobaczy� w stroju Stra�nika.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Zdrada_11_05"); //Pozostali Cienie byli pod wra�eniem. Mieli podobne zdanie jak �wistak.
		Points_OC = Points_OC + 15;
	};*/
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Uda�o ci si� zjedna� wystarczaj�co wiele os�b.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Przeszed�e� r�wnie� test zaufania. Id� do Thorusa. Ju� go o wszystkim powiadomi�em. Pozwoli ci si� spotka� z Gomezem.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC, "Diego za�atwi� mi audiencj� u Gomeza. Teraz musz� jeszcze zamieni� s�owo z Thorusem. Wkr�tce b�d� jednym z ludzi Gomeza!");
			}
			else
			{
				if ( Npc_KnowsInfo (hero,DIA_STT_315_Sly_Sukces) ) && (Npc_KnowsInfo (hero, DIA_Whistler_Zdrada2))
				{
				AI_Output (self, hero,"Info_Diego_Points_11_03"); //Wprawdzie nie przeszed�e� testu, ale i tak zas�u�y�e� sobie na nasze zaufanie.
				Diego_GomezAudience = TRUE;
				} else
				{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ale musisz jeszcze przej�� test zaufania.
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
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //W sumie - ca�kiem nie�le jak na ��todzioba.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Bierz si� do roboty. Przed tob� jeszcze daleka droga, je�li chcesz do czego� doj�� w tym obozie.
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
	description = "Co mam zrobi�, kiedy stan� przed Gomezem?";
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
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mam zrobi�, kiedy stan� przed Gomezem?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez podejmuje decyzje na podstawie instynktu. Je�li spodoba mu si� twoja g�ba - pozwoli ci zosta�.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od tej pory musisz sobie radzi� sam - postaraj si�! Powodzenia!
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
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Mog� dosta� tak� zbroj� jak twoja?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //A masz do�� rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Zdob�d� rud�, to dostaniesz zbroj�.
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
   description	= "Mam twoj� przesy�k�.";
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
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_01"); //Chyba mam co� co nale�y do ciebie.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_02"); //Co takiego?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_03"); //Sp�jrz. Wspomina�e� co� o jakiej� przesy�ce ze �wiata Zewn�trznego.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_04"); //Gdzie to znalaz�e�?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_05"); //Mia� to przy sobie Bullit.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_06"); //Chcesz powiedzie�, �e pokona�e� go w walce?
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_07"); //To nieistotne.
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_08"); //Jestem pod olbrzymim wra�eniem! A z tym sukinsynem policz� si� p�niej.
    AI_Output (other, self ,"DIA_PC_Thief_GiveParcel_15_09"); //Mo�e tak jaka� nagroda?
    AI_Output (self, other ,"DIA_PC_Thief_GiveParcel_03_10"); //Jasne, zas�u�y�e�.
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
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej! My�la�em, �e ju� nie �yjesz!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Par� razy te� mi si� tak wydawa�o.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Wiele si� wydarzy�o od naszego ostatniego spotkania. S�ysza�em, �e mia�e� sw�j wk�ad w wielkie przywo�anie!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Widz�, �e jeste� �wietnie poinformowany.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lepiej ni� my�lisz... Teraz szukasz kamienia ogniskuj�cego?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Tak. Powinien by� gdzie� w pobli�u.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Wiem, gdzie go mo�na znale��. Jest tylko jeden problem.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumiem. Czego chcesz?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Widz�, �e szybko si� uczysz, ale nie o to mi chodzi�o.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nie? Wi�c c� to za problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //O, to ca�e trzy tony problem�w!
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Chod�my. Za chwil� sam zobaczysz.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,	"W pobli�u p�nocnego kamienia ogniskuj�cego, niespodziewanie natkn��em si� na Diego. Ostrzeg� mnie, �e co� 'wielkiego' czeka na mnie na ko�cu tego kanionu.");
	B_LogEntry		(CH3_TrollCanyon,	"Jakim� cudem dowiedzia� si� o moich dzia�aniach w Obozie Bractwa oraz o poszukiwaniach kamienia. Dalej p�jdziemy razem.");

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
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Po lewej stronie tego kanionu znajdziesz wej�cie do jaskini, kt�ra prowadzi do kamienia.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Wszystko jasne. Jednak najpierw musimy si� jako� pozby� tamtego bydlaka.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Spr�buj znale�� jaki� jego s�aby punkt albo inny spos�b na pokonanie tego trolla.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //�ci�gn� na siebie jego uwag�.

	B_LogEntry		(CH3_TrollCanyon,	"Na naszej drodze stan�� ogromny troll. Diego zamierza �ci�gn�� na siebie jego uwag� a ja mam znale�� jaki� s�aby punkt.");

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
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To by�o niesamowite. Niez�y jeste�. Teraz mo�esz i�� po kamie� ogniskuj�cy.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ja dopilnuj�, �eby�my nie mieli ju� wi�cej niemi�ych niespodzianek.

	B_LogEntry		(CH3_TrollCanyon,	"Pokonali�my trolla! Teraz mog� zaj�� si� ko�owrotem podnosz�cym krat� przed platform� z kamieniem ogniskuj�cym.");

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
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Ko�owr�t chyba si� zaci��!
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Czekaj, mo�e uda mi si� go naprawi�!

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
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //No, teraz powinno dzia�a�!
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,	"Diego naprawi� ko�owr�t. Teraz nic ju� nie stanie mi na drodze.");

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

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Id� po kamie�. Zaczekam na ciebie tutaj!

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

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Widz�, �e znalaz�e� kamie�! �wietnie.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Chyba powinienem znowu zajrze� do Starego Obozu. Powodzenia!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Nie daj si� zabi�!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Jeszcze si� zobaczymy.

	B_LogEntry		(CH3_TrollCanyon,	"Mam ju� kamie� ogniskuj�cy. Teraz pozosta�o tylko przekona� par� harpii, �e nie zamierzam go pr�dko oddawa�.");
	B_LogEntry		(CH3_TrollCanyon,	"Diego wraca do Starego Obozu. Pewnie si� jeszcze spotkamy...");

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

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Ciii... B�d� cicho!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Cze��, Diego. Rozmawia�em ju� z Miltenem po przeciwnej stronie Obozu.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dobrze, zatem wiesz ju�, co si� sta�o.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //A s�ysza�e� o planowanym ataku na Woln� Kopalni�?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Cze��, Diego. Co ma znaczy� ta ca�a zabawa w chowanego?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Nic nie s�ysza�e�?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //O czym?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //O zawaleniu si� Starej Kopalni, zamordowaniu Mag�w Ognia i planach ataku na Woln� Kopalni�.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //CO?! O czym ty m�wisz?!
	};
	if (Npc_GetTrueGuild(hero) == GIL_BAU)
	{
	MIS_RozwalaUBnadytow = LOG_RUNNING;
	Log_CreateTopic          (CH1_RozwalaUBnadytow, LOG_MISSION);
    Log_SetTopicStatus       (CH1_RozwalaUBnadytow, LOG_RUNNING);
    B_LogEntry               (CH1_RozwalaUBnadytow,"Od Diego dowiedzia�em si� o niepokoj�cej sytuacji w Kolonii. Zawalenie si� Starej Kopalni, zamordowanie Mag�w Ognia... To zbyt wiele na moj� g�ow�. Quentin musi si� jak najszybciej o tym dowiedzie�.");
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
	description = "Jak mog�o doj�� do zawalenia si� kopalni?";
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
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mog�o doj�� do zawalenia si� kopalni?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z Kopaczy, kt�remu uda�o si� uratowa�, powiedzia�, �e kopi�c na najni�szym poziomie trafili na podziemn� rzek�.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kiedy woda wdar�a si� do szyb�w, pop�ka�y podpory i run�a ca�a g�rna cz��.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Tylko garstce ludzi uda�o si� wydosta� na powierzchni�.
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
	description = "Co si� sta�o z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Co si� sta�o z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To d�uga historia.
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
	description = "Napad na Woln� Kopalni�?";
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
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Napad na Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To d�uga historia.
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
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Opowiadaj, to nie pierwsza d�uga historia, kt�rej musia�em wys�ucha�.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //No dobra. Na szcz�cie by�em w�a�nie w siedzibie Magnat�w, kiedy dotar�y do nich wie�ci o zawaleniu si� kopalni.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Kiedy Gomez dowiedzia� si� o wypadku, oszala� z w�ciek�o�ci. Wcale mu si� nie dziwi� - jego autorytet m�g� run�� w ka�dej chwili, razem z kopalni�.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Jasne. Kto kontroluje rud�, kontroluje ca�� Koloni�!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //No w�a�nie. Przecie� bez sta�ego nap�ywu rudy, handel ze �wiatem Zewn�trznym padnie raz - dwa.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Je�li Gomez nie znajdzie szybko nowego �r�d�a dochodu, ludzie przestan� go s�ucha�.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //I dlatego postanowi� najecha� Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //C�, obiektywnie rzecz bior�c, to jedyna szansa Gomeza na zachowanie w�adzy.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Dwie godziny temu dwa tuziny Stra�nik�w wyruszy�y w kierunku Wolnej Kopalni.

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
	description = "To szale�stwo! Musz� uprzedzi� Nowy Ob�z.";
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
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To szale�stwo! Musz� uprzedzi� Nowy Ob�z.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //W takim razie lepiej si� pospiesz! Stra�nicy s� ju� pewnie niedaleko Wolnej Kopalni.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Ale przecie� nie przedr� si� tak �atwo przez obronne fortyfikacje Nowego Obozu!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Wcale nie musz� si� przez nie przedziera�. Kilka miesi�cy temu znale�li�my �cie�k�, kt�ra prowadzi przez g�ry wprost do Wolnej Kopalni. Nikt inny nie wie o jej istnieniu.
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
	description = "Widzia�em Stra�nik�w pilnuj�cych zamkni�tych bram.";
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
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Widzia�em Stra�nik�w pilnuj�cych zamkni�tych bram.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Trzymaj si� z dala od nich. Zaatakuj� ka�dego, kto spr�buje dosta� si� do Obozu.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Obawiaj� si� odwetu za napad na Woln� Kopalni�.
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
	description = "Ale co sta�o si� z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Ale co sta�o si� z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo i jego towarzysze byli jedynymi lud�mi w obozie, kt�rzy zachowali zimn� krew.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zabronili przeprowadzenia ataku i domagali si� pertraktacji z pozosta�ymi obozami.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //ZABRONILI Gomezowi przeprowadzenia ataku na Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //No w�a�nie. Corristo i jego ludzie byli zbyt zadufani w sobie. Gomez przesta� im ufa� i kaza� ich zdradziecko zamordowa�.
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
	description = "I co teraz zamierzacie zrobi�? To znaczy - ty i Milten?";
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
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //I co teraz zamierzacie zrobi�? To znaczy - ty i Milten?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Zostaniemy tu jeszcze przez jaki� czas. B�dziemy ostrzegali innych przyjaci�, �eby nie wpadli w �apy Stra�nik�w.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ale m�g�by� co� dla nas zrobi�.
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
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Znajd� Lestera i Gorna. Musz� si� dowiedzie� o tym, co si� tutaj wydarzy�o.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Powiedz im, �e spotkamy si� we czw�rk� tam gdzie zwykle.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Je�li znajd� ich przed tob�, przeka�� im ostrze�enie i wezwanie na spotkanie.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Dzi�ki, przyjacielu. Widz�, �e r�wny z ciebie go��. Id� ju�. Jeszcze si� kiedy� spotkamy.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_06"); //Ach, by�bym zapomnia�! Przypomnij te� Miltenowi. 
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_11_07"); //Jasne.
	MIS_4Friends = false;			
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Wszyscy Magowie Ognia zgin�li. Sytuacja wymyka si� spod kontroli. Diego kaza� mi powiadomi� Lestera i Gorna, �e maj� si� spotka� z nim i z Miltenem (swoj� drog� jemu te� warto przypomnie�) w tajemnym miejscu. Chyba nie robi� tego pierwszy raz!"); 
};

//#####################################################################################
//####### ROZDZIA� 2-4
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
    AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_01"); //Zaczekaj, mam dla ciebie robot�. 
    AI_Output (other, self ,"DIA_PC_Thief_Quest_DeadHand_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_03"); //Zgin�� gdzie� jeden z moich ludzi. Nazywa� si� R�czka. Na pewno go kojarzysz. Znikn�� z dnia na dzie�.
	AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_04"); //M�g�by� si� tym zaj��? Przydzieli�em do tego zadania tak�e Dextera. Powinno wam p�j�� sprawnie we dw�ch.
    AI_Output (other, self ,"DIA_PC_Thief_Quest_DeadHand_15_05"); //Gdzie go znajd�? 
	AI_Output (self, other ,"DIA_PC_Thief_Quest_DeadHand_03_06"); //Zapewne jest ju� w chacie R�czki i szuka poszlak. 
    MIS_HandDed = LOG_RUNNING;
	Npc_ExchangeRoutine (STT_329_Dexter,"csi");
	
	//CreateInvItems 	  (STT_331_Fingers, ItMis_FingersSecretBook, 1);
	//R�czka znika z mapy gry
	
    Log_CreateTopic          (CH1_HandDed, LOG_MISSION);
    Log_SetTopicStatus       (CH1_HandDed, LOG_RUNNING);
    B_LogEntry               (CH1_HandDed,"Diego poprosi� mnie o zbadanie sprawy tajemniczego znikni�cia R�czki. �ledztwo mam prowadzi� razem z Dexterem. Znajd� go w chacie R�czki. By� mo�e znalaz� ju� jakie� poszlaki.");
	
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
   description	= "Czy R�czka mia� jakich� wrog�w? ";
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
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_01"); //Czy R�czka mia� jakich� wrog�w? Szukamy kogo�, komu mog�oby zale�e� na jego �mierci. 
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_02"); //Widz�, �e �ledztwo zacz�o si� na dobre.
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_03"); //C�, nie s�ysza�em, �eby R�czka mia� tu jakich� wrog�w. Cho� nie wykluczam, �e kto� m�g� go wreszcie przy�apa�.
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_04"); //Przy�apa�?
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_05"); //W ko�cu to z�odziej. A w�a�ciwie to mistrz z�odziei.
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_06"); //Co masz na my�li?
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_07"); //R�czka dzia�a� w Gildii Z�odziei w Khorinis. To bardzo silna i wp�ywowa organizacja podziemna. Na pewno wielu zaszli za sk�r�...
    AI_Output (self, other ,"DIA_PC_Thief_FNGERS_PAST_03_08"); //By� mo�e kto� z nich te� trafi� do Kolonii? 
    AI_Output (other, self ,"DIA_PC_Thief_FNGERS_PAST_15_09"); //To bardzo prawdopodobne. Jednak w dalszym ci�gu to za ma�o, �eby cokolwiek ustali�. 
	
    B_LogEntry                     (CH1_HandDed,"R�czka przed wrzuceniem za Barier� dzia�a� w Gildii Z�odziei w Khorinis. By� mo�e kt�ry� z jego dawniejszych wrog�w r�wnie� trafi� za Barier�. Niestety ta informacja w niczym mi nie pomo�e. ");
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
   description	= "R�czka nie �yje.";
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
    AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_01"); //R�czka nie �yje. Zamordowa� go jeden ze Szkodnik�w, niejaki Klin. Go�� wyr�wnywa� rachunki z czas�w kiedy obaj byli na wolno�ci. 
    AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_02"); //Jak do tego doszed�e�?
	AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_03"); //Z poszlak znajduj�cych si� w chacie R�czki dowiedzia�em si�, �e wyruszy� do Nowego Obozu obrabowa� karczm�. 
	AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_04"); //Zanim dokona� kradzie�y zosta� rozpoznany przez Szkodnika o kt�rym wspomina�em. Dosz�o mi�dzy nimi do szarpaniny, w kt�rej nie wzi��em udzia�u. 
	AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_04"); //To niezbyt dobra informacje. Niech to pozostanie mi�dzy nami. Skoro chata R�czki jest wolna, mo�esz si� tam tymczasowo rozgo�ci�.  
    AI_Output (other, self ,"DIA_PC_Thief_NoWPyte_15_05"); //Dzi�ki. 
    AI_Output (self, other ,"DIA_PC_Thief_NoWPyte_03_06"); //Masz tu troch� rudy w nagrod�. 
	
    CreateInvItems (self, ItMiNugget, 100);
    B_GiveInvItems (self, other, ItMiNugget, 100);
	
    B_LogEntry               (CH1_HandDed,"Powiedzia�em Diego o �mierci R�czki. Mam nie wspomina� nikomu tego o czym si� dowiedzia�em.");
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
   description	= "R�czka wr�ci� do Obozu.";
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
    AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_01"); //R�czka wr�ci� do Obozu.
    AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_02"); //A gdzie si� podziewa�?
	AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_03"); //Spotka�em go w Nowym Obozie. Wpad� w ma�e tarapaty, ale pomog�em mu si� z nich wykaraska�. 
	AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_04"); //Mo�esz mi powiedzie� co on tam do cholery robi�?
	AI_Output (other, self ,"DIA_PC_Thief_FingersStayAlive_15_05"); //Pocz�tkowo mia� tylko okra�� karczm�, ale przy okazji za�atwi� te� pewn� spraw� z przesz�o�ci. Najlepiej sam z nim o tym pogadaj. 
	AI_Output (self, other ,"DIA_PC_Thief_FingersStayAlive_03_06"); //No dobra, sam si� dowiem. Dobrze si� spisa�e�. Oto sakiewka z rud�. 
	
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
	
    B_LogEntry               (CH1_HandDed,"Powiedzia�em Diego o tym, �e R�czka wr�ci� do Obozu. W nagrod� otrzyma�em 200 bry�ek rudy i zaskarbi�em sobie szacunek starego Cienia.");
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
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_03"); //Ju� od kilku dni czekam na list� zam�wie� do kopalni.
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_04"); //Jednak pos�aniec nie przychodzi.
    AI_Output (self, other ,"DIA_Pc_Thief_SprawkaXD_03_05"); //M�g�by� go dla mnie poszuka�?
    AI_Output (other, self ,"DIA_Pc_Thief_SprawkaXD_15_06"); //Jasne.
    MIS_Search_Poslaniec = LOG_RUNNING;
	CreateInvItem (VLK_507_Buddler, OldMineList2);
	B_ExchangeRoutine (VLK_507_Buddler,"trup");
	B_killnpc (VLK_507_Buddler);
	
    Log_CreateTopic            (CH1_Search_Poslaniec, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Search_Poslaniec, LOG_RUNNING);
    B_LogEntry                     (CH1_Search_Poslaniec,"Diego kaza� mi odnale�� pos�a�ca z kopalni. Ma przy sobi� liste zam�wie� na kt�rej zale�y Cieniowi.");
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
   description	= "Mam twoj� list�.";
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
    AI_Output (other, self ,"DIA_Pc_Thief_ListGive_15_01"); //Mam twoj� list�.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_02"); //Poka� mi j�!
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_03"); //Wycwanili si�! 
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_04"); //No c�. W ka�dym razie dzi�kuj�.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_05"); //Gdzie by� ten pos�aniec?
    AI_Output (other, self ,"DIA_Pc_Thief_ListGive_15_06"); //Zosta� na obiedzie u z�baczy.
    AI_Output (self, other ,"DIA_Pc_Thief_ListGive_03_07"); //Rozumiem. We� t� rud�.
    B_LogEntry                     (CH1_Search_Poslaniec,"Przy ciele pos�a�ca znalaz�em list�, kt�r� odda�em Diego.");
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
   description	= "Czy wiesz w jakie miejsca w Kolonii Thorus wysy�a Stra�nik�w na patrole?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_01"); //Czy wiesz w jakie miejsca w Kolonii Thorus wysy�a Stra�nik�w na patrole?
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_02"); //Owszem. Thorus wysy�a swoje patrole najcz�ciej w okolice placu wymian, lasu nieopodal Starej Kopalni, przez kt�ry transportowane s� konwoje oraz w rejony Nowego Obozu i Starej Kopalni. Jak wiesz, Stary Ob�z jest w konflikcie z lud�mi z Nowego Obozu, tak wi�c wysy�a w te okolice szpieg�w.
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_03"); //Z tego co mi wiadomo Stra�nicy nie zapuszczaj� si� na ziemie ork�w oraz w okolice wybrze�a, gdy� s� to miejsca do�� niebezpiecznie. 
    AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_04"); //Dzi�kuje. Bardzo mi pomog�e�.
	AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_05"); //W porz�dku. Mog� jednak wiedzie� w co si� znowu wpakowa�e�?
	AI_Output (other, self ,"DIA_PC_THIEF_GDZIE_PATROLE_15_06"); //Potrzebuj� znale�� jednego ze Stra�nik�w, kt�ry wyruszy� na misje nie oddawszy Magnatom klucza do piwnic zamkowych.
    AI_Output (self, other ,"DIA_PC_THIEF_GDZIE_PATROLE_03_07"); //S�dz�c po twojej zbroi jeste� jednym z ludzi Laresa. Pewnie pracujesz dla kogo� w Nowym Obozie. Nie wiem co dok�adnie planujesz, ale b�d� ostro�ny. 
	B_LogEntry                     (CH1_Magazyny_OC,"Gomez wysy�a swoich ludzi w okolice placu wymian, lasu, nieopodal Starej Kopalni oraz w rejony Nowego Obozu. Tam powinienem szuka�.");

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
   description	= "Kt�ry z Magnat�w zajmuje si� handlem ze �wiatem Zewn�trznym?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_HANDEL_MAGNAT_15_01"); //Kt�ry z Magnat�w zajmuje si� handlem ze �wiatem Zewn�trznym?
    AI_Output (self, other ,"DIA_PC_THIEF_HANDEL_MAGNAT_03_02"); //Bartholo, jednak Magnaci to zaj�ci i niecierpliwi ludzie, tak�e radz� ci uwa�a�.
    B_LogEntry                     (CH1_SzponyTopielca,"Za handel ze �wiatem Zewn�trznym odpowiada Magnat Bartholo. Powinienem uda� si� do niego.");
    AI_StopProcessInfos	(self);
};
//#####################################################################################
//####### ROZDZIA� 5
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
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_01"); //A wi�c przyby�e� na nasze spotkanie!
    AI_Output (other, self ,"DIA_PC_THIEF_You_Hero_15_02"); //Czy�bym by� tu nieproszonym go�ciem?
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_03"); //Ale� sk�d! Rozmawiali�my o tobie z Lesterem. Twoje dokonania s� naprawd� wspania�e.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_04"); //Od tej pory jeste� oficjalnie jednym z nas. Mo�esz na nas liczy� w ka�dej sytuacji.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_05"); //Jako znak mojej przyja�ni chc� ci zaoferowa� pewien miecz.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_06"); //To miecz mistrzowski, najlepszy z lekkich mieczy, jakie mo�na zdoby� w Myrtanie.
    AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_07"); //Aby go u�ywa�, musisz by� bardzo zwinny. Pami�taj, �e s�u�� pomoc�, je�li chcesz si� czego� nauczy�.
	AI_Output (other, self ,"DIA_PC_THIEF_You_Hero_15_08"); //Dzi�kuj�, to wspania�y prezent.
	AI_Output (self, other ,"DIA_PC_THIEF_You_Hero_03_09"); //Prosz�, oto miecz.
    CreateInvItems (self, ItMw_Meisterdegen, 1);
    B_GiveInvItems (self, other, ItMw_Meisterdegen, 1);
	B_LogEntry                     (CH4_4Friends,"Diego podarowa� mi miecz mistrzowski, najlepsz� bro� wymagaj�c� zr�czno�ci, jak� kiedykolwiek stworzono w Myrtanie.");
	
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
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_01"); //Mam nadziej�, �e spodoba�y ci si� podarki.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_02"); //Jasne. Na pewno mi si� przydadz�.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_03"); //Co� czuj�, �e spotka nas jeszcze wiele przyg�d.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_04"); //Co teraz planujecie?
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_05"); //Gorn z pewno�ci� zostanie tutaj razem z Lee i innymi Najemnikami. Ci ludzie wol� si� trzyma� razem.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_06"); //Ja p�jd� teraz na plac wymian. Mam tam pewn� spraw� do za�atwienia w zwi�zku z moj� rud�.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_07"); //A Milten i Lester pewnie ukryj� si� w jakim� cichym miejscu i b�d� czeka� na rozw�j wydarze�.
    AI_Output (other, self ,"DIA_PC_THIEF_WSZYSTKO_15_08"); //Cokolwiek si� stanie, �ycz� wam powodzenia w waszych dzia�aniach.
    AI_Output (self, other ,"DIA_PC_THIEF_WSZYSTKO_03_09"); //Ty r�wnie� si� trzymaj, ch�opcze. 
    B_GIVEXP (500);
	B_LogEntry			(CH4_4Friends,		"Spotkanie si� odby�o, a ja sta�em si� jego oficjalnym go�ciem. Diego, Lester, Milten i Gorn przyj�li mnie do swojego tajemniczego kr�gu. To dla mnie wa�ne prze�ycie. Czuj�, �e mog� polega� na tych ludziach i nasze drogi jeszcze nie raz si� skrzy�uj�. Otrzyma�em wspania�e podarki, kt�re z pewno�ci� pomog� mi w moich kolejnych przygodach. Teraz ka�dy musi i�� w swoj� stron�. Tak�e mnie czekaj� nowe wyzywania... "); 
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
   description	= "Zawsze si� tutaj spotykacie?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_CALA_PRAWDA_15_01"); //Zawsze si� tutaj spotykacie?
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_02"); //Zazwyczaj tak, cho� s� jeszcze inne miejsca. 
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_03"); //Jednak teraz kr�ci si� w ich pobli�u zbyt wiele os�b. Ca�e to zamieszanie w Kolonii... Wiesz, jak jest.
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_04"); //Tutaj nikt nie zagl�da. My�liwi boj� si� ork�w oraz nieumar�ych, kt�rzy pono� s� w okolicy.
    AI_Output (other, self ,"DIA_PC_THIEF_CALA_PRAWDA_15_05"); //Spokojnie, grota jest pusta. Zaj�li�my si� ni� z Miltenem. 
    AI_Output (self, other ,"DIA_PC_THIEF_CALA_PRAWDA_03_06"); //Wiedzia�em, �e mo�na na tobie polega�, nawet je�li nie chcesz pom�c, he he.
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
   description	= "Czy mog� ci w czym� pom�c?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_01"); //Czy mog� ci w czym� pom�c?
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_02"); //Owszem. Nie zamierzam odpu�ci� maj�tku i s�awy.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_03"); //Niestety teraz jestem niepo��dan� osob� w Starym Obozie i nie mog� dosta� si� do �rodka.
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_04"); //I co w zwi�zku z tym?
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_05"); //Sta�e� si� pot�ny przyjacielu. Znajd� spos�b na dostanie si� do zamku.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_06"); //Gdy to zrobisz, id� do siedziby Magnat�w i poder�nij Gomezowi gard�o.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_07"); //Przy okazji wy�lij do Beliara jego przydupas�w.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_08"); //Nigdy za nimi jako� nie przepada�em.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_09"); //Wierz mi, wszyscy ludzie na tym skorzystaj�. A z �wiata zostanie usuni�ty kolejny tyran.
    AI_Output (other, self ,"DIA_PC_THIEF_KILL_GOMEZ_15_10"); //Skoro tak, to spr�buj�.
    AI_Output (self, other ,"DIA_PC_THIEF_KILL_GOMEZ_03_11"); //�wietnie.
    MIS_Upadek_Gomeza = LOG_RUNNING;

    Log_CreateTopic            (CH5_Upadek_Gomeza, LOG_MISSION);
    Log_SetTopicStatus       (CH5_Upadek_Gomeza, LOG_RUNNING);
    B_LogEntry                     (CH5_Upadek_Gomeza,"Diego poprosi� mnie, abym znalaz� jaki� spos�b na dostanie si� do zamku w Starym Obozie. Gdy ju� mi si� uda, mam poder�n�� gard�o Gomezowi.");
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
   description	= "W jaki spos�b zosta�e� przyw�dc� Cieni?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_SZEF_CIENI_15_01"); //W jaki spos�b zosta�e� przyw�dc� Cieni?
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_02"); //W bardzo prosty. Gdy mnie tutaj wrzucono, od razu u�y�em ca�ego swego sprytu by do��czy� do Starego Obozu.
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_03"); //W do�� kr�tkim czasie sta�em si� praw� r�k� Greva - by�ego przyw�dcy Cieni.
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_04"); //Po �mierci szefa zaj��em jego miejsce. Ludzie bardzo si� cieszyli z tego powodu.
    AI_Output (other, self ,"DIA_PC_THIEF_SZEF_CIENI_15_05"); //Czemu?
    AI_Output (self, other ,"DIA_PC_THIEF_SZEF_CIENI_03_06"); //Bo Grev nie grzeszy� przebieg�o�ci�. Kierowa� si� g��wnie okrucie�stwem, a jego pomys�y by�y szalone.
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
   description	= "Opowiedz mi wi�cej o Grevu.";
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
    AI_Output (other, self ,"DIA_PC_THIEF_ALFONSO_15_01"); //Opowiedz mi wi�cej o Grevu.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_02"); //By� jednym z przyjaci� samego Gomeza jeszcze z czas�w, gdy nie by�o Bariery.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_03"); //Skumali si� pracuj�c w kopalni, a po wielkim buncie Gomez wyznaczy� go na przyw�dc� Cieni.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_04"); //Jego kariera nie trwa�a jednak d�ugo.
    AI_Output (other, self ,"DIA_PC_THIEF_ALFONSO_15_05"); //Dlaczego?
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_06"); //Pewnego razu totalnie mu odbi�o.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_07"); //Postanowi� przekra�� si� pod os�on� nocy do �wi�tyni Mag�w Ognia i poder�n�� we �nie gard�o samemu Xardasowi.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_08"); //Xardas oczywi�cie na to nie pozwoli�. W�ciek� si� niemi�osiernie.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_09"); //Dorwa� Greva i nie zawaha� si� u�y� na nim swoich czar�w. Huk by�, jakby czarny troll dosta� rui.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_10"); //Nie�le rozsadzi�o biednego Greva. A w�a�ciwe to rozsmarowa�o... Tak, po ca�ym Zewn�trznym Pier�cieniu. 
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_11"); //Xardas oskar�y� o wszystko Thorusa, bo to jego zadaniem by�o pilnowanie porz�dku.
    AI_Output (self, other ,"DIA_PC_THIEF_ALFONSO_03_12"); //Od tamtej pory Thorus ma na pie�ku z magami, mimo �e Xardas wkr�tce po tym opu�ci� Stary Ob�z.
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
   description	= "Co my�lisz o sytuacji w kopalniach?";
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
    AI_Output (other, self ,"DIA_PC_THIEF_MINES_15_01"); //Co my�lisz o sytuacji w kopalniach?
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_02"); //No c�, nie do ko�ca wierz�, �e Stara Kopalnia zawali�a si� w ca�o�ci.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_03"); //Z pewno�ci� zawali�o si� tylko wej�cie, a nap�ywaj�ca do kopalni woda szybko usta�a.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_04"); //Za jaki� czas pewnie b�dzie mo�na z powrotem eksploatowa� z�o�a w Starej Kopalni.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_05"); //Je�eli chodzi o Woln� Kopalni�, to Gomez nie�le namiesza�.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_06"); //Nowy Ob�z nigdy nie chcia� zagarn�� wi�cej kopal� poza w�asn�. Zachowanie Gomeza jest nie w porz�dku, cho� zrozumia�e.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_07"); //Je�li chodzi o Opuszczon� Kopalni�, to nie wiem zbyt wiele.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_08"); //Podobno Stra�nicy odkopali wej�cie i szukaj� z�� rudy.
    AI_Output (self, other ,"DIA_PC_THIEF_MINES_03_09"); //Z tego co wiem zainteresowali si� ni� te� Bandyci Quentina.
};


//#####################################################################################
//####### ROZDZIA� 1
//####### WEJ�CIE DO OBOZU JAKO BANDYTA
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
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_01"); //No nie�le si� wpakowa�e�! Jeste� teraz Bandyt�.
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_WARN_15_02"); //Ciszej, do diab�a!
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_03"); //Pos�uchaj: nie powinno ci� tu by�. Najlepiej pojawiaj si� w Obozie tylko gdy MUSISZ. Mo�esz by� spokojny. 
	AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_04"); //Ja ci� nie wydam, ale Stra�nicy na pewno zaczn� ci� wypytywa� o pancerz. By�oby dobrze, gdyby� go zdejmowa�.
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_05"); //Aha, i jak ju� ci� kto� zapyta to m�w, �e nie masz przynale�no�ci, albo, �e mieszkasz u my�liwych. Cokolwiek byle nie prawd�. I nie pr�buj tu wszczyna� �adnych burd.
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_WARN_03_06"); //Stra�nicy s� ci�ci na Szkodnik�w i Nowicjuszy, ale Bandyt�w nienawidz� i to cholernie nienawidz�. B�d� ostro�ny i pami�taj o czym ci m�wi�em.
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
   description	= "Musz� dosta� si� do zamku. Mo�esz mi pom�c?";
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
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_ZAMEK_15_01"); //Musz� dosta� si� do zamku. Mo�esz mi pom�c?
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_ZAMEK_03_02"); //Jeste� pewien, �e chcesz tam wej��? W zamku a� roi si� od Stra�nik�w.
    AI_Output (other, self ,"DIA_PC_Thief_BANDYTA_ZAMEK_15_03"); //Mimo wszystko musz� tam wej��. Masz jaki� pomys� na przekonanie Stra�nik�w?
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_ZAMEK_03_04"); //Hmm... Mog� porozmawia� z Thorusem, jednak b�d� potrzebowa� 500 bry�ek rudy na poniesienie ewentualnych koszt�w.
	B_LogEntry			(CH1_WejscieDoZamku,"Diego zaproponowa� mi pomoc. Za 500 bry�ek rudy spr�buje za�atwi� mi wst�p.");
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
    AI_Output (self, other ,"DIA_PC_Thief_BANDYTA_PRZEKUPSTWO_GATE_03_02"); //W porz�dku. Zajm� si� wszystkim.
	B_giveinvitems (hero,self, ItMiNugget, 500);
	B_LogEntry			(CH1_WejscieDoZamku,"Zap�aci�em Diego. Ciekawe czy uda mu si� co� wsk�ra�.");
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
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wr��", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wska�nik do�wiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);
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
        PrintScreen	("Wy��czono automatyczne leczenie! ", -1,-1,"font_new_10_red.tga",2);
    }
    else
    {
        AutoHealth = true;
         PrintScreen	("W��czono automatyczne leczenie! ", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    };
	  Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wr��", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wska�nik do�wiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);
};

FUNC VOID DIA_PC_THIEF_CONFIG_EXP_INFO()
{
    if (LicznikExp == true)
    {
        LicznikExp = false;
        PrintScreen	("Wy��czono wska�nik do�wiadczenia! ",-1,-1,"font_new_10_red.tga",2);
    }
    else
    {
        LicznikExp = true;
        PrintScreen	("W��czono wska�nik do�wiadczenia! ", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
    };
  Info_ClearChoices		(DIA_PC_THIEF_CONFIG);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wr��", DIA_PC_THIEF_CONFIG_BACK);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Automatyczne leczenie", DIA_PC_THIEF_CONFIG_AUT_HEAL);
    Info_AddChoice		(DIA_PC_THIEF_CONFIG, "Wska�nik do�wiadczenia", DIA_PC_THIEF_CONFIG_EXP_INFO);

};
