// *Script was make in Easy Dialog Maker (EDM)
// **************************************************
// 						 EXIT 
// **************************************************
//sprawdzone przez gothic1210
INSTANCE DIA_SLD_3915_Gestath_Exit (C_INFO)
{
	npc			= SLD_3915_Gestath;
	nr			= 999;
	condition	= DIA_SLD_3915_Gestath_Exit_Condition;
	information	= DIA_SLD_3915_Gestath_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_3915_Gestath_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_3915_Gestath_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Gestath_HELLO1 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_HELLO1_Condition;
   information  = DIA_Gestath_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Gestath_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Gestath_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_02"); //Nazywam si� Gestath. Jestem my�liwym.
    AI_Output (other, self ,"DIA_Gestath_HELLO1_15_03"); //Znasz si� na swoim fachu?
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_04"); //Jasne! Potrafi� te� uszy� pancerz. Razem z Wilkiem pracujemy nad zbroj�, kt�ra sk�ada�aby si� z p�ytek pancerzy pe�zaczy.
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_05"); //To by by�o co�! Niestety, nie jeste�my nawet w po�owie pracy nad konceptem. 
    AI_Output (self, other ,"DIA_Gestath_HELLO1_03_06"); //Wiesz... trzeba to wszystko dobrze rozplanowa�, �eby nie uwiera�o podczas chodzenia.
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Gestath_HELLO2 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 2;
   condition    = DIA_Gestath_HELLO2_Condition;
   information  = DIA_Gestath_HELLO2_Info;
   permanent	= FALSE;
   description	= "Jak leci?";
};

FUNC INT DIA_Gestath_HELLO2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gestath_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO2_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Gestath_HELLO2_03_02"); //Nie jest �le.. Zbli�a si� zima, wi�c gromadzimy zapasy. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Gestath_HELLO3 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 3;
   condition    = DIA_Gestath_HELLO3_Condition;
   information  = DIA_Gestath_HELLO3_Info;
   permanent	= FALSE;
   description	= "Skupujesz jakie� sk�ry?";
};

FUNC INT DIA_Gestath_HELLO3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
	{
    return TRUE;
	};
};

FUNC VOID DIA_Gestath_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO3_15_01"); //Skupujesz jakie� sk�ry?
    AI_Output (self, other ,"DIA_Gestath_HELLO3_03_02"); //Kupi� od ciebie sk�ry orkowych ps�w za rozs�dn� cen�.
    AI_Output (self, other ,"DIA_Gestath_HELLO3_03_03"); //Tylko nie zawracaj mi dupy jedn� sztuk�. Przynie� mi chocia� pi��. 
    AI_Output (other, self ,"DIA_Gestath_HELLO3_15_04"); //No dobra, jak b�d� co� mia� to wpadn�.
    B_LogEntry          (GE_Skup,"Gestath skupuje sk�ry orkowych ps�w. Je�li b�d� mia� przynajmniej pi�� sztuk, ch�tnie je ode mnie odkupi.");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Gestath_HELLO4 (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 4;
   condition    = DIA_Gestath_HELLO4_Condition;
   information  = DIA_Gestath_HELLO4_Info;
   permanent	= TRUE;
   description	= "Mam pi�� sk�r orkowych ps�w!";
};

FUNC INT DIA_Gestath_HELLO4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gestath_HELLO3))
    && (Npc_HasItems (other, ItAt_Wolf_02) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Gestath_HELLO4_15_01"); //Mam pi�� sk�r orkowych ps�w!
    AI_Output (self, other ,"DIA_Gestath_HELLO4_03_02"); //Dobra robota. Przydadz� si�.
    CreateInvItems (self, ItMiNugget, 200);
    B_GiveInvItems (self, other, ItMiNugget, 200);
    b_givexp (50);
    B_GiveInvItems (other, self, ItAt_Wolf_02, 5);
	Npc_RemoveInvItems (self, ItAt_Wolf_02, 5);
};

//========================================
//-----------------> LOWCA
//========================================

INSTANCE DIA_Gestath_LOWCA (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_LOWCA_Condition;
   information  = DIA_Gestath_LOWCA_Info;
   permanent	= FALSE;
   description	= "�owcy ork�w poszukuj� nowych ludzi.";
};

