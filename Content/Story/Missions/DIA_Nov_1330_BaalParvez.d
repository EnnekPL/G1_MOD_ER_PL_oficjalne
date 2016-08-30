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
//					Erste Begr�ssung
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
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Niech �ni�cy b�dzie z tob�, nieznajomy.
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jestem tu, by wskaza� ci w�a�ciw� �cie�k�.
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
	description = "A kt�ra �cie�ka jest w�a�ciwa?";
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
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A kt�ra �cie�ka jest w�a�ciwa?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //�cie�ka �ni�cego, oczywi�cie. Tylko on mo�e nas st�d uwolni�.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru przygotowuj� w naszym Obozie rytua� wielkiego przyzwania. Zamierzaj� nawi�za� kontakt ze �ni�cym.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Do tej pory przemawia� do nas wy��cznie za po�rednictwem wizji, ale ju� wkr�tce stanie przed nami w pe�ni swej chwa�y.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Jednak aby to osi�gn��, potrzebujemy jak najwi�kszej rzeszy wyznawc�w. Jednocz�c nasze si�y duchowe uda nam si� nawi�za� z nim kontakt.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Nasz Ob�z znajduje si� do�� daleko st�d - na wielkim bagnie. Mog� ci� tam zaprowadzi�, je�li chcesz.
};

// **************************************************
//					Vorteile f�r mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co mi przyjdzie z przy��czenia si� do was?";
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
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co mi przyjdzie z przy��czenia si� do was?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Mo�e oka�esz si� jednym z wybra�c�w, kt�rzy otrzymuj� od �ni�cego dar magii.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //A mo�e dost�pisz zaszczytu s�u�by w �wi�tynnej Stra�y. Tylko najlepsi spo�r�d wojownik�w mog� nale�e� do Stra�nik�w.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Je�li �ni�ce b�dzie ci szczeg�lnie sprzyja� - mo�e dane ci b�dzie po��czy� jedno z drugim! Najlepsi Stra�nicy otrzymuj� r�wnie� dar magii!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Jak widzisz, nasze Bractwo otwiera przed tob� wielkie mo�liwo�ci!
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Pami�taj o tym zanim zdecydujesz si� przy��czy� do kt�rego� z innych oboz�w!
};

// **************************************************
//					Schl�fer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest �ni�cy?";
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
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //�ni�cy przemawia do nas poprzez sny i wizje.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Przewodzi nam odk�d nawi�za� pierwszy kontakt z Y'Berionem, pi�� lat temu.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Wszyscy wyznawcy Bractwa wyrzekli si� trzech bog�w. Teraz modlimy si� o zbawienie tylko do �ni�cego.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Zbawienie od czego?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tego przekl�tego miejsca, naturalnie! �ni�cy wska�e nam drog� do wolno�ci!
};

// **************************************************
//			Was hat Schl�fer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co powiedzia� wam �ni�cy?";
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
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co powiedzia� wam �ni�cy?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Zaprowadzi� nas na bagna, na ruiny starej �wi�tyni. Tam zbudowali�my nasz Ob�z.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Da� nam niezale�no�� - �aden z nas nie musi pracowa� pod ziemi�.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Pokaza� nam jaka moc drzemie w bagiennym zielu. Teraz sprzedajemy je innym obozom, otrzymuj�c w zamian wszystko, czego nam potrzeba.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Wreszcie obdarzy� niekt�rych z nas darem magii. Magii staro�ytnej i pot�nej. R�nej od tej, kt�r� wykorzystywali dot�d magowie tego kr�lestwa.
};

