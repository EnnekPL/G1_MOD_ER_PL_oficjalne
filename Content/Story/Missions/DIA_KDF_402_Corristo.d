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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szuka�! Precz!

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
   description	= "Podobno chcia�e� mnie widzie�.";
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
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_01"); //Podobno chcia�e� mnie widzie�.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_02"); //Niech Innos b�dzie z tob�.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_03"); //Jako �e nale�ysz do Cieni, mam dla ciebie specjalne zadanie.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_04"); //Jakie?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_05"); //Jaki� czas temu wys�a�em kuriera z wa�n� przesy�k� do Mag�w Wody.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_06"); //Niestety z pewnych �r�de� wiem, �e przesy�ka nie dotar�a na miejsce, a kurier gdzie� znikn��.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_07"); //Domy�lasz si� mo�e gdzie?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_08"); //No c�, wiem, �e bardzo szczyci� si� sw� misj� w�r�d innych skaza�c�w.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_09"); //Jeste�my w Kolonii Karnej i ka�dy chce zagarn�� tu jak najwi�cej dla siebie.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_10"); //Zapytaj najlepiej plotkarzy i informator�w w Zewn�trznym Pier�cieniu.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_11"); //Mo�e kt�ry� z nich wie co si� sta�o z Emilem.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_12"); //Emilem?
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_13"); //Tak, tak mia� na imi�.
    AI_Output (other, self ,"DIA_Corristo_MageCourier_Quest_15_14"); //Zobacz� co da si� zrobi�.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_15"); //Doskonale! Niech Innos ci� prowadzi.
    AI_Output (self, other ,"DIA_Corristo_MageCourier_Quest_03_16"); //Wr�� do mnie, gdy tylko si� czego� dowiesz. 
    B_LogEntry                     (CH2_CourierFireMage,"Uda�o mi si� spotka� z samym Corristo - Arcymistrzem Mag�w Ognia. Zleci� mi pewn� misje, polegaj�c� na odnalezieniu wys�anego do Mag�w Wody kuriera. Podobno kurier bardzo szczyci� si� swym zadaniem i chwali� si� nim, gdzie tylko m�g�. Powinienem porozmawia� z plotkarzami w Zewn�trznym Pier�cieniu.");
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
   description	= "Zdoby�em przesy�k� i wiem, kto zabi� Emila. ";
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
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_01"); //Zdoby�em przesy�k� i wiem, kto zabi� Emila. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_02"); //Doskonale! Opowiadaj, synu.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_03"); //Emil zosta� zabity przez Bandyt� Ratforda.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_04"); //Stra�nik Pacho widzia� ca�e zaj�cie, Ratford przechwyci� te� paczk�.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_05"); //Na szcz�cie uda�o mi si� odkry� jego s�aby punkt i przechwyci�em przesy�k�.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_06"); //Przekl�ty bandzior. B�d� si� modli� do Innosa, by ukara� go kl�tw�. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_07"); //Dobrze si� spisa�e�.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_08"); //Teraz zanie� paczk� do Maga Wody imieniem Cronos. 
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_09"); //Zw� go Stra�nikiem Rudy. Znajdziesz go przy kopcu w Nowym Obozie.
    AI_Output (other, self ,"DIA_Corristo_QUestSucces_15_10"); //W porz�dku.
    AI_Output (self, other ,"DIA_Corristo_QUestSucces_03_11"); //Zatem id� ju�. 
    B_LogEntry                     (CH2_CourierFireMage,"Corristo poprosi� mnie, bym odni�s� paczk� do Maga Wody Cronosa.");

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
   description	= "Odda�em paczk� Magom Wody.";
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
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_01"); //Odda�em paczk� Magom Wody.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_02"); //Gdy odchodzi�em, Cronos poleci� mi si� spotka� z jednym ze Szkodnik�w.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_03"); //Podobno sam Lares ma do was jaki� interes. Napisa� do was list.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_04"); //Hmm... Lares? To niepokoj�ce.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_05"); //Poka� mi to pismo.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_06"); //Oto i ono.
    B_GiveInvItems (other, self, ItMis_LetterLaresToFireMages, 1);
    B_UseFakeScroll();
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_07"); //No c�, nie jestem tym szczeg�lnie zdziwiony.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_08"); //Ludzie z Nowego Obozu chc� by�my porzucili Gomeza i po��czyli swe si�y z Magami Wody.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_09"); //M�wi�, �e kiedy� przyp�acimy �yciem za s�u�b� Gomezowi.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_10"); //I co o tym s�dzisz?
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_11"); //Gomez to cz�owiek nieobliczalny, bez doradc�w w postaci nas, Mag�w d�ugo by nie poci�gn��.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_12"); //Nie chcemy zaburzy� panuj�cego w Kolonii porz�dku naszym odej�ciem.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_13"); //Magnaci z pewno�ci� by nam nie odpu�cili. Ruszy�by za nami po�cig.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_14"); //Co gorsza, z pewno�ci� powa�yliby si� na zaatakowanie Nowego Obozu.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_15"); //Dlatego jestem zmuszony odm�wi� pro�bie Laresa.
    AI_Output (other, self ,"DIA_Corristo_CourierQuest_EndLastDia_15_16"); //Nie powinni�cie dawa� si� tak wykorzystywa�. W ko�cu jeste�cie...
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_17"); //Milcz! Nie wa� si� m�wi�, co powinni�my, a czego nie.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_18"); //Sam Innos kieruje naszym losem i wiemy, co robimy.
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_19"); //We� te kilka mikstur. 
    AI_Output (self, other ,"DIA_Corristo_CourierQuest_EndLastDia_03_20"); //A teraz odejd�, zako�czmy t� rozmow�. 
    B_LogEntry                     (CH2_CourierFireMage,"Odda�em list od Laresa Corristo. Podobno ludzie z Nowego Obozu chcieli nak�oni� Mag�w Ognia do porzucenia Gomeza i po��czenia si� z Magami Wody. Corristo odrzuci� ofert� i poda� kilka wyssanych z palca argument�w. Gdy pr�bowa�em go zapyta� o wi�cej szczeg��w, zez�o�ci� si� i zako�czy� rozmow�. Co� mi tu �mierdzi...");
    Log_SetTopicStatus       (CH2_CourierFireMage, LOG_SUCCESS);
    MIS_CourierFireMage = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItFo_Potion_Health_02, 5);
    B_GiveInvItems (self, other, ItFo_Potion_Health_02, 5);
    AI_StopProcessInfos	(self);
};




