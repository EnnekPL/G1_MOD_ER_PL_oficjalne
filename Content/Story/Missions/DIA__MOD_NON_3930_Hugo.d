// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hugo_EXIT(C_INFO)
{
	npc             = NON_3930_Hugo;
	nr              = 999;
	condition	= DIA_Hugo_EXIT_Condition;
	information	= DIA_Hugo_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Hugo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hugo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Hugo_HELLO1 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 1;
   condition    = DIA_Hugo_HELLO1_Condition;
   information  = DIA_Hugo_HELLO1_Info;
   permanent	= FALSE;
   description	= "Co ty tu robisz?";
};

FUNC INT DIA_Hugo_HELLO1_Condition()
{
    if (MIS_gdzie_hugo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_01"); //Co ty tu robisz?
	//fix1210
    AI_Output (self, other ,"DIA_Hugo_HELLO1_15_02"); //Postanowi�em za�o�y� tu sobie baz� wypadow�. Znalaz�em pewn� map� z orkowym skarbem. Zbieram si� od kilku dni, aby po niego wyruszy�. 
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_03"); //Zaraz, nazywasz si� Hugo?
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_04"); //Tak, jestem Hugo, �owca ork�w, sk�d znasz moje imi�?
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_05"); //Ch�opaki z obozu ci� szukaj�. M�wili, �e znikn��e� bez �ladu.
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_06"); //Zgadza si�, nie chcia�em si� im t�umaczy� z tego, co odkry�em. Jestem na tropie skarbu i chcia�em wymkn�� si� ukradkiem, aby w spokoju go odnale��. 
    B_LogEntry                     (CH1_gdzie_hugo,"Hugo ukry� si� przed przyjaci�mi, bo odnalaz� map� do orkowego skarbu. Nie chcia� dzieli� si� nagrod�, kt�rej jeszcze nawet nie zdoby�.");
//fix 1210
    B_GiveXP (150);
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Hugo_HELLO2 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 2;
   condition    = DIA_Hugo_HELLO2_Condition;
   information  = DIA_Hugo_HELLO2_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o tym skarbie. ";
};

FUNC INT DIA_Hugo_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO2_15_01"); //Opowiedz mi o tym skarbie. 
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_02"); //No wi�c kilka dni temu stoczyli�my z ch�opakami potyczk� z grup� ork�w w starej Cytadeli w g�rach. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_03"); //Jestem bardzo zainteresowany wszystkim, co nosi znami� ork�w i pozwoli mi zbada� dog��bnie ich kultur�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_04"); //Mam pewn� zasad�: zanim zabij� jakiego� orka torturuj� go, aby wydoby� informacje, a gdy ju� go zabijam, zawsze przeszukuj� zw�oki.
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_05"); //Po potyczce przeszuka�em wi�c cia�o przyw�dcy tej grupy ork�w i znalaz�em pewn� map�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_06"); //Miejsce, gdzie znajduje si� skarb oznaczono na mapie krzy�ykiem. Postanowi�em wi�c opu�ci� ob�z �owc�w ork�w na jaki� czas i odnale�� skarb.
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Hugo_HELLO3 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 3;
   condition    = DIA_Hugo_HELLO3_Condition;
   information  = DIA_Hugo_HELLO3_Info;
   permanent	= FALSE;
   description	= "Pomog� ci odnale�� skarb, poka� mi t� map�. ";
};

FUNC INT DIA_Hugo_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_01"); //Pomog� ci odnale�� skarb, poka� mi t� map�. 
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_02"); //Prosz� bardzo, przynie� mi wszystko co tam znajdziesz, a nagrodz� ci� rud�. 
	AI_Output (self, other ,"DIA_Hugo_HELLO3_03_03"); //Nie pr�buj jednak znikn�� ze skarbem, bo zrobi si� nieciekawie. Wychowa�em si� w Nordmarze i mo�esz mi wierzy�, �e na bitce to ja si� znam. 
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_04"); //Nie obawiaj si�, przynios� ci skarb.
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_05"); //�wietnie, oto mapa. Miejsce, gdzie znajduje si� skarb znajduje si� chyba w okolicach Nowego Obozu i Starej Kopalni. Powodzenia, i pami�taj o naszej umowie.
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_06"); //Dzi�ki.
	B_GiveInvItems (self, other, Hugo_Map, 1);
    B_LogEntry                     (CH1_gdzie_hugo,"Hugo nie pokusi� si�, �eby i�� ze mn� odnale�� skarb. Nie do��, �e musz� sam uda� si� w wyznaczone miejsce, to jeszcze mam si� z nim podzieli� po�ow� skarbu.");
};//fix 1210

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Hugo_HELLO4 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 4;
   condition    = DIA_Hugo_HELLO4_Condition;
   information  = DIA_Hugo_HELLO4_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o orkach i o tym, czego zdo�a�e� si� dowiedzie�. ";
};

FUNC INT DIA_Hugo_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO2))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO4_Info()
{
     AI_Output (other, self ,"DIA_Hugo_HELLO4_15_01"); //Opowiedz mi o orkach i o tym, czego zdo�a�e� si� dowiedzie�. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_02"); //Niech ci b�dzie, s�uchaj wi�c: Orkowa kultura dor�wnuje wiekiem naszej, cho� ludzie i orkowie nigdy za dobrze si� nie dogadywali. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_03"); //Ludzie i orkowie od wiek�w toczyli mi�dzy sob� wojny. Rycerze Innosa organizowali nawet krucjaty na Ziemie Ork�w, by tam t�pi� je w ich le�ach po�o�onych na dalekiej p�nocy Kontynentu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_04"); //W walkach tych brali udzia� ochotnicy z chyba wszystkich kr�lestw podzielonej jeszcze w�wczas Myrtany. Swoj� drog� w tamtych czasach udzielni w�adcy zielonej cz�ci Kontynentu rzadko wyst�powali wsp�lnie w jakiejkolwiek sprawie. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_05"); //Szczerze m�wi�c kr�lowie ci woleli prowadzi� wojny mi�dzy sob�, a wyprawy na ork�w by�y przez nich raczej wykorzystywane jedynie jako okazja by odwr�ci� uwag� Nordmarczyk�w od bogatych ziem po�o�onych na po�udniu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_06"); //Wiele zmieni�o si� wraz z pojawieniem si� Rhobara I i zapocz�tkowanym przez niego dzie�em zjednoczenia Myrtany... 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_07"); //Pan Ognia poradzi� Rhobarowi, aby zebra� jak najpot�niejsz� armi� i uderzy� na ork�w w Nordmarze, aby rozbi� ich pot�g�.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_08"); //Z imieniem Innosa na ustach kr�l i jego armia rzucili si� na zielonosk�rych i rozgromili pot�n� armi� nieprzyjaciela.
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_09"); //Wi�cej jednak o tej walce nie wiem, gdy� wiem o nich jedynie z opowie�ci, kt�re pami�� o nich czyni� wci�� �yw� po�r�d mego ludu. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_10"); //Wiem jednak, �e pierwszym kr�lem Myrtany by� Nordmarczyk, i za tamtych czas�w oba kr�lestwa trzyma�y si� razem. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_11"); //Wiele lat p�niej za czas�w panowania Rhobara II, wybuch�a kolejna wielka wojna z orkami, kt�ra trwa po dzie� dzisiejszy.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_12"); //Przyczyn� wojny, z tego co wiem by� mro�ny klimat niesprzyjaj�cy �yciu w Kr�lestwie Ork�w, po�o�onym na p�noc od kontynentu.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_13"); //Ich przyw�dc� by� Berserker, kt�ry wraz z pot�n� armi� ork�w najecha� Nordmar, wyp�dzaj�c jednocze�nie stamt�d wojska kr�lewskie, kt�re zarz�dza�y kopalni� rudy w Klanie M�ota. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_14"); //Op�r po dzie� dzisiejszy stawiaj� tylko moi pobratymcy z nordmarskich klan�w, kt�rzy podczas jednej z potyczek powalili Berserkera.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_15"); //Orkom jednak to nie przeszkodzi�o, gdy� za nast�pny cel obrali sobie Myrtan�, o kt�r� wojna wci�� trwa. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_16"); //Jestem ciekaw jak potocz� si� dalsze losy tej wojny.
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_17"); //A co z orkow� kultur�? Opowiesz mi co� o niej?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_18"); //Jasne. Orkowie dziel� si� na dwie nacje: orkowie z p�nocy i orkowie z g�r. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_19"); //Te ma�piszony tutaj to g�rscy orkowie, kt�rzy s� potwornie prymitywni w por�wnaniu do pobratymc�w z kontynentu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_20"); //Owszem, maj� swoje zwyczaje, sw�j j�zyk oraz czcz� jakiego� boga zwanego KRUSHAK, jednak s� oni ma�o ludzcy.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_21"); //Orkowie z kontynentu natomiast potrafi� pos�ugiwa� si� mow� ludzk� i s� o wiele bardziej cywilizowani. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_22"); //R�ni� si� oni tak�e wygl�dem, gdy� w przeciwie�stwie do g�rskich ork�w s� oni prostej postawy i nie wygl�daj� jak napakowane ma�py.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_23"); //Orkowie z g�r przewy�sz� jednak swoich pobratymc�w si�� - s� nieco silniejsi. Orkowie to gro�ne skurczybyki w ka�dej postaci i bez ostrego miecz czy topora nie dasz im rady. 
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_24"); //Sk�d tyle wiesz o orkach?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_25"); //Pochodz� z Klanu Ognia w Nordmarze. Barbarzy�cy, kt�rzy tam mieszkaj� nazywani s� Zab�jcami Ork�w. Mamy wi�c ogromne do�wiadczenie, je�li chodzi o te bestie. 
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Hugo_HELLO5 (C_INFO)
{
   npc          = NON_3930_Hugo;
   nr           = 5;
   condition    = DIA_Hugo_HELLO5_Condition;
   information  = DIA_Hugo_HELLO5_Info;
   permanent	= FALSE;
   description	= "By�em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani ork�w, ani skarbu, nic. ";
};

FUNC INT DIA_Hugo_HELLO5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Hugo_HELLO3))
    && (Bylem_wodospad == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_01"); //By�em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani ork�w, ani skarbu, nic. 
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_02"); //CO? Cholera, chyba nie robisz mnie w konia?
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_03"); //Nie, m�wi� prawd�.
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_04"); //W porz�dku, wierz� ci. Cholerni orkowie, pewnie to jaka� stara mapa i zwin�li skarb ju� dawno temu zabieraj�c go do miasta. 
	AI_Output (self, other ,"DIA_Hugo_HELLO5_03_05"); //Troch� si� rozczarowa�em, ale trudno. Wracam do obozu. Mo�esz powiedzie� ch�opakom, �e nied�ugo tam b�d�.
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_06"); //Przeka��.
    B_LogEntry                     (CH1_gdzie_hugo,"Skarb nie istnieje, Hugo postanowi� wr�ci� do obozu. Powinienem poinformowa� o tym Osko.");

    B_GiveXP (200);
	Npc_ExchangeRoutine (self,"lowcy");
};

