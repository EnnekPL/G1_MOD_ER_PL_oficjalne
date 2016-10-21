//poprawione i sprawdzone - Nocturn

//***************************************************************************
//	Info EXIT
//***************************************************************************
instance Info_Pacho_EXIT (C_INFO)
{
	npc			= Grd_224_Pacho;
	nr			= 999;
	condition	= Info_Pacho_EXIT_Condition;
	information	= Info_Pacho_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func VOID Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################
//---------------------------------------------------------------------
//	Info STOP
//---------------------------------------------------------------------
instance Info_Pacho_STOP (C_INFO)
{
	npc				= Grd_224_Pacho;
	condition		= Info_Pacho_STOP_Condition;
	information		= Info_Pacho_STOP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Hej, ty!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Kto? Ja?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Nie, twoja babcia... Jasne, ¿e ty!!!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Na twoim miejscu nie szed³bym dalej!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Dlaczego?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Widzê, ¿e jesteœ tu nowy, co?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Stary, ta droga prowadzi na Ziemie Orków...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Zrobi¹ z ciebie kotlety!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Och!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //Nie ma za co!

	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Guardian
//========================================

INSTANCE DIA_Pacho_Guardian (C_INFO)
{
   npc          = Grd_224_Pacho;
   nr           = 1;
   condition    = DIA_Pacho_Guardian_Condition;
   information  = DIA_Pacho_Guardian_Info;
   permanent	= FALSE;
   description	= "Na czyje polecenie strze¿esz wejœcia na tereny orków?";
};

FUNC INT DIA_Pacho_Guardian_Condition()
{
    if (Npc_KnowsInfo (hero, Info_Pacho_STOP))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pacho_Guardian_Info()
{
    AI_Output (other, self ,"DIA_Pacho_Guardian_15_01"); //Na czyje polecenie strze¿esz wejœcia na tereny orków?
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_02"); //Co to za g³upie pytanie! Oczywiœcie, ¿e na polecenie Thorusa.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_03"); //Mam dbaæ, ¿eby w okolice Starego Obozu nie przedostali siê orkowi zwiadowcy, albo jakieœ wiêksze bydlaki.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_04"); //Poza orkami ¿yj¹ tam naprawdê groŸne bestie, takie jak orkowe psy i brzytwy. 
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_05"); //Oczywiœcie ³owcy orków dobrze siê sprawuj¹, pilnuj¹c, aby te stworzenia nie zbli¿a³y siê do siedzib ludzkich.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_06"); //Ca³e szczêœcie, bo inaczej by³oby z nami kiepsko.
    AI_Output (other, self ,"DIA_Pacho_Guardian_15_07"); //Orkowie s¹ a¿ tak agresywni? 
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_08"); //No, a nie? Choæ ostatnio jest ca³kiem spokojnie. Zielonoskórzy chyba szykuj¹ coœ du¿ego...
};

//========================================
//-----------------> OrcHuntersCamp
//========================================

INSTANCE DIA_Pacho_OrcHuntersCamp (C_INFO)
{
   npc          = Grd_224_Pacho;
   nr           = 2;
   condition    = DIA_Pacho_OrcHuntersCamp_Condition;
   information  = DIA_Pacho_OrcHuntersCamp_Info;
   permanent	= FALSE;
   description	= "Co mo¿esz mi powiedzieæ o ³owcach orków?";
};

FUNC INT DIA_Pacho_OrcHuntersCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pacho_Guardian))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pacho_OrcHuntersCamp_Info()
{
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_01"); //Co mo¿esz mi powiedzieæ o ³owcach orków?
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_02"); //¯yj¹ w obozie, w ma³ej wnêce, w tej wielkiej œcianie skalnej za Starym Obozem, dla œcis³oœci.
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_03"); //Gdzie?! 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_04"); //Jesteœ a¿ tak g³upi, czy tylko udajesz? 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_05"); //Œciana skalna za Obozem, wnêka, dziura? Kapujesz?
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_06"); //Mniej wiêcej. Mów dalej.
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_07"); //Od ziem orków odgrodzeni s¹ palisad¹ i poluj¹ g³ównie od strony gór. Z tej¿e strony mo¿na siê ³atwo dostaæ do ich obozu.
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_08"); //W jaki sposób?
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_09"); //WyjdŸ ze Starego Obozu i idŸ wzd³u¿ œciany skalnej. Po chwili drogi powinieneœ trafiæ na grupkê skalnych gzymsów. 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_10"); //Dalej czeka ciê wspinaczka. Tylko uwa¿aj, ¿eby nie po³amaæ sobie koœci. 
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_11"); //Dziêki za radê.
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_12"); //Jasne. Ma dla ciebie jak¹œ wartoœæ kole¿ko?
    if (Npc_HasItems (hero, ItMiNugget)>=10)
    {
        AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_13"); //Proszê, oto 10 bry³ek rudy.
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_14"); //He he. Widzê, ¿e bêdê móg³ coœ sobie chlapn¹æ w karczmie w Starym Obozie. 
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_15"); //Dziêki, kole¿ko. Uwa¿aj na siebie.
        B_GiveInvItems (other, self, ItMiNugget, 10);
    }
    else
    {
        AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_16"); //Nie mam rudy. 
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_17"); //Szkoda. Chêtnie bym siê napi³. 
    };
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ShadowEmil
//========================================

