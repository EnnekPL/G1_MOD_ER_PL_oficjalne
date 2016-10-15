//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Tippler_EXIT(C_INFO)
{
	npc             = VLK_3999_Tippler;
	nr              = 999;
	condition		= DIA_Tippler_EXIT_Condition;
	information		= DIA_Tippler_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Tippler_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Tippler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Tippler_HELLO (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 1;
   condition    = DIA_Tippler_HELLO_Condition;
   information  = DIA_Tippler_HELLO_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Tippler_HELLO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Tippler_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Tippler_HELLO_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Tippler_HELLO_03_02"); //Pr�buj� znale�� co� do jedzenia.
    AI_Output (other, self ,"DIA_Tippler_HELLO_15_03"); //Ci�ko ci si� �yje w Obozie?
    AI_Output (self, other ,"DIA_Tippler_HELLO_03_04"); //Niestety! By�oby lepiej, gdyby nie moja zwichni�ta r�ka.
	AI_Output (other, self ,"DIA_Tippler_HELLO_15_05"); //Jak to si� sta�o?
	AI_Output (self, other ,"DIA_Tippler_HELLO_03_06"); //To by� wypadek, �le uderzy�em w ska��, kilof si� odbi� i wykrzywi� mi r�k�. 
	AI_Output (self, other ,"DIA_Tippler_HELLO_03_07"); //Nie jestem w stanie pracowa�, wi�c nie mam rudy.
};

//========================================
//-----------------> SZLACHTA
//========================================

INSTANCE DIA_Tippler_SZLACHTA (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 2;
   condition    = DIA_Tippler_SZLACHTA_Condition;
   information  = DIA_Tippler_SZLACHTA_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o ludziach w Obozie.";
};

FUNC INT DIA_Tippler_SZLACHTA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Tippler_SZLACHTA_Info()
{//te� fix 1210
    AI_Output (other, self ,"DIA_Tippler_SZLACHTA_15_01"); //Opowiedz mi o ludziach w Obozie.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_02"); //Nie powiem ci za du�o o Magnatach ani Magach Ognia, bo ich nie znam. Po Zewn�trznym Pier�cieniu kr�c� si� tylko Stra�nicy i Kopacze.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_03"); //O Gomezie mog� wspomnie� jedynie to, �e on tu rz�dzi. Nigdy w �yciu go nawet nie widzia�em.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_04"); //Ma swoich doradc�w, oraz zaufanych ludzi. Najwa�niejsi to Diego, Lorenzo i Thorus. Ka�dy jest zwierzchnikiem innej kasty.
	AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_05"); //Diego kontroluje Cieni, Lorenzo Kopaczy, a Thorus Stra�nik�w. Na tych ludzi proponuj� ci uwa�a�, a je�li przyjdzie ci z nimi porozmawia�...
	AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_06"); //...to uwa�aj na s�owa. Jedno �le wypowiedziane zdanie i sko�czysz po�amany w jakiej� beczce. 
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_07"); //Je�eli chodzi o Kopaczy, to radz� ci mie� dobre stosunki chocia�by z Gravo. Pomaga takim jak ty i nie bierze du�o za swoje us�ugi.
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_08"); //Dobrze zna� si� ze Snafem i Manheimem. Kucharze i karczmarze zawsze s� szanowani. 
    AI_Output (other, self ,"DIA_Tippler_SZLACHTA_15_09"); //Kto� jeszcze?
    AI_Output (self, other ,"DIA_Tippler_SZLACHTA_03_10"); //Uwa�aj na zabijak�w takich jak Herek, Erens czy Bonie i Clayde. Ci ostatni s� szczeg�lnie niebezpieczni, bo wymuszaj� myto.  
};

//========================================
//-----------------> NEK_DED
//========================================

INSTANCE DIA_Tippler_NEK_DED (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 3;
   condition    = DIA_Tippler_NEK_DED_Condition;
   information  = DIA_Tippler_NEK_DED_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zab�jstwie Neka?";
};

FUNC INT DIA_Tippler_NEK_DED_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_NEK_DED_Info()
{
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_01"); //Co wiesz o zab�jstwie Neka?
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_02"); //A dlaczego mnie o to pytasz? 
    AI_DrawWeapon (other);
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_03"); //Wiem, �e kilku z was co� wie. Nie ukrywaj tego, bo pogadamy inaczej.
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_04"); //Cz�owieku, uspok�j si�. Nie widzisz, �e mam niew�adn� r�k�? Nie b�d� w stanie si� obroni�!
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_05"); //No wi�c streszczaj si�, kole�ko, je�li chcesz mie� przynajmniej jedn� r�k�.
    AI_RemoveWeapon (other);
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_06"); //Po prostu chc�, �eby� potwierdzi� u Thorusa, �e to Z�y go zabi�. Widzia�e�, s�ysza�e�, nie wiem... To nieistotne. 
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_07"); //Wystarczy tylko, �e powiesz to zwierzchnikowi Stra�nik�w. 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_08"); //Sk�d wiesz, �e to Z�y? Kto� ju� ci to wyjawi�?
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_09"); //Skaza mi powiedzia�. By� pono� �wiadkiem tego zab�jstwa, ale Thorus mu nie uwierzy�. Dziwi mnie, �e by�o a� tylu �wiadk�w, a nikt nic nie m�wi. 
    AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_10"); //Jak to si� sta�o? Z�y odstawia� jakie� przedstawienie w kt�rym mordowa� tego go�cia, a wy je ogl�dali�cie? 
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_11"); //Na chwil� obecn� tak to wygl�da z mojego punktu widzenia. 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_12"); //Nie, nie. To nie tak! To zbieg okoliczno�ci. Nie wiem co tam robi� Skaza, jego pytaj, ale co do mnie i Jesse to le�eli�my razem w rowie.
	AI_Output (other, self ,"DIA_Tippler_NEK_DED_15_13"); //Na Innosa... 
    AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_14"); //To nie tak! Byli�my tego wieczora w karczmie i schlali�my si� jak dzikie �winie. Potem wyszli�my za Ob�z.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_15"); //Jako �e by�a ciep�a noc po�o�y�em si� obok wielkiego kamienia i zagada�em z Jesse o starych czasach. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_16"); //Po chwili on te� usiad�, a �e zwin�� Manheimowi jedn� butelk� piwa, postanowi� j� opr�ni�. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_17"); //Wszystko by�o w porz�dku do czasu, gdy nie us�yszeli�my ha�as�w z groty. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_18"); //Jesse oczywi�cie stwierdzi�, �e to dwa kretoszczury si� pieprz�, ale ja poszed�em to sprawdzi� i wtedy zobaczy�em... cholera.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_19"); //Zobaczy�em jak Nek jeszcze drga i �apie si� za serce z kt�rego wystaje sztylet. W jaskini by� jeszcze Kyle. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_20"); //Dr�a� jak osika przyparty do �ciany. Widocznie nie spodziewa� si� takiego obrotu sprawy. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_21"); //Tymczasem podszed� do mnie m�j kompan, chwyci� za bark i kaza� stamt�d znika�. Pobiegli�my do Obozu, jednak po drodze mign�a mi ciemna posta�.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_22"); //Sta�a za ska�� i ch�odno si� przygl�da�a. Wtedy my�la�em, �e to duch, ale teraz przypuszczam, �e to w�a�nie by� Skaza.  
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_23"); //Nast�pnego dnia udawali�my, �e nic si� nie sta�o. Zw�aszcza, �e Z�y wynaj�� dw�ch gro�nych Cieni. Chodzili ko�o nas i wpatrywali si� wrogo. 
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_24"); //Wyra�nie zrozumieli�my przekaz. Postanowili�my nic nie m�wi�.
	AI_Output (self, other ,"DIA_Tippler_NEK_DED_03_25"); //Zr�b co�, �eby nie byli ju� dla nas gro�ni, a powiem o wszystkim Thorusowi. 
    B_LogEntry                     (CH1_SpysProblems,"Tippler wie o zab�jstwie Neka. Opowiedzia� mi ca�� histori�. Po�wiadczy to u Thorusa, je�li pozb�d� si� siepaczy Z�ego."); 
    HeroKnowsSlyKillNek = true;
};

