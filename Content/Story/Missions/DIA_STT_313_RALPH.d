// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Ralph_Exit (C_INFO)
{
	npc				= Stt_313_Schatten;
	nr				= 999;
	condition		= DIA_Ralph_Exit_Condition;
	information		= DIA_Ralph_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Ralph_Exit_Condition()
{
	return 1;
};

func VOID DIA_Ralph_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Ralph_Hallo(C_INFO)
{
	npc				= Stt_313_Schatten;
	nr				= 1;
	condition		= DIA_Ralph_Hallo_Condition;
	information		= DIA_Ralph_Hallo_Info;
	permanent		= 0;
	description 	= "Witam.";
};                       

FUNC INT DIA_Ralph_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Ralph_Hallo_Info()
{
	AI_Output (other, self,"DIA_Ralph_Hallo_15_00"); //Witam. 
	AI_Output (self, other,"DIA_Ralph_Hallo_04_01"); //Hej, nowy? Nazywam si� Ralph.
	AI_Output (other, self,"DIA_Ralph_Hallo_15_02"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_Ralph_Hallo_04_03"); //Wyrabiam pa�ki. Zwyczajne, nabijane kolcami, jakie tylko chcesz.
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Ralph sprzedaje pa�ki i proste bronie drzewcowe. Jego chat� znajd� pomi�dzy aren�, a zawalon� wie�� w Starym Obozie. ");
		
	CreateInvItems (self, ItMw_1H_Club_01,5);
	CreateInvItems (self, ItMw_1H_Sickle_01,3);
	CreateInvItems (self, ItMw_1H_Mace_Light_01,5);
	CreateInvItems (self, ItMw_1H_Hatchet_01,5);
	CreateInvItems (self, ItMw_1H_Nailmace_01,3);
	CreateInvItems (self, ItMw_2H_Axe_Big_02,1);
	CreateInvItems (self, ItMw_2H_Staff_01,1);
	CreateInvItems (self, ItMw_2H_Staff_02,1);
	CreateInvItems (self, ItMw_2H_Staff_03,1);
	CreateInvItems (self, ItMw_2H_Axe_Big_03,1);
	CreateInvItems (self, ItAmArrow,100);
	CreateInvItems (self, ItAmBolt,100);
};

// **************************************************
//						Camp
// **************************************************

instance DIA_Ralph_Camp(C_INFO)
{
	npc				= Stt_313_Schatten;
	nr				= 1;
	condition		= DIA_Ralph_Camp_Condition;
	information		= DIA_Ralph_Camp_Info;
	permanent		= 0;
	description 	= "Co mo�esz mi powiedzie� o tej cz�ci Obozu?";
};                       

FUNC INT DIA_Ralph_Camp_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Ralph_Hallo))
	{
	return 1;
	};
};

func VOID DIA_Ralph_Camp_Info()
{
	AI_Output (other, self,"DIA_Ralph_Camp_15_00"); //Co mo�esz mi powiedzie� o tej cz�ci Obozu?
	AI_Output (self, other,"DIA_Ralph_Camp_04_01"); //Cholernie tu �mierdzi. A to wszystko dlatego, �e Kopacze urz�dzili sobie �mietnik obok mojej chaty. 
	AI_Output (other, self,"DIA_Ralph_Camp_15_02"); //Dlaczego si� nie przeniesiesz? 
	AI_Output (self, other,"DIA_Ralph_Camp_04_03"); //Niby dok�d? Smr�d w sumie przesta� mi ju� przeszkadza�. 
	AI_Output (self, other,"DIA_Ralph_Camp_04_04"); //Ponadto zauwa�, �e tej alejki nie pilnuje �aden Stra�nik. Nikt nie zabiera mi rudy i mam �wi�ty spok�j. 
	AI_Output (other, self,"DIA_Ralph_Camp_15_05"); //No dobra. Wr��my jeszcze do tematu okolicy.
	AI_Output (self, other,"DIA_Ralph_Camp_04_06"); //Co ty jeszcze chcesz ode mnie wiedzie�? To najbiedniejsza cz�� Obozu. Ca�o�� tutejszego �ycia kr�ci si� wok� interesu z aren�.
	AI_Output (self, other,"DIA_Ralph_Camp_04_07"); //Scatty zarabia krocie na tych durniach ogl�daj�cych walki. 
	AI_Output (self, other,"DIA_Ralph_Camp_04_08"); //Spore znaczenie ma ku�nia. Znajduje si� wy�ej. O tam. Z pewno�ci� widzisz dym buchaj�cy z komina pieca.
	AI_Output (self, other,"DIA_Ralph_Camp_04_09"); //Huno jest szanowany. Nie jest wprawdzie mistrzem kowalstwa, ale potrafi nanie�� proste ozdoby na miecz. Szczeg�lnie cieszy to �wistaka.
	AI_Output (self, other,"DIA_Ralph_Camp_04_10"); //Ten go�� nigdy si� nie zmieni. Traktuje bronie jak zabawki. No, ale w sumie, gdybym mia� tyle rudy co on...
	Info_ClearChoices	(DIA_Ralph_Camp );
	Info_AddChoice		(DIA_Ralph_Camp,"�wistak ma sporo rudy?",DIA_Ralph_Camp_Whistler);
	Info_AddChoice		(DIA_Ralph_Camp,"Dzi�ki za rozmow�.",DIA_Ralph_Camp_Ende);
};