FUNC INT DIA_Gestath_LOWCA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_ROBOTA)) && (Npc_KnowsInfo (hero, DIA_Gestath_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_LOWCA_Info()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_15_01"); //�owcy ork�w poszukuj� nowych ludzi.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_03_02"); //Hmm? Dlaczego mi to m�wisz?

    Info_ClearChoices		(DIA_Gestath_LOWCA);
    Info_AddChoice		(DIA_Gestath_LOWCA, "Jeste� do�wiadczonym my�liwym. To szansa na nowe trofea.", DIA_Gestath_LOWCA_EXPERIENCE);
    Info_AddChoice		(DIA_Gestath_LOWCA, "Oni naprawd� potrzebuj� twojej pomocy.", DIA_Gestath_LOWCA_HELP);
};

FUNC VOID DIA_Gestath_LOWCA_EXPERIENCE()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_01"); //Jeste� do�wiadczonym my�liwym. To szansa na nowe trofea.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_02"); //Jakby nie patrze� w okolicy s� tylko wilki i �cierwojady. Masz racj�.
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_03"); //Pomy�l jaki zyska�by� szacunek, gdyby� posiada� pancerz ze sk�ry orkowego psa.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_04"); //Ha! Przekona�e� mnie. To by by�o wspania�e.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_05"); //Gdzie dok�adnie jest ten ob�z �owc�w?
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_06"); //�owcy ork�w obozuj� we wn�ce skalnej �ciany.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_07"); //Jakiej �ciany skalnej?
    AI_Output (other, self ,"DIA_Gestath_LOWCA_EXPERIENCE_15_08"); //Tej przy przej�ciu na ziemie ork�w. To naturalna palisada dziel�ca ziemie ludzi i ork�w.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_EXPERIENCE_03_09"); //Ach, ju� wiem o czym m�wisz. Wkr�tce si� tam wybior�.

    Npc_ExchangeRoutine (self, "hunters");//fix
    B_LogEntry                     (CH3_NewBloodForOrcHunters,"Przekona�em Gestatha, �e ob�z �owc�w ork�w to jego miejsce. Mog� pogada� z Wilsonem. ");
	gestah_lowca = true;
    B_GiveXP (250);
    Info_ClearChoices		(DIA_Gestath_LOWCA);
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Gestath_LOWCA_HELP()
{
    AI_Output (other, self ,"DIA_Gestath_LOWCA_HELP_15_01"); //Oni naprawd� potrzebuj� twojej pomocy.
    AI_Output (self, other ,"DIA_Gestath_LOWCA_HELP_03_02"); //A co mnie to obchodzi? Czy ja ci wygl�dam na dobrodzieja?
    AI_Output (self, other ,"DIA_Gestath_LOWCA_HELP_03_03"); //Jak nie mog� sobie poradzi� to niech si� stamt�d wynosz�. Te� mi co�!
    Info_ClearChoices		(DIA_Gestath_LOWCA);
    AI_StopProcessInfos	(self);
	gestah_lowca = false;
};

//========================================
//-----------------> OBOZ_BANDYTOW
//========================================

INSTANCE DIA_Gestath_OBOZ_BANDYTOW (C_INFO)
{
   npc          = SLD_3915_Gestath;
   nr           = 1;
   condition    = DIA_Gestath_OBOZ_BANDYTOW_Condition;
   information  = DIA_Gestath_OBOZ_BANDYTOW_Info;
   permanent	= FALSE;
   description	= "Nie wybierasz si� do Obozu Bandyt�w?";
};

FUNC INT DIA_Gestath_OBOZ_BANDYTOW_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_SZEFU_Quest12))
    && (Npc_KnowsInfo (hero, DIA_SZEFU_DAVOR))
	&& (gestah_lowca == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Gestath_OBOZ_BANDYTOW_Info()
{
    AI_Output (other, self ,"DIA_Gestath_OBOZ_BANDYTOW_15_01"); //Nie wybierasz si� do Obozu Bandyt�w?
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_02"); //Ja? Nie jestem tam potrzebny. Poza tym nie mam ochoty nadstawia� karku za tych samob�jc�w!
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_03"); //Gdy wszystko si� nieco uspokoi, planuj� uciec w g�ry, schroni� si� w jakie� jaskini i nieco zapolowa�.
    AI_Output (self, other ,"DIA_Gestath_OBOZ_BANDYTOW_03_04"); //Pr�dzej czy p�niej Bariera opadnie, a wtedy si� wzbogac�. 
};


