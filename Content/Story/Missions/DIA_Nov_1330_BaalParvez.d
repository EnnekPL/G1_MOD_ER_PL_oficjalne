//poprawione i sprawdzone - Nocturn

// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Niech Œni¹cy bêdzie z tob¹, nieznajomy.
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jestem tu, by wskazaæ ci w³aœciw¹ œcie¿kê.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "A która œcie¿ka jest w³aœciwa?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A która œcie¿ka jest w³aœciwa?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Œcie¿ka Œni¹cego, oczywiœcie. Tylko on mo¿e nas st¹d uwolniæ.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru przygotowuj¹ w naszym Obozie rytua³ wielkiego przyzwania. Zamierzaj¹ nawi¹zaæ kontakt ze Œni¹cym.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Do tej pory przemawia³ do nas wy³¹cznie za poœrednictwem wizji, ale ju¿ wkrótce stanie przed nami w pe³ni swej chwa³y.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Jednak aby to osi¹gn¹æ, potrzebujemy jak najwiêkszej rzeszy wyznawców. Jednocz¹c nasze si³y duchowe uda nam siê nawi¹zaæ z nim kontakt.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Nasz Obóz znajduje siê doœæ daleko st¹d - na wielkim bagnie. Mogê ciê tam zaprowadziæ, jeœli chcesz.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co mi przyjdzie z przy³¹czenia siê do was?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co mi przyjdzie z przy³¹czenia siê do was?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Mo¿e oka¿esz siê jednym z wybrañców, którzy otrzymuj¹ od Œni¹cego dar magii.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //A mo¿e dost¹pisz zaszczytu s³u¿by w Œwi¹tynnej Stra¿y. Tylko najlepsi spoœród wojowników mog¹ nale¿eæ do Stra¿ników.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Jeœli Œni¹ce bêdzie ci szczególnie sprzyja³ - mo¿e dane ci bêdzie po³¹czyæ jedno z drugim! Najlepsi Stra¿nicy otrzymuj¹ równie¿ dar magii!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Jak widzisz, nasze Bractwo otwiera przed tob¹ wielkie mo¿liwoœci!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Pamiêtaj o tym zanim zdecydujesz siê przy³¹czyæ do któregoœ z innych obozów!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest Œni¹cy?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Œni¹cy przemawia do nas poprzez sny i wizje.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Przewodzi nam odk¹d nawi¹za³ pierwszy kontakt z Y'Berionem, piêæ lat temu.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Wszyscy wyznawcy Bractwa wyrzekli siê trzech bogów. Teraz modlimy siê o zbawienie tylko do Œni¹cego.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Zbawienie od czego?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tego przeklêtego miejsca, naturalnie! Œni¹cy wska¿e nam drogê do wolnoœci!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co powiedzia³ wam Œni¹cy?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co powiedzia³ wam Œni¹cy?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Zaprowadzi³ nas na bagna, na ruiny starej œwi¹tyni. Tam zbudowaliœmy nasz Obóz.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Da³ nam niezale¿noœæ - ¿aden z nas nie musi pracowaæ pod ziemi¹.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Pokaza³ nam jaka moc drzemie w bagiennym zielu. Teraz sprzedajemy je innym obozom, otrzymuj¹c w zamian wszystko, czego nam potrzeba.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Wreszcie obdarzy³ niektórych z nas darem magii. Magii staro¿ytnej i potê¿nej. Ró¿nej od tej, któr¹ wykorzystywali dot¹d magowie tego królestwa.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o magii Œni¹cego.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Opowiedz mi jeszcze o magii Œni¹cego.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Magia Œni¹cego pozwala ci kontrolowaæ rzeczy si³¹ twojej woli.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Jednak tylko wtajemniczeni Guru poznali tajniki tej magii.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 0;
	description = "ZaprowadŸ mnie do waszego Obozu. Chcia³bym siê tam rozejrzeæ.";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //ZaprowadŸ mnie do waszego Obozu. Chcia³bym siê tam rozejrzeæ.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
			B_LogEntry				(CH1_JoinPsi, "Baal Parvez jest wys³annikiem Obozu Bractwa. Kr¹¿y po Starym Obozie werbuj¹c nowych cz³onków Sekty. Mo¿e mnie zaprowadziæ do obozu na bagnie, gdzie rezyduj¹ wyznawcy ŒNI¥CEGO!");
		};
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //To wspaniale. ChodŸ za mn¹!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	B_SetPermAttitude	(self,	ATT_FRIENDLY);
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Jesteœmy na miejscu. Tam le¿y obóz Bractwa Œni¹cego.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Nie spieszy³eœ siê zbytnio, bracie! Przed nami obóz wyznawców Œni¹cego!
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //PrzejdŸ przez bramê i porozmawiaj z moimi braæmi. Gwarantujê ci, ¿e nie przyszed³eœ tu na pró¿no.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zapytaj o Cor Kaloma. To on opiekuje siê Nowicjuszami.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Ja wrócê teraz do Starego Obozu. Wielu niewiernych potrzebuje wci¹¿ pomocy w odnalezieniu w³aœciwej œcie¿ki.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Powodzenia!

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_SetPermAttitude	(self,	ATT_NEUTRAL);
	B_LogEntry	(CH1_JoinPsi, "Przede mn¹ rozci¹ga siê obóz Bractwa. Mój przewodnik poradzi³ mi, bym odwiedzi³ niejakiego Cor Kaloma. To opiekun wszystkich nowoprzyby³ych.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	self.flags = 0;
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_BaalParvez_WhatsTroubles (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_WhatsTroubles_Condition;
	information	= DIA_BaalParvez_WhatsTroubles_Info;
	permanent	= 0;
	description = "Joru powiedzia³, ¿e potrzebujesz tu pomocy.";
};                       

FUNC int DIA_BaalParvez_WhatsTroubles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Joru_ParvezInTroubles))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalParvez_WhatsTroubles_Info()
{
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_00"); //Joru powiedzia³, ¿e potrzebujesz tu pomocy.
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_01"); //Tak. Ktoœ w Obozie nie pa³a zbytni¹ sympati¹ do nas, wyznawców Œni¹cego, do tego stopnia, ¿e na ka¿dym kroku wyrz¹dza mi du¿e szkody uniemo¿liwiaj¹ce normalne prowadzenie nauk.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_02"); //Nie próbowa³eœ rozpracowaæ tego wandala?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_03"); //Obawiam siê, ¿e to z³o ma wiele twarzy. Jest ich co najmniej kilku. Potrafi¹ wyrz¹dzaæ szkody naraz w kilku miejscach. Dlatego nigdy nie mog³em ich powstrzymaæ.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_04"); //Mam byæ twoim stró¿em?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_05"); //Nie. Gdy ktoœ atakuje nas, atakuje tak¿e Œni¹cego, dlatego nie mo¿emy siê jedynie broniæ. Czas ruszyæ z inicjatyw¹.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_06"); //Mianowicie?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_07"); //W obozie znajduje siê parê osób, które mog¹ rozsiewaæ ró¿ne informacje. Chodzi mi o zwyk³ych plotkarzy, takich jak kucharz Snaf i Kopacz Gravo.
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_08"); //Pierwszy cieszy siê poparciem Cieni i Kopaczy. Drugi natomiast zaskarbi³ sobie szacunek Stra¿ników, a nawet Magnatów. Wykorzystamy to.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_09"); //Jak dok³adnie?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_10"); //Udasz siê do Snafa i Gravo. Dasz im trochê rudy, by nagadali ludziom, ¿e posiadam w skrzyni cenne artefakty z Bractwa. Te ³obuzy na pewno siê na to z³api¹. 
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_11"); //Gdy uderz¹, dowiemy siê kim s¹. 
	
	B_LogEntry(CH1_ParvezInTroubles, "Baal Parvez faktycznie ma k³opoty. Ktoœ niszczy rzeczy Nowicjusza i wysy³a mu pogró¿ki. Parvez ma jednak pomys³ jak ustaliæ kto za tym stoi. Mam siê udaæ do Snafa i Gravo, aby rozsiali plotkê o rzekomo przys³anych Parvezowi cennych artefaktach z Bractwa. Baal jest pewien, ¿e jego przeœladowcy nie odrzuc¹ okazji na dodatkowy zarobek.");
};

