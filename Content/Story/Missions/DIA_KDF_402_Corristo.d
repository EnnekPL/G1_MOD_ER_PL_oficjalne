//poprawione i sprawdzone - Nocturn

instance  KDF_402_Corristo_Exit (C_INFO)
{
	npc			=  KDF_402_Corristo;
	nr			=  999;
	condition	=  KDF_402_Corristo_Exit_Condition;
	information	=  KDF_402_Corristo_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_402_Corristo_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_402_Corristo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


// ************************ Intruder **************************

instance  Info_Corristo_Intruder (C_INFO)
{
	npc			=	KDF_402_Corristo;
	nr			=	1;
	condition	=	Info_Corristo_Intruder_Condition;
	information	=	Info_Corristo_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Corristo_Intruder_Condition()
{
	if	 Npc_IsInState(self,ZS_Talk)
	&&	( (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	&& (!Npc_KnowsInfo(hero,DIA_Torrez_CourierQuest))
	&& (kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID  Info_Corristo_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szukaæ! Precz!

	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MageCourier_Quest
//========================================

INSTANCE DIA_Corristo_MageCourier_Quest (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_MageCourier_Quest_Condition;
   information  = DIA_Corristo_MageCourier_Quest_Info;
   permanent	= FALSE;
   description	= "Podobno chcia³eœ mnie widzieæ.";
};

FUNC INT DIA_Corristo_MageCourier_Quest_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Torrez_CourierQuest))
    && (kapitel <= 2)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_MageCourier_Quest_Info()
{
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_01"); //Podobno chcia³eœ mnie widzieæ.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_02"); //Niech Innos bêdzie z tob¹.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_03"); //Jako ¿e nale¿ysz do Cieni, mam dla ciebie specjalne zadanie.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_04"); //Jakie?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_05"); //Jakiœ czas temu wys³a³em kuriera z wa¿n¹ przesy³k¹ do Magów Wody.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_06"); //Niestety z pewnych Ÿróde³ wiem, ¿e przesy³ka nie dotar³a na miejsce, a kurier gdzieœ znikn¹³.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_07"); //Domyœlasz siê mo¿e gdzie?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_08"); //No có¿, wiem, ¿e bardzo szczyci³ siê sw¹ misj¹ wœród innych skazañców.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_09"); //Jesteœmy w Kolonii Karnej i ka¿dy chce zagarn¹æ tu jak najwiêcej dla siebie.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_10"); //Zapytaj najlepiej plotkarzy i informatorów w Zewnêtrznym Pierœcieniu.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_11"); //Mo¿e któryœ z nich wie co siê sta³o z Emilem.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_12"); //Emilem?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_13"); //Tak, tak mia³ na imiê.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_14"); //Zobaczê co da siê zrobiæ.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_15"); //Doskonale! Niech Innos ciê prowadzi.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_16"); //Wróæ do mnie, gdy tylko siê czegoœ dowiesz. 
    B_LogEntry                     (CH2_CourierFireMage,"Uda³o mi siê spotkaæ z samym Corristo - Arcymistrzem Magów Ognia. Zleci³ mi pewn¹ misje, polegaj¹c¹ na odnalezieniu wys³anego do Magów Wody kuriera. Podobno kurier bardzo szczyci³ siê swym zadaniem i chwali³ siê nim, gdzie tylko móg³. Powinienem porozmawiaæ z plotkarzami w Zewnêtrznym Pierœcieniu.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QUestSucces
//========================================

INSTANCE DIA_Corristo_QUestSucces (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_QUestSucces_Condition;
   information  = DIA_Corristo_QUestSucces_Info;
   permanent	= FALSE;
   description	= "Zdoby³em przesy³kê i wiem, kto zabi³ Emila. ";
};

FUNC INT DIA_Corristo_QUestSucces_Condition()
{
    if (MIS_CourierFireMage == LOG_RUNNING)
    && (Npc_HasItems (other, ItMis_PaczkaMagowOgnia) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_QUestSucces_Info()
{
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_01"); //Zdoby³em przesy³kê i wiem, kto zabi³ Emila. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_02"); //Doskonale! Opowiadaj, synu.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_03"); //Emil zosta³ zabity przez Bandytê Ratforda.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_04"); //Stra¿nik Pacho widzia³ ca³e zajœcie, Ratford przechwyci³ te¿ paczkê.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_05"); //Na szczêœcie uda³o mi siê odkryæ jego s³aby punkt i przechwyci³em przesy³kê.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_06"); //Przeklêty bandzior. Bêdê siê modli³ do Innosa, by ukara³ go kl¹tw¹. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_07"); //Dobrze siê spisa³eœ.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_08"); //Teraz zanieœ paczkê do Maga Wody imieniem Cronos. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_09"); //Zw¹ go Stra¿nikiem Rudy. Znajdziesz go przy kopcu w Nowym Obozie.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_10"); //W porz¹dku.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_11"); //Zatem idŸ ju¿. 
    B_LogEntry                     (CH2_CourierFireMage,"Corristo poprosi³ mnie, bym odniós³ paczkê do Maga Wody Cronosa.");

    B_GiveXP (300);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> CourierQuest_EndLastDia
//========================================

INSTANCE DIA_Corristo_CourierQuest_EndLastDia (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_CourierQuest_EndLastDia_Condition;
   information  = DIA_Corristo_CourierQuest_EndLastDia_Info;
   permanent	= FALSE;
   description	= "Odda³em paczkê Magom Wody.";
};

FUNC INT DIA_Corristo_CourierQuest_EndLastDia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Roscoe_LetterForFireMages))
    && (Npc_HasItems (other, ItMis_LetterLaresToFireMages) >=1)
    && (MIS_CourierFireMage == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_CourierQuest_EndLastDia_Info()
{
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_01"); //Odda³em paczkê Magom Wody.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_02"); //Gdy odchodzi³em, Cronos poleci³ mi siê spotkaæ z jednym ze Szkodników.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_03"); //Podobno sam Lares ma do was jakiœ interes. Napisa³ do was list.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_04"); //Hmm... Lares? To niepokoj¹ce.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_05"); //Poka¿ mi to pismo.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_06"); //Oto i ono.
    B_GiveInvItems (other, self, ItMis_LetterLaresToFireMages, 1);
    B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_07"); //No có¿, nie jestem tym szczególnie zdziwiony.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_08"); //Ludzie z Nowego Obozu chc¹ byœmy porzucili Gomeza i po³¹czyli swe si³y z Magami Wody.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_09"); //Mówi¹, ¿e kiedyœ przyp³acimy ¿yciem za s³u¿bê Gomezowi.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_10"); //I co o tym s¹dzisz?
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_11"); //Gomez to cz³owiek nieobliczalny, bez doradców w postaci nas, Magów d³ugo by nie poci¹gn¹³.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_12"); //Nie chcemy zaburzyæ panuj¹cego w Kolonii porz¹dku naszym odejœciem.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_13"); //Magnaci z pewnoœci¹ by nam nie odpuœcili. Ruszy³by za nami poœcig.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_14"); //Co gorsza, z pewnoœci¹ powa¿yliby siê na zaatakowanie Nowego Obozu.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_15"); //Dlatego jestem zmuszony odmówiæ proœbie Laresa.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_16"); //Nie powinniœcie dawaæ siê tak wykorzystywaæ. W koñcu jesteœcie...
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_17"); //Milcz! Nie wa¿ siê mówiæ, co powinniœmy, a czego nie.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_18"); //Sam Innos kieruje naszym losem i wiemy, co robimy.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_19"); //WeŸ te kilka mikstur. 
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_20"); //A teraz odejdŸ, zakoñczmy tê rozmowê. 
    B_LogEntry                     (CH2_CourierFireMage,"Odda³em list od Laresa Corristo. Podobno ludzie z Nowego Obozu chcieli nak³oniæ Magów Ognia do porzucenia Gomeza i po³¹czenia si³ z Magami Wody. Corristo odrzuci³ ofertê i poda³ kilka wyssanych z palca argumentów. Gdy próbowa³em go zapytaæ o wiêcej szczegó³ów, zez³oœci³ siê i zakoñczy³ rozmowê. Coœ mi tu œmierdzi...");
    Log_SetTopicStatus       (CH2_CourierFireMage, LOG_SUCCESS);
    MIS_CourierFireMage = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItFo_Potion_Health_02, 5);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 5);
    AI_StopProcessInfos	(self);
};