INSTANCE DIA_Pacho_ShadowEmil (C_INFO)
{
   npc          = Grd_224_Pacho;
   nr           = 1;
   condition    = DIA_Pacho_ShadowEmil_Condition;
   information  = DIA_Pacho_ShadowEmil_Info;
   permanent	= FALSE;
   description	= "Widzia³eœ mo¿e Cienia o imieniu Emil?";
};

FUNC INT DIA_Pacho_ShadowEmil_Condition()
{
    if (heroknow_Emil == true)
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pacho_ShadowEmil_Info()
{
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_01"); //Widzia³eœ mo¿e Cienia o imieniu Emil?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_02"); //Czy widzia³em? Widzia³em jak poder¿niêto mu gard³o i okradziono.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_03"); //Co?!
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_04"); //By³o co prawda ciemno, ale jako wartownik mam doskona³y wzrok.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_05"); //W rozwalonej chacie nieopodal czai³ siê na niego jeden z Bandytów z gór.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_06"); //Nie s¹dzi³em, ¿e wyniknie z tego taka jatka, wiêc postanowi³em obserwowaæ z daleka. 
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_07"); //Ku mojejmu zdziwieniu, ni st¹d ni zow¹d Bandyta rzuci³ siê na Emila i poder¿n¹³ mu gard³o.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_08"); //Dzia³a³ szybko, niczym urodzony skrytobójca. To by³o coœ niesamowitego! 
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_09"); //Widzia³eœ coœ jeszcze?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_10"); //Tak, Bandycie towarzyszy³ jeden z Cieni ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_11"); //Jednak on nie rzuci³ siê na Emila.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_12"); //Znasz mo¿e tego Cienia? Chcia³bym poznaæ jego imiê.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_13"); //No có¿, to zale¿y.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_14"); //Od dawna tutaj stojê i poma³u koñcz¹ mi siê zapasy jedzenia, które wzi¹³em ze sob¹ ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_15"); //Nie mogê opuœciæ swojego stanowiska. Móg³byœ mi przynieœæ coœ do jedzenia i do picia?
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_16"); //A co byœ chcia³?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_17"); //Przynieœ mi piêæ piw, trzy bochenki chleba, dwie szynki, piêæ kawa³ków pieczonego miêsa i dwa jab³ka.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_18"); //No i butelkê wina, tak! Od dawna nie pi³em wina.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_19"); //Cholera, cz³owieku, mam wa¿niejsze sprawy na g³owie.
    B_LogEntry                     (CH2_CourierFireMage,"Pacho zdradzi mi szczegó³y ataku na Emila, jeœli przyniosê mu: piêæ piw, trzy bochenki chleba, dwie szynki, piêæ kawa³ków pieczonego miêsa, dwa jab³ka i wino. ");

    B_GiveXP (150);
};

//========================================
//-----------------> IhabeFood
//========================================

INSTANCE DIA_Pacho_IhabeFood (C_INFO)
{
   npc          = Grd_224_Pacho;
   nr           = 2;
   condition    = DIA_Pacho_IhabeFood_Condition;
   information  = DIA_Pacho_IhabeFood_Info;
   permanent	= FALSE;
   description	= "Przynios³em jedzenie.";
};

FUNC INT DIA_Pacho_IhabeFood_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Pacho_ShadowEmil))
    && (MIS_CourierFireMage == LOG_RUNNING)
    && (Npc_HasItems (other, ItFoBeer) >=5)
    && (Npc_HasItems (other, ItFoLoaf) >=3)
    && (Npc_HasItems (other, ItFo_mutton_01) >=2)
    && (Npc_HasItems (other, ItFoMutton) >=5)
    && (Npc_HasItems (other, ItFoApple) >=2)
    && (Npc_HasItems (other, ItFoWine) >=2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Pacho_IhabeFood_Info()
{
    AI_Output (other, self ,"DIA_Pacho_IhabeFood_15_01"); //Przynios³em jedzenie.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_02"); //Œwietnie! Daj mi to!
    AI_Output (other, self ,"DIA_Pacho_IhabeFood_15_03"); //No, teraz mo¿emy pogadaæ, kolego.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_04"); //Cieniem, który towarzyszy³ temu Bandycie by³ Flint.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_05"); //Zazwyczaj krêci siê po Starym Obozie w okolicach areny.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_06"); //O ile pamiêtam w ka¿dym razie. Dawno nie by³em w Starym Obozie. Mo¿liwe, ¿e coœ pokrêci³em.
    B_LogEntry                     (CH2_CourierFireMage,"Cieniem, który towarzyszy³ zabójcy Emila by³ Flint. Znajdê go w Starym Obozie nieopodal areny.");

    B_GiveXP (250);
    B_GiveInvItems (other, self, ItFoWine, 2);
    B_GiveInvItems (other, self, ItFoMutton, 5);
    B_GiveInvItems (other, self, ItFo_mutton_01, 2);
    B_GiveInvItems (other, self, ItFoLoaf, 3);
    B_GiveInvItems (other, self, ItFoBeer, 5);
    B_GiveInvItems (other, self, ItFoApple, 2);
    AI_StopProcessInfos	(self);
};