func void DIA_Ralph_Camp_Whistler ()
{
	AI_Output (other, self,"DIA_Ralph_Camp_Whistler_15_00"); //�wistak ma sporo rudy?
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_01"); //Jasne. W ko�cu sprzedaje ubrania. Podobnie zreszt� jak Fisk. Ci dwaj rywalizuj� ze sob�.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_02"); //Jednak �wistak ma wi�kszy wyb�r spodni, dlatego wi�cej ludzi do niego zagl�da.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_03"); //Fisk z kolei ma dobre bronie od Huno i wiele drobnostek typu wytrychy i narz�dzia.
	AI_Output (other, self,"DIA_Ralph_Camp_Whistler_15_04"); //Nie przepadaj� za sob� tylko ze wzgl�du na konkurencj�? Czy mo�e konflikt ma jakie� g��bsze dno?
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_05"); //Czy ja wiem... Fisk handlowa� od zawsze. Z kolei �wistak dopiero kilka miesi�cy temu rozwin�� interes. 
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_06"); //Pewien z�odziej powiedzia� mi w sekrecie, �e �wistak przez kilka lat trzyma� ma�� fortunk� zrabowan� Magnatom. 
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_07"); //Dopiero teraz postanowi� j� zainwestowa� i op�aca dw�ch szwaczy, kt�rzy robi� dla niego ubrania. Sk�ry ma chyba od my�liwych.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_08"); //Ca�a ta jego szwalnia to jeden wielki przekr�t. Zapytasz czemu. Ot� wykorzystuje do pracy ludzi Iana, kt�rzy przyszli z kopalni.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_09"); //Jak tylko naczelnik kopalni si� o tym dowie, to �wistak b�dzie mia� k�opoty. Mo�liwe, �e nie wiesz, ale Ian i Thorus to kumple. 
};

func void DIA_Ralph_Camp_Ende ()
{
	AI_Output (other, self,"DIA_Ralph_Camp_Ende_15_00"); //Dzi�ki za rozmow�.
	AI_Output (self, other,"DIA_Ralph_Camp_Ende_04_01"); //Nie ma sprawy. Wydajesz si� w porz�dku.
	Info_ClearChoices	(DIA_Ralph_Camp );
};

// **************************************************
//						Past
// **************************************************

instance DIA_Ralph_Past(C_INFO)
{
	npc				= Stt_313_Schatten;
	nr				= 1;
	condition		= DIA_Ralph_Past_Condition;
	information		= DIA_Ralph_Past_Info;
	permanent		= 0;
	description 	= "Za co tutaj trafi�e�?";
};                       

FUNC INT DIA_Ralph_Past_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Ralph_Hallo))
	{
	return 1;
	};
};

func VOID DIA_Ralph_Past_Info()
{
	AI_Output (other, self,"DIA_Ralph_Past_15_00"); //Za co tutaj trafi�e�? Wydajesz si� dobrym cz�owiekiem. 
	AI_Output (self, other,"DIA_Ralph_Past_04_01"); //No wiesz, pozory myl�.
	AI_Output (other, self,"DIA_Ralph_Past_15_02"); //Co zrobi�e�?
	AI_Output (self, other,"DIA_Ralph_Past_04_03"); //Manipulowa�em finansami. Kilkana�cie lat temu kilku pot�nych arystokrat�w z Vengardu razem z kr�lem za�o�y�o sp�k� handlow�.
	AI_Output (self, other,"DIA_Ralph_Past_04_04"); //Pocz�tkowo pracowa�em tam jako subiekt i zajmowa�em si� dyspozycj� towar�w, jednak z czasem awansowa�em na wy�sze stanowisko.
	AI_Output (self, other,"DIA_Ralph_Past_04_05"); //Mia�em dost�p do ksi�g zawieraj�cych zapisy handlowe i kontrakty z bogatymi kupcami. 
	AI_Output (self, other,"DIA_Ralph_Past_04_06"); //Podoba�a mi si� w tamtym czasie pewna m�oda dama. Jej ojciec r�wnie� by� kupcem, jednak popada� w ruin�.
	AI_Output (self, other,"DIA_Ralph_Past_04_07"); //Chcia�em poprosi� j� o r�k�, wi�c robi�em wszystko by si� przypodoba�. Zacz��em wi�c potajemnie odprowadza� cz�� zysk�w kupcowi z Khorinis.
	AI_Output (self, other,"DIA_Ralph_Past_04_08"); //Jednak, aby nikt si� nie zorientowa� musia�em podpisywa� r�ne ma�o dochodowe kontrakty. Gdy kr�lewska sp�ka zacz�a powa�nie traci� rozpocz�to kontrol�.
	AI_Output (self, other,"DIA_Ralph_Past_04_09"); //Wtedy to w�a�nie wpad�em. Gdy wr�ci�em statkiem wi�ziennym na Khorinis, spotka�o mnie olbrzymie rozczarowanie. 
	AI_Output (self, other,"DIA_Ralph_Past_04_10"); //Pi�kna Izabela w kt�rej si� kocha�em wysz�a za bogatego arystokrat�. Jej ojciec dzi�ki moim machlojkom wyszed� na prost�.
	AI_Output (self, other,"DIA_Ralph_Past_04_11"); //Okaza�o si�, �e ona przez ca�y czas mnie oszukiwa�a. Nigdy mnie nie kocha�a. Uwa�a�a bowiem, �e dama jej pokroju nie mo�e po�lubi� syna kupca takiego jak ja. 
	AI_Output (other, self,"DIA_Ralph_Past_15_12"); //A powiedz mi jeszcze jak dosta�e� si� do kr�lewskiej sp�ki? 
	AI_Output (self, other,"DIA_Ralph_Past_04_13"); //By�em czeladnikiem u najlepszych kupc�w w Khorinis. P�niej pracowa�em nieco w Ardei. Nauczy�em si� wiec sporo o kupieckim fachu.
	AI_Output (other, self,"DIA_Ralph_Past_15_14"); //Nie powiniene� wi�c by� teraz jakim� doradc� Magnat�w?
	AI_Output (self, other,"DIA_Ralph_Past_04_15"); //W sumie nigdy im si� nie oferowa�em. I raczej nie mam zamiaru. Gdy by�em dzieckiem, pracowa�em raz u stolarza. To u niego nauczy�em si� tego, co robi� dzi�. Nie chc� ju� nic zmienia�.
};

//========================================
//-----------------> DealWithIt
//========================================

INSTANCE DIA_Schatten_DealWithIt (C_INFO)
{
   npc          = Stt_313_Schatten;
   nr           = 1;
   condition    = DIA_Schatten_DealWithIt_Condition;
   information  = DIA_Schatten_DealWithIt_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� mi te twoje pa�ki. ";
};

FUNC INT DIA_Schatten_DealWithIt_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ralph_Hallo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Schatten_DealWithIt_Info()
{
    AI_Output (other, self ,"DIA_Schatten_DealWithIt_15_01"); //Poka� mi te twoje pa�ki. 
};