//--------------------------------------------------------------------------
// 							ÜBER DIE MAGIER
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_EXPLAINMAGE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINMAGE_Condition;
	information		= KDF_402_Corristo_EXPLAINMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Powiedz mi - jak to jest byæ Magiem?"; 
};

FUNC int  KDF_402_Corristo_EXPLAINMAGE_Condition()
{	
	if (!Npc_KnowsInfo (hero,KDF_402_Corristo_WANNBEKDF))
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_EXPLAINMAGE_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Powiedz mi - jak to jest byæ Magiem?
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jesteœmy Magami Ognia. S³u¿ymy Innosowi - najpotê¿niejszemu z bogów.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Nasza magia jest darem niebios. Jesteœmy kap³anami, nauczycielami i sêdziami jednoczeœnie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Dar, który jest jednoczeœnie wielkim ciê¿arem. To zadanie, które okreœla cel naszego ¿ycia.
};  
//--------------------------------------------------------------------------
// 							MAGIERAUFNAHME
//--------------------------------------------------------------------------
instance KDF_402_Corristo_WANNBEKDF (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_WANNBEKDF_Condition;
	information		= KDF_402_Corristo_WANNBEKDF_Info;
	important		= 0;
	permanent		= 1;
	description     = "Chcia³bym przyst¹piæ do Krêgu.";
};

