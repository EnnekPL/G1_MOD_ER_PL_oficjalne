//poprawione i sprawdzone - Nocturn

instance KDF_401_Damarok_WELCOME (C_INFO)
{
	npc				= KDF_401_Damarok;
	condition		= KDF_401_Damarok_WELCOME_Condition;
	information		= KDF_401_Damarok_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_401_Damarok_WELCOME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&& (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	&& (Npc_KnowsInfo (hero,KDF_405_Torrez_BOOK))
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  KDF_401_Damarok_WELCOME_Info()
{

	AI_GotoNpc (self,hero);
	AI_Output (self, other,"KDF_401_Damarok_WELCOME_Info_14_01"); //Niech Ogie� roz�wietla twe �ycie!
	
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos	( self );
};
// ************************ EXIT **************************

instance  KDF_401_Damarok_Exit (C_INFO)
{
	npc			=  KDF_401_Damarok;
	nr			=  999;
	condition	=  KDF_401_Damarok_Exit_Condition;
	information	=  KDF_401_Damarok_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//-----------------------------------------------------------
instance KDF_401_Damarok_HEAL (C_INFO)
{
	npc				= KDF_401_Damarok;
	condition		= KDF_401_Damarok_HEAL_Condition;
	information		= KDF_401_Damarok_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_401_Damarok_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF)
	&& (Npc_IsInRoutine  (self,Rtn_START_401))
	{
		return TRUE;
	};
};
func void  KDF_401_Damarok_HEAL_Info()
{
	AI_Output (self, other,"KDF_401_Damarok_HEAL_Info_14_01"); //Gdyby� zosta� ranny, uzdrowi� ci�.
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  KDF_401_Damarok_HEALINFO (C_INFO)
{
	npc				= KDF_401_Damarok;
	nr				= 100;
	condition		= KDF_401_Damarok_HEALINFO_Condition;
	information		= KDF_401_Damarok_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo�esz mi pom�c?"; 
};

FUNC int  KDF_401_Damarok_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output (other, self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //Jestem ranny. Mo�esz mi pom�c?
	AI_Output (self, other,"KDF_401_Damarok_HEALINFO_Info_14_02"); //W zdrowym ciele - zdrowy duch.
	Snd_Play  ("MFX_Heal_Cast"); 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
};  
//========================================
//-----------------> HEAL_WARRIOR
//========================================

INSTANCE DIA_Damarok_HEAL_WARRIOR (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 1;
   condition    = DIA_Damarok_HEAL_WARRIOR_Condition;
   information  = DIA_Damarok_HEAL_WARRIOR_Info;
   permanent	= FALSE;
   description	= "Podobno jeste� w stanie uwarzy� eliksir, kt�ry ca�kowicie wyleczy cielesne rany.";
};

FUNC INT DIA_Damarok_HEAL_WARRIOR_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jim_HELP_WARRIOR))
    && (Jim_odrzucilem == false)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_HEAL_WARRIOR_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_01"); //Podobno jeste� w stanie uwarzy� eliksir, kt�ry ca�kowicie wyleczy cielesne rany.
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_02"); //To prawda, jednak dlaczego mia�bym ci pomaga�, skaza�cze?
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_03"); //Przysy�a mnie Jim.
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_04"); //Ach tak, Jim. Ju� z nim rozmawia�em. Wywar, kt�ry chcesz otrzyma� jest znacznie bardziej skomplikowany ni� inne eliksiry lecznicze. 
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_05"); //Do jego stworzenia potrzebna jest niesamowita precyzja, a przede wszystkim magia. Niestety, nie jestem w posiadaniu najbardziej istotnego sk�adnika - magicznej wody.
	AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_06"); //Gdzie j� mog� znale��?
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_07"); //Nie wiem, prawdopodobnie w miejscach oddzia�ywania magii.
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_08"); //Dostarcz� ci ten sk�adnik.
    B_LogEntry                     (CH1_RannyWojownik,"Damarok sporz�dzi mikstur�, je�li przynios� mu najwa�niejszy sk�adnik - magiczn� wod�. Powinienem szuka� w miejscach, na kt�re ma wp�yw magia.");

    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FOUND_WATER
//========================================
//edit by Nocturn

INSTANCE DIA_Damarok_FOUND_WATER (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 2;
   condition    = DIA_Damarok_FOUND_WATER_Condition;
   information  = DIA_Damarok_FOUND_WATER_Info;
   permanent	= FALSE;
   description	= "Znalaz�em magiczn� wod�.";
};

FUNC INT DIA_Damarok_FOUND_WATER_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Damarok_HEAL_WARRIOR))
    && (Npc_HasItems (other, SpecialWater) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_FOUND_WATER_Info()
{
    AI_Output (other, self ,"DIA_Damarok_FOUND_WATER_15_01"); //Znalaz�em magiczn� wod�.
    AI_Output (self, other ,"DIA_Damarok_FOUND_WATER_03_02"); //�wietnie, zaraz przyrz�dz� wywar. Poczekaj tu na mnie. Zaraz wr�c�.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
};
//powr�t 
INSTANCE DIA_Damarok_FOUND_WATER2 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 2;
   condition    = DIA_Damarok_FOUND_WATER2_Condition;
   information  = DIA_Damarok_FOUND_WATER2_Info;
   permanent	= FALSE;
   important	= true;
};

