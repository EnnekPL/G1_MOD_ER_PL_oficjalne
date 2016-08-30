//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Schatten_EXIT(C_INFO)
{
	npc             = STT_316_Schatten;
	nr              = 999;
	condition		= DIA_Schatten_EXIT_Condition;
	information		= DIA_Schatten_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Schatten_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Schatten_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> RonosHelp
//========================================

INSTANCE DIA_Schatten_RonosHelp (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 1;
   condition    = DIA_Schatten_RonosHelp_Condition;
   information  = DIA_Schatten_RonosHelp_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Schatten_RonosHelp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_GivePlate))
    && (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_RonosHelp_Info()
{
    AI_Output (self, other ,"DIA_Schatten_RonosHelp_03_01"); //Pomog�e� Rono. To m�j przyjaciel. Jestem ci wdzi�czny. D�ugo m�czyli�my si� z t� skrzyni�.
    AI_Output (self, other ,"DIA_Schatten_RonosHelp_03_02"); //My�l�, �e jeste� w porz�dku. Jak spotkam Diego, to szepn� mu s��wko o tobie. 
    AI_StopProcessInfos	(self);
	
	B_LogEntry (CH1_JoinOC,"Relghar faktycznie poprze mnie u Diego.");
};

//========================================
//-----------------> WhoTou
//========================================

INSTANCE DIA_Schatten_WhoTou (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 2;
   condition    = DIA_Schatten_WhoTou_Condition;
   information  = DIA_Schatten_WhoTou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Schatten_WhoTou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_WhoTou_Info()
{
    AI_Output (other, self ,"DIA_Schatten_WhoTou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Schatten_WhoTou_03_02"); //Nazywam si� Relghar. Zes�any za rozb�j na kupcu.
};


//========================================
//-----------------> Porady
//========================================

INSTANCE DIA_Schatten_Porady (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 3;
   condition    = DIA_Schatten_Porady_Condition;
   information  = DIA_Schatten_Porady_Info;
   permanent	= FALSE;
   description	= "Masz dla mnie jakie� rady?";
};

FUNC INT DIA_Schatten_Porady_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_Porady_Info()
{
    AI_Output (other, self ,"DIA_Schatten_Porady_15_01"); //Masz dla mnie jakie� rady?
    AI_Output (self, other ,"DIA_Schatten_Porady_03_02"); //Je�li chcesz tutaj prze�y�, musisz mie� dobr� bro� i tyle pancerza ile zdo�asz unie��. A, i unikaj od k�opot�w. Mo�e jeszcze ze dwa zakl�cia jak nie masz na co wydawa� rudy. 
    AI_Output (self, other ,"DIA_Schatten_Porady_03_03"); //Pami�taj, by �wiczy� swoje umiej�tno�ci. Tylko nie wewn�trz mur�w Starego Obozu, bo nie potrzebujemy tu rozr�b. 
    AI_Output (self, other ,"DIA_Schatten_Porady_03_04"); //Najlepiej u�yj sobie na tych pata�achach z Nowego Obozu - oni nie maj� tu �adnych praw.
};


//========================================
//-----------------> STTGuild
//========================================

INSTANCE DIA_Schatten_STTGuild (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 4;
   condition    = DIA_Schatten_STTGuild_Condition;
   information  = DIA_Schatten_STTGuild_Info;
   permanent	= FALSE;
   description	= "Chcia�bym do��czy� do Cieni.";
};

FUNC INT DIA_Schatten_STTGuild_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NONE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_STTGuild_Info()
{
    AI_Output (other, self ,"DIA_Schatten_STTGuild_15_01"); //Chcia�bym do��czy� do Cieni.
    AI_Output (self, other ,"DIA_Schatten_STTGuild_03_02"); //S�u�ba w imi� Gomeza to nie przelewki. Nikt ci� nie b�dzie tu prowadzi� za r�czk�. Diego ci� nie przyjmie, je�eli nie b�dzie pewny, �e podo�asz naszym zadaniom. 
    AI_Output (self, other ,"DIA_Schatten_STTGuild_03_03"); //Je�li nie masz do�� sprytu umiej�tno�ci, to nie masz nawet po co si� stara�. 
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Schatten_HELLO5 (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 5;
   condition    = DIA_Schatten_HELLO5_Condition;
   information  = DIA_Schatten_HELLO5_Info;
   permanent	= FALSE;
   description	= "Powiesz mi jeszcze co� ciekawego?";
};

FUNC INT DIA_Schatten_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Schatten_Porady))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Schatten_HELLO5_15_01"); //Powiesz mi jeszcze co� ciekawego?
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_02"); //Jak b�dziesz potrzebowa� dobrego �uku, lub strza�, przejd� si� do Cavalorna. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_03"); //To jeden z Cieni, kt�remu Diego powierzy� zadanie kontrolowania jednej z dr�g wiod�cych do Nowego Obozu. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_04"); //My�l� jednak, �e ten lis po prostu chcia� sobie ca�ymi dniami polowa� i przekona� szefa, �e trzeba wys�a� zwiadowc� w tamt� okolic�. 
    AI_Output (self, other ,"DIA_Schatten_HELLO5_03_05"); //Pewnie siedzi sobie teraz w starej chacie po Garlanie. 
};


//========================================
//-----------------> Galran
//========================================

INSTANCE DIA_Schatten_Galran (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 6;
   condition    = DIA_Schatten_Galran_Condition;
   information  = DIA_Schatten_Galran_Info;
   permanent	= FALSE;
   description	= "Kim by� Garlan?";
};

FUNC INT DIA_Schatten_Galran_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Schatten_HELLO5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_Galran_Info()
{
    AI_Output (other, self ,"DIA_Schatten_Galran_15_01"); //Kim by� Garlan?
    AI_Output (self, other ,"DIA_Schatten_Galran_03_02"); //Stary Garlan? W czasie intensywnej rozbudowy Starej Kopalni by� szefem drwali, a raczej Kopaczy kt�rych zagoniono do r�bania drewna. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_03"); //Przed trafieniem do Kolonii Karnej by� drwalem, wi�c wiele w jego �yciu si� nie zmieni�o.
    AI_Output (self, other ,"DIA_Schatten_Galran_03_04"); //Szczerze m�wi�c, jak Gomez poleci� budowa� kolejne poziomy w kopalni i rozpocz�a si� ca�a akcja z wycink� lasu, to Garlan czu� si� jak ryba w wodzie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_05"); //M�wi� nawet, �e to najlepsze lata jego �ycia. Uda�o mu si� nawet sprowadzi� swoj� siekier� ze �wiata Zewn�trznego � pono� wcze�niej u�y� jej na jakim� opoju w karczmie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_06"); //Magnaci naprawd� potrafi� czasem zdzia�a� cuda. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_07"); //Jego pasja raczej nie udziela�a si� przys�anym mu do pomocy Kopaczom� 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_08"); //Ale mniejsza z tym. Potem wielka rozbudowa dobieg�a ko�ca, ale stary Garlan pozosta� w swojej chacie i dalej zajmowa� si� r�baniem drewna. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_09"); //Od czasu do czasu przybywali do niego ze Starego Obozu i z kopalni, by odebra� drewno. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_10"); //Ze Starego Obozu wys�ali raz Santino, by z�o�y� Garlanowi kolejne zam�wienie. 
    AI_Output (self, other ,"DIA_Schatten_Galran_03_11"); //Cie� mia� pecha, bo w chacie zasta� zieleniej�ce ju� cia�o starego drwala z wygryzionymi przez z�bacze bebechami. 
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Schatten_HowAreYou (C_INFO)
{
   npc          = STT_316_Schatten;
   nr           = 7;
   condition    = DIA_Schatten_HowAreYou_Condition;
   information  = DIA_Schatten_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Schatten_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Schatten_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_01"); //Co s�ycha�?
    if (Npc_GetTrueGuild (hero) == GIL_ORG)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_02"); //Nie rozmawiam z takimi jak ty!
    }
    else if (Npc_GetTrueGuild (hero) == GIL_STT)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_03"); //Zosta�e� jednym z nas! 
        AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_04"); //Nie da si� ukry�. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_05"); //Twoje zdrowie, kolego.
        CreateInvItems (self, ItFoBeer, 2);
        B_GiveInvItems (self, other, ItFoBeer, 1);
        AI_UseItem (self, ItFoBeer);
        AI_UseItem (hero, ItFoBeer);
    }
    else if (Npc_GetTrueGuild (hero) == GIL_GRD)
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_06"); //Jeszcze wczoraj biega�e� po obozie pr�buj�c wkupi� si� w szeregi Cieni.
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_07"); //Dzi� wracasz jako Stra�nik i pogromca kr�lowej pe�zaczy. No bracie, jak tak dalej p�jdzie, pewnie za tydzie� b�dziesz jednym z Magnat�w. 
        AI_Output (other, self ,"DIA_Schatten_HowAreYou_15_08"); //Dzi�ki.
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_09"); //Twoje zdrowie.
        CreateInvItems (self, ItFoBeer, 1);
        AI_UseItem (self, ItFoBeer);
    }
    else
    {
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_10"); //Rz�dy Magnat�w przynios�y do Kolonii dobrobyt i bogactwo. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_11"); //Niestety taka obfito�� d�br przyci�ga te� bandyt�w i ci�gle musimy u�era� si� z napadaj�cymi na nasze konwoje Szkodnikami i innym �cierwem. 
        AI_Output (self, other ,"DIA_Schatten_HowAreYou_03_12"); //Niebawem Gomez zrobi jednak z nimi porz�dek, a wtedy to dopiero rozpocznie si� handel ze �wiatem Zewn�trznym. 
    };
};