//========================================
//-----------------> OKQUEST
//========================================

INSTANCE DIA_Tippler_OKQUEST (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 4;
   condition    = DIA_Tippler_OKQUEST_Condition;
   information  = DIA_Tippler_OKQUEST_Info;
   permanent	= FALSE;
   description	= "Zrobi�em co kaza�e�.";
};

FUNC INT DIA_Tippler_OKQUEST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    && (MIS_SpysProblems == LOG_RUNNING)
	&& (Npc_IsDead(GRD_2014_Siepacz))
    && (Npc_IsDead(GRD_2013_Siepacz))

    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_OKQUEST_Info()
{
    AI_Output (other, self ,"DIA_Tippler_OKQUEST_15_01"); //Zrobi�em, co kaza�e�.
    AI_Output (self, other ,"DIA_Tippler_OKQUEST_03_02"); //Wszyscy nie �yj�? 
    AI_Output (other, self ,"DIA_Tippler_OKQUEST_15_03"); //Tak, jeste�cie bezpieczni.
    AI_Output (self, other ,"DIA_Tippler_OKQUEST_03_04"); //�wietnie! Mo�esz ju� i�� do Thorusa.
    B_LogEntry                     (CH1_SpysProblems,"Uda�o mi si� przekona� Tipplera do zezna�.");
};

//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Tippler_NIEPOKORNY1 (C_INFO)
{
   npc          = VLK_3999_Tippler;
   nr           = 1;
   condition    = DIA_Tippler_NIEPOKORNY1_Condition;
   information  = DIA_Tippler_NIEPOKORNY1_Info;
   permanent	= FALSE;
   description	= "Oned planuje nawia� dzi� w nocy. (zap�a� 50 bry�ek)";
};

FUNC INT DIA_Tippler_NIEPOKORNY1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_NIEPOKORNY2))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Tippler_NIEPOKORNY1_Info()
{
    AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_01"); //Oned planuje nawia� dzi� w nocy.
    AI_Output (self, other ,"DIA_Tippler_NIEPOKORNY1_03_02"); //Co?! Przecie� jest mi winien rud�. Trzeba go zatrzyma�.
    AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_03"); //Masz tu 50 bry�ek na dodatkow� motywacje. Masz dzi� w nocy obserwowa� Oneda i jego kompana Lotha. A gdy zaczn� ucieka� to ich powstrzymaj.
    AI_Output (self, other ,"DIA_Tippler_NIEPOKORNY1_03_04"); //Zgoda, ale chyba nie b�d� sam? Przez moj� kontuzj� nie mog� zdzia�a� za wiele.
	AI_Output (other, self ,"DIA_Tippler_NIEPOKORNY1_15_05"); //Nie b�dziesz.
    B_GiveInvItems (other, self, ItMiNugget, 50);
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Tippler do��czy do grupy Kopaczy, kt�rzy zasadz� si� na Oneda.");
  
};

 