instance DIA_BaalParvez_RumorAnnounced (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_RumorAnnounced_Condition;
	information	= DIA_BaalParvez_RumorAnnounced_Info;
	permanent	= 0;
	description = "Rozmawia³em ze Snafem i Gravo.";
};                       

FUNC int DIA_BaalParvez_RumorAnnounced_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Snaf_FakeRumorGiveOre) && Npc_KnowsInfo(hero, DIA_Gravo_FakeRumorGiveOre))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalParvez_RumorAnnounced_Info()
{
	AI_Output(other, self, "DIA_BaalParvez_RumorAnnounced_15_00"); //Rozmawia³em ze Snafem i Gravo.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_01"); //Znakomicie. Wróg naszej sprawy wie ju¿ to co chcemy, teraz pora zastawiæ pu³apkê. Gdy zapadnie zmrok, udaj siê w pobli¿e mojego kufra.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_02"); //Miej oczy szeroko otwarte, bo zapewne poznasz odpowiedŸ, kto œmie opluwaæ kult Œni¹cego. 
	AI_Output(other, self, "DIA_BaalParvez_RumorAnnounced_15_03"); //Zatem popilnuje noc¹ tego kufra.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_04"); //Uwa¿aj na siebie, bracie.
	
	B_LogEntry(CH1_ParvezInTroubles, "Po zmroku mam siê udaæ na plac targowy i staæ przy kufrze Baal Parveza. Bandziory, które go przeœladujê z pewnoœci¹ siê tam pojawi¹. ");
	
	Npc_ExchangeRoutine (STT_319_Schatten,"parvez");
	Npc_ExchangeRoutine (VLK_576_Buddler,"parvez");
	Npc_ExchangeRoutine (VLK_510_Buddler,"parvez");
};