FUNC INT DIA_Damarok_FOUND_WATER2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Damarok_FOUND_WATER))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_FOUND_WATER2_Info()
{
	AI_Output (self, other ,"DIA_Damarok_FOUND_WATER2_15_03"); //Gotowe, oto eliksir.
    AI_Output (other, self ,"DIA_Damarok_FOUND_WATER2_15_04"); //Dzi�ki.
    B_LogEntry                     (CH1_RannyWojownik,"Damarok przyrz�dzi� lekarstwo. Powinienem jak najszybciej uda� si� do Gerarda.");
    B_GiveXP (400);
    B_GiveInvItems (other, self, SpecialWater, 1);
    CreateInvItems (self, GerardPotion, 1);
    B_GiveInvItems (self, other, GerardPotion, 1);
    AI_StopProcessInfos	(self);
};
 
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_DAMAROK_KnowsAlchemy2 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 4;
   condition    = DIA_DAMAROK_KnowsAlchemy2_Condition;
   information  = DIA_DAMAROK_KnowsAlchemy2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_1, LPCOST_TALENT_ALCHEMY_1,150);
};

FUNC INT DIA_DAMAROK_KnowsAlchemy2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 0) && (Npc_GetTrueGuild    (hero) == GIL_KDF)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DAMAROK_KnowsAlchemy2_Info()
{
    AI_Output (other, self ,"DIA_DAMAROK_KnowsAlchemy2_15_01"); //Naucz mnie podstaw alchemii.
    if  (hero.lp >= 10) && (Npc_HasItems (hero, ItMiNugget)>=150)
    {
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_02"); //No dobrze. Naucz� ci� warzy� proste mikstury i alkohole, oraz przygotowywa� tyto�.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_05"); //Szczeg�lnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_06"); //Podstawowe mo�esz pr�bowa� uwarzy� sam.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_07"); //Kieruj si� zdrowym rozs�dkiem i b�d� spokojny.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_08"); //Ostro�nie dawkuj sk�adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiej�tno��: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_DAMAROK_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_DAMAROK_KnowsAlchemy2.permanent = true;
	if (!hero.lp >= 10)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=150)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};
//========================================
//-----------------> KnowsAlchemy
//========================================

INSTANCE DIA_DAMAROK_KnowsAlchemy2_L2 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 4;
   condition    = DIA_DAMAROK_KnowsAlchemy2_L2_Condition;
   information  = DIA_DAMAROK_KnowsAlchemy2_L2_Info;
   permanent	= true;
   description	=  B_BuildLearnString(NAME_LearnAlchemy_2, LPCOST_TALENT_ALCHEMY_2,360);
};

FUNC INT DIA_DAMAROK_KnowsAlchemy2_L2_Condition()
{
    if (Npc_GetTalentSkill(other, NPC_TALENT_FIREMASTER) == 1) && (Npc_GetTrueGuild    (hero) == GIL_KDF)
    {
    return TRUE;
    };
};


FUNC VOID DIA_DAMAROK_KnowsAlchemy2_L2_Info()
{
    AI_Output (other, self ,"DIA_DAMAROK_KnowsAlchemy2_L2_15_01"); //Naucz mnie z�o�onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_02"); //Aby przyrz�dzi� trudniejsze mikstury, b�dziesz potrzebowa� przepisu.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_03"); //Nigdy nie pr�buj sam wytwarza� silnych mikstur. Wielu alchemik�w przyp�aci�o to �yciem.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_04"); //Wa�ne s� tutaj sk�adniki. To, z czym b�dziesz mia� do czynienia, to nie byle ziele - to swoiste pok�ady magicznej energii drzemi�cej w li�ciach i �odygach.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiej�tno�ci� syntezy tej energii.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury b�dziesz m�g� ulepszy�.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj�cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_08"); //To tyle. B�d� ostro�ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Post�p w umiej�tno�ci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_DAMAROK_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_09"); //Nie mog� ci� tego nauczy�.
	DIA_DAMAROK_KnowsAlchemy2_l2.permanent = true;
	if (!hero.lp >= 20)
	{
	PrintScreen (HAVENT_LP,-1, 18, "Font_New_10_Red.TGA", 2);
	};
	if (!Npc_HasItems (other, ItMiNugget) >=360)
	{
	PrintScreen (HAVENT_ORE,-1, 21, "Font_New_10_Red.TGA", 2);
	};
    AI_StopProcessInfos	(self);
    };

};

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Damarok_HELLO1 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 1;
   condition    = DIA_Damarok_HELLO1_Condition;
   information  = DIA_Damarok_HELLO1_Info;
   permanent	= FALSE;
   description	= "Witaj magu!";
};