//--------------------------------------------------------------------------
// 							�BER DIE MAGIER
//--------------------------------------------------------------------------
instance  KDF_402_Corristo_EXPLAINMAGE (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINMAGE_Condition;
	information		= KDF_402_Corristo_EXPLAINMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Powiedz mi - jak to jest by� Magiem?"; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINMAGE_Info_15_01"); //Powiedz mi - jak to jest by� Magiem?
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_02"); //Jeste�my Magami Ognia. S�u�ymy Innosowi - najpot�niejszemu z bog�w.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_03"); //Nasza magia jest darem niebios. Jeste�my kap�anami, nauczycielami i s�dziami jednocze�nie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINMAGE_Info_14_04"); //Dar, kt�ry jest jednocze�nie wielkim ci�arem. To zadanie, kt�re okre�la cel naszego �ycia.
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
	description     = "Chcia�bym przyst�pi� do Kr�gu.";
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
	AI_Output (other, self,"KDF_402_Corristo_WANNBEKDF_Info_15_01"); //Chcia�bym przyst�pi� do Kr�gu.
	AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_02"); //A wi�c chcesz zosta� Magiem z Kr�gu Ognia? Hmmm...

	
	if	(hero.level < 10)
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jeste� jeszcze got�w. Wr�� do mnie, kiedy zdob�dziesz wi�cej do�wiadczenia.
		
		AI_StopProcessInfos	( self );
		B_PrintGuildCondition(10);
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_03"); //Wielu chcia�o nale�e� do naszego Kr�gu, ale przez te wszystkie lata przyj��em tylko jednego ucznia. Wszyscy pozostali zawiedli.
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_05"); //Tw�j duch jest dojrza�y i got�w do pr�by. Zanim zostaniesz magiem musisz pomy�lnie przej�� egzamin. Daj mi zna�, kiedy b�dziesz got�w.
		Corristo_KDFAufnahme = 1;
		KDF_402_Corristo_WANNBEKDF.permanent = 0;
		Info_ClearChoices (KDF_402_Corristo_WANNBEKDF);

		Log_CreateTopic	(GE_BecomeFiremage,	LOG_NOTE);
		B_LogEntry	(GE_BecomeFiremage,	"Corristo zgodzi� si� przyj�� mnie do kr�gu Mag�w Ognia, ale najpierw chce podda� mnie testowi.");
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
	description		= "Jestem got�w. Mo�esz podda� mnie pr�bie."; 
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
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_Info_15_01"); //Jestem got�w. Mo�esz podda� mnie pr�bie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_Info_14_02"); //Dobrze. S�u�y�e� Bractwu na bagnach, czy� nie?
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Tak.",KDF_402_Corristo_KDFTEST_JA); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Nie.",KDF_402_Corristo_KDFTEST_NO); 

};  
FUNC VOID  KDF_402_Corristo_KDFTEST_JA()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_JA_Info_15_01"); //Tak.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_02"); //Hmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_JA_Info_14_03"); //Jak ma na imi� najwy�szy z bog�w?
	Corristo_KDFAufnahme = 2;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Adanos",KDF_402_Corristo_KDFTEST_ADANOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"�ni�cy.",KDF_402_Corristo_KDFTEST_SLEEPER);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Innos",KDF_402_Corristo_KDFTEST_INNOS); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Gomez",KDF_402_Corristo_KDFTEST_GOMEZ);
};

