
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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Buddler_USKAN1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_USKAN1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_USKAN1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Buddler_USKAN1_03_02"); //Jestem Uscan. Chyba nie muszê dodawaæ, ¿e jestem Kopaczem, prawda?
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
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_02"); //Gildia zleci³a mi zdobycie szeœciu krwawych pucharów. Szefowa zamierza³a je pewnie opchn¹æ jakiemuœ z tych snobów, którzy gromadz¹ tego typu historyczne pami¹tki.
    AI_Output (other, self ,"DIA_Buddler_USKAN2_15_03"); //Widaæ nie za dobrze ci posz³o, skoro wyl¹dowa³eœ na zes³aniu.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_04"); //Nie przerywaj mi, to ci opowiem. Na czym to ja skoñczy³em? A no tak...
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_05"); //Wprawdzie uda³o mi siê œwisn¹æ puchar z domu tego piêknisia – Valentino, ale wpad³em podczas przeczesywania domu Gerbrandta.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_06"); //By³em pewien, ¿e ten krêtacz g³êboko œpi, a tymczasem wymkn¹³ siê ze swojej rezydencji i zawo³a³ stra¿e. Mój dalszy los by³ ³atwy do przewidzenia. 
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_07"); //Ten Gerbrandt sam prowadzi ró¿ne ciemne interesy. W Kolonii Karnej jest ju¿ jego by³y wspólnik, który odwala³ za niego brudn¹ robotê.
    AI_Output (self, other ,"DIA_Buddler_USKAN2_03_08"); //Tylko czekaæ i ten obleœny knur sam wyl¹duje w Górniczej Dolinie, a wtedy nie chcia³bym byæ na jego miejscu.
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
   description	= "Kim jest by³y wspó³pracownik Gerbrandta?";
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
    AI_Output (other, self ,"DIA_Buddler_USKAN3_15_01"); //Kim jest by³y wspó³pracownik Gerbrandta?
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_02"); //To Diego – szef Cieni, naprawdê nie wiedzia³eœ? Widaæ Gerbrandt postanowi³ siê pozbyæ swojego wspólnika. 
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_03"); //Pewnie wyczu³, ¿e z Diega jest niez³y spryciarz i w sumie siê nie pomyli³, bo ten szczwany lis zdo³a³ siê nieŸle urz¹dzi³ w Kolonii Karnej.
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_04"); //Ka¿dy tu niby zaczyna³ z kilofem, ale nie ka¿demu udaje siê zostaæ dowódc¹ Cieni, prawda? 
    AI_Output (self, other ,"DIA_Buddler_USKAN3_03_05"); //Pomyœl wiêc sobie, co ten bystrzacha przygotowa³ na wypadek, gdyby do Kolonii Karnej mia³ trafiæ goœæ, który go wycycka³. 
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
   description	= "Sk¹d nazwa tych kielichów?";
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
    AI_Output (other, self ,"DIA_Buddler_USKAN4_15_01"); //Sk¹d nazwa tych kielichów?
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_02"); //Nazywaj¹ je krwawymi, bo nasz „kochany” król zdoby³ je podczas bardzo krwawej wyprawy, w czasie której straci³ sporo swoich ludzi. 
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_03"); //Bra³o w niej udzia³ wielu ¿o³nierzy z Khorinis, wiêc te snoby z Górnego Miasta postanowi³y koniecznie zdobyæ krwawe kielichy.
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_04"); //¯e niby jakaœ pami¹tka odwagi mieszkañców Khorinis, ale dla mnie to zwyk³e kielichy, za które bogacze s¹ gotowi solidnie przep³aciæ.
    AI_Output (self, other ,"DIA_Buddler_USKAN4_03_05"); //Naprawdê trzeba nie wiedzieæ co robiæ ze z³otem, by wydawaæ je na jakieœ sentymentalne starocia.
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
   description	= "Co mo¿esz mi poradziæ?";
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
    AI_Output (other, self ,"DIA_Buddler_USKAN5_15_01"); //Co mo¿esz mi poradziæ?
    AI_Output (self, other ,"DIA_Buddler_USKAN5_03_02"); //Ten Valentino chowa swoje skarby w skrytce, której mechanizm uruchamia jedna z lamp wisz¹cych na œcianie. Po przekrêceniu lampy, œcianka znika i pojawia siê pomieszczenie z kuferkiem.
    AI_Output (other, self ,"DIA_Buddler_USKAN5_15_03"); //Z pewnoœci¹ bêdê mia³ okazjê to sprawdziæ.
    AI_Output (self, other ,"DIA_Buddler_USKAN5_03_04"); //No tak, jesteœmy przecie¿ pod Magiczn¹ Barier¹. Ale prosi³eœ o radê, wiêc masz radê.
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
    AI_Output (self, other ,"DIA_Buddler_USKAN6_03_02"); //P³acê Stra¿nikom i cieszê siê spokojem…
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
   description	= "R¹czka te¿ by³ w Gildii Z³odziei?";
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
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_01"); //R¹czka te¿ by³ w Gildii Z³odziei?
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_02"); //Wprawdzie jestem tu od lat, ale kodeks honorowy z³odzieja w dalszym ci¹gu mnie zobowi¹zuje.
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_03"); //No i?
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_04"); //Przede wszystkim lojalnoœæ.
    AI_Output (other, self ,"DIA_Buddler_USKAN7_15_05"); //Czyli jednak R¹czka by³ cz³onkiem Gildii Z³odziei.
    AI_Output (self, other ,"DIA_Buddler_USKAN7_03_06"); //Wybacz kolego, ale naprawdê nie mogê ci powiedzieæ.
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
   description	= "Dziœ w nocy trzeba przetrzepaæ skórê Onedowi! (zap³aæ 50 bry³ek)";
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
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_01"); //Dziœ w nocy trzeba przetrzepaæ skórê Onedowi! 
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1USKAN_03_02"); //A to niby czemu?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_03"); //Bo chce nawiaæ. Oczywiœcie gdy mu siê uda ,wszystko spadnie na resztê Kopaczy.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1USKAN_03_04"); //Racja, daj parê bry³ek za fatygê i zajmê siê tym.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1USKAN_15_05"); //Proszê.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Uscan weŸmie udzia³ w zasadzce na Oneda.");
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
	description = "Potrzebujesz mo¿e pomocy?";
};                       

FUNC INT DIA_Uscan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Uscan_Hello_Info()
{
	AI_Output (other, self,"DIA_Uscan_Hello_15_00"); //Potrzebujesz mo¿e pomocy?
	AI_Output (self, other,"DIA_Uscan_Hello_01_01"); //Móg³byœ mi siê przydaæ. To nie bêdzie trudne zadanie, a jeœli je wykonasz, to dostaniesz parê bry³ek. Zainteresowany?
	AI_Output (other, self,"DIA_Uscan_Hello_15_02"); //Pewnie, ¿e tak.
	AI_Output (self, other,"DIA_Uscan_Hello_01_03"); //Zatem pos³uchaj. W obozie znajduje siê Kopacz o imieniu Eskel. Kiedyœ by³ piekarzem w Khorinis...
	AI_Output (other, self,"DIA_Uscan_Hello_15_04"); //I co w tym takiego niezwyk³ego?
	AI_Output (self, other,"DIA_Uscan_Hello_01_05"); //Przez tego drania nie mam paru zêbów!
	AI_Output (other, self,"DIA_Uscan_Hello_15_06"); //Czyli ci je wybi³ i teraz mam mu siê odwdziêczyæ tym samym?
	AI_Output (self, other,"DIA_Uscan_Hello_01_07"); //Daj mi dokoñczyæ. Kiedy Eskel mia³ z kimœ na pieñku dodawa³ piasek do m¹ki i sprzedawa³ mu tak wypieczony chleb.
	AI_Output (self, other,"DIA_Uscan_Hello_01_08"); //Potem szczerbaty nieszczêœnik wyklina³ tego trefnego piekarza, a tamten mia³ radochê. Tak by³o te¿ ze mn¹.
	AI_Output (self, other,"DIA_Uscan_Hello_01_09"); //Czas wyrównaæ z nim rachunki!
	AI_Output (other, self,"DIA_Uscan_Hello_15_10"); //W jaki sposób?
	AI_Output (self, other,"DIA_Uscan_Hello_01_11"); //Eskel wykorzystuje swój dawny fach by upiec czasem sobie w³asny chleb.
	AI_Output (self, other,"DIA_Uscan_Hello_01_12"); //Czas daæ mu posmakowaæ jego ulepszonej wersji.
	AI_Output (other, self,"DIA_Uscan_Hello_15_13"); //Rozumiem. Mam wiec mu dosypaæ piasku do tej m¹ki, tak?
	AI_Output (self, other,"DIA_Uscan_Hello_01_14"); //To musi byæ fachowa robota, tak by Eskel siê nie po³apa³. Pójdziesz do Bukharta, on by³ kiedyœ farmerem.
	AI_Output (self, other,"DIA_Uscan_Hello_01_15"); //Bêdzie wiedzia³ jak dobrze to przygotowaæ, by tamten szubrawiec niczego nie odkry³.
	AI_Output (other, self,"DIA_Uscan_Hello_15_16"); //Zatem, idê do niego. Mieszka na górnym stopniu nieopodal kuŸni, tu¿ przy zawalonej karczmie Manheima. 
	AI_Output (self, other,"DIA_Uscan_Hello_01_17"); //Zaczekaj. Za¿¹da od ciebie has³a. Brzmi ono "Czerwona Latarnia".
	AI_Output (other, self,"DIA_Uscan_Hello_15_18"); //Bêdê pamiêta³.
	
	MIS_WhoeverPoursSand = LOG_RUNNING;

	Log_CreateTopic			(CH1_WhoeverPoursSand, LOG_MISSION);
	Log_SetTopicStatus	(CH1_WhoeverPoursSand, LOG_RUNNING);
	B_LogEntry					(CH1_WhoeverPoursSand, "Kopacz Uscan poprosi³ mnie o pomoc w zemœcie na Eskelu. Eskel dosypa³ kiedyœ Uscanowi piasku do m¹ki i przez to ten teraz nie ma zêbów. Mam siê odwdziêczyæ w imieniu Uscana. W tym celu powianiem pogadaæ z Bukhartem i poprosiæ go o przygotowanie worka z przygotowan¹ m¹k¹. Bukharta znajdê na górnym poziomie nieopodal kuŸni, tu¿ przy zawalonej wie¿y w której sw¹ karczmê ma Manheim.");
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
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_01"); //No tak, jesteœ tu od niedawna. Jak by ci to...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_02"); //Ju¿ wiem!
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_03"); //IdŸ górnym poziomem w kierunku chaty Kyle'a. To ten wariat co ma chatê na drodze i wydziera siê na ka¿dego kto przez ni¹ przechodzi.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_04"); //Nad¹¿asz?
	AI_Output (other, self,"DIA_Uscan_LookForEskel_15_05"); //Mhm...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_06"); //Œwietnie. W ka¿dym razie, jak do niej dojdziesz, to odwróæ siê za siebie i szukaj domu z baldachimem. 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_07"); //Je¿eli niczego nie pokrêci³em to w³aœnie powinieneœ mieæ przed oczyma chatê Eskela... 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_08"); //Trochê g³upio by by³o gdybyœ wbi³ przez przypadek do Hereka. Chyba, ¿e lubisz towarzystwo furiatów i idiotów. 
	AI_Output (other, self,"DIA_Uscan_LookForEskel_15_09"); //Wola³bym tego unikn¹æ.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_10"); //No w³aœnie.
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_11"); //I jeszcze jedno. 
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_12"); //Nie wypytuj wszystkich o chatê Eskela bo ca³y plan szlag trafi. Taki Jesse go nie lubi, ale czasami ma zbyt d³ugi jêzyk i no ten tego...
	AI_Output (self, other,"DIA_Uscan_LookForEskel_01_13"); //Dobra, a teraz spadaj siê wszystkim zaj¹æ.
	
	B_LogEntry					(CH1_WhoeverPoursSand, "Z tego co powiedzia³ Uscan, Eskel mieszka w chacie z baldachimem, na górnym poziomie przed chat¹ Kyle'a. Ze wskazówek z³odzieja wynika, ¿e Eskel mieszka w s¹siedztwie Hereka. Mam nadziejê, ¿e nie pomylê ich chat.");
};

INSTANCE DIA_Uscan_Flour (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_Flour_Condition;
	information	= DIA_Uscan_Flour_Info;
	permanent	= 0;
	description = "Podmieni³em m¹kê.";
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
	AI_Output (other, self,"DIA_Uscan_Flour_15_00"); //Podmieni³em m¹kê.
	AI_Output (self, other,"DIA_Uscan_Flour_01_01"); //Œwietnie, teraz czekajmy na efekty.
	AI_Output (other, self,"DIA_Uscan_Flour_15_02"); //A co z moj¹ zap³at¹?
	AI_Output (self, other,"DIA_Uscan_Flour_01_03"); //A widzisz gdzieœ walaj¹ce siê po ziemi zêby Eskela? Bo ja nie. Dostaniesz rudê jak wszystko wypali.
	AI_Output (self, other,"DIA_Uscan_Flour_01_04"); //Poczekaj parê dni i miej uszy szeroko otwarte.
	
	UscanDay = Wld_GetDay() + 2;
	
	B_LogEntry(CH1_WhoeverPoursSand, "Musze poczekaæ parê dni, oczekuj¹c efektów moich dzia³añ.");
};

INSTANCE DIA_Uscan_EskelTeeth (C_INFO)
{
	npc			= VLK_553_Buddler;
	nr			= 1;
	condition	= DIA_Uscan_EskelTeeth_Condition;
	information	= DIA_Uscan_EskelTeeth_Info;
	permanent	= 0;
	description = "Uzêbienie Eskela dosta³o nale¿n¹ nauczkê.";
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
	AI_Output (other, self,"DIA_Uscan_EskelTeeth_15_00"); //Uzêbienie Eskela dosta³o nale¿n¹ nauczkê.
	AI_Output (self, other,"DIA_Uscan_EskelTeeth_01_01"); //Wspaniale. Ten drañ teraz poczu³ siê dok³adnie tak Ÿle jak ja kiedyœ. Mam nadzieje, ¿e ta Kolonia nieraz skopie mu jeszcze ty³ek.
	AI_Output (self, other,"DIA_Uscan_EskelTeeth_01_02"); //A teraz weŸ nale¿n¹ zap³atê.
	
	CreateInvItem(self, ItMiNugget);
	B_GiveInvItems(self, other, ItMiNugget, 50);
	
	AI_Output (other, self,"DIA_Uscan_EskelTeeth_15_03"); //Dziêki.
	
	MIS_WhoeverPoursSand = LOG_SUCCESS;

   Log_SetTopicStatus(CH1_WhoeverPoursSand, LOG_SUCCESS);
	B_LogEntry(CH1_WhoeverPoursSand, "Otrzyma³em trochê rudy od Uscana. Zadanie wykonane.");
};