FUNC INT DIA_Damarok_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Damarok_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HELLO1_15_01"); //Witaj, magu!
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_02"); //Innos z tob�, synu. Co ci� do mnie sprowadza?
    AI_Output (other, self ,"DIA_Damarok_HELLO1_15_03"); //Jestem po prostu ciekaw, czym si� zajmujesz. 
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_04"); //Jestem alchemikiem, jednym z najlepszych w ca�ej Kolonii. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_05"); //Dawniej, gdy nie by�o jeszcze Bariery, wspiera�em moimi miksturami grupy wydobywcze i kr�lewskich stra�nik�w.
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_06"); //Jednak te czasy min�y. Teraz nie dbamy ju� o �ycie g�rnik�w. Je�li kt�ry� z nich zemrze w kopalni, jest zast�powany kim� innym. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_07"); //Od kiedy skaza�cy przej�li kontrol� nad Koloni�, ka�dy musi sam o siebie zadba�. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_08"); //Zaj��em si� wi�c zaopatrywaniem w mikstury pozosta�ych Mag�w oraz Magnat�w. 
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_09"); //Moje wyroby sprzedaje r�wnie� jeden z Cieni na placu targowym. Je�li kogo� na nie sta�, nie ma przeszk�d by si� zaopatrzy�. 
};

//========================================
//-----------------> HELLO2
//========================================

INSTANCE DIA_Damarok_HELLO2 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 2;
   condition    = DIA_Damarok_HELLO2_Condition;
   information  = DIA_Damarok_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo�e mog� ci w czym� pom�c?";
};

FUNC INT DIA_Damarok_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Damarok_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HELLO2_15_01"); //Mo�e mog� ci w czym� pom�c?
    AI_Output (self, other ,"DIA_Damarok_HELLO2_03_02"); //Pracuj� teraz nad do�� intryguj�cym eksperymentem. Odkry�em, �e ��d�a krwiopijc�w mo�na wykorzystywa� w innych celach, ni� jako trofeum my�liwskie.
    AI_Output (self, other ,"DIA_Damarok_HELLO2_03_03"); //Znajduj�ca si� w nich wydzielina dzia�a jak mikstura lecznicza. Niestety, efekt ten jest ograniczony, gdy� organizm ludzki z czasem przestaje na� reagowa�.
	AI_Output (other, self ,"DIA_Damarok_HELLO2_15_04"); //S�dzi�em, �e w ��d�ach raczej znajduje si� trucizna.
	AI_Output (self, other ,"DIA_Damarok_HELLO2_03_05"); //I nie mylisz si�. Jednak na stole alchemicznym mo�na �atwo rozdzieli� te substancje. 
	AI_Output (self, other ,"DIA_Damarok_HELLO2_03_06"); //Przykro mi, pomoc przy takim eksperymencie mog� przyj�� wy��cznie od innego Maga Ognia. 
};

//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Damarok_HELLO3 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 3;
   condition    = DIA_Damarok_HELLO3_Condition;
   information  = DIA_Damarok_HELLO3_Info;
   permanent	= FALSE;
   description	= "Corristo przyj�� mnie do Kr�gu Ognia. Mog� ci teraz pom�c?";
};