FUNC VOID  KDF_402_Corristo_KDFTEST_NO()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_NO_Info_15_01"); //Nie.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_03"); //Nie potrzebujemy tu ludzi, kt�rzy wypieraj� si� w�asnych czyn�w.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_NO_Info_14_04"); //Spr�buj szcz�cia jako wojownik, albo Kopacz. �cie�ka magii b�dzie dla ciebie zamkni�ta ju� na zawsze.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_ADANOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_ADANOS_Info_15_01"); //Adanos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_ADANOS_Info_14_03"); //To nieprawid�owa odpowied�. Mo�e w stra�y b�dzie z ciebie wi�cej po�ytku.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_SLEEPER()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_15_01"); //�ni�cy.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_SLEEPER_Info_14_03"); //Wygl�da na to, �e zbyt du�o czasu sp�dzi�e� po�r�d wyznawc�w �ni�cego. Chyba lepiej b�dzie, je�li tam wr�cisz.
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID  KDF_402_Corristo_KDFTEST_INNOS()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_INNOS_Info_15_01"); //Innos.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_INNOS_Info_14_03"); //Jaka jest najwa�niejsza z cn�t?
	Corristo_KDFAufnahme = 3;
	Info_ClearChoices (KDF_402_Corristo_KDFTEST);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Honor wojownika.",KDF_402_Corristo_KDFTEST_FIGHT); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Pokora w obliczu magii.",KDF_402_Corristo_KDFTEST_DEMUT);
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Dyscyplina.",KDF_402_Corristo_KDFTEST_DISZIPLIN); 
	Info_Addchoice (KDF_402_Corristo_KDFTEST,"Bogobojno��.",KDF_402_Corristo_KDFTEST_EHRFURCHT);
};
FUNC VOID  KDF_402_Corristo_KDFTEST_GOMEZ()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_15_01"); //Gomez.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_GOMEZ_Info_14_03"); //My�l�, �e kto� taki jak ty przyda si� raczej w stra�y. Porozmawiaj z Thorusem!
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
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_FIGHT_Info_14_03"); //My�l�, �e kto� taki jak ty przyda si� raczej w stra�y. Porozmawiaj z Thorusem!
	AI_StopProcessInfos	( self );

};
FUNC VOID  KDF_402_Corristo_KDFTEST_DEMUT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DEMUT_Info_15_01"); //Pokora w obliczu magii.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DEMUT_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie. 

	AI_StopProcessInfos	( self );
	Corristo_KDFAufnahme = 4;
	B_Story_Feueraufnahme();
};
FUNC VOID  KDF_402_Corristo_KDFTEST_DISZIPLIN()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_15_01"); //Dyscyplina.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_DISZIPLIN_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie. 
	Corristo_KDFAufnahme = 4;
	AI_StopProcessInfos	( self );
	B_Story_Feueraufnahme();

};
FUNC VOID  KDF_402_Corristo_KDFTEST_EHRFURCHT()
{
	AI_Output (other, self,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_15_01"); //Bogobojno��.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_02"); //Hmmm...
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_03"); //Udzieli�e� m�drych, przemy�lanych odpowiedzi. Mo�esz zosta� moim uczniem.
	AI_Output (self, other,"KDF_402_Corristo_KDFTEST_EHRFURCHT_Info_14_04"); //Chod� za mn�. Zaprowadz� ci� do Komnaty Magii, gdzie z�o�ysz staro�ytne �lubowanie. 
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
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_01"); //Zebrali�my si� tu dzisiaj, aby przyj�� do naszego grona nowego s�ug� Ognia.
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_02"); //Teraz z�o�ysz przysi�g� Ognia.
	Snd_Play   ("howling_01");
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_03"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_04"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_05"); //...Przysi�gam, na pot�g� �wi�tego Ognia...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_06"); //...Przysi�gam, na pot�g� �wi�tego Ognia...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_07"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z p�omieniem...
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_08"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z p�omieniem...
	AI_Output  (self, other,"KDF_402_Corristo_AUFNAHME_Info_14_09"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy p�omie� mego �ycia wyga�nie.
	AI_Output  (other, self,"KDF_402_Corristo_AUFNAHME_Info_15_10"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy p�omie� mego �ycia wyga�nie.
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
	
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_01"); //Wyg�aszaj�c s�owa przysi�gi zosta�e� po wsze czasy zwi�zany ze �wi�tym Ogniem.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_02"); //No� t� szat� na znak tego przymierza.
	AI_Output			(self, other,"KDF_402_Corristo_ROBE_Info_14_03"); //Kostur symbolizuj�cy twoj� rang� wyda ci Rodriguez. 
	AI_StopProcessInfos	(self);
	AI_EquipBestArmor	(hero);
	AI_UnequipWeapons	(hero);
	Npc_SetTrueGuild	(hero,GIL_KDF);
	hero.guild = GIL_KDF;
	//HeroJoinToOC ();
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];

	B_LogEntry		(GE_BecomeFiremage,	"Przeszed�em test i z�o�y�em przysi�g� Ognia. Od tej pory mog� nosi� czerwon� szat� Kr�gu Ognia!");
	Log_CreateTopic	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Corristo mo�e mnie wprowadzi� w kr�gi magii oraz zwi�kszy� moj� mana. Znajd� go w siedzibie Mag�w Ognia.");	
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
	description		= "Potrzebuj� wi�kszej mocy magicznej."; 
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
	AI_Output (other, self,"KDF_402_Corristo_MANA_Info_15_01"); //Potrzebuj� wi�kszej mocy magicznej.
	AI_Output (self, other,"KDF_402_Corristo_MANA_Info_14_02"); //Poka�� ci, jak zwi�kszy� twoje zdolno�ci magiczne. Jak je wykorzysta�, zale�y ju� tylko od ciebie.
	
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
// 							ERL�UTERUNG DER KREISE
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDF_402_Corristo_EXPLAINCIRCLES (C_INFO)
{
	npc				= KDF_402_Corristo;
	condition		= KDF_402_Corristo_EXPLAINCIRCLES_Condition;
	information		= KDF_402_Corristo_EXPLAINCIRCLES_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wyja�nij mi znaczenie magicznych Kr�g�w."; 
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
	AI_Output (other, self,"KDF_402_Corristo_EXPLAINCIRCLES_Info_15_01"); //Wyja�nij mi znaczenie magicznych Kr�g�w.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_02"); //Oczywi�cie. Kr�gi symbolizuj� tw�j udzia� w magicznych mocach.  
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_03"); //Symbolizuj� wiedz�, umiej�tno�ci i poznanie magicznych zakl�� i formu�. 
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_04"); //Musisz uko�czy� ka�dy Kr�g, zanim wolno ci b�dzie przyst�pi� do nast�pnego.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_05"); //Czeka ci� wiele godzin �wicze�. To trudna droga, z kt�rej �atwo zboczy�, ale nagroda warta jest po�wi�cenia. 
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_06"); //Za ka�dym razem, kiedy awansujesz do kolejnego Kr�gu, poznasz nowe, pot�niejsze zakl�cia. Oczywi�cie magiczne Kr�gi to co� wi�cej ni� tylko mocniejsze czary.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_07"); //To istotna cz�� twojego �ycia. One zawsze b�d� z tob�. Uczy� je cz�ci� siebie.
	AI_Output (self, other,"KDF_402_Corristo_EXPLAINCIRCLES_Info_14_08"); //Pojmuj�c ich pot�g�, pojmiesz pot�g� siebie samego.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS1_Info_15_01"); //Jestem gotowy do przyst�pienia do Pierwszego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_02"); //Przyst�pienie do Pierwszego Kr�gu wi��e si� z poznaniem tajnik�w magii runicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_03"); //Ka�da runa zawiera esencj� szczeg�lnego zakl�cia magicznego.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_04"); //Wykorzystuj�c swoje zdolno�ci magiczne, b�dziesz w stanie j� uwolni�.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_05"); //W odr�nieniu od magicznych zwoj�w zawieraj�cych formu�y zakl��, magia zawarta w runach jest trwa�a. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_06"); //Runy s� �r�d�em czarodziejskiej mocy, na kt�rym mo�esz polega� w ka�dej sytuacji.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_07"); //Twoja w�asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwoj�w.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_08"); //W miar� awansowania do kolejnych Kr�g�w, b�dziesz poznawa� nowe runy.
		AI_Output (self, other,"KDF_402_Corristo_KREIS1_Info_14_09"); //Wykorzystaj drzemi�c� w runach moc do poznania samego siebie.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS2_Info_15_01"); //Jestem gotowy do przyst�pienia do Drugiego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_02"); //Pozna�e� ju� magiczn� natur� j�zyka runicznego. Teraz zg��bisz jego tajniki.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_03"); //Po przyst�pieniu do Drugiego Kr�gu poznasz silniejsze zakl�cia ofensywne oraz tajemnic� magii uzdrawiaj�cej. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_04"); //Musisz si� jeszcze wiele nauczy�, zanim dane ci b�dzie pozna� prawdziwe oblicze magii. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_05"); //Wiesz ju�, �e runy mog� by� wykorzystywane do chwili wyczerpania twoich w�asnych pok�ad�w si�y magicznej.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_06"); //Jednak zanim przyst�pisz do dzia�ania, zastan�w si� nad celem, jaki ci przy�wieca. Moce, kt�rymi b�dziesz dysponowa� mog� nie�� �mier� i zniszczenie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolno�ci tylko wtedy, gdy jest to absolutnie niezb�dne.
		AI_Output (self, other,"KDF_402_Corristo_KREIS2_Info_14_08"); //Kiedy w pe�ni u�wiadomisz sobie ten fakt, zrozumiesz prawd� kryj�c� si� za magi� runiczn�.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS3_Info_15_01"); //Mo�esz mnie wprowadzi� w arkana Trzeciego Kr�gu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_02"); //Trzeci Kr�g to jeden z najwa�niejszych etap�w w �yciu ka�dego maga. Przyst�puj�c do niego przestajesz by� uczniem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_03"); //Zaszed�e� ju� bardzo daleko na �cie�ce magii. Potrafisz pos�ugiwa� si� runami.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_04"); //Ta wiedza pos�u�y za fundament twojej dalszej nauki. U�ywaj magii runicznej �wiadomie i z rozwag�. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale�e� wy��cznie od ciebie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_06"); //Wyb�r, kt�rego dokonasz, musi by� ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_07"); //Wyobra� sobie wyra�nie �cie�k�, kt�r� chcesz kroczy� i ponie� wszelkie konsekwencje swojego wyboru.
		KDF_402_Corristo_KREIS3.permanent = 0;
		AI_Output (self, other,"KDF_402_Corristo_KREIS3_Info_14_08"); //Jako, �e masz trzeci poziom wtajemniczenia mo�esz uda� si� do Rorigueza po kostur Maga Ognia.
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
	AI_Output (other, self,"KDF_402_Corristo_KREIS4_Info_15_01"); //Jestem gotowy do przyst�pienia do Czwartego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_02"); //Uko�czy�e� ju� pierwsze trzy Kr�gi. Nadesz�a pora, by� zg��bi� prawdziw� natur� magii.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_03"); //Magia runiczna jest zakl�ta w kamieniu. W ko�cu runy to fragmenty magicznej rudy. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_04"); //Tej samej rudy, kt�ra wydobywana jest w kopalniach. Z pomoc� bog�w runy nasycane s� magi� w naszych �wi�tyniach staj�c si� narz�dziem naszej pot�gi.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_05"); //Z twoj� znajomo�ci� magii runicznej, ca�a wiedza zgromadzona przez wszystkie �wi�tynie w tym kr�lestwie stoi przed tob� otworem.
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_06"); //Nauczy�em ci� wszystkiego, co sam potrafi�. 
		AI_Output (self, other,"KDF_402_Corristo_KREIS4_Info_14_07"); //Pami�taj: poznanie natury magii jest kluczem do poznania natury pot�gi i w�adzy.
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
	AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_01"); //Mistrzu, chcia�bym nosi� szat� Arcymaga Ognia.
	if (Kapitel < 3) 
	{
		AI_Output (self, other,"KDF_402_Corristo_WANNBEKDF_Info_14_04"); //Nie jeste� jeszcze got�w. Wr�� do mnie, kiedy zdob�dziesz wi�cej do�wiadczenia.
		//AI_Output (other, self,"KDF_402_Corristo_HEAVYARMOR_Info_15_02"); //Es ist noch nicht deine Zeit, die hohe Robe zu tragen. //***FALSCHE STIMME***
	}
	else if (Npc_HasItems (hero,ItMinugget)< VALUE_KDF_ARMOR_H) 
	{ 
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczaj�cej ilo�ci rudy!
	}	
	else
	{	
		AI_Output			(self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_04"); //Tw�j czas wreszcie nadszed�. Jeste� godzien, by nosi� szat� Arcymaga Ognia.
		
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
// ZADANIE NA 3 ROZDZIA�
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
   description	= "Przysy�a mnie Drago. Musimy podj�� odpowiednie kroki w sprawie �ni�cego.";
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
	
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_01"); //Przysy�a mnie Drago. Musimy podj�� odpowiednie kroki w sprawie �ni�cego.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_02"); //Tak, wiem ju� o wszystkim. Nie jestem tym faktem szczeg�lnie zaskoczony. 
	AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_03"); //�ni�cy od pocz�tku wydawa� mi si� podejrzany. Interesuje mnie natomiast, co teraz stanie si� z Bractwem.
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_04"); //Cor Angar przej�� w�adz� w Obozie, wyrzekaj�c si� wraz ze swoimi lud�mi �ni�cego. 
	AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_05"); //Cor Kalom natomiast zebra� grup� ludzi, kt�rzy nie porzucili swej wiary i uda� si� na poszukiwania demona.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_06"); //Na Innosa, to istna katastrofa. Ci ludzie potrzebuj� teraz wielkiego wsparcia. Jakie teraz maj� plany?
    AI_Output (other, self ,"DIA_Corristo_DRAGO_QUEST_15_07"); //Wys�ali mnie do Nowego Obozu, abym wspom�g� Mag�w Wody w ich planie zniszczenia Bariery.
    AI_Output (self, other ,"DIA_Corristo_DRAGO_QUEST_03_08"); //Oczywi�cie, Magowie Wody... Id� do nich natychmiast i zr�b wszystko, co jeste� w stanie. My w tym czasie pomy�limy, co nale�y robi� w sprawie �ni�cego.
    B_LogEntry                     (CH2_New_God,"C�... Pozostaje mi czeka� na rozw�j wydarze� i dalej robi� to, co do mnie nale�y, czyli pr�bowa� si� st�d wydosta�.");
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
   description	= "Drago, gdy �y�, kaza� mi z tob� pogada�.";
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
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_01"); //Drago, gdy �y�, kaza� mi z tob� pogada�.
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_02"); //Niby o czym?
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_03"); //O tym, co si� dzia�o w Bractwie. O �ni�cym. 
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_04"); //Nie s�dzisz, �e przychodzisz troch� za p�no?
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_05"); //Teraz ju� nic nie zmienimy. �ni�cy jest demonem, a ja zosta�em ostatnim �yj�cym Magiem Ognia w Kolonii.
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_06"); //Nie. Jest jeszcze Milten.
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_07"); //Ach, Milten... No tak...
    AI_Output (other, self ,"DIA_Corristo_ALTERNATIVE_QUEST_END_15_08"); //Wszystko w porz�dku?
    AI_Output (self, other ,"DIA_Corristo_ALTERNATIVE_QUEST_END_03_09"); //Tak, tak. Daj mi chwilk�...
    B_LogEntry                     (CH2_New_God,"Chcia�em porozmawia� z Corristo o wydarzeniach w Bractwie, ale przyszed�em chyba zbyt p�no. W�tpi�, �e gdyby ta rozmowa odby�aby si� kilka dni wcze�niej, co� by�oby inaczej.");
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
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_01"); //Dobrze ci� widzie�.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_02"); //Corristo?! Co ty TU robisz? 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_03"); //S�dzi�em, �e jeste� teraz w innym, lepszym �wiecie. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_04"); //Uda�o mi si� uciec z Obozu dos�ownie w ostatniej chwili. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_05"); //Bogowie nade mn� czuwaj�.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_06"); //Nie wiem czy wiesz, ale to nie jest zbyt dobre miejsce na kryj�wk�.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_07"); //Pos�uchaj, jestem tutaj tylko i wy��cznie ze wzgl�du na ciebie.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_08"); //Na mnie? 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_09"); //Tak. Wszystko si� skomplikowa�o... Jeste� mi potrzebny.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_10"); //M�w wi�c, o co chodzi.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_11"); //Dowiedzia�em si�, �e Gomez wys�a� grup� Stra�nik�w do Opuszczonej Kopalni. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_12"); //Kopalnia sta�a si� kolejnym punktem zapalnym w konflikcie Oboz�w. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_13"); //Ka�dy z przyw�dc�w chce ugra� co� dla siebie. Pami�tasz, �e kto ma kopalnie ten ma w�adz�? 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_14"); //Tak, te s�owa ci�gle tkwi� mi w g�owie. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_15"); //No w�a�nie. Mnie nie interesuje kopalnia. Jestem magiem, sprawy materialne maj� dla mnie drugorz�dne znaczenie. 
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_16"); //Wi�c o co ci chodzi? 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_17"); //W kopalni znajduje si� pewien artefakt. Jego wygl�d i dzia�anie jest bardzo podobne do dzia�ania kamieni ogniskuj�cych. 
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_18"); //Ta b�yskotka nie mo�e wpa�� w niepowo�ane r�ce. W kopalni wkr�tce zrobi si� t�oczno.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_19"); //Musisz wykorzysta� to, �e Stra�nicy odsun�li wielki g�az, kt�ry zas�ania� wej�cie do kopalni i przynie�� mi artefakt.
    AI_Output (self, other ,"DIA_Corristo_Chapter4_NewStoryLine_03_20"); //Ja postaram si� go zabezpieczy�. To bardzo wa�ne.
    AI_Output (other, self ,"DIA_Corristo_Chapter4_NewStoryLine_15_21"); //Skoro tak, to chyba nie mam innego wyboru. 
	 MIS_CorristoEvil = LOG_RUNNING;

    Log_CreateTopic          (CH4_CorristoEvil, LOG_MISSION);
    Log_SetTopicStatus       (CH4_CorristoEvil, LOG_RUNNING);
    B_LogEntry               (CH4_CorristoEvil,"Id�c w kierunku Opuszczonej Kopalni spotka�em Arcymaga Ognia, Corristo. Okaza�o si�, �e uciek� ze Starego Obozu. Musz� uda� si� do kopalni i znale�� artefakt przypominaj�cy kamienie ogniskuj�ce. Pono� do kopalni dobieraj� si� ludzie Gomeza. Nie mog� dopu�ci�, by kamie� wpad� w ich r�ce. ");

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
   description	= "Mam tw�j kamie�.";
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
    AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_01"); //Mam tw�j kamie�.
	AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_02"); //Doskonale! Spr�buj� zabezpieczy� jego moc. 
    AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_03"); //Co teraz z nim zrobimy?
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_04"); //My? Nic. B�d� prowadzi� nad nim badania. Je�li b�dziesz mnie szuka�, b�d� w Klasztorze Zmiennokszta�tnych.
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_05"); //My�l�, �e znasz to miejsce...
	AI_Output (other, self ,"DIA_Corristo_MamSkalke_15_06"); //Co? �adnych wyja�nie�? Tak poprostu zabierasz kamie� i odchodzisz?! Ryzkowa�em �ycie...!
    AI_Output (self, other ,"DIA_Corristo_MamSkalke_03_07"); //Doceniam to, ale nie czas teraz na wyja�nienia. Do zobaczenia. 
    B_LogEntry                     (CH4_CorristoEvil,"Odda�em artefakt Corristo. By� tajemniczy i nie z�o�y� mi �adnych wyja�nie�. Tak po prostu uda� si� do Klasztoru Zmiennokszta�tnych. Bez s�owa... Chyba dam temu spok�j.");
	B_GiveInvItems (other, self, Focus_Corristo, 1);
    B_GiveXP (XP_CorristoEvil);
	
    Log_SetTopicStatus       (CH4_CorristoEvil, LOG_SUCCESS);
    MIS_CorristoEvil = LOG_SUCCESS;
	
	Npc_ExchangeRoutine (self,"monestry");
};