
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler553_EXIT(C_INFO)
{
	npc             = VLK_553_Buddler;
	nr              = 999;
	condition		= DIA_Buddler553_EXIT_Condition;
	information		= DIA_Buddler553_EXIT_Info;
	permanent		= TRUE;
	description     = dialog_ende;
};

FUNC INT DIA_Buddler553_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler553_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> USKAN1
//========================================

INSTANCE DIA_Buddler_USKAN1 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_USKAN1_Condition;
   information  = DIA_Buddler_USKAN1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Buddler_USKAN1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_USKAN1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Buddler_USKAN1_03_02"); //Jestem Uscan. Chyba nie musz� dodawa�, �e jestem Kopaczem, prawda?
};

//========================================
//-----------------> USKAN2
//========================================

INSTANCE DIA_Buddler_USKAN2 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_USKAN2_Condition;
   information  = DIA_Buddler_USKAN2_Info;
   permanent	= FALSE;
   description	= "Za co tu siedzisz?";
};

FUNC INT DIA_Buddler_USKAN2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN1))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Buddler_USKAN2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN2_15_01"); //Za co tu siedzisz?
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_02"); //Gildia zleci�a mi zdobycie sze�ciu krwawych puchar�w. Szefowa zamierza�a je pewnie opchn�� jakiemu� z tych snob�w, kt�rzy gromadz� tego typu historyczne pami�tki.
    AI_Output (other, self ,"DIA_Buddler_USKAN2_15_03"); //Wida� nie za dobrze ci posz�o, skoro wyl�dowa�e� na zes�aniu.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_04"); //Nie przerywaj mi, to ci opowiem. Na czym to ja sko�czy�em? A no tak...
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_05"); //Wprawdzie uda�o mi si� �wisn�� puchar z domu tego pi�knisia � Valentino, ale wpad�em podczas przeczesywania domu Gerbrandta.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_06"); //By�em pewien, �e ten kr�tacz g��boko �pi, a tymczasem wymkn�� si� ze swojej rezydencji i zawo�a� stra�e. M�j dalszy los by� �atwy do przewidzenia. 
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_07"); //Ten Gerbrandt sam prowadzi r�ne ciemne interesy. W Kolonii Karnej jest ju� jego by�y wsp�lnik, kt�ry odwala� za niego brudn� robot�.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_08"); //Tylko czeka� i ten oble�ny knur sam wyl�duje w G�rniczej Dolinie, a wtedy nie chcia�bym by� na jego miejscu.
};

//========================================
//-----------------> USKAN3
//========================================

INSTANCE DIA_Buddler_USKAN3 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_USKAN3_Condition;
   information  = DIA_Buddler_USKAN3_Info;
   permanent	= FALSE;
   description	= "Kim jest by�y wsp�pracownik Gerbrandta?";
};

FUNC INT DIA_Buddler_USKAN3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_USKAN3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN3_15_01"); //Kim jest by�y wsp�pracownik Gerbrandta?
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_02"); //To Diego � szef Cieni, naprawd� nie wiedzia�e�? Wida� Gerbrandt postanowi� si� pozby� swojego wsp�lnika. 
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_03"); //Pewnie wyczu�, �e z Diega jest niez�y spryciarz i w sumie si� nie pomyli�, bo ten szczwany lis zdo�a� si� nie�le urz�dzi� w Kolonii Karnej.
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_04"); //Ka�dy tu niby zaczyna� z kilofem, ale nie ka�demu udaje si� zosta� dow�dc� Cieni, prawda? 
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_05"); //Pomy�l wi�c sobie, co ten bystrzacha przygotowa� na wypadek, gdyby do Kolonii Karnej mia� trafi� go��, kt�ry go wycycka�. 
};

//========================================
//-----------------> USKAN4
//========================================

INSTANCE DIA_Buddler_USKAN4 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_USKAN4_Condition;
   information  = DIA_Buddler_USKAN4_Info;
   permanent	= FALSE;
   description	= "Sk�d nazwa tych kielich�w?";
};

FUNC INT DIA_Buddler_USKAN4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN3))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_USKAN4_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN4_15_01"); //Sk�d nazwa tych kielich�w?
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_02"); //Nazywaj� je krwawymi, bo nasz �kochany� kr�l zdoby� je podczas bardzo krwawej wyprawy, w czasie kt�rej straci� sporo swoich ludzi. 
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_03"); //Bra�o w niej udzia� wielu �o�nierzy z Khorinis, wi�c te snoby z G�rnego Miasta postanowi�y koniecznie zdoby� krwawe kielichy.
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_04"); //�e niby jaka� pami�tka odwagi mieszka�c�w Khorinis, ale dla mnie to zwyk�e kielichy, za kt�re bogacze s� gotowi solidnie przep�aci�.
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_05"); //Naprawd� trzeba nie wiedzie� co robi� ze z�otem, by wydawa� je na jakie� sentymentalne starocia.
};

