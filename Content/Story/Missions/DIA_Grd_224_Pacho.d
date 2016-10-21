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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Nie, twoja babcia... Jasne, �e ty!!!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Na twoim miejscu nie szed�bym dalej!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Dlaczego?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Widz�, �e jeste� tu nowy, co?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Stary, ta droga prowadzi na Ziemie Ork�w...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Zrobi� z ciebie kotlety!
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
   description	= "Na czyje polecenie strze�esz wej�cia na tereny ork�w?";
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
    AI_Output (other, self ,"DIA_Pacho_Guardian_15_01"); //Na czyje polecenie strze�esz wej�cia na tereny ork�w?
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_02"); //Co to za g�upie pytanie! Oczywi�cie, �e na polecenie Thorusa.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_03"); //Mam dba�, �eby w okolice Starego Obozu nie przedostali si� orkowi zwiadowcy, albo jakie� wi�ksze bydlaki.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_04"); //Poza orkami �yj� tam naprawd� gro�ne bestie, takie jak orkowe psy i brzytwy. 
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_05"); //Oczywi�cie �owcy ork�w dobrze si� sprawuj�, pilnuj�c, aby te stworzenia nie zbli�a�y si� do siedzib ludzkich.
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_06"); //Ca�e szcz�cie, bo inaczej by�oby z nami kiepsko.
    AI_Output (other, self ,"DIA_Pacho_Guardian_15_07"); //Orkowie s� a� tak agresywni? 
    AI_Output (self, other ,"DIA_Pacho_Guardian_03_08"); //No, a nie? Cho� ostatnio jest ca�kiem spokojnie. Zielonosk�rzy chyba szykuj� co� du�ego...
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
   description	= "Co mo�esz mi powiedzie� o �owcach ork�w?";
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
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_01"); //Co mo�esz mi powiedzie� o �owcach ork�w?
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_02"); //�yj� w obozie, w ma�ej wn�ce, w tej wielkiej �cianie skalnej za Starym Obozem, dla �cis�o�ci.
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_03"); //Gdzie?! 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_04"); //Jeste� a� tak g�upi, czy tylko udajesz? 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_05"); //�ciana skalna za Obozem, wn�ka, dziura? Kapujesz?
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_06"); //Mniej wi�cej. M�w dalej.
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_07"); //Od ziem ork�w odgrodzeni s� palisad� i poluj� g��wnie od strony g�r. Z tej�e strony mo�na si� �atwo dosta� do ich obozu.
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_08"); //W jaki spos�b?
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_09"); //Wyjd� ze Starego Obozu i id� wzd�u� �ciany skalnej. Po chwili drogi powiniene� trafi� na grupk� skalnych gzyms�w. 
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_10"); //Dalej czeka ci� wspinaczka. Tylko uwa�aj, �eby nie po�ama� sobie ko�ci. 
    AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_11"); //Dzi�ki za rad�.
    AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_12"); //Jasne. Ma dla ciebie jak�� warto�� kole�ko?
    if (Npc_HasItems (hero, ItMiNugget)>=10)
    {
        AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_13"); //Prosz�, oto 10 bry�ek rudy.
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_14"); //He he. Widz�, �e b�d� m�g� co� sobie chlapn�� w karczmie w Starym Obozie. 
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_15"); //Dzi�ki, kole�ko. Uwa�aj na siebie.
        B_GiveInvItems (other, self, ItMiNugget, 10);
    }
    else
    {
        AI_Output (other, self ,"DIA_Pacho_OrcHuntersCamp_15_16"); //Nie mam rudy. 
        AI_Output (self, other ,"DIA_Pacho_OrcHuntersCamp_03_17"); //Szkoda. Ch�tnie bym si� napi�. 
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
   description	= "Widzia�e� mo�e Cienia o imieniu Emil?";
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
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_01"); //Widzia�e� mo�e Cienia o imieniu Emil?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_02"); //Czy widzia�em? Widzia�em jak poder�ni�to mu gard�o i okradziono.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_03"); //Co?!
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_04"); //By�o co prawda ciemno, ale jako wartownik mam doskona�y wzrok.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_05"); //W rozwalonej chacie nieopodal czai� si� na niego jeden z Bandyt�w z g�r.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_06"); //Nie s�dzi�em, �e wyniknie z tego taka jatka, wi�c postanowi�em obserwowa� z daleka. 
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_07"); //Ku mojejmu zdziwieniu, ni st�d ni zow�d Bandyta rzuci� si� na Emila i poder�n�� mu gard�o.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_08"); //Dzia�a� szybko, niczym urodzony skrytob�jca. To by�o co� niesamowitego! 
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_09"); //Widzia�e� co� jeszcze?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_10"); //Tak, Bandycie towarzyszy� jeden z Cieni ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_11"); //Jednak on nie rzuci� si� na Emila.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_12"); //Znasz mo�e tego Cienia? Chcia�bym pozna� jego imi�.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_13"); //No c�, to zale�y.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_14"); //Od dawna tutaj stoj� i poma�u ko�cz� mi si� zapasy jedzenia, kt�re wzi��em ze sob� ze Starego Obozu.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_15"); //Nie mog� opu�ci� swojego stanowiska. M�g�by� mi przynie�� co� do jedzenia i do picia?
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_16"); //A co by� chcia�?
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_17"); //Przynie� mi pi�� piw, trzy bochenki chleba, dwie szynki, pi�� kawa�k�w pieczonego mi�sa i dwa jab�ka.
    AI_Output (self, other ,"DIA_Pacho_ShadowEmil_03_18"); //No i butelk� wina, tak! Od dawna nie pi�em wina.
    AI_Output (other, self ,"DIA_Pacho_ShadowEmil_15_19"); //Cholera, cz�owieku, mam wa�niejsze sprawy na g�owie.
    B_LogEntry                     (CH2_CourierFireMage,"Pacho zdradzi mi szczeg�y ataku na Emila, je�li przynios� mu: pi�� piw, trzy bochenki chleba, dwie szynki, pi�� kawa�k�w pieczonego mi�sa, dwa jab�ka i wino. ");

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
   description	= "Przynios�em jedzenie.";
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
    AI_Output (other, self ,"DIA_Pacho_IhabeFood_15_01"); //Przynios�em jedzenie.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_02"); //�wietnie! Daj mi to!
    AI_Output (other, self ,"DIA_Pacho_IhabeFood_15_03"); //No, teraz mo�emy pogada�, kolego.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_04"); //Cieniem, kt�ry towarzyszy� temu Bandycie by� Flint.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_05"); //Zazwyczaj kr�ci si� po Starym Obozie w okolicach areny.
    AI_Output (self, other ,"DIA_Pacho_IhabeFood_03_06"); //O ile pami�tam w ka�dym razie. Dawno nie by�em w Starym Obozie. Mo�liwe, �e co� pokr�ci�em.
    B_LogEntry                     (CH2_CourierFireMage,"Cieniem, kt�ry towarzyszy� zab�jcy Emila by� Flint. Znajd� go w Starym Obozie nieopodal areny.");

    B_GiveXP (250);
    B_GiveInvItems (other, self, ItFoWine, 2);
    B_GiveInvItems (other, self, ItFoMutton, 5);
    B_GiveInvItems (other, self, ItFo_mutton_01, 2);
    B_GiveInvItems (other, self, ItFoLoaf, 3);
    B_GiveInvItems (other, self, ItFoBeer, 5);
    B_GiveInvItems (other, self, ItFoApple, 2);
    AI_StopProcessInfos	(self);
};

