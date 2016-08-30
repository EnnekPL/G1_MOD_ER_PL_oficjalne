// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Chani_EXIT(C_INFO)
{
	npc             = Gur_1205_Chani;
	nr              = 999;
	condition	= DIA_Chani_EXIT_Condition;
	information	= DIA_Chani_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Chani_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Chani_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloChani
//========================================

INSTANCE DIA_Chani_HelloChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 1;
   condition    = DIA_Chani_HelloChani_Condition;
   information  = DIA_Chani_HelloChani_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Chani_HelloChani_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Chani_HelloChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_HelloChani_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Chani_HelloChani_03_02"); //Nazywam si� Chani i jestem jedn� z kobiet Ja�nie O�wieconego.
    AI_Output (self, other ,"DIA_Chani_HelloChani_03_03"); //Tu, w Bractwie �yje nam si� naprawd� dobrze. Mamy wszystko zapewnione, a inni skaza�cy traktuj� nas z szacunkiem.
};

//========================================
//-----------------> CampChani
//========================================

INSTANCE DIA_Chani_CampChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 1;
   condition    = DIA_Chani_CampChani_Condition;
   information  = DIA_Chani_CampChani_Info;
   permanent	= FALSE;
   description	= "Jak trafi�a� do Bractwa?";
};

FUNC INT DIA_Chani_CampChani_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chani_HelloChani))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chani_CampChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_CampChani_15_01"); //Jak trafi�a� do Bractwa?
    AI_Output (self, other ,"DIA_Chani_CampChani_03_02"); //To proste. Po prostu Gomezowi znudzi�a si� moja egzotyczna uroda. Zosta�am oddelegowana tutaj w prezencie.
    AI_Output (self, other ,"DIA_Chani_CampChani_03_03"); //Bractwo prowadzi intensywn� wymian� handlow� z Magnatami. Gomez nie tylko p�aci rud� i towarami z Zewn�trznego �wiata.
    AI_Output (self, other ,"DIA_Chani_CampChani_03_04"); //Czasami p�aci te� kobietami.
};

//========================================
//-----------------> ColonyChani
//========================================

INSTANCE DIA_Chani_ColonyChani (C_INFO)
{
   npc          = Gur_1205_Chani;
   nr           = 2;
   condition    = DIA_Chani_ColonyChani_Condition;
   information  = DIA_Chani_ColonyChani_Info;
   permanent	= FALSE;
   description	= "Jak trafi�a� do Kolonii?";
};

FUNC INT DIA_Chani_ColonyChani_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Chani_HelloChani))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Chani_ColonyChani_Info()
{
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_01"); //Jak trafi�a� do Kolonii?
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_02"); //Pochodz� z dalekiego po�udnia - z jednej z Wysp Po�udniowych.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_03"); //Moja wyspa w przeciwie�stwie do innych region�w, to jedna wielka d�ungla us�ana ruinami.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_04"); //Tam te� si� wychowa�am. Nale�a�am do tak zwanego plemienia Burzowych Kruk�w.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_05"); //W mojej rodzinie nie ma �adnych m�czyzn, tylko same kobiety. Jest nas naprawd� wiele.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_06"); //Atakujemy miasta portowe i wybrze�a g�sto zaludnionych wysp, aby zdoby� jak najwi�cej �up�w.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_07"); //Nazywaj� nas "Paniami Harpii" - dowodzimy tymi stworzeniami, i to my dzi�ki zaawansowanej magii przekszta�ci�y�my nasze siostry w te stworzenia.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_08"); //Wiele harpii jednak uciek�o nam i teraz ten gatunek jest powszechny na ca�ym �wiecie.
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_09"); //To ciekawe... By�em ciekaw jednak...
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_10"); //Hej! Nie przerywaj mi!
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_11"); //Zaraz dojd� do tego, jak trafi�am za Barier�.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_12"); //Pewnej burzowej nocy postanowi�y�my najecha� Bakaresh - �wi�tynne miasto po�o�one w Varrancie.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_13"); //Okaza�o si� jednak, �e ca�a pustynia zosta�a w��czona do Myrtany i wsz�dzie a� roi�o si� od stra�nik�w kr�lewskich.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_14"); //Podobno po kl�sce Gellora i Lukkora podporz�dkowali sobie ca�� pustynie, 
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_15"); //Gdy tylko przyby�y�my do Bakareshu, armia paladyn�w i gwardzist�w ju� na nas czeka�a.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_16"); //Zabili wiele moich si�str i zatopili wszystkie nasze �odzie. Tylko mi i paru moim siostrom uda�o si� prze�y�.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_17"); //Rzuci�am bro� i poprosi�am paladyn�w o lito��. Nie chcia�am sko�czy� z konsekrowanym mieczem w brzuchu.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_18"); //Na szcz�cie ulegli mojemu urokowi i postanowili zabra� mnie do stolicy pod os�d Kr�la.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_19"); //Reszta moich si�str tak�e prze�y�a. Zosta�y oddelegowane do innych varranckich miast jako prezent dla gubernator�w.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_20"); //Rhobar zamkn�� mnie w lochu, a po jakim� miesi�cu zdecydowa� wys�a� mnie do Khorinis, jako prezent dla Gomeza.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_21"); //M�wi�, �e moja egzotyczna uroda z pewno�ci� wywrze na Gomezie wra�enie i b�dzie przysy�a� wi�ksze �adunki rudy.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_22"); //Tak oto trafi�am tutaj.
    AI_Output (other, self ,"DIA_Chani_ColonyChani_15_23"); //Bardzo ciekawa historia.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_24"); //Tak, mam do�� ciekaw� przesz�o��.
    AI_Output (self, other ,"DIA_Chani_ColonyChani_03_25"); //Jednak tutaj nie ma ona znaczenia. W obozie na bagnie ka�dy jest sobie r�wny w tych kwestiach.
};