instance DIA_BaalParvez_FoundOrderFromBloodwyn (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_FoundOrderFromBloodwyn_Condition;
	information	= DIA_BaalParvez_FoundOrderFromBloodwyn_Info;
	permanent	= 0;
	description = "Wiem ju¿ wszystko!";
};                       

FUNC int DIA_BaalParvez_FoundOrderFromBloodwyn_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_319_Schatten_Caught) && Npc_HasItems(other, ItMi_Bloodwyns_Order))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalParvez_FoundOrderFromBloodwyn_Info()
{
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_00"); //Wiem ju¿ wszystko!
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_01"); //Zatem mów.
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_02"); //Za wszystkim stoi Stra¿nik o imieniu Bloodwyn. Nie podoba mu siê, ¿e Bractwo stara siê zwerbowaæ Kopaczy, którzy p³ac¹ mu za ochronê.
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_03"); //Razem z ludŸmi traci³by równie¿ rudê, dlatego postara³ siê byœ opuœci³ Obóz.
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_04"); //Masz na to jakieœ materialne dowody?
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_05"); //Tak, mam jego rozkazy. Znalaz³em je przy twoich oprawcach.
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_06"); //WeŸ to pismo i udaj siê do Thorusa. Masz powiedzieæ, ¿e jeœli nie ukarze Bloodywna to Bractwo nie bêdzie d³u¿ne Staremu Obozowi.
	
	B_LogEntry(CH1_ParvezInTroubles, "Parvez dowiedzia³ siê o planach Bloodwyna. Teraz mam udaæ siê do Thorusa, by ukara³ Stra¿nika.");
};

instance DIA_BaalParvez_TroublesSolved (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_TroublesSolved_Condition;
	information	= DIA_BaalParvez_TroublesSolved_Info;
	permanent	= 0;
	description = "Rozmawia³em z Thorusem. Wygl¹da na to, ¿e problem zosta³ rozwi¹zany.";
};                       

FUNC int DIA_BaalParvez_TroublesSolved_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Thorus_BloodwynsOrder))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalParvez_TroublesSolved_Info()
{
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_00"); //Rozmawia³em z Thorusem. Wygl¹da na to, ¿e problem zosta³ rozwi¹zany.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_01"); //Chwa³a Œni¹cemu! Brawo, okaza³eœ mi zrozumienie i pomoc.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_02"); //Dlatego przyjmij ten datek na twoj¹ dalsz¹ dzia³alnoœæ, bracie. Kup za te rudê orê¿, którym bêdziesz rani³ wrogów Œni¹cego.
	
	CreateInvItems(self, ItMiNugget,200);
	B_GiveInvItems(self, other, ItMiNugget, 200);
	
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_03"); //Dziêkuje, myœlê, ¿e mi siê przyda.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_04"); //Uwa¿aj na siebie. Niech Œni¹cy ma ciê w swojej opiece.
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_05"); //Do zobaczenia.

	MIS_ParvezInTroubles = LOG_SUCCESS;

   Log_SetTopicStatus(CH1_ParvezInTroubles, LOG_SUCCESS);
	B_LogEntry(CH1_ParvezInTroubles, "Rozwi¹za³em problemy Baal Parveza. Otrzyma³em w nagrodê ca³kiem pokaŸn¹ liczbê bry³ek rudy.");
	
	B_GiveXP (325);
};