FUNC INT DIA_Damarok_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Damarok_HELLO2)) && (Npc_GetTrueGuild(other) == GIL_KDF)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_01"); //Corristo przyj�� mnie do Kr�gu Ognia. Mog� ci teraz pom�c?
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_02"); //Oczywi�cie, bracie. Wci�� pracuj� nad leczniczymi w�a�ciwo�ciami wydzieliny z ��de� krwiopijc�w.
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_03"); //Niestety, brakuje mi ��de� do przeprowadzenia ostatecznych test�w, a nie mog� poprosi� o pomoc innych Mag�w. Ka�dy ma swoje zaj�cia. Zgadzasz si�?
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_04"); //Oczywi�cie, ile ��de� potrzebujesz? 
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_05"); //Przynajmniej 25. Wiem, �e to du�o, jednak moje odkrycie mo�e by� prze�omowe.
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_06"); //Rozejrz� si� za nimi. Wiesz mo�e, gdzie znajd� wi�ksz� ilo�� tych stworze�?
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_07"); //Krwiopijcy uwielbiaj� wilgotne powietrze oraz zaduch. Najlepiej rozejrzyj si� na bagnach w pobli�u Obozu Bractwa. 
	AI_Output (self, other ,"DIA_Damarok_HELLO3_03_08"); //Przejd� si� tak�e wzd�u� rzeki odchodz�cej z wodospadu w Nowym Obozie. Po drodze powiniene� spotka� ich ca�e mn�stwo.
    MIS_BloodflyStings = LOG_RUNNING;

    Log_CreateTopic          (CH2_BloodflyStings, LOG_MISSION);
    Log_SetTopicStatus       (CH2_BloodflyStings, LOG_RUNNING);
    B_LogEntry               (CH2_BloodflyStings,"Damarok kaza� mi przynie�� 25 ��de� krwiopijc�w. Narz�dy s� mu potrzebne do bada�.");
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Damarok_HELLO4 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 4;
   condition    = DIA_Damarok_HELLO4_Condition;
   information  = DIA_Damarok_HELLO4_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie nauczy� jak pozyskiwa� ��d�a krwiopijc�w?";
};

FUNC INT DIA_Damarok_HELLO4_Condition()
{
    if (MIS_BloodflyStings == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HELLO4_15_01"); //Mo�esz mnie nauczy�, jak pozyskiwa� ��d�a krwiopijc�w?
    AI_Output (self, other ,"DIA_Damarok_HELLO4_03_02"); //Przykro mi, sam nigdy na nie polowa�em. Sk�adniki dostarczali mi my�liwi i ludzie z Nowego Obozu. 
	AI_Output (self, other ,"DIA_Damarok_HELLO4_03_03"); //Nasz kurier, kt�rego wysy�ali�my z listami do Saturasa, jednak opowiedzia� mi o cz�owieku imieniem Wilk.
    AI_Output (self, other ,"DIA_Damarok_HELLO4_03_04"); //Ma on na stanie ksi�g� pod tytu�em "Krwiopijcy". My�l�, �e handlarze w Bractwie r�wnie� powinni dysponowa� jednym egzemplarzem. 
    AI_Output (other, self ,"DIA_Damarok_HELLO4_15_05"); //W takim razie ruszam w dalsz� drog�. 
    B_LogEntry          (CH2_BloodflyStings,"W pewnej ksi�dze opisany jest spos�b pozyskiwania ��de� krwiopijc�w. By� mo�e Wilk lub kto� z Sekty b�dzie w jej posiadaniu.");
};

//========================================
//-----------------> HELLO5
//========================================

INSTANCE DIA_Damarok_HELLO5 (C_INFO)
{
   npc          = KDF_401_Damarok;
   nr           = 5;
   condition    = DIA_Damarok_HELLO5_Condition;
   information  = DIA_Damarok_HELLO5_Info;
   permanent	= FALSE;
   description	= "Przynios�em 25 ��de� krwiopijc�w.";
};

FUNC INT DIA_Damarok_HELLO5_Condition()
{
    if (MIS_BloodflyStings == LOG_RUNNING)
    && (Npc_HasItems (other, ItAt_Bloodfly_02) >=25)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Damarok_HELLO5_Info()
{
    AI_Output (other, self ,"DIA_Damarok_HELLO5_15_01"); //Przynios�em 25 ��de� krwiopijc�w.
    AI_Output (self, other ,"DIA_Damarok_HELLO5_03_02"); //Doskonale, doskonale. W ko�cu zako�cz� m�j eksperyment. Daj mi je szybko. Oczywi�cie nie pozwol� odej�� ci st�d z pustymi r�kami. 
   AI_Output (self, other ,"DIA_Damarok_HELLO5_03_03"); //We� prosz� ten zw�j z zakl�ciem i niech Innos roz�wietla twoj� �cie�k�. 
    B_LogEntry                     (CH2_BloodflyStings,"Zabi�em 25 krwiopijc�w i przekaza�em ich ��d�a Damarokowi.");
    Log_SetTopicStatus       (CH2_BloodflyStings, LOG_SUCCESS);
    MIS_BloodflyStings = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItArScrollFireRain, 1);
    B_GiveInvItems (self, other, ItArScrollFireRain, 1);
	B_GiveInvItems (other, self, ItAt_Bloodfly_02, 25);
    AI_StopProcessInfos	(self);
};