//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Postaraj si� dotrze� do Starego Obozu w jednym kawa�ku!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Czym si� tutaj zajmujesz?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Dbam o to, by nikt niepowo�any nie dosta� si� w pobli�e miejsca wymiany. Zw�aszcza ci bandyci z Nowego Obozu.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Hej, to ciebie dzi� zrzucili tutaj, co?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Zgadza si�.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //W takim razie uwa�aj na ludzi z Nowego Obozu!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Ja jestem ze Starego Obozu, tak jak wszyscy, kt�rych widzia�e� na miejscu wymiany.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Zak�adam, �e rozmawia�e� ju� z Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Nie."	,DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Tak."	,DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Wi�c zr�b to! On zajmuje si� wszystkimi nowoprzyby�ymi.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Od niego dowiesz si� wszystkiego co ��todzi�b wiedzie� powinien.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Tak, rozmawia�em.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //To dobrze. Zatem wiesz ju� mniej wi�cej co i jak.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Dlaczego mam uwa�a� na ludzi z Nowego Obozu?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Dlaczego mam uwa�a� na ludzi z Nowego Obozu?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //W por�wnaniu z Nowym Obozem, Stary Ob�z to ciche i przytulne miejsce!
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nowy Ob�z nie otrzymuje �adnych przesy�ek z zewn�trz. Te szkodniki po prostu kradn� wszystko, czego potrzebuj�.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "A Stary Ob�z?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Stary Ob�z?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Tutaj wszystkim rz�dz� Magnaci, handluj�cy rud�. Pod nimi s� Stra�nicy, a nast�pnie Cienie. Najni�sz� kast� stanowi� Kopacze.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka�dy, kto tu trafi, zaczyna jako Kopacz. Je�li masz wi�ksze ambicje, musisz zosta� przyj�ty do Cieni.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kiedy tutaj wyl�dowa�em, jeden z waszych uderzy� mnie w twarz.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Robi� tak z wszystkimi nowymi. M�wi� na to "Chrzest Wody".
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Rozumiem. Czy w Starym Obozie jest wielu takich zawadiak�w?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Jest kilka czarnych owiec. Ale nie zrobi� ci krzywdy, je�li zap�acisz im za ochron�.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Widzia�em, jak spuszczano tutaj jak�� kobiet�."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Widzia�em, jak spuszczano tutaj jak�� kobiet�.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //C�, Magnaci dostaj� wszystko, czego zapragn�.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzie�, �e kr�l wymienia kobiety na rud�?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie one te� trafiaj� tutaj prosto z wi�zienia. Gdyby Gomez nie �ci�gn�� ich tutaj, dalej gni�yby w jakim� lochu.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Sam ju� nie wiem, co jest dla nich gorsze...
	
	MIS_Women = LOG_RUNNING;
	Log_CreateTopic		(CH1_Women, LOG_MISSION); //fix
	Log_SetTopicStatus    (CH1_Women, LOG_RUNNING);
    B_LogEntry                (CH1_Women,"Gdy zosta�em zrzucony za Barier�, widzia�em kobiet� spuszczan� na d� wraz z �adunkiem. Jestem ciekaw jaki los j� spotka� w Kolonii. Stra�nik Orry powiedzia�, �e kobiety s� w�asno�ci� Magnat�w i s� zsy�ane do Kolonii z ich polecenia. Powinienem rozejrze� si� w Starym Obozie.");
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Potrzebuj� broni..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Potrzebuj� broni...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Rozejrzyj si� troch� przy zamkni�tej kopalni, w g��bi kanionu. Na pewno co� tam znajdziesz.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Tylko nie wdawaj si� w powa�ne b�jki uzbrojony w g�upi kilof. To bardzo ci�ka i niepor�czna bro�.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Niedo�wiadczony wojownik powinien pos�ugiwa� si� nim tylko w ostateczno�ci.
	
};
/*
//========================================
//-----------------> PODSLUCH_ORRY
//========================================

INSTANCE DIA_Orry_PODSLUCH_ORRY (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 4;
   condition    = DIA_Orry_PODSLUCH_ORRY_Condition;
   information  = DIA_Orry_PODSLUCH_ORRY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Orry_PODSLUCH_ORRY_Condition()
{
if (Jedzenie_zplacu == LOG_SUCCESS)
{
 return TRUE;
 };
};


FUNC VOID DIA_Orry_PODSLUCH_ORRY_Info()
{
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_01"); //No, no. Nie�le poradzili�cie sobie ze Stra�nikami.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_02"); //Eee... Nie, to nie tak.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_03"); //Kto by pomy�la�, �e ten niepozorny Kopacz jest taki sprytny i pomys�owy.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_04"); //Wielu m�drych ludzi si� tu marnuje.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_05"); //Ciekawe przez kogo?
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_06"); //Nie wszyscy Stra�nicy s� tacy. Sp�jrz na mnie.
    AI_Output (self, other ,"DIA_Orry_PODSLUCH_ORRY_03_07"); //Nie wyda�em was, a przecie� wszystko s�ysza�em.
    AI_Output (other, self ,"DIA_Orry_PODSLUCH_ORRY_15_08"); //Dzi�kuj� ci za to.
    AI_StopProcessInfos	(self);
};



// *Script was make in Easy Dialog Maker (EDM)
var int GravoUfny;
//========================================
//-----------------> INFOS
//========================================

INSTANCE DIA_Orry_INFOS (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 5;
   condition    = DIA_Orry_INFOS_Condition;
   information  = DIA_Orry_INFOS_Info;
   permanent	= FALSE;
   description	= "Co mi powiesz o Z�ym?";
};

FUNC INT DIA_Orry_INFOS_Condition()
{
    if (DexterDalej == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_INFOS_Info()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_15_01"); //Co mi powiesz o Z�ym?
    AI_Output (self, other ,"DIA_Orry_INFOS_03_02"); //A co ja mam o nim wiedzie�? Jestem tylko Stra�nikiem.
    AI_Output (other, self ,"DIA_Orry_INFOS_15_03"); //Przesta�. Wiem o ca�ym tym zamieszaniu z jaskini�. Z�y mnie wtajemniczy�.
    AI_Output (other, self ,"DIA_Orry_INFOS_15_04"); //Co robisz w�r�d zbir�w? 
    AI_Output (self, other ,"DIA_Orry_INFOS_03_05"); //To d�uga historia. Wiesz ju�, �e to oni zabili Neka?
    AI_Output (other, self ,"DIA_Orry_INFOS_15_06"); //Poniek�d.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_07"); //P�nym wieczorem wraca�em z polowania. Us�ysza�em g�osy. Zdziwi�o mnie to.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_08"); //Poszed�em do jaskini i zobaczy�em rozmawiaj�cych.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_09"); //Chcieli mnie zabi�. Musia�em co� wymy�li�.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_10"); //Zaproponowa�em im pomoc. Mia�em, b�d�c w szeregach stra�y, odwraca� uwag� od ich dzia�a�.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_11"); //To dzi�ki mnie nie zostali przez tyle lat z�apani.
    AI_Output (self, other ,"DIA_Orry_INFOS_03_12"); //Pom�g� mi te� w tym Gravo. W jaskini wstawi� si� za mn�.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Orry nie nale�a� do spisku od pocz�tku. Do przy��czenia si� do zbir�w zmusi� go los. Czuj�, �e mog� wydoby� od niego sporo informacji.");

    B_GiveXP (300);

    Info_ClearChoices		(DIA_Orry_INFOS);
    Info_AddChoice		(DIA_Orry_INFOS, "Dlaczego Gravo ci pom�g�?", DIA_Orry_INFOS_GRAVO);
    Info_AddChoice		(DIA_Orry_INFOS, "Sk�d macie te �upy?", DIA_Orry_INFOS_SKARBY);
    Info_AddChoice		(DIA_Orry_INFOS, "Musz� ju� i��.", DIA_Orry_INFOS_IDE);
};

FUNC VOID DIA_Orry_INFOS_GRAVO()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_01"); //Dlaczego Gravo ci pom�g�?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_02"); //Znali�my si� jeszcze w Khorinis.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_03"); //Pomaga�em mu szmuglowa� towary do miasta.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_04"); //Od tamtego czasu mog� na nim polega�.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_05"); //Ze mn� nie chcia� rozmawia�...
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_06"); //Jest niech�tny w stosunku do obcych.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_07"); //Nie ufa ci. Wiem, jak temu zaradzi�.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_08"); //Co mam zrobi�?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_09"); //Powiedz mu, �e ci� przysy�am. Jak zapyta o imi�, powiedz: Fraser.
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_10"); //Kim jest Fraser?
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_11"); //By� stra�nikiem miejskim. Gravo go zabi�.
    AI_Output (self, other ,"DIA_Orry_INFOS_GRAVO_03_12"); //Do dzisiaj nie mo�e sobie wybaczy�...
    AI_Output (other, self ,"DIA_Orry_INFOS_GRAVO_15_13"); //Dzi�ki.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Gravo jest nieufny wobec nowych. Aby zdoby� jego zaufanie musz� powiedzie�, �e przys�a� mnie Orry, a potem powiedzie� imi� stra�nika zabitego przez Gravo w Khorinis.");
    GravoUfny = true;
    B_GiveXP (50);
};

FUNC VOID DIA_Orry_INFOS_SKARBY()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_SKARBY_15_01"); //Sk�d macie te �upy?
    AI_Output (self, other ,"DIA_Orry_INFOS_SKATBY_03_02"); //Nie wiem. Ja dostaj� tylko 10 bry�ek tygodniowo.
    AI_Output (self, other ,"DIA_Orry_INFOS_SKARBY_03_03"); //Gravo dzia�a� w zespole od pocz�tku. Musisz z nim porozmawia�.
    B_LogEntry                     (CH1_ZLY_Poplecznicy,"Gravo wie, jak Z�y zdoby� �upy.");
    GravoUfny = true;
    B_GiveXP (50);
};

FUNC VOID DIA_Orry_INFOS_IDE()
{
    AI_Output (other, self ,"DIA_Orry_INFOS_IDE_15_01"); //Musz� ju� i��.
    AI_Output (self, other ,"DIA_Orry_INFOS_IDE_03_02"); //Tylko nie m�w nikomu.
    Info_ClearChoices		(DIA_Orry_INFOS);
    AI_StopProcessInfos	(self);
};

*/

