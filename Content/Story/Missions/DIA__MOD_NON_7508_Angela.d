// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Angela_EXIT(C_INFO)
{
	npc             = NON_7508_Angela;
	nr              = 999;
	condition	= DIA_Angela_EXIT_Condition;
	information	= DIA_Angela_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Angela_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Angela_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Angela_HELLO1 (C_INFO)
{
   npc          = NON_7508_Angela;
   nr           = 1;
   condition    = DIA_Angela_HELLO1_Condition;
   information  = DIA_Angela_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj, nieznajoma.";
};

FUNC INT DIA_Angela_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Angela_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_01"); //Witaj, nieznajoma.
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_02"); //No prosz�. Widz�, �e komu� uda�o si� odnale�� jaskini� Gilberta. Mam nadzieje, �e nie pracujesz dla Magnat�w, bo inaczej poder�n� ci gard�o.
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_03"); //Widz�, �e jeste� bardzo wygadana jak na kobiet�.
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_04"); //Chyba nie trafi�am do tej zasranej Kolonii przez przypadek, prawda? Wsp�pracowa�am z Gildi� Z�odziei w Khorinis, wi�c znam par� sztuczek. 
    AI_Output (other, self ,"DIA_Angela_HELLO1_15_05"); //Jak uda�o ci si� wymkn�� Magnatom?
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_06"); //No wiesz, poczeka�am a� zapadnie zmrok. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_07"); //Gomez poszed� do Zewn�trznego Pier�cienia ogl�da� jakie� pokazy na arenie, Kruk zaj�ty by� czytaniem ksi��ki, Blizna i Arto gadali o jaki� pierdo�ach, a Bartholo strofowa� kucharzy w kuchni. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_08"); //Postanowi�am si� wymkn��. Przemkn�am szybko przez dziedziniec zamkowy. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_15_09"); //Okaza�o si�, �e w pobli�u zawalonej wie�y jest rusztowanie. Magnaci wynaj�li paru roboli, aby naprawili wie��, w ten spos�b dzi�ki swej zwinno�ci zesz�am na d�. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_10"); //Szybko upora�am si� tak�e ze stra�nikami bramy, jeden z nich to prawdziwy imbecyl, a drugi dosta� ode mnie kopniaka pomi�dzy nogi. 
	AI_Output (self, other ,"DIA_Angela_HELLO1_15_11"); //Gdy si� im wymkn�am, zobaczy�em Gilberta poluj�cego na �cierwojady dla ich mi�sa. Powiedzia�, �e mog� schroni� si� w jaskini na g�rze, wi�c skorzysta�am z oferty. I tak tkwi� tu od tego czasu.
    AI_Output (other, self ,"DIA_Angela_HELLO1_03_12"); //Ciekawa historia. 
    AI_Output (self, other ,"DIA_Angela_HELLO1_03_13"); //Dobra dobra, nie podlizuj si�. A teraz daj mi spok�j, chc� odpocz�� od tej paplaniny.
};