// **************************************************
//		Erz�hl mir von der MAgie des Schl�fers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o magii �ni�cego.";
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
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Opowiedz mi jeszcze o magii �ni�cego.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Magia �ni�cego pozwala ci kontrolowa� rzeczy si�� twojej woli.
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
	description = "Zaprowad� mnie do waszego Obozu. Chcia�bym si� tam rozejrze�.";
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
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Zaprowad� mnie do waszego Obozu. Chcia�bym si� tam rozejrze�.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi, "Baal Parvez jest wys�annikiem Obozu Bractwa. Kr��y po Starym Obozie werbuj�c nowych cz�onk�w Sekty. Mo�e mnie zaprowadzi� do obozu na bagnie, gdzie rezyduj� wyznawcy �NI�CEGO!");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //To wspaniale. Chod� za mn�!
	
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
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Jeste�my na miejscu. Tam le�y ob�z Bractwa �ni�cego.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Nie spieszy�e� si� zbytnio, bracie! Przed nami ob�z wyznawc�w �ni�cego!
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Przejd� przez bram� i porozmawiaj z moimi bra�mi. Gwarantuj� ci, �e nie przyszed�e� tu na pr�no.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zapytaj o Cor Kaloma. To on opiekuje si� Nowicjuszami.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Ja wr�c� teraz do Starego Obozu. Wielu niewiernych potrzebuje wci�� pomocy w odnalezieniu w�a�ciwej �cie�ki.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Powodzenia!

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_SetPermAttitude	(self,	ATT_NEUTRAL);
	B_LogEntry	(CH1_JoinPsi, "Przede mn� rozci�ga si� ob�z Bractwa. M�j przewodnik poradzi� mi, bym odwiedzi� niejakiego Cor Kaloma. To opiekun wszystkich nowoprzyby�ych.");
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
	description = "Joru powiedzia�, �e potrzebujesz tu pomocy.";
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
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_00"); //Joru powiedzia�, �e potrzebujesz tu pomocy.
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_01"); //Tak. Kto� w Obozie nie pa�a zbytni� sympati� do nas, wyznawc�w �ni�cego, do tego stopnia, �e na ka�dym kroku wyrz�dza mi du�e szkody uniemo�liwiaj�ce normalne prowadzenie nauk.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_02"); //Nie pr�bowa�e� rozpracowa� tego wandala?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_03"); //Obawiam si�, �e to z�o ma wiele twarzy. Jest ich co najmniej kilku. Potrafi� wyrz�dza� szkody naraz w kilku miejscach. Dlatego nigdy nie mog�em ich powstrzyma�.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_04"); //Mam by� twoim str�em?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_05"); //Nie. Gdy kto� atakuje nas, atakuje tak�e �ni�cego, dlatego nie mo�emy si� jedynie broni�. Czas ruszy� z inicjatyw�.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_06"); //Mianowicie?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_07"); //W obozie znajduje si� par� os�b, kt�re mog� rozsiewa� r�ne informacje. Chodzi mi o zwyk�ych plotkarzy, takich jak kucharz Snaf i Kopacz Gravo.
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_08"); //Pierwszy cieszy si� poparciem Cieni i Kopaczy. Drugi natomiast zaskarbi� sobie szacunek Stra�nik�w, a nawet Magnat�w. Wykorzystamy to.
	AI_Output(other, self, "DIA_BaalParvez_WhatsTroubles_15_09"); //Jak dok�adnie?
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_10"); //Udasz si� do Snafa i Gravo. Dasz im troch� rudy, by nagadali ludziom, �e posiadam w skrzyni cenne artefakty z Bractwa. Te �obuzy na pewno si� na to z�api�. 
	AI_Output(self, other, "DIA_BaalParvez_WhatsTroubles_10_11"); //Gdy uderz�, dowiemy si� kim s�. 
	
	B_LogEntry(CH1_ParvezInTroubles, "Baal Parvez faktycznie ma k�opoty. Kto� niszczy rzeczy Nowicjusza i wysy�a mu pogr�ki. Parvez ma jednak pomys� jak ustali� kto za tym stoi. Mam si� uda� do Snafa i Gravo, aby rozsiali plotk� o rzekomo przys�anych Parvezowi cennych artefaktach z Bractwa. Baal jest pewien, �e jego prze�ladowcy nie odrzuc� okazji na dodatkowy zarobek.");
};

