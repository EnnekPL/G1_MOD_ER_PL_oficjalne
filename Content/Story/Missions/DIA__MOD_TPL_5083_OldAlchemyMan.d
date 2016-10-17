
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_OldAlchemyMan_EXIT(C_INFO)
{
	npc             = TPL_5083_OldAlchemyMan;
	nr              = 999;
	condition		= DIA_OldAlchemyMan_EXIT_Condition;
	information		= DIA_OldAlchemyMan_EXIT_Info;
	permanent		= false;
	description     = "Powodzenia w lepszym œwiecie. (KONIEC)";
};

FUNC INT DIA_OldAlchemyMan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_EXIT_Info()
{
	AI_Output (other, self ,"DIA_OldAlchemyMan_EXIT_15_01"); //Powodzenia w lepszym œwiecie.
    AI_Output (self, other ,"DIA_OldAlchemyMan_EXIT_03_02"); //Trzymaj siê, ch³opcze. 
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"die");
};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO1 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 1;
   condition    = DIA_OldAlchemyMan_HELLO1_Condition;
   information  = DIA_OldAlchemyMan_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_OldAlchemyMan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_01"); //Arrgh... Wreszcie ¿ywy cz³owiek!
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO1_15_02"); //Co tutaj robisz?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_03"); //Prowadzi³em badania nad tym miejscem. S¹dzi³em, ¿e...
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO1_15_04"); //Niby jak tutaj wszed³eœ?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_05"); //B³¹ka³em siê po tych kompleksach, gdy nagle us³ysza³em orków. Postanowi³em siê schowaæ. Nie mog³em siê wróciæ. Musia³em biec w g³¹b jaskini.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_06"); //W koñcu dotar³em do g³ównej sali, tej w której przed chwil¹ by³eœ. Z górnego piêtra zaczêli na mnie biec orkowie.
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_07"); //Nagle zauwa¿y³em odró¿niaj¹c¹ siê od innych œcianê. By³a pod ni¹ szczelina. Przeœlizgn¹³em siê przez ni¹ przez przypadek zawadzaj¹c o mechanizm. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_08"); //Œciana opad³a ca³kiem, a ja wola³em nie próbowaæ jej otwieraæ. Tak trafi³em tutaj.
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO1_03_09"); //Niestety œciana zmia¿d¿y³a moj¹ stopê i straci³em przez to du¿o krwi. Wkrótce umrê. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO2 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 2;
   condition    = DIA_OldAlchemyMan_HELLO2_Condition;
   information  = DIA_OldAlchemyMan_HELLO2_Info;
   permanent	= FALSE;
   description	= "Orkowie dali ci dojœæ a¿ tutaj?!";
};

FUNC INT DIA_OldAlchemyMan_HELLO2_Condition()
{
    return TRUE;
};

FUNC VOID DIA_OldAlchemyMan_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO2_15_01"); //Orkowie dali ci dojœæ a¿ tutaj?!
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_02"); //Nie wiedzieli o mnie. Dopiero póŸniej us³yszeli ha³as. Ponadto przyby³ kolejny oddzia³ z zewn¹trz. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_03"); //W³óczy³em siê po tym zapomnianym miejscu przez jakiœ czas.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_04"); //Siedzê ju¿ tutaj od kliku godzin. Jakiœ czas temu s³ysza³em jakby g³osy Stra¿ników Œwi¹tynnych i Baal Lukora. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO2_03_05"); //Byli tutaj?
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO2_15_06"); //Tak, wykonywali specjaln¹ misjê, ale to ju¿ przesz³oœæ.
};

//========================================
//-----------------> GURUS
//========================================

INSTANCE DIA_OldAlchemyMan_GURUS (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 1;
   condition    = DIA_OldAlchemyMan_GURUS_Condition;
   information  = DIA_OldAlchemyMan_GURUS_Info;
   permanent	= FALSE;
   description	= "Czy to nie ty mia³eœ badaæ kamienie na bagnie dla Guru?";
};

FUNC INT DIA_OldAlchemyMan_GURUS_Condition()
{
    if (MIS_OldAlchemist == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_OldAlchemyMan_GURUS_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_GURUS_15_01"); //Czy to nie ty mia³eœ badaæ kamienie na bagnie dla Guru?
    AI_Output (self, other ,"DIA_OldAlchemyMan_GURUS_03_02"); //Masz racjê. (kaszle) Moje badania zaprowadzi³y mnie a¿ tutaj.
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_OldAlchemyMan_HELLO4 (C_INFO)
{
   npc          = TPL_5083_OldAlchemyMan;
   nr           = 4;
   condition    = DIA_OldAlchemyMan_HELLO4_Condition;
   information  = DIA_OldAlchemyMan_HELLO4_Info;
   permanent	= FALSE;
   description	= "Co uda³o ci siê wybadaæ?";
};

FUNC INT DIA_OldAlchemyMan_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_OldAlchemyMan_GURUS)) 
    {
    return TRUE;
    };
};


FUNC VOID DIA_OldAlchemyMan_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_15_01"); //Co uda³o ci siê wybadaæ?
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_02"); //Nic konkretnego. Nie znalaz³em tutaj ¿adnych zapisków ani wskazówek.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_03"); //Ciebie zapewne interesuj¹ wyniki badañ, które zlecili mi Guru. 
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_04"); //Co do tych œwietlistych punktów na bagnie, to s¹ to czary ¿ycia i ducha.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_05"); //Zauwa¿y³em, ¿e bêd¹c w ich pobli¿u, szybciej regenerowa³em swoj¹ energiê. Jednak trzeba posiadaæ specjalne umiejêtnoœci.
    AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_06"); //Jakiœ mag musia³ natchn¹æ te kamienie potê¿n¹ energi¹.
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_15_07"); //Dlaczego postanowi³eœ szukaæ w³aœnie tutaj? 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_08"); //S¹dzi³em, ¿e kamienie na bagnie mog¹ mieæ zwi¹zek z orkowymi obrzêdami pogrzebowymi. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_09"); //Jak zapewne wiesz, obrzêdami kierowali szamani. Tylko oni mogli grzebaæ orków. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_10"); //Wysnu³em tezê, ¿e moc tkwi¹ca w tych kamieniach pomaga³a orkom przejœæ do królestwa Beliara. 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_11"); //Prawdopodobnie jednak siê myli³em. Spotka³a mnie za to najgorsza kara. Wkrótce umrê. 
	AI_Output (other, self ,"DIA_OldAlchemyMan_HELLO4_03_12"); //Mo¿e mogê ci jakoœ pomóc? 
	AI_Output (self, other ,"DIA_OldAlchemyMan_HELLO4_03_13"); //Nie, ch³opcze. Orkowy topór rozci¹³ mi skórê na lewej rêce. Wda³o siê zaka¿enie. Nic ju¿ nie mo¿na zrobiæ.
    B_LogEntry                     (CH2_OldAlchemist,"Prawie martwy alchemik ostatnimi si³ami wyszepta³ mi, ¿e œwietliste punkty na bagnie to czary - potê¿ne kamienie natchniêto magiczn¹ moc¹.");
	B_givexp (150);
};


