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
	AI_Output (self, other,"DIA_Ralph_Hallo_04_01"); //Hej, nowy? Nazywam siê Ralph.
	AI_Output (other, self,"DIA_Ralph_Hallo_15_02"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_Ralph_Hallo_04_03"); //Wyrabiam pa³ki. Zwyczajne, nabijane kolcami, jakie tylko chcesz.
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Ralph sprzedaje pa³ki i proste bronie drzewcowe. Jego chatê znajdê pomiêdzy aren¹, a zawalon¹ wie¿¹ w Starym Obozie. ");
		
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
	description 	= "Co mo¿esz mi powiedzieæ o tej czêœci Obozu?";
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
	AI_Output (other, self,"DIA_Ralph_Camp_15_00"); //Co mo¿esz mi powiedzieæ o tej czêœci Obozu?
	AI_Output (self, other,"DIA_Ralph_Camp_04_01"); //Cholernie tu œmierdzi. A to wszystko dlatego, ¿e Kopacze urz¹dzili sobie œmietnik obok mojej chaty. 
	AI_Output (other, self,"DIA_Ralph_Camp_15_02"); //Dlaczego siê nie przeniesiesz? 
	AI_Output (self, other,"DIA_Ralph_Camp_04_03"); //Niby dok¹d? Smród w sumie przesta³ mi ju¿ przeszkadzaæ. 
	AI_Output (self, other,"DIA_Ralph_Camp_04_04"); //Ponadto zauwa¿, ¿e tej alejki nie pilnuje ¿aden Stra¿nik. Nikt nie zabiera mi rudy i mam œwiêty spokój. 
	AI_Output (other, self,"DIA_Ralph_Camp_15_05"); //No dobra. Wróæmy jeszcze do tematu okolicy.
	AI_Output (self, other,"DIA_Ralph_Camp_04_06"); //Co ty jeszcze chcesz ode mnie wiedzieæ? To najbiedniejsza czêœæ Obozu. Ca³oœæ tutejszego ¿ycia krêci siê wokó³ interesu z aren¹.
	AI_Output (self, other,"DIA_Ralph_Camp_04_07"); //Scatty zarabia krocie na tych durniach ogl¹daj¹cych walki. 
	AI_Output (self, other,"DIA_Ralph_Camp_04_08"); //Spore znaczenie ma kuŸnia. Znajduje siê wy¿ej. O tam. Z pewnoœci¹ widzisz dym buchaj¹cy z komina pieca.
	AI_Output (self, other,"DIA_Ralph_Camp_04_09"); //Huno jest szanowany. Nie jest wprawdzie mistrzem kowalstwa, ale potrafi nanieœæ proste ozdoby na miecz. Szczególnie cieszy to Œwistaka.
	AI_Output (self, other,"DIA_Ralph_Camp_04_10"); //Ten goœæ nigdy siê nie zmieni. Traktuje bronie jak zabawki. No, ale w sumie, gdybym mia³ tyle rudy co on...
	Info_ClearChoices	(DIA_Ralph_Camp );
	Info_AddChoice		(DIA_Ralph_Camp,"Œwistak ma sporo rudy?",DIA_Ralph_Camp_Whistler);
	Info_AddChoice		(DIA_Ralph_Camp,"Dziêki za rozmowê.",DIA_Ralph_Camp_Ende);
};

func void DIA_Ralph_Camp_Whistler ()
{
	AI_Output (other, self,"DIA_Ralph_Camp_Whistler_15_00"); //Œwistak ma sporo rudy?
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_01"); //Jasne. W koñcu sprzedaje ubrania. Podobnie zreszt¹ jak Fisk. Ci dwaj rywalizuj¹ ze sob¹.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_02"); //Jednak Œwistak ma wiêkszy wybór spodni, dlatego wiêcej ludzi do niego zagl¹da.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_03"); //Fisk z kolei ma dobre bronie od Huno i wiele drobnostek typu wytrychy i narzêdzia.
	AI_Output (other, self,"DIA_Ralph_Camp_Whistler_15_04"); //Nie przepadaj¹ za sob¹ tylko ze wzglêdu na konkurencjê? Czy mo¿e konflikt ma jakieœ g³êbsze dno?
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_05"); //Czy ja wiem... Fisk handlowa³ od zawsze. Z kolei Œwistak dopiero kilka miesiêcy temu rozwin¹³ interes. 
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_06"); //Pewien z³odziej powiedzia³ mi w sekrecie, ¿e Œwistak przez kilka lat trzyma³ ma³¹ fortunkê zrabowan¹ Magnatom. 
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_07"); //Dopiero teraz postanowi³ j¹ zainwestowaæ i op³aca dwóch szwaczy, którzy robi¹ dla niego ubrania. Skóry ma chyba od myœliwych.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_08"); //Ca³a ta jego szwalnia to jeden wielki przekrêt. Zapytasz czemu. Otó¿ wykorzystuje do pracy ludzi Iana, którzy przyszli z kopalni.
	AI_Output (self, other,"DIA_Ralph_Camp_Whistler_04_09"); //Jak tylko naczelnik kopalni siê o tym dowie, to Œwistak bêdzie mia³ k³opoty. Mo¿liwe, ¿e nie wiesz, ale Ian i Thorus to kumple. 
};

