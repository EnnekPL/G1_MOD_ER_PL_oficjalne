// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Natalia_EXIT(C_INFO)
{
	npc             = Gur_1207_Natalia;
	nr              = 999;
	condition	= DIA_Natalia_EXIT_Condition;
	information	= DIA_Natalia_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Natalia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Natalia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HelloNatalia
//========================================

INSTANCE DIA_Natalia_HelloNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 1;
   condition    = DIA_Natalia_HelloNatalia_Condition;
   information  = DIA_Natalia_HelloNatalia_Info;
   permanent	= FALSE;
   description	= "Witaj nieznajoma!";
};

FUNC INT DIA_Natalia_HelloNatalia_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Natalia_HelloNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_HelloNatalia_15_01"); //Witaj nieznajoma!
  //  AI_Output (self, other ,"DIA_Natalia_HelloNatalia_03_02"); //Omm...
    AI_Output (self, other ,"DIA_Natalia_HelloNatalia_03_03"); //Witaj skaza�cze! Jestem Natalia, jedna z kobiet Y'Beriona.
};

//========================================
//-----------------> WorkNatalia
//========================================

INSTANCE DIA_Natalia_WorkNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 1;
   condition    = DIA_Natalia_WorkNatalia_Condition;
   information  = DIA_Natalia_WorkNatalia_Info;
   permanent	= FALSE;
   description	= "Na czym polega twoja praca?";
};

FUNC INT DIA_Natalia_WorkNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_WorkNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_WorkNatalia_15_01"); //Na czym polega twoja praca?
    AI_Output (self, other ,"DIA_Natalia_WorkNatalia_03_02"); //Dbamy o to, by wizje naszego mistrza by�y intensywne.
    AI_Output (self, other ,"DIA_Natalia_WorkNatalia_03_03"); //Opr�cz tego razem z Chani troszczymy si� o jego potrzeby.
};

//========================================
//-----------------> CampNatalia
//========================================

INSTANCE DIA_Natalia_CampNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 2;
   condition    = DIA_Natalia_CampNatalia_Condition;
   information  = DIA_Natalia_CampNatalia_Info;
   permanent	= FALSE;
   description	= "Czy wyznajesz �ni�cego?";
};

FUNC INT DIA_Natalia_CampNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_CampNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_SleeperNatalia_15_01"); //Czy wyznajesz �ni�cego?
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_02"); //Oczywi�cie. Nale�� teraz do Bractwa i wszystko co robi�, jest ku chwale �ni�cego.
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_03"); //On w zamian za nasz� pomoc, uwolni nas z tego wi�zienia.
    AI_Output (other, self ,"DIA_Natalia_SleeperNatalia_15_04"); //Czyli kobiety te� mog� do��cza� do Obozu?
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_05"); //Tak, jednak na troch� innych zasadach. Nie mo�emy przynale�e� do �adnych kast, a naszym jedynym obowi�zkiem jest s�u�y� Y'Berionowi.
    AI_Output (self, other ,"DIA_Natalia_SleeperNatalia_03_06"); //Pozosta�ymi rzeczami w Obozie zajmuj� si� m�czy�ni.
};

//========================================
//-----------------> PastNatalia
//========================================

INSTANCE DIA_Natalia_PastNatalia (C_INFO)
{
   npc          = Gur_1207_Natalia;
   nr           = 3;
   condition    = DIA_Natalia_PastNatalia_Condition;
   information  = DIA_Natalia_PastNatalia_Info;
   permanent	= FALSE;
   description	= "Kim by�a� zanim trafi�a� do Kolonii?";
};

FUNC INT DIA_Natalia_PastNatalia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Natalia_HelloNatalia))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Natalia_PastNatalia_Info()
{
    AI_Output (other, self ,"DIA_Natalia_PastNatalia_15_01"); //Kim by�a� zanim trafi�a� do Kolonii?
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_02"); //By�am zielark� z Khorinis. Mieszka�am razem z moj� mentork� i nauczycielk� Sagitt�, w jaskini w lesie.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_03"); //Farmerzy nazywali nas wied�mami i oszustkami. Jednak w razie potrzeby przypominali sobie o naszych leczniczych zio�ach.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_04"); //Niestety pewnego razu moje losy nie potoczy�y si� zbyt dobrze.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_05"); //Ojciec Onara, mieszkaj�cy na farmie posiadacza ziemskiego dosta� ataku serca.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_06"); //Jego rodzina i pomocnicy od razu przyprowadzili go do mnie.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_07"); //Chcia�am przyrz�dzi� mu specjaln� mikstur� z serafis�w i rdest�w polnych.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_08"); //Okaza�o si�, �e w moich zapasach zabrak�o dw�ch serafis�w i mikstura okaza�a si� wadliwa.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_09"); //Sagitty nie by�o w�wczas ze mn�. Wyruszy�a z samego rana do lasu nazbiera� nieco grzyb�w.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_10"); //Nie by�am w stanie uratowa� starego Onara. Zmar� po chwili...
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_11"); //Jego syn oskar�y� mnie w mie�cie o otrucie go.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_12"); //I reszty mo�esz si� sam domy�li�. Sagitta zosta�a sama i wci�� pe�ni�a rol� zielarki.
    AI_Output (self, other ,"DIA_Natalia_PastNatalia_03_13"); //Za�o�� si�, �e wci�� nie mo�e si� pozbiera� po utracie swojej jedynej przyjaci�ki...
    AI_Output (other, self ,"DIA_Natalia_PastNatalia_15_14"); //Rozumiem.
};