FUNC int  KDF_402_Corristo_WANNBEKDF_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) || Npc_KnowsInfo(hero,DIA_Thorus_MAG_OGNIA_NOV))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_WANNBEKDF_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chcia³bym przyst¹piæ do Krêgu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //A wiêc chcesz zostaæ Magiem z Krêgu Ognia? Hmmm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jesteœ jeszcze gotów. Wróæ do mnie, kiedy zdobêdziesz wiêcej doœwiadczenia.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Wielu chcia³o nale¿eæ do naszego Krêgu, ale przez te wszystkie lata przyj¹³em tylko jednego ucznia. Wszyscy pozostali zawiedli.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Twój duch jest dojrza³y i gotów do próby. Zanim zostaniesz magiem musisz pomyœlnie przejœæ egzamin. Daj mi znaæ, kiedy bêdziesz gotów.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,	"Corristo zgodzi³ siê przyj¹æ mnie do krêgu Magów Ognia, ale najpierw chce poddaæ mnie testowi.");
	};
};
//--------------------------------------------------------------------------
// 							DIE PROBE 
//-------------------------------------------------------------------------- 
instance  KDF_402_Corristo_KDFTEST (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KDFTEST_Condition;
	information		= KDF_402_Corristo_KDFTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem gotów. Mo¿esz poddaæ mnie próbie."; 
};

