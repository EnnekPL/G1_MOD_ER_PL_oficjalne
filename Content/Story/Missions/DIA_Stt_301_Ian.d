
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Rozejrz� si� troch� po okolicy.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Nie sprawiaj �adnych k�opot�w.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "To ty jeste� Ian, szef tej kopalni?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //To ty jeste� Ian, szef tej kopalni?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Tak, to ja. A to moja kopalnia, wi�c lepiej nie pr�buj niczego g�upiego.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "My�la�em, �e to kopalnia Gomeza?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //My�la�em, �e to kopalnia Gomeza?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //No c�, oczywi�cie, kopalnia nale�y do Starego Obozu. Ale tutaj, pod ziemi�, jest tylko jeden szef - ja!
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mo�esz mi opowiedzie� o wydobyciu rudy?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Mo�esz mi opowiedzie� o wydobyciu rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Kopiemy dniem i noc�. Dzi�ki temu wydobywamy oko�o 200 work�w rudy na miesi�c, plus jakie� 20 work�w, kt�re od razu zostaj� przetopione.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, kt�r� dostarczamy Kr�lowi mo�na by wyku� or� dla nie lada armii.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //S�ysza�em, �e ruda ma w�a�ciwo�ci magiczne. Opowiedz mi o tym.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Tak, nasza ruda rzeczywi�cie posiada w�a�ciwo�ci magiczne. Wykuta z niej bro� nigdy si� nie psuje, a miecze i topory s� ostrzejsze, ni� te wykute ze stali.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Ka�da armia wyposa�ona w taki or� ma powa�n� przewag� w boju.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi co� jeszcze o rudzie."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Opowiedz mi co� jeszcze o rudzie.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Niestety, magiczne w�a�ciwo�ci rudy zanikaj� podczas przetapiania. W hutach Nordmaru znaj� odpowiednie techniki przetapiania.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale nawet bez mocy magicznych, bro� wykonana z naszej rudy jest bardziej wytrzyma�a i zadaje wi�ksze obra�enia ni� zwyk�y or�.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o kopalni."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Opowiedz mi o kopalni.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Je�li chcesz si� tu troch� rozejrze�, to radz� ci dobrze uwa�a�. W jaskiniach kryj� si� pe�zacze. Najlepiej trzymaj si� g��wnego szybu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //I nie przeszkadzaj �wi�tynnym Stra�nikom. Chocia� przez wi�kszo�� czasu zbijaj� b�ki, to najlepsi sprzymierze�cy, jakich mo�na sobie wyobrazi� podczas starcia z pe�zaczami.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Postaram si� o tym pami�ta�.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Mam jeszcze sporo roboty. A, i nie przeszkadzaj w pracy moim ludziom!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Tylko si� tu troch� rozejrz�.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przychodz� tu po list� dla Obozu."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Przychodz� tu po list� dla Obozu.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Ka�dy mo�e tak powiedzie�. Spadaj.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przysy�a mnie Diego. Mam odebra� list�."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	&& (Npc_GetTrueGuild(hero) == GIL_VLK)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Przysy�a mnie Diego. Mam odebra� list�.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //W porz�dku. Oto i ona. Powiedz im, �eby si� pospieszyli z dostawami.
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_03"); //Mog� tak po prostu st�d wyj��? Stra�nicy nie b�d� mi robi� k�opotu? Niejaki Lorenzo m�wi�, �e mo�esz mi nie zaufa�.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_04"); //Lorenzo to niech si� za przeproszeniem nie wpierdala w moje sprawy. 
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_05"); //Ta lista jest bardzo wa�na i CHOLERNIE mi ZALE�Y, aby SZYBKO dosta� rzeczy, kt�re na niej s�. Jasne? Id� ju�.
	B_LogEntry  (CH1_BringList,"Ian bez sprzeciwu wr�czy� mi list� zam�wie�. Ponadto zaufa� mi i nie musz� pracowa� jako Kopacz, zanim b�d� m�g� wyj�� z Kopalni.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie� tutaj musi by� gniazdo pe�zaczy.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Gdzie� tutaj musi by� gniazdo pe�zaczy.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Za�o�� si�, �e jest tu przynajmniej z tuzin gniazd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //S�uchaj, musz� natychmiast i�� do tego gniazda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nie mam teraz na to czasu! Par� godzin temu zepsu� si� nasz rozdrabniacz. Ko�o z�bate p�k�o w drzazgi.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nie mam poj�cia, gdzie znajd� nowe.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Przynie� mi ko�o z�bate. Wtedy zajm� si� twoim problemem.

	B_LogEntry		(CH2_MCEggs,	"Ian, szef Starej Kopalni, nie pomo�e mi w odnalezieniu gniazda pe�zaczy. Mam za to przynie�� mu ko�o z�bate do zepsutego rozdrabniacza rudy. Podobno mog� je znale�� w kt�rym� z opuszczonych bocznych tuneli.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ko�o z�bate? A gdzie ja niby mam je znale��?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ko�o z�bate? A gdzie ja niby mam je znale��?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nie mam poj�cia. Jestem r�wnie bezradny co ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //W kt�rym� z bocznych szyb�w stoi zepsuty rozdrabniacz. Mo�e tam co� znajdziesz.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam ko�o z�bate.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mam ko�o z�bate.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Dobra robota! Powinno dzia�a�. No a teraz wr��my do twojej sprawy. Szukasz gniazda pe�zaczy... Hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Znajd� Asghana i powiedz mu, �eby otworzy� ci drzwi. B�dziesz m�g� rozejrze� si� po zamkni�tych korytarzach.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Powiedz mu "Wszystko b�dzie w porz�dku". Po tym pozna, �e to ja ci� przysy�am.

	B_LogEntry		(CH2_MCEggs,	"Przynios�em Ianowi ko�o z�bate, o kt�re prosi�. Teraz mam powiedzie� Asghanowi, �e WSZYSTKO B�DZIE W PORZ�DKU. Wtedy Stra�nik otworzy dla mnie bram� do opuszczonych szyb�w.");
	
	//er 1.4.5
	Wld_InsertNpc (VLK_7019_Buddler, "OM_NEW_ORE1");
	Wld_InsertNpc (VLK_7018_Buddler, "OM_NEW_ORE1");
	Wld_InsertNpc (GRD_7017_Gardist, "OM_NEW_ORE1");
	Wld_InsertNpc (GRD_7016_Gardist, "OM_NEW_ORE1");
};	

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Nadal szukam gniazda pe�zaczy.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Nadal szukam gniazda pe�zaczy.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //M�wi�em ci ju� - id� do Asghana. To dow�dca Stra�nik�w. Znajdziesz go gdzie� na najni�szym poziomie.

	B_LogEntry		(CH2_MCEggs,	"Je�li chc� odnale�� gniazdo pe�zaczy, powinienem porozmawia� z Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz�em gniazdo!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Znalaz�em gniazdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //No to nareszcie b�dziemy tu mieli chwil� spokoju. Ha ha ha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez obrazy. Dobra robota, ch�opcze.
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Masz. We� t� skrzynk� piwa. Zas�u�y�e�.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Znalaz�em gniazdo! I jaja z�o�one przez kr�low� pe�zaczy!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Co? Tylko tyle tych jaj? A zreszt�... Udowodni�e�, �e twardy z ciebie go��.
};

//========================================
//-----------------> SZPIEG
//========================================

INSTANCE DIA_IAN_SZPIEG (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 8;
   condition    = DIA_IAN_SZPIEG_Condition;
   information  = DIA_IAN_SZPIEG_Info;
   permanent	= FALSE;
   description	= "Podobno Stary Ob�z robi co� w kopalni dla Bractwa.";
};

FUNC INT DIA_IAN_SZPIEG_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_GorNaDrak_SZPIEG))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_SZPIEG_Info()
{
    AI_Output (other, self ,"DIA_IAN_SZPIEG_15_01"); //Podobno Stary Ob�z robi co� w kopalni dla Bractwa.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_02"); //Mo�e, ale taki bandycki ch�ystek nie powinien nic o tym wiedzie�.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_03"); //Masz szcz�cie, �e w og�le ci� tu wpu�ci�em.
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_04"); //Zobaczycie. Bandyci kiedy� polegn�. Quentin zap�aci za swe zuchwalstwo!
    AI_Output (self, other ,"DIA_IAN_SZPIEG_03_05"); //Spr�buj tylko co� zrobi� w kopalni, to po�a�ujesz!
    B_LogEntry                     (CH1_PSIcampWORK,"Ian nie chce mi zdradzi� informacji. O ma�o co wyp�dzi�by mnie z kopalni. Musz� na niego uwa�a�.");
};

//========================================
//-----------------> Start_FoodForOldMine
//========================================

INSTANCE DIA_IAN_Start_FoodForOldMine (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_Start_FoodForOldMine_Condition;
   information  = DIA_IAN_Start_FoodForOldMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_IAN_Start_FoodForOldMine_Condition()
{
    if (Npc_KnowsInfo (hero, STT_301_IAN_GETLIST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_Start_FoodForOldMine_Info()
{
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_01"); //Zaczekaj. Jak ju� wybierasz si� na zewn�trz, to b�d� mia� dla ciebie zadanie.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_02"); //Mamy problem z dostawami �ywno�ci do Kopalni.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_03"); //To co dostajemy z Obozu nie zgadza si� z tym, co zamawiamy.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_04"); //Nikt z moich ludzi nie chcia� sobie babra� tym r�k.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_05"); //M�g�by� wyja�ni� t� spraw�?
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_06"); //Jasne. Od czego mam zacz��?
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_07"); //Id� do Starego Obozu i porozmawiaj z kucharzem Snafem.
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_08"); //On przygotowuje straw�, kt�ra jest nam dostarczana.
    AI_Output (other, self ,"DIA_IAN_Start_FoodForOldMine_15_09"); //Wkr�tce si� tym zajm�. 
    AI_Output (self, other ,"DIA_IAN_Start_FoodForOldMine_03_10"); //Mam tak� nadziej�.
    MIS_FoodForOldMine = LOG_RUNNING;

    Log_CreateTopic          (CH1_FoodForOldMine, LOG_MISSION);
    Log_SetTopicStatus       (CH1_FoodForOldMine, LOG_RUNNING);
    B_LogEntry               (CH1_FoodForOldMine,"Ian zleci� mi pewne zadanie: mam wybada�, dlaczego dostawy �ywno�ci dostarczane do Starej Kopalni nie zgadzaj� si� z zam�wieniami. Powinienem w tym celu porozmawia� ze Snafem.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> QuestEndAll
//========================================

INSTANCE DIA_IAN_QuestEndAll (C_INFO)
{
   npc          = STT_301_IAN;
   nr           = 1;
   condition    = DIA_IAN_QuestEndAll_Condition;
   information  = DIA_IAN_QuestEndAll_Info;
   permanent	= FALSE;
   description	= "Problem zosta� rozwi�zany.";
};

FUNC INT DIA_IAN_QuestEndAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Artegor_QuestIan_Succes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_IAN_QuestEndAll_Info()
{
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_01"); //Problem zosta� rozwi�zany.
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_02"); //Mirzo odprowadza� cz�� dostaw do Nowego Obozu. Nie�le przy tym zarobi�.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_03"); //A to gnida! Mam nadzieje, �e ju� nie b�dzie przeszkadza�?
    AI_Output (other, self ,"DIA_IAN_QuestEndAll_15_04"); //Nie b�dzie.
    AI_Output (self, other ,"DIA_IAN_QuestEndAll_03_05"); //Bardzo dobrze. �wietnie si� spisa�e�, jak na nowego.
    B_LogEntry               (CH1_FoodForOldMine,"Powiedzia�em o wszystkim Ianowi. Moja rola sko�czona. ");
    Log_SetTopicStatus       (CH1_FoodForOldMine, LOG_SUCCESS);
    MIS_FoodForOldMine = LOG_SUCCESS;

    B_GiveXP (255);
    CreateInvItems (self, ItMiNugget, 150);
    B_GiveInvItems (self, other, ItMiNugget, 150);
    AI_StopProcessInfos	(self);
};