//========================================
//-----------------> USKAN5
//========================================

INSTANCE DIA_Buddler_USKAN5 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 5;
   condition    = DIA_Buddler_USKAN5_Condition;
   information  = DIA_Buddler_USKAN5_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi poradzi�?";
};

FUNC INT DIA_Buddler_USKAN5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN2))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Buddler_USKAN5_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN5_15_01"); //Co mo�esz mi poradzi�?
    AI_Output (self, other ,"DIA_Buddler_USKAN5_03_02"); //Ten Valentino chowa swoje skarby w skrytce, kt�rej mechanizm uruchamia jedna z lamp wisz�cych na �cianie. Po przekr�ceniu lampy, �cianka znika i pojawia si� pomieszczenie z kuferkiem.
    AI_Output (other, self ,"DIA_Buddler_USKAN5_15_03"); //Z pewno�ci� b�d� mia� okazj� to sprawdzi�.
    AI_Output (self, other ,"DIA_Buddler_USKAN5_03_04"); //No tak, jeste�my przecie� pod Magiczn� Barier�. Ale prosi�e� o rad�, wi�c masz rad�.
};

//========================================
//-----------------> USKAN6
//========================================

INSTANCE DIA_Buddler_USKAN6 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 6;
   condition    = DIA_Buddler_USKAN6_Condition;
   information  = DIA_Buddler_USKAN6_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Buddler_USKAN6_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_USKAN6_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN6_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Buddler_USKAN6_03_02"); //P�ac� Stra�nikom i ciesz� si� spokojem�
};

//========================================
//-----------------> USKAN7
//========================================

INSTANCE DIA_Buddler_USKAN7 (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 7;
   condition    = DIA_Buddler_USKAN7_Condition;
   information  = DIA_Buddler_USKAN7_Info;
   permanent	= FALSE;
   description	= "R�czka te� by� w Gildii Z�odziei?";
};

FUNC INT DIA_Buddler_USKAN7_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_USKAN2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_USKAN7_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_01"); //R�czka te� by� w Gildii Z�odziei?
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_02"); //Wprawdzie jestem tu od lat, ale kodeks honorowy z�odzieja w dalszym ci�gu mnie zobowi�zuje.
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_03"); //No i?
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_04"); //Przede wszystkim lojalno��.
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_05"); //Czyli jednak R�czka by� cz�onkiem Gildii Z�odziei.
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_06"); //Wybacz kolego, ale naprawd� nie mog� ci powiedzie�.
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_07"); //Jak sobie chcesz.
};


//========================================
//-----------------> NIEPOKORNY1USKAN
//========================================

INSTANCE DIA_Buddler_NIEPOKORNY1USKAN (C_INFO)
{
   npc          = VLK_553_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_NIEPOKORNY1USKAN_Condition;
   information  = DIA_Buddler_NIEPOKORNY1USKAN_Info;
   permanent	= FALSE;
   description	= "Dzi� w nocy trzeba przetrzepa� sk�r� Onedowi! (zap�a� 50 bry�ek)";
};

FUNC INT DIA_Buddler_NIEPOKORNY1USKAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_NIEPOKORNY2))
    && (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_NIEPOKORNY1USKAN_Info()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_01"); //Dzi� w nocy trzeba przetrzepa� sk�r� Onedowi! 
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1USKAN_03_02"); //A to niby czemu?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_03"); //Bo chce nawia�. Oczywi�cie gdy mu si� uda ,wszystko spadnie na reszt� Kopaczy.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1USKAN_03_04"); //Racja, daj par� bry�ek za fatyg� i zajm� si� tym.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_05"); //Prosz�.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Uscan we�mie udzia� w zasadzce na Oneda.");
    B_GiveInvItems (other, self, ItMiNugget, 50);
};

//========================================
// Zadanie "Kto komu piasek sypie"
//========================================

INSTANCE DIA_Uscan_Hello (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_Hello_Condition;
	information	= DIA_Uscan_Hello_Info;
	permanent	= 0;
	description = "Potrzebujesz mo�e pomocy?";
};                       