FUNC int  KDF_402_Corristo_KDFTEST_Condition()
{	
	if (Corristo_KDFAufnahme == 1) && (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KDFTEST_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jestem gotów. Mo¿esz poddaæ mnie próbie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobrze. S³u¿y³eœ Bractwu na bagnach, czy¿ nie?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Tak.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Nie.",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Tak.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak ma na imiê najwy¿szy z bogów?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Œni¹cy.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Nie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nie potrzebujemy tu ludzi, którzy wypieraj¹ siê w³asnych czynów.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Spróbuj szczêœcia jako wojownik, albo Kopacz. Œcie¿ka magii bêdzie dla ciebie zamkniêta ju¿ na zawsze.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To nieprawid³owa odpowiedŸ. Mo¿e w stra¿y bêdzie z ciebie wiêcej po¿ytku.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //Œni¹cy.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Wygl¹da na to, ¿e zbyt du¿o czasu spêdzi³eœ poœród wyznawców Œni¹cego. Chyba lepiej bêdzie, jeœli tam wrócisz.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaka jest najwa¿niejsza z cnót?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Honor wojownika.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora w obliczu magii.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Dyscyplina.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bogobojnoœæ.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //Myœlê, ¿e ktoœ taki jak ty przyda siê raczej w stra¿y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
//--------------------------------------------------------------------------
// 							DIE PROBE 3
//--------------------------------------------------------------------------
FUNC VOID  KDF_402_Corristo_KDFTEST_FIGHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_FIGHT_Info_15_01"); //Honor wojownika.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //Myœlê, ¿e ktoœ taki jak ty przyda siê raczej w stra¿y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora w obliczu magii.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie. 

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Dyscyplina.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie. 
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bogobojnoœæ.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Udzieli³eœ m¹drych, przemyœlanych odpowiedzi. Mo¿esz zostaæ moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //ChodŸ za mn¹. Zaprowadzê ciê do Komnaty Magii, gdzie z³o¿ysz staro¿ytne œlubowanie. 
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();
};
//--------------------------------------------------------------------------
// 							DAS AUFNAHMERITUAL
//--------------------------------------------------------------------------
instance KDF_402_Corristo_AUFNAHME (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_AUFNAHME_Condition;
	information		= KDF_402_Corristo_AUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_AUFNAHME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"OCC_CHAPEL_UPSTAIRS") < 500)
	&& (Corristo_KDFAufnahme == 4)
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_AUFNAHME_Info()
{
	
	Corristo_KDFAufnahme = 5;
	B_Story_Feueraufnahme();
	AI_UnequipWeapons (hero); 
	AI_SetWalkmode (hero,NPC_WALK); 
	AI_GotoNpc (hero,self);
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Zebraliœmy siê tu dzisiaj, aby przyj¹æ do naszego grona nowego s³ugê Ognia.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teraz z³o¿ysz przysiêgê Ognia.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...Przysiêgam, na potêgê œwiêtego Ognia...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...Przysiêgam, na potêgê œwiêtego Ognia...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z p³omieniem...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z p³omieniem...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy p³omieñ mego ¿ycia wygaœnie.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy p³omieñ mego ¿ycia wygaœnie.
	AI_StopProcessInfos	( self );
};
instance KDF_402_Corristo_ROBE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_ROBE_Condition;
	information		= KDF_402_Corristo_ROBE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_402_Corristo_ROBE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_AUFNAHME))
	&& (Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_ROBE_Info()
{
	Snd_Play			("MFX_Heal_Cast"); 
	
	CreateInvItem		(hero,KDF_ARMOR_L);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Wyg³aszaj¹c s³owa przysiêgi zosta³eœ po wsze czasy zwi¹zany ze œwiêtym Ogniem.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //Noœ tê szatê na znak tego przymierza.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_03"); //Kostur symbolizuj¹cy twoj¹ rangê wyda ci Rodriguez. 
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	//HeroJoinToOC ();
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,	"Przeszed³em test i z³o¿y³em przysiêgê Ognia. Od tej pory mogê nosiæ czerwon¹ szatê Krêgu Ognia!");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo mo¿e mnie wprowadziæ w krêgi magii oraz zwiêkszyæ moj¹ mana. Znajdê go w siedzibie Magów Ognia.");	
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_MANA (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_MANA_Condition;
	information		= KDF_402_Corristo_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebujê wiêkszej mocy magicznej."; 
};

FUNC int  KDF_402_Corristo_MANA_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_MANA_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Potrzebujê wiêkszej mocy magicznej.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Poka¿ê ci, jak zwiêkszyæ twoje zdolnoœci magiczne. Jak je wykorzystaæ, zale¿y ju¿ tylko od ciebie.
	
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK	,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);
};  
func void KDF_402_Corristo_MANA_BACK()
{
	Info_ClearChoices	(KDF_402_Corristo_MANA);
};

func void KDF_402_Corristo_MANA_MAN_1()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};

func void KDF_402_Corristo_MANA_MAN_5()
{
	Mod_KupAtrybut (hero, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_402_Corristo_MANA);
	Info_AddChoice		(KDF_402_Corristo_MANA,DIALOG_BACK								,KDF_402_Corristo_MANA_BACK);
	Info_AddChoice		(KDF_402_Corristo_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDF_402_Corristo_MANA_MAN_5);
	Info_AddChoice		(KDF_402_Corristo_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDF_402_Corristo_MANA_MAN_1);

};
//--------------------------------------------------------------------------
// 							ERLÄUTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_EXPLAINCIRCLES (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information		= KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyjaœnij mi znaczenie magicznych Krêgów."; 
};