//========================================
//-----------------> TripNotes
//========================================

INSTANCE DIA_Orry_TripNotes (C_INFO)
{
   npc          = GRD_254_Orry;
   nr           = 1;
   condition    = DIA_Orry_TripNotes_Condition;
   information  = DIA_Orry_TripNotes_Info;
   permanent	= FALSE;
   description	= "Przysy�a mnie Thorus. Przychodz� po notatki opisuj�ce kierunki dzia�a� Bandyt�w.";
};

FUNC INT DIA_Orry_TripNotes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Graham_Spy_Map_Bandit))
    && (MIS_DraxTest == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Orry_TripNotes_Info()
{
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_01"); //Przysy�a mnie Thorus. Przychodz� po notatki opisuj�ce kierunki dzia�a� Bandyt�w.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_02"); //Ach tak, kojarz�.
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_03"); //Faktycznie, dostarczono mi takie notatki. 
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_04"); //Nie czyta�em ich jeszcze, wi�c postanowi�em je ukry�, by nikt mi ich nie wykrad�.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_05"); //Gdzie je znajd�?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_06"); //Wybacz, ale zanim ci je dam, musz� je przeczyta�.
    AI_Output (other, self ,"DIA_Orry_TripNotes_15_07"); //To na co czekasz?
    AI_Output (self, other ,"DIA_Orry_TripNotes_03_08"); //Teraz mam to zrobi�? Nie widzisz, �e pilnuj� placu przed Szkodnikami i Bandytami?
    B_LogEntry                     (CH1_DraxTest,"Orry ukry� notatki Tripa. Nie chce mi ich przekaza�, dop�ki ich nie przeczyta. My�l�, �e szkoda na to czasu.");
    AI_StopProcessInfos	(self);
};