FUNC INT DIA_Uscan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Uscan_Hello_Info()
{
	AI_Output (other, self,"DIA_Uscan_Hello_15_00"); //Potrzebujesz mo�e pomocy?
	AI_Output (self, other,"DIA_Uscan_Hello_01_01"); //M�g�by� mi si� przyda�. To nie b�dzie trudne zadanie, a je�li je wykonasz, to dostaniesz par� bry�ek. Zainteresowany?
	AI_Output (other, self,"DIA_Uscan_Hello_15_02"); //Pewnie, �e tak.
	AI_Output (self, other,"DIA_Uscan_Hello_01_03"); //Zatem pos�uchaj. W obozie znajduje si� Kopacz o imieniu Eskel. Kiedy� by� piekarzem w Khorinis...
	AI_Output (other, self,"DIA_Uscan_Hello_15_04"); //I co w tym takiego niezwyk�ego?
	AI_Output (self, other,"DIA_Uscan_Hello_01_05"); //Przez tego drania nie mam paru z�b�w!
	AI_Output (other, self,"DIA_Uscan_Hello_15_06"); //Czyli ci je wybi� i teraz mam mu si� odwdzi�czy� tym samym?
	AI_Output (self, other,"DIA_Uscan_Hello_01_07"); //Daj mi doko�czy�. Kiedy Eskel mia� z kim� na pie�ku dodawa� piasek do m�ki i sprzedawa� mu tak wypieczony chleb.
	AI_Output (self, other,"DIA_Uscan_Hello_01_08"); //Potem szczerbaty nieszcz�nik wyklina� tego trefnego piekarza, a tamten mia� radoch�. Tak by�o te� ze mn�.
	AI_Output (self, other,"DIA_Uscan_Hello_01_09"); //Czas wyr�wna� z nim rachunki!
	AI_Output (other, self,"DIA_Uscan_Hello_15_10"); //W jaki spos�b?
	AI_Output (self, other,"DIA_Uscan_Hello_01_11"); //Eskel wykorzystuje sw�j dawny fach by upiec czasem sobie w�asny chleb.
	AI_Output (self, other,"DIA_Uscan_Hello_01_12"); //Czas da� mu posmakowa� jego ulepszonej wersji.
	AI_Output (other, self,"DIA_Uscan_Hello_15_13"); //Rozumiem. Mam wiec mu dosypa� piasku do tej m�ki, tak?
	AI_Output (self, other,"DIA_Uscan_Hello_01_14"); //To musi by� fachowa robota, tak by Eskel si� nie po�apa�. P�jdziesz do Bukharta, on by� kiedy� farmerem.
	AI_Output (self, other,"DIA_Uscan_Hello_01_15"); //B�dzie wiedzia� jak dobrze to przygotowa�, by tamten szubrawiec niczego nie odkry�.
	AI_Output (other, self,"DIA_Uscan_Hello_15_16"); //Zatem, id� do niego. Mieszka na g�rnym stopniu nieopodal ku�ni, tu� przy zawalonej karczmie Manheima. 
	AI_Output (self, other,"DIA_Uscan_Hello_01_17"); //Zaczekaj. Za��da od ciebie has�a. Brzmi ono "Czerwona Latarnia".
	AI_Output (other, self,"DIA_Uscan_Hello_15_18"); //B�d� pami�ta�.
	
	MIS_WhoeverPoursSand = LOG_RUNNING;

	Log_CreateTopic			(CH1_WhoeverPoursSand, LOG_MISSION);
	Log_SetTopicStatus	(CH1_WhoeverPoursSand, LOG_RUNNING);
	B_LogEntry					(CH1_WhoeverPoursSand, "Kopacz Uscan poprosi� mnie o pomoc w zem�cie na Eskelu. Eskel dosypa� kiedy� Uscanowi piasku do m�ki i przez to ten teraz nie ma z�b�w. Mam si� odwdzi�czy� w imieniu Uscana. W tym celu powianiem pogada� z Bukhartem i poprosi� go o przygotowanie worka z przygotowan� m�k�. Bukharta znajd� na g�rnym poziomie nieopodal ku�ni, tu� przy zawalonej wie�y w kt�rej sw� karczm� ma Manheim.");
};

INSTANCE DIA_Uscan_LookForEskel (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_LookForEskel_Condition;
	information	= DIA_Uscan_LookForEskel_Info;
	permanent	= 0;
	description = "Gdzie mieszka Eskel?";
};                       

FUNC INT DIA_Uscan_LookForEskel_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Uscan_Hello)) && (MIS_WhoeverPoursSand == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Uscan_LookForEskel_Info()
{
	AI_Output (other, self,"DIA_Uscan_LookForEskel_15_00"); //Gdzie mieszka Eskel?
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_01"); //No tak, jeste� tu od niedawna. Jak by ci to...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_02"); //Ju� wiem!
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_03"); //Id� g�rnym poziomem w kierunku chaty Kyle'a. To ten wariat co ma chat� na drodze i wydziera si� na ka�dego kto przez ni� przechodzi.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_04"); //Nad��asz?
	AI_Output (other, self,"DIA_Uscan_LookForEskel_15_05"); //Mhm...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_06"); //�wietnie. W ka�dym razie, jak do niej dojdziesz, to odwr�� si� za siebie i szukaj domu z baldachimem. 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_07"); //Je�eli niczego nie pokr�ci�em to w�a�nie powiniene� mie� przed oczyma chat� Eskela... 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_08"); //Troch� g�upio by by�o gdyby� wbi� przez przypadek do Hereka. Chyba, �e lubisz towarzystwo furiat�w i idiot�w. 
	AI_Output (other, self,"DIA_Uscan_LookForEskel_15_09"); //Wola�bym tego unikn��.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_10"); //No w�a�nie.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_11"); //I jeszcze jedno. 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_12"); //Nie wypytuj wszystkich o chat� Eskela bo ca�y plan szlag trafi. Taki Jesse go nie lubi, ale czasami ma zbyt d�ugi j�zyk i no ten tego...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_13"); //Dobra, a teraz spadaj si� wszystkim zaj��.
	
	B_LogEntry					(CH1_WhoeverPoursSand, "Z tego co powiedzia� Uscan, Eskel mieszka w chacie z baldachimem, na g�rnym poziomie przed chat� Kyle'a. Ze wskaz�wek z�odzieja wynika, �e Eskel mieszka w s�siedztwie Hereka. Mam nadziej�, �e nie pomyl� ich chat.");
};

INSTANCE DIA_Uscan_Flour (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_Flour_Condition;
	information	= DIA_Uscan_Flour_Info;
	permanent	= 0;
	description = "Podmieni�em m�k�.";
};                       

FUNC INT DIA_Uscan_Flour_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Bukhart_TwoHoursLater) && (Mob_HasItems("MOD_USCANCHEST", ItMi_FlourBagWithSand) > 0) && (Mob_HasItems("MOD_USCANCHEST", ItMi_FlourBag) == 0))
	{
		return 1;
	};
};

FUNC VOID DIA_Uscan_Flour_Info()
{
	AI_Output (other, self,"DIA_Uscan_Flour_15_00"); //Podmieni�em m�k�.
	AI_Output (self, other,"DIA_Uscan_Flour_01_01"); //�wietnie, teraz czekajmy na efekty.
	AI_Output (other, self,"DIA_Uscan_Flour_15_02"); //A co z moj� zap�at�?
	AI_Output (self, other,"DIA_Uscan_Flour_01_03"); //A widzisz gdzie� walaj�ce si� po ziemi z�by Eskela? Bo ja nie. Dostaniesz rud� jak wszystko wypali.
	AI_Output (self, other,"DIA_Uscan_Flour_01_04"); //Poczekaj par� dni i miej uszy szeroko otwarte.
	
	UscanDay = Wld_GetDay() + 2;
	
	B_LogEntry(CH1_WhoeverPoursSand, "Musze poczeka� par� dni, oczekuj�c efekt�w moich dzia�a�.");
};

INSTANCE DIA_Uscan_EskelTeeth (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_EskelTeeth_Condition;
	information	= DIA_Uscan_EskelTeeth_Info;
	permanent	= 0;
	description = "Uz�bienie Eskela dosta�o nale�n� nauczk�.";
};                       

FUNC INT DIA_Uscan_EskelTeeth_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jesse_Eskel))
	{
		return 1;
	};
};

FUNC VOID DIA_Uscan_EskelTeeth_Info()
{
	AI_Output (other, self,"DIA_Uscan_EskelTeeth_15_00"); //Uz�bienie Eskela dosta�o nale�n� nauczk�.
	AI_Output (self, other,"DIA_Uscan_EskelTeeth_01_01"); //Wspaniale. Ten dra� teraz poczu� si� dok�adnie tak �le jak ja kiedy�. Mam nadzieje, �e ta Kolonia nieraz skopie mu jeszcze ty�ek.
	AI_Output (self, other,"DIA_Uscan_EskelTeeth_01_02"); //A teraz we� nale�n� zap�at�.
	
	CreateInvItem(self, ItMiNugget);
	B_GiveInvItems(self, other, ItMiNugget, 50);
	
	AI_Output (other, self,"DIA_Uscan_EskelTeeth_15_03"); //Dzi�ki.
	
	MIS_WhoeverPoursSand = LOG_SUCCESS;

   Log_SetTopicStatus(CH1_WhoeverPoursSand, LOG_SUCCESS);
	B_LogEntry(CH1_WhoeverPoursSand, "Otrzyma�em troch� rudy od Uscana. Zadanie wykonane.");
};