func void DIA_Ralph_Camp_Ende ()
{
	AI_Output (other, self,"DIA_Ralph_Camp_Ende_15_00"); //Dziêki za rozmowê.
	AI_Output (self, other,"DIA_Ralph_Camp_Ende_04_01"); //Nie ma sprawy. Wydajesz siê w porz¹dku.
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
	description 	= "Za co tutaj trafi³eœ?";
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
	AI_Output (other, self,"DIA_Ralph_Past_15_00"); //Za co tutaj trafi³eœ? Wydajesz siê dobrym cz³owiekiem. 
	AI_Output (self, other,"DIA_Ralph_Past_04_01"); //No wiesz, pozory myl¹.
	AI_Output (other, self,"DIA_Ralph_Past_15_02"); //Co zrobi³eœ?
	AI_Output (self, other,"DIA_Ralph_Past_04_03"); //Manipulowa³em finansami. Kilkanaœcie lat temu kilku potê¿nych arystokratów z Vengardu razem z królem za³o¿y³o spó³kê handlow¹.
	AI_Output (self, other,"DIA_Ralph_Past_04_04"); //Pocz¹tkowo pracowa³em tam jako subiekt i zajmowa³em siê dyspozycj¹ towarów, jednak z czasem awansowa³em na wy¿sze stanowisko.
	AI_Output (self, other,"DIA_Ralph_Past_04_05"); //Mia³em dostêp do ksi¹g zawieraj¹cych zapisy handlowe i kontrakty z bogatymi kupcami. 
	AI_Output (self, other,"DIA_Ralph_Past_04_06"); //Podoba³a mi siê w tamtym czasie pewna m³oda dama. Jej ojciec równie¿ by³ kupcem, jednak popada³ w ruinê.
	AI_Output (self, other,"DIA_Ralph_Past_04_07"); //Chcia³em poprosiæ j¹ o rêkê, wiêc robi³em wszystko by siê przypodobaæ. Zacz¹³em wiêc potajemnie odprowadzaæ czêœæ zysków kupcowi z Khorinis.
	AI_Output (self, other,"DIA_Ralph_Past_04_08"); //Jednak, aby nikt siê nie zorientowa³ musia³em podpisywaæ ró¿ne ma³o dochodowe kontrakty. Gdy królewska spó³ka zaczê³a powa¿nie traciæ rozpoczêto kontrolê.
	AI_Output (self, other,"DIA_Ralph_Past_04_09"); //Wtedy to w³aœnie wpad³em. Gdy wróci³em statkiem wiêziennym na Khorinis, spotka³o mnie olbrzymie rozczarowanie. 
	AI_Output (self, other,"DIA_Ralph_Past_04_10"); //Piêkna Izabela w której siê kocha³em wysz³a za bogatego arystokratê. Jej ojciec dziêki moim machlojkom wyszed³ na prost¹.
	AI_Output (self, other,"DIA_Ralph_Past_04_11"); //Okaza³o siê, ¿e ona przez ca³y czas mnie oszukiwa³a. Nigdy mnie nie kocha³a. Uwa¿a³a bowiem, ¿e dama jej pokroju nie mo¿e poœlubiæ syna kupca takiego jak ja. 
	AI_Output (other, self,"DIA_Ralph_Past_15_12"); //A powiedz mi jeszcze jak dosta³eœ siê do królewskiej spó³ki? 
	AI_Output (self, other,"DIA_Ralph_Past_04_13"); //By³em czeladnikiem u najlepszych kupców w Khorinis. PóŸniej pracowa³em nieco w Ardei. Nauczy³em siê wiec sporo o kupieckim fachu.
	AI_Output (other, self,"DIA_Ralph_Past_15_14"); //Nie powinieneœ wiêc byæ teraz jakimœ doradc¹ Magnatów?
	AI_Output (self, other,"DIA_Ralph_Past_04_15"); //W sumie nigdy im siê nie oferowa³em. I raczej nie mam zamiaru. Gdy by³em dzieckiem, pracowa³em raz u stolarza. To u niego nauczy³em siê tego, co robiê dziœ. Nie chcê ju¿ nic zmieniaæ.
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
   description	= "Poka¿ mi te twoje pa³ki. ";
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
    AI_Output (other, self ,"DIA_Schatten_DealWithIt_15_01"); //Poka¿ mi te twoje pa³ki. 
};