FUNC int  KDF_402_Corristo_EXPLAINCIRCLES_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF) 
	{
		return TRUE;
	};
};
func void  KDF_402_Corristo_EXPLAINCIRCLES_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Wyjaœnij mi znaczenie magicznych Krêgów.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Oczywiœcie. Krêgi symbolizuj¹ twój udzia³ w magicznych mocach.  
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Symbolizuj¹ wiedzê, umiejêtnoœci i poznanie magicznych zaklêæ i formu³. 
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Musisz ukoñczyæ ka¿dy Kr¹g, zanim wolno ci bêdzie przyst¹piæ do nastêpnego.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Czeka ciê wiele godzin æwiczeñ. To trudna droga, z której ³atwo zboczyæ, ale nagroda warta jest poœwiêcenia. 
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Za ka¿dym razem, kiedy awansujesz do kolejnego Krêgu, poznasz nowe, potê¿niejsze zaklêcia. Oczywiœcie magiczne Krêgi to coœ wiêcej ni¿ tylko mocniejsze czary.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //To istotna czêœæ twojego ¿ycia. One zawsze bêd¹ z tob¹. Uczyñ je czêœci¹ siebie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Pojmuj¹c ich potêgê, pojmiesz potêgê siebie samego.
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS1 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS1_Condition;
	information		= KDF_402_Corristo_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDF_402_Corristo_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,KDF_402_Corristo_EXPLAINCIRCLES))
	&&	(Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS1_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jestem gotowy do przyst¹pienia do Pierwszego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Przyst¹pienie do Pierwszego Krêgu wi¹¿e siê z poznaniem tajników magii runicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Ka¿da runa zawiera esencjê szczególnego zaklêcia magicznego.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Wykorzystuj¹c swoje zdolnoœci magiczne, bêdziesz w stanie j¹ uwolniæ.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //W odró¿nieniu od magicznych zwojów zawieraj¹cych formu³y zaklêæ, magia zawarta w runach jest trwa³a. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Runy s¹ Ÿród³em czarodziejskiej mocy, na którym mo¿esz polegaæ w ka¿dej sytuacji.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Twoja w³asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwojów.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //W miarê awansowania do kolejnych Krêgów, bêdziesz poznawa³ nowe runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Wykorzystaj drzemi¹c¹ w runach moc do poznania samego siebie.
		KDF_402_Corristo_KREIS1.permanent	= 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS2 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS2_Condition;
	information		= KDF_402_Corristo_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDF_402_Corristo_KREIS2_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS2_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jestem gotowy do przyst¹pienia do Drugiego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Pozna³eœ ju¿ magiczn¹ naturê jêzyka runicznego. Teraz zg³êbisz jego tajniki.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Po przyst¹pieniu do Drugiego Krêgu poznasz silniejsze zaklêcia ofensywne oraz tajemnicê magii uzdrawiaj¹cej. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Musisz siê jeszcze wiele nauczyæ, zanim dane ci bêdzie poznaæ prawdziwe oblicze magii. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Wiesz ju¿, ¿e runy mog¹ byæ wykorzystywane do chwili wyczerpania twoich w³asnych pok³adów si³y magicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Jednak zanim przyst¹pisz do dzia³ania, zastanów siê nad celem, jaki ci przyœwieca. Moce, którymi bêdziesz dysponowa³ mog¹ nieœæ œmieræ i zniszczenie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolnoœci tylko wtedy, gdy jest to absolutnie niezbêdne.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Kiedy w pe³ni uœwiadomisz sobie ten fakt, zrozumiesz prawdê kryj¹c¹ siê za magi¹ runiczn¹.
		KDF_402_Corristo_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS3 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS3_Condition;
	information		= KDF_402_Corristo_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDF_402_Corristo_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	 
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS3_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Mo¿esz mnie wprowadziæ w arkana Trzeciego Krêgu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Trzeci Kr¹g to jeden z najwa¿niejszych etapów w ¿yciu ka¿dego maga. Przystêpuj¹c do niego przestajesz byæ uczniem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Zaszed³eœ ju¿ bardzo daleko na œcie¿ce magii. Potrafisz pos³ugiwaæ siê runami.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Ta wiedza pos³u¿y za fundament twojej dalszej nauki. U¿ywaj magii runicznej œwiadomie i z rozwag¹. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale¿eæ wy³¹cznie od ciebie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Wybór, którego dokonasz, musi byæ ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //WyobraŸ sobie wyraŸnie œcie¿kê, któr¹ chcesz kroczyæ i ponieœ wszelkie konsekwencje swojego wyboru.
		KDF_402_Corristo_KREIS3.permanent = 0;
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_08"); //Jako, ¿e masz trzeci poziom wtajemniczenia mo¿esz udaæ siê do Rorigueza po kostur Maga Ognia.
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDF_402_Corristo_KREIS4 (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_KREIS4_Condition;
	information		= KDF_402_Corristo_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDF_402_Corristo_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_KREIS4_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jestem gotowy do przyst¹pienia do Czwartego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Ukoñczy³eœ ju¿ pierwsze trzy Krêgi. Nadesz³a pora, byœ zg³êbi³ prawdziw¹ naturê magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Magia runiczna jest zaklêta w kamieniu. W koñcu runy to fragmenty magicznej rudy. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Tej samej rudy, która wydobywana jest w kopalniach. Z pomoc¹ bogów runy nasycane s¹ magi¹ w naszych œwi¹tyniach staj¹c siê narzêdziem naszej potêgi.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Z twoj¹ znajomoœci¹ magii runicznej, ca³a wiedza zgromadzona przez wszystkie œwi¹tynie w tym królestwie stoi przed tob¹ otworem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Nauczy³em ciê wszystkiego, co sam potrafiê. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Pamiêtaj: poznanie natury magii jest kluczem do poznania natury potêgi i w³adzy.
		KDF_402_Corristo_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE									
------------------------------------------------------------------------*/

instance  KDF_402_Corristo_HEAVYARMOR (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_HEAVYARMOR_Condition;
	information		= KDF_402_Corristo_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_CorristoHighRobe,VALUE_KDF_ARMOR_H); 
};

FUNC int  KDF_402_Corristo_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_402_Corristo_HEAVYARMOR_Info()
{
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistrzu, chcia³bym nosiæ szatê Arcymaga Ognia.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jesteœ jeszcze gotów. Wróæ do mnie, kiedy zdobêdziesz wiêcej doœwiadczenia.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj¹cej iloœci rudy!
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Twój czas wreszcie nadszed³. Jesteœ godzien, by nosiæ szatê Arcymaga Ognia.
		
		CreateInvItem		(hero,KDF_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		B_GiveInvItems      (hero, self, ItMinugget,VALUE_KDF_ARMOR_H);
		AI_EquipBestArmor	(hero);
		KDF_402_Corristo_HEAVYARMOR.permanent = 0;
	};
	
};  


////////////////////////////////////////////////////////////////
// ZADANIE NA 3 ROZDZIA£
////////////////////////////////////////////////////////////////

//========================================
//-----------------> DRAGO_QUEST
//========================================

INSTANCE DIA_Corristo_DRAGO_QUEST (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_DRAGO_QUEST_Condition;
   information  = DIA_Corristo_DRAGO_QUEST_Info;
   permanent	= FALSE;
   description	= "Przysy³a mnie Drago. Musimy podj¹æ odpowiednie kroki w sprawie Œni¹cego.";
};

FUNC INT DIA_Corristo_DRAGO_QUEST_Condition()
{
    if (must_talk_corristo == true)
    && (kapitel == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_DRAGO_QUEST_Info()
{
	
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_01"); //Przysy³a mnie Drago. Musimy podj¹æ odpowiednie kroki w sprawie Œni¹cego.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_02"); //Tak, wiem ju¿ o wszystkim. Nie jestem tym faktem szczególnie zaskoczony. 
	AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_03"); //Œni¹cy od pocz¹tku wydawa³ mi siê podejrzany. Interesuje mnie natomiast, co teraz stanie siê z Bractwem.
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_04"); //Cor Angar przej¹³ w³adzê w Obozie, wyrzekaj¹c siê wraz ze swoimi ludŸmi Œni¹cego. 
	AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_05"); //Cor Kalom natomiast zebra³ grupê ludzi, którzy nie porzucili swej wiary i uda³ siê na poszukiwania demona.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_06"); //Na Innosa, to istna katastrofa. Ci ludzie potrzebuj¹ teraz wielkiego wsparcia. Jakie teraz maj¹ plany?
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_07"); //Wys³ali mnie do Nowego Obozu, abym wspomóg³ Magów Wody w ich planie zniszczenia Bariery.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_08"); //Oczywiœcie, Magowie Wody... IdŸ do nich natychmiast i zrób wszystko, co jesteœ w stanie. My w tym czasie pomyœlimy, co nale¿y robiæ w sprawie Œni¹cego.
    B_LogEntry                     (CH2_New_God,"Có¿... Pozostaje mi czekaæ na rozwój wydarzeñ i dalej robiæ to, co do mnie nale¿y, czyli próbowaæ siê st¹d wydostaæ.");
    Log_SetTopicStatus       (CH2_New_God, LOG_SUCCESS);
    MIS_NEW_GOD = LOG_SUCCESS;

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ALTERNATIVE_QUEST_END
//========================================

INSTANCE DIA_Corristo_ALTERNATIVE_QUEST_END (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 2;
   condition    = DIA_Corristo_ALTERNATIVE_QUEST_END_Condition;
   information  = DIA_Corristo_ALTERNATIVE_QUEST_END_Info;
   permanent	= FALSE;
   description	= "Drago, gdy ¿y³, kaza³ mi z tob¹ pogadaæ.";
};

FUNC INT DIA_Corristo_ALTERNATIVE_QUEST_END_Condition()
{
    if (!Npc_KnowsInfo (hero, DIA_Corristo_DRAGO_QUEST))
    && (must_talk_corristo == true)
    && (kapitel > 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_ALTERNATIVE_QUEST_END_Info()
{
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_01"); //Drago, gdy ¿y³, kaza³ mi z tob¹ pogadaæ.
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_02"); //Niby o czym?
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_03"); //O tym, co siê dzia³o w Bractwie. O Œni¹cym. 
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_04"); //Nie s¹dzisz, ¿e przychodzisz trochê za póŸno?
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_05"); //Teraz ju¿ nic nie zmienimy. Œni¹cy jest demonem, a ja zosta³em ostatnim ¿yj¹cym Magiem Ognia w Kolonii.
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_06"); //Nie. Jest jeszcze Milten.
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_07"); //Ach, Milten... No tak...
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_08"); //Wszystko w porz¹dku?
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_09"); //Tak, tak. Daj mi chwilkê...
    B_LogEntry                     (CH2_New_God,"Chcia³em porozmawiaæ z Corristo o wydarzeniach w Bractwie, ale przyszed³em chyba zbyt póŸno. W¹tpiê, ¿e gdyby ta rozmowa odby³aby siê kilka dni wczeœniej, coœ by³oby inaczej.");
    Log_SetTopicStatus       (CH2_New_God, LOG_SUCCESS);
    MIS_NEW_GOD = LOG_SUCCESS;

    B_GiveXP (50);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Chapter4_NewStoryLine
//========================================

INSTANCE DIA_Corristo_Chapter4_NewStoryLine (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_Chapter4_NewStoryLine_Condition;
   information  = DIA_Corristo_Chapter4_NewStoryLine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Corristo_Chapter4_NewStoryLine_Condition()
{
    if (initialization_AbMine_Guilds == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_Chapter4_NewStoryLine_Info()
{
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_01"); //Dobrze ciê widzieæ.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_02"); //Corristo?! Co ty TU robisz? 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_03"); //S¹dzi³em, ¿e jesteœ teraz w innym, lepszym œwiecie. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_04"); //Uda³o mi siê uciec z Obozu dos³ownie w ostatniej chwili. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_05"); //Bogowie nade mn¹ czuwaj¹.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_06"); //Nie wiem czy wiesz, ale to nie jest zbyt dobre miejsce na kryjówkê.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_07"); //Pos³uchaj, jestem tutaj tylko i wy³¹cznie ze wzglêdu na ciebie.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_08"); //Na mnie? 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_09"); //Tak. Wszystko siê skomplikowa³o... Jesteœ mi potrzebny.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_10"); //Mów wiêc, o co chodzi.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_11"); //Dowiedzia³em siê, ¿e Gomez wys³a³ grupê Stra¿ników do Opuszczonej Kopalni. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_12"); //Kopalnia sta³a siê kolejnym punktem zapalnym w konflikcie Obozów. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_13"); //Ka¿dy z przywódców chce ugraæ coœ dla siebie. Pamiêtasz, ¿e kto ma kopalnie ten ma w³adzê? 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_14"); //Tak, te s³owa ci¹gle tkwi¹ mi w g³owie. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_15"); //No w³aœnie. Mnie nie interesuje kopalnia. Jestem magiem, sprawy materialne maj¹ dla mnie drugorzêdne znaczenie. 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_16"); //Wiêc o co ci chodzi? 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_17"); //W kopalni znajduje siê pewien artefakt. Jego wygl¹d i dzia³anie jest bardzo podobne do dzia³ania kamieni ogniskuj¹cych. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_18"); //Ta b³yskotka nie mo¿e wpaœæ w niepowo³ane rêce. W kopalni wkrótce zrobi siê t³oczno.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_19"); //Musisz wykorzystaæ to, ¿e Stra¿nicy odsunêli wielki g³az, który zas³ania³ wejœcie do kopalni i przynieœæ mi artefakt.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_20"); //Ja postaram siê go zabezpieczyæ. To bardzo wa¿ne.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_21"); //Skoro tak, to chyba nie mam innego wyboru. 
	 MIS_CorristoEvil = LOG_RUNNING;

    Log_CreateTopic          (CH4_CorristoEvil, LOG_MISSION);
    Log_SetTopicStatus       (CH4_CorristoEvil, LOG_RUNNING);
    B_LogEntry               (CH4_CorristoEvil,"Id¹c w kierunku Opuszczonej Kopalni spotka³em Arcymaga Ognia, Corristo. Okaza³o siê, ¿e uciek³ ze Starego Obozu. Muszê udaæ siê do kopalni i znaleŸæ artefakt przypominaj¹cy kamienie ogniskuj¹ce. Ponoæ do kopalni dobieraj¹ siê ludzie Gomeza. Nie mogê dopuœciæ, by kamieñ wpad³ w ich rêce. ");

};

//========================================
//-----------------> MamSkalke
//========================================

INSTANCE DIA_Corristo_MamSkalke (C_INFO)
{
   npc          = KDF_402_Corristo;
   nr           = 1;
   condition    = DIA_Corristo_MamSkalke_Condition;
   information  = DIA_Corristo_MamSkalke_Info;
   permanent	= FALSE;
   description	= "Mam twój kamieñ.";
};

FUNC INT DIA_Corristo_MamSkalke_Condition()
{
    if (Npc_HasItems (other, Focus_Corristo) >=1) && (MIS_CorristoEvil == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Corristo_MamSkalke_Info()
{
    AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_01"); //Mam twój kamieñ.
	AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_02"); //Doskonale! Spróbujê zabezpieczyæ jego moc. 
    AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_03"); //Co teraz z nim zrobimy?
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_04"); //My? Nic. Bêdê prowadzi³ nad nim badania. Jeœli bêdziesz mnie szuka³, bêdê w Klasztorze Zmiennokszta³tnych.
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_05"); //Myœlê, ¿e znasz to miejsce...
	AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_06"); //Co? ¯adnych wyjaœnieñ? Tak poprostu zabierasz kamieñ i odchodzisz?! Ryzkowa³em ¿ycie...!
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_07"); //Doceniam to, ale nie czas teraz na wyjaœnienia. Do zobaczenia. 
    B_LogEntry                     (CH4_CorristoEvil,"Odda³em artefakt Corristo. By³ tajemniczy i nie z³o¿y³ mi ¿adnych wyjaœnieñ. Tak po prostu uda³ siê do Klasztoru Zmiennokszta³tnych. Bez s³owa... Chyba dam temu spokój.");
	B_GiveInvItems (other, self, Focus_Corristo, 1);
    B_GiveXP (XP_CorristoEvil);
	
    Log_SetTopicStatus       (CH4_CorristoEvil, LOG_SUCCESS);
    MIS_CorristoEvil = LOG_SUCCESS;
	
	Npc_ExchangeRoutine (self,"monestry");
};