instance DIA_BaalParvez_RumorAnnounced (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_RumorAnnounced_Condition;
	information	= DIA_BaalParvez_RumorAnnounced_Info;
	permanent	= 0;
	description = "Rozmawia�em ze Snafem i Gravo.";
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
	AI_Output(other, self, "DIA_BaalParvez_RumorAnnounced_15_00"); //Rozmawia�em ze Snafem i Gravo.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_01"); //Znakomicie. Wr�g naszej sprawy wie ju� to co chcemy, teraz pora zastawi� pu�apk�. Gdy zapadnie zmrok, udaj si� w pobli�e mojego kufra.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_02"); //Miej oczy szeroko otwarte, bo zapewne poznasz odpowied�, kto �mie opluwa� kult �ni�cego. 
	AI_Output(other, self, "DIA_BaalParvez_RumorAnnounced_15_03"); //Zatem popilnuje noc� tego kufra.
	AI_Output(self, other, "DIA_BaalParvez_RumorAnnounced_10_04"); //Uwa�aj na siebie, bracie.
	
	B_LogEntry(CH1_ParvezInTroubles, "Po zmroku mam si� uda� na plac targowy i sta� przy kufrze Baal Parveza. Bandziory, kt�re go prze�laduj� z pewno�ci� si� tam pojawi�. ");
	
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
	description = "Wiem ju� wszystko!";
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
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_00"); //Wiem ju� wszystko!
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_01"); //Zatem m�w.
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_02"); //Za wszystkim stoi Stra�nik o imieniu Bloodwyn. Nie podoba mu si�, �e Bractwo stara si� zwerbowa� Kopaczy, kt�rzy p�ac� mu za ochron�.
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_03"); //Razem z lud�mi traci�by r�wnie� rud�, dlatego postara� si� by� opu�ci� Ob�z.
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_04"); //Masz na to jakie� materialne dowody?
	AI_Output(other, self, "DIA_BaalParvez_FoundOrderFromBloodwyn_15_05"); //Tak, mam jego rozkazy. Znalaz�em je przy twoich oprawcach.
	AI_Output(self, other, "DIA_BaalParvez_FoundOrderFromBloodwyn_10_06"); //We� to pismo i udaj si� do Thorusa. Masz powiedzie�, �e je�li nie ukarze Bloodywna to Bractwo nie b�dzie d�u�ne Staremu Obozowi.
	
	B_LogEntry(CH1_ParvezInTroubles, "Parvez dowiedzia� si� o planach Bloodwyna. Teraz mam uda� si� do Thorusa, by ukara� Stra�nika.");
};

instance DIA_BaalParvez_TroublesSolved (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_TroublesSolved_Condition;
	information	= DIA_BaalParvez_TroublesSolved_Info;
	permanent	= 0;
	description = "Rozmawia�em z Thorusem. Wygl�da na to, �e problem zosta� rozwi�zany.";
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
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_00"); //Rozmawia�em z Thorusem. Wygl�da na to, �e problem zosta� rozwi�zany.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_01"); //Chwa�a �ni�cemu! Brawo, okaza�e� mi zrozumienie i pomoc.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_02"); //Dlatego przyjmij ten datek na twoj� dalsz� dzia�alno��, bracie. Kup za te rud� or�, kt�rym b�dziesz rani� wrog�w �ni�cego.
	
	CreateInvItems(self, ItMiNugget,200);
	B_GiveInvItems(self, other, ItMiNugget, 200);
	
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_03"); //Dzi�kuje, my�l�, �e mi si� przyda.
	AI_Output(self, other, "DIA_BaalParvez_TroublesSolved_10_04"); //Uwa�aj na siebie. Niech �ni�cy ma ci� w swojej opiece.
	AI_Output(other, self, "DIA_BaalParvez_TroublesSolved_15_05"); //Do zobaczenia.

	MIS_ParvezInTroubles = LOG_SUCCESS;

   Log_SetTopicStatus(CH1_ParvezInTroubles, LOG_SUCCESS);
	B_LogEntry(CH1_ParvezInTroubles, "Rozwi�za�em problemy Baal Parveza. Otrzyma�em w nagrod� ca�kiem poka�n� liczb� bry�ek rudy.");
	
	B_GiveXP (325);
};