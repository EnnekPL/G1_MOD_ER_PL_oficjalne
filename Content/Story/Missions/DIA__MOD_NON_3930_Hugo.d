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
    if (MIS_HunterHugo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hugo_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_01"); //Co ty tu robisz?
	//fix1210
    AI_Output (self, other ,"DIA_Hugo_HELLO1_15_02"); //Postanowi³em za³o¿yæ tu sobie bazê wypadow¹. Znalaz³em pewn¹ mapê z orkowym skarbem. Zbieram siê od kilku dni, aby po niego wyruszyæ. 
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_03"); //Zaraz, nazywasz siê Hugo?
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_04"); //Tak, jestem Hugo, ³owca orków, sk¹d znasz moje imiê?
    AI_Output (other, self ,"DIA_Hugo_HELLO1_15_05"); //Ch³opaki z obozu ciê szukaj¹. Mówili, ¿e znikn¹³eœ bez œladu.
    AI_Output (self, other ,"DIA_Hugo_HELLO1_03_06"); //Zgadza siê, nie chcia³em siê im t³umaczyæ z tego, co odkry³em. Jestem na tropie skarbu i chcia³em wymkn¹æ siê ukradkiem, aby w spokoju go odnaleŸæ. 
    B_LogEntry                     (CH1_HunterHugo,"Hugo ukry³ siê przed przyjació³mi, bo odnalaz³ mapê do orkowego skarbu. Nie chcia³ dzieliæ siê nagrod¹, której jeszcze nawet nie zdoby³.");
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
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_02"); //No wiêc kilka dni temu stoczyliœmy z ch³opakami potyczkê z grup¹ orków w starej Cytadeli w górach. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_03"); //Jestem bardzo zainteresowany wszystkim, co nosi znamiê orków i pozwoli mi zbadaæ dog³êbnie ich kulturê. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_04"); //Mam pewn¹ zasadê: zanim zabijê jakiegoœ orka torturujê go, aby wydobyæ informacje, a gdy ju¿ go zabijam, zawsze przeszukujê zw³oki.
    AI_Output (self, other ,"DIA_Hugo_HELLO2_03_05"); //Po potyczce przeszuka³em wiêc cia³o przywódcy tej grupy orków i znalaz³em pewn¹ mapê. 
	AI_Output (self, other ,"DIA_Hugo_HELLO2_03_06"); //Miejsce, gdzie znajduje siê skarb oznaczono na mapie krzy¿ykiem. Postanowi³em wiêc opuœciæ obóz ³owców orków na jakiœ czas i odnaleŸæ skarb.
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
   description	= "Pomogê ci odnaleŸæ skarb, poka¿ mi t¹ mapê. ";
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
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_01"); //Pomogê ci odnaleŸæ skarb, poka¿ mi t¹ mapê. 
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_02"); //Proszê bardzo, przynieœ mi wszystko co tam znajdziesz, a nagrodzê ciê rud¹. 
	AI_Output (self, other ,"DIA_Hugo_HELLO3_03_03"); //Nie próbuj jednak znikn¹æ ze skarbem, bo zrobi siê nieciekawie. Wychowa³em siê w Nordmarze i mo¿esz mi wierzyæ, ¿e na bitce to ja siê znam. 
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_04"); //Nie obawiaj siê, przyniosê ci skarb.
    AI_Output (self, other ,"DIA_Hugo_HELLO3_03_05"); //Œwietnie, oto mapa. Miejsce, gdzie znajduje siê skarb znajduje siê chyba w okolicach Nowego Obozu i Starej Kopalni. Powodzenia, i pamiêtaj o naszej umowie.
    AI_Output (other, self ,"DIA_Hugo_HELLO3_15_06"); //Dziêki.
	B_GiveInvItems (self, other, Hugo_Map, 1);
    B_LogEntry                     (CH1_HunterHugo,"Hugo nie pokusi³ siê, ¿eby iœæ ze mn¹ odnaleŸæ skarb. Nie doœæ, ¿e muszê sam udaæ siê w wyznaczone miejsce, to jeszcze mam siê z nim podzieliæ po³ow¹ skarbu.");
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
   description	= "Opowiedz mi o orkach i o tym, czego zdo³a³eœ siê dowiedzieæ. ";
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
     AI_Output (other, self ,"DIA_Hugo_HELLO4_15_01"); //Opowiedz mi o orkach i o tym, czego zdo³a³eœ siê dowiedzieæ. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_02"); //Niech ci bêdzie, s³uchaj wiêc: Orkowa kultura dorównuje wiekiem naszej, choæ ludzie i orkowie nigdy za dobrze siê nie dogadywali. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_03"); //Ludzie i orkowie od wieków toczyli miêdzy sob¹ wojny. Rycerze Innosa organizowali nawet krucjaty na Ziemie Orków, by tam têpiæ je w ich le¿ach po³o¿onych na dalekiej pó³nocy Kontynentu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_04"); //W walkach tych brali udzia³ ochotnicy z chyba wszystkich królestw podzielonej jeszcze wówczas Myrtany. Swoj¹ drog¹ w tamtych czasach udzielni w³adcy zielonej czêœci Kontynentu rzadko wystêpowali wspólnie w jakiejkolwiek sprawie. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_05"); //Szczerze mówi¹c królowie ci woleli prowadziæ wojny miêdzy sob¹, a wyprawy na orków by³y przez nich raczej wykorzystywane jedynie jako okazja by odwróciæ uwagê Nordmarczyków od bogatych ziem po³o¿onych na po³udniu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_06"); //Wiele zmieni³o siê wraz z pojawieniem siê Rhobara I i zapocz¹tkowanym przez niego dzie³em zjednoczenia Myrtany... 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_07"); //Pan Ognia poradzi³ Rhobarowi, aby zebra³ jak najpotê¿niejsz¹ armiê i uderzy³ na orków w Nordmarze, aby rozbiæ ich potêgê.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_08"); //Z imieniem Innosa na ustach król i jego armia rzucili siê na zielonoskórych i rozgromili potê¿n¹ armiê nieprzyjaciela.
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_09"); //Wiêcej jednak o tej walce nie wiem, gdy¿ wiem o nich jedynie z opowieœci, które pamiêæ o nich czyni¹ wci¹¿ ¿yw¹ poœród mego ludu. 
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_10"); //Wiem jednak, ¿e pierwszym królem Myrtany by³ Nordmarczyk, i za tamtych czasów oba królestwa trzyma³y siê razem. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_11"); //Wiele lat póŸniej za czasów panowania Rhobara II, wybuch³a kolejna wielka wojna z orkami, która trwa po dzieñ dzisiejszy.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_12"); //Przyczyn¹ wojny, z tego co wiem by³ mroŸny klimat niesprzyjaj¹cy ¿yciu w Królestwie Orków, po³o¿onym na pó³noc od kontynentu.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_13"); //Ich przywódc¹ by³ Berserker, który wraz z potê¿n¹ armi¹ orków najecha³ Nordmar, wypêdzaj¹c jednoczeœnie stamt¹d wojska królewskie, które zarz¹dza³y kopalni¹ rudy w Klanie M³ota. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_14"); //Opór po dzieñ dzisiejszy stawiaj¹ tylko moi pobratymcy z nordmarskich klanów, którzy podczas jednej z potyczek powalili Berserkera.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_15"); //Orkom jednak to nie przeszkodzi³o, gdy¿ za nastêpny cel obrali sobie Myrtanê, o któr¹ wojna wci¹¿ trwa. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_16"); //Jestem ciekaw jak potocz¹ siê dalsze losy tej wojny.
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_17"); //A co z orkow¹ kultur¹? Opowiesz mi coœ o niej?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_18"); //Jasne. Orkowie dziel¹ siê na dwie nacje: orkowie z pó³nocy i orkowie z gór. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_19"); //Te ma³piszony tutaj to górscy orkowie, którzy s¹ potwornie prymitywni w porównaniu do pobratymców z kontynentu. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_20"); //Owszem, maj¹ swoje zwyczaje, swój jêzyk oraz czcz¹ jakiegoœ boga zwanego KRUSHAK, jednak s¹ oni ma³o ludzcy.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_21"); //Orkowie z kontynentu natomiast potrafi¹ pos³ugiwaæ siê mow¹ ludzk¹ i s¹ o wiele bardziej cywilizowani. 
AI_Output (self, other ,"DIA_Hugo_HELLO4_03_22"); //Ró¿ni¹ siê oni tak¿e wygl¹dem, gdy¿ w przeciwieñstwie do górskich orków s¹ oni prostej postawy i nie wygl¹daj¹ jak napakowane ma³py.
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_23"); //Orkowie z gór przewy¿sz¹ jednak swoich pobratymców si³¹ - s¹ nieco silniejsi. Orkowie to groŸne skurczybyki w ka¿dej postaci i bez ostrego miecz czy topora nie dasz im rady. 
   AI_Output (other, self ,"DIA_Hugo_HELLO4_15_24"); //Sk¹d tyle wiesz o orkach?
   AI_Output (self, other ,"DIA_Hugo_HELLO4_03_25"); //Pochodzê z Klanu Ognia w Nordmarze. Barbarzyñcy, którzy tam mieszkaj¹ nazywani s¹ Zabójcami Orków. Mamy wiêc ogromne doœwiadczenie, jeœli chodzi o te bestie. 
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
   description	= "By³em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani orków, ani skarbu, nic. ";
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
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_01"); //By³em w tej jaskini zaznaczonej na mapie i tam nic nie ma. Ani orków, ani skarbu, nic. 
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_02"); //CO? Cholera, chyba nie robisz mnie w konia?
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_03"); //Nie, mówiê prawdê.
    AI_Output (self, other ,"DIA_Hugo_HELLO5_03_04"); //W porz¹dku, wierzê ci. Cholerni orkowie, pewnie to jakaœ stara mapa i zwinêli skarb ju¿ dawno temu zabieraj¹c go do miasta. 
	AI_Output (self, other ,"DIA_Hugo_HELLO5_03_05"); //Trochê siê rozczarowa³em, ale trudno. Wracam do obozu. Mo¿esz powiedzieæ ch³opakom, ¿e nied³ugo tam bêdê.
    AI_Output (other, self ,"DIA_Hugo_HELLO5_15_06"); //Przeka¿ê.
    B_LogEntry                     (CH1_HunterHugo,"Skarb nie istnieje, Hugo postanowi³ wróciæ do obozu. Powinienem poinformowaæ o tym Osko.");

    B_GiveXP (200);
	Npc_ExchangeRoutine (self,"lowcy");
};

