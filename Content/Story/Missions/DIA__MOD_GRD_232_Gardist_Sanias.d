
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Gardist232_EXIT(C_INFO)
{
	npc             = GRD_232_Gardist;
	nr              = 999;
	condition		= DIA_Gardist232_EXIT_Condition;
	information		= DIA_Gardist232_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Gardist232_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Gardist232_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY1 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY1_Condition;
   information  = DIA_Gardist_NIEPOKORNY1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY1_Condition()
{
    if (hero.guild == gil_stt)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY1_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_01"); //Powinni�my porozmawia�.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_03"); //Niedawno do naszego Obozu trafi� pewien cz�owiek imieniem Oned, do��czy� do Kopaczy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_04"); //I co w tym z�ego?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_05"); //Ten palant nie zamierza p�aci� Stra�nikom podatku od bezpiecze�stwa. My�li, �e sam da sobie tu rad�.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_06"); //Czemu wi�c Stra�nicy nie obij� mu porz�dnie pyska?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_07"); //Wkr�tce do tego dojdzie, o ile nic si� nie zmieni. Ale lepiej by�oby gdyby Stra�nicy go nie katowali.
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_08"); //Reszta Kopaczy uzna�aby go za bohatera i pewnie odbi�oby si� to na wydajno�ci ich pracy. 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_09"); //No to jak da� Onedowi nauczk�? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_10"); //C� proponuje ci niez�� sumk� za za�atwienie tej sprawy w odpowiedni spos�b.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_11"); //Masz jakie� wskaz�wki?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY1_03_12"); //Oned przyja�ni si� z niejakim Lothem. Mo�e gdyby go przekona� do naszych intencji to Oned z �atwo�ci� wpad�by w nasze �apy.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY1_15_13"); //Porozmawiam z nim.
    MIS_Niepokorny_Kopacz = LOG_RUNNING;

    Log_CreateTopic          	(CH1_Niepokorny_Kopacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_RUNNING);
    B_LogEntry               		(CH1_Niepokorny_Kopacz,"Zaczepi� mnie Sanias i zleci� pewne zadanie. W Starym Obozie pojawi� si� skazaniec imieniem Oned. Typ jest odwa�ny i nie ma zamiaru p�aci� Stra�nikom za ochron�. Sanias chce to zmieni�, jednak Stra�nicy nie mog� tak po prostu pobi� Oneda. Trzeba to zrobi� r�kami innych Kopaczy. Mam porozmawia� z Lothem, kt�ry kumpluje si� z Onedem. By� mo�e on przem�wi nowemu do rozs�dku zanim stanie mu si� co� z�ego.");
};


//========================================
//-----------------> NIEPOKORNY2
//========================================

INSTANCE DIA_Gardist_NIEPOKORNY2 (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_NIEPOKORNY2_Condition;
   information  = DIA_Gardist_NIEPOKORNY2_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Gardist_NIEPOKORNY2_Condition()
{
    if (NiepokornyKopacz < Wld_GetDay())
    && (Npc_KnowsInfo (hero, DIA_Buddler_BuddlersPaid))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gardist_NIEPOKORNY2_Info()
{
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_01"); //S�ysza�e�?! 
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_02"); //O czym?
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_03"); //O �omocie jaki dosta� Oned. Nast�pnego dnia zap�aci� Stra�nikom i wygl�da na to, �e b�dzie to ju� robi� regularnie.
    AI_Output (other, self ,"DIA_Gardist_NIEPOKORNY2_15_04"); //Zatem mi si� uda�o. A skoro tak, to jeste� mi co� winien, czy� nie? 
    AI_Output (self, other ,"DIA_Gardist_NIEPOKORNY2_03_05"); //Oczywi�cie, oto twoja nagroda. W pe�ni na ni� zas�u�y�e�.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Rozliczy�em si� z Saniasem. By� zadowolony z takiego obrotu spraw. ");
    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_SUCCESS);
    MIS_Niepokorny_Kopacz = LOG_SUCCESS;

	CreateInvItems (self, itminugget,40);
	B_GiveInvItems (self,other,itminugget,40);
    B_GiveXP (100);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Gardist_Hello (C_INFO)
{
   npc          = GRD_232_Gardist;
   nr           = 1;
   condition    = DIA_Gardist_Hello_Condition;
   information  = DIA_Gardist_Hello_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Gardist_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gardist_Hello_Info()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_02"); //Wo�aj� na mnie Sanias.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_03"); //To nie jest twoje prawdziwe imi�?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_04"); //Nie. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_05"); //Wi�c jak naprawd� masz na imi�? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_06"); //Nie wiem.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_07"); //Jak to nie wiesz?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_08"); //Mia�em trudne dzieci�stwo. Niezbyt wiele z niego pami�tam.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_09"); //Nie pami�tam chocia�by mojej prawdziwej rodziny. Podobno jaki� wie�niak znalaz� mnie w lesie, gdy mia�em zaledwie cztery lata.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_10"); //Prawdopodobnie mieszka�em wcze�niej wraz z rodzicami w lesie. My�l�, �e mogli by� banitami. A m�j dom sp�on�� w po�arze. 
    AI_Output (other, self ,"DIA_Gardist_Hello_15_11"); //My�la�em, �e ma�o pami�tasz. Sk�d o tym wszystkim wiesz?
    AI_Output (self, other ,"DIA_Gardist_Hello_03_12"); //Gdy doros�em, pozna�em szczeg�y tajemniczego odnalezienia. Kilkana�cie metr�w od miejsca w kt�rym le�a�em stadko wilk�w po�ar�o jak�� kobiet�.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_13"); //My�l�, �e to mog�a by� moja matka. Ch�opi oczywi�cie zabili wilki i obejrzeli cia�o. Ubranie by�o ca�e okopcone i ubrudzone w sadzy. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_14"); //Ucieka�a z po�aru i zabra�a mnie ze sob�. Jednak napad�y j� wilki. Ja prze�y�em, a ona nie. Ocali�a mi �ycie.
    AI_Output (other, self ,"DIA_Gardist_Hello_15_15"); //Wspania�e po�wi�cenie. A wiesz co� na temat ojca? 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_16"); //Oczywi�cie ta sprawa nie dawa�a mi spokoju. Gdy mia�em ju� dwadzie�cia pi�� wiosen na karku poprosi�em, aby zaprowadzono mnie w miejsce, w kt�rym mnie znaleziono. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_17"); //Niech�tnie, ale uda�o mi si� przekona� do tego mojego starego, przybranego wuja. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_18"); //Gdy dotarli�my na miejsce, ruszy�em na samotn� w�dr�wk� w g��b lasu. By�a to puszcza niezbadana, a wie�niacy znali wy��cznie jej obrze�a.
    AI_Output (self, other ,"DIA_Gardist_Hello_03_19"); //Po godzinie drogi wg��b, w�r�d identycznych drzew w ko�cu natrafi�em na co�, co przypomina�o pogorzelisko sprzed wielu lat. 
    AI_Output (self, other ,"DIA_Gardist_Hello_03_20"); //To musia� by� m�j dom. Znalaz�em tam kilka spalonych ludzkich ko�ci. Mo�esz si� domy�la� do kogo nale�a�y.

    Info_ClearChoices		(DIA_Gardist_Hello);
    Info_AddChoice		(DIA_Gardist_Hello, DIALOG_BACK, DIA_Gardist_Hello_BACK);
    Info_AddChoice		(DIA_Gardist_Hello, "To przykre.", DIA_Gardist_Hello_Sorry);
};

FUNC VOID DIA_Gardist_Hello_BACK()
{
    Info_ClearChoices		(DIA_Gardist_Hello);
};

FUNC VOID DIA_Gardist_Hello_Sorry()
{
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_01"); //To przykre.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_02"); //Dzi�ki. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_03"); //Po odkryciu tej tajemnicy ogarn�� mnie tak g��boki �al, �e zacz��em dzie� w dzie� spija� si� w karczmie.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_04"); //Moja przybrana rodzina i przyjaciele zostawili mnie. Wpad�em wi�c w z�e towarzystwo.
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_05"); //P�niej dopu�ci�em si� b�jki w dzielnicy portowej. B�jki ze skutkiem �miertelnym dla mojego oponenta. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_06"); //Ale to stare dzieje.
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_07"); //Nie zawsze wszystko si� uk�ada tak, jak chcemy. 
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_08"); //Hej, opowiedzia�em ci sporo o sobie, a nawet nie wiem jak masz na imi�. 
    AI_Output (other, self ,"DIA_Gardist_Hello_Sorry_15_09"); //Jestem...
    AI_Output (self, other ,"DIA_Gardist_Hello_Sorry_03_10"); //A zreszt� zaczekaj, nie m�w. Czym s� imiona wobec pot�gi przeznaczenia? Mo�esz zmieni� imi�, a przeznaczenia i tak nie odmienisz. 
    Info_ClearChoices		(DIA_Gardist_Hello);
};

