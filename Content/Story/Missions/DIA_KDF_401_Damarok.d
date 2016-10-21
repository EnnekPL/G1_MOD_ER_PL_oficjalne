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
	AI_Output (self, other,"KDF_401_Damarok_WELCOME_Info_14_01"); //Niech Ogieñ rozœwietla twe ¿ycie!
	
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
	AI_Output (self, other,"KDF_401_Damarok_HEAL_Info_14_01"); //Gdybyœ zosta³ ranny, uzdrowiê ciê.
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
	description		= "Jestem ranny. Mo¿esz mi pomóc?"; 
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
	AI_Output (other, self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //Jestem ranny. Mo¿esz mi pomóc?
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
   description	= "Podobno jesteœ w stanie uwarzyæ eliksir, który ca³kowicie wyleczy cielesne rany.";
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
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_01"); //Podobno jesteœ w stanie uwarzyæ eliksir, który ca³kowicie wyleczy cielesne rany.
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_02"); //To prawda, jednak dlaczego mia³bym ci pomagaæ, skazañcze?
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_03"); //Przysy³a mnie Jim.
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_04"); //Ach tak, Jim. Ju¿ z nim rozmawia³em. Wywar, który chcesz otrzymaæ jest znacznie bardziej skomplikowany ni¿ inne eliksiry lecznicze. 
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_05"); //Do jego stworzenia potrzebna jest niesamowita precyzja, a przede wszystkim magia. Niestety, nie jestem w posiadaniu najbardziej istotnego sk³adnika - magicznej wody.
	AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_06"); //Gdzie j¹ mogê znaleŸæ?
    AI_Output (self, other ,"DIA_Damarok_HEAL_WARRIOR_03_07"); //Nie wiem, prawdopodobnie w miejscach oddzia³ywania magii.
    AI_Output (other, self ,"DIA_Damarok_HEAL_WARRIOR_15_08"); //Dostarczê ci ten sk³adnik.
    B_LogEntry                     (CH1_RannyWojownik,"Damarok sporz¹dzi miksturê, jeœli przyniosê mu najwa¿niejszy sk³adnik - magiczn¹ wodê. Powinienem szukaæ w miejscach, na które ma wp³yw magia.");

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
   description	= "Znalaz³em magiczn¹ wodê.";
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
    AI_Output (other, self ,"DIA_Damarok_FOUND_WATER_15_01"); //Znalaz³em magiczn¹ wodê.
    AI_Output (self, other ,"DIA_Damarok_FOUND_WATER_03_02"); //Œwietnie, zaraz przyrz¹dzê wywar. Poczekaj tu na mnie. Zaraz wrócê.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
};
//powrót 
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
    AI_Output (other, self ,"DIA_Damarok_FOUND_WATER2_15_04"); //Dziêki.
    B_LogEntry                     (CH1_RannyWojownik,"Damarok przyrz¹dzi³ lekarstwo. Powinienem jak najszybciej udaæ siê do Gerarda.");
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
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_02"); //No dobrze. Nauczê ciê warzyæ proste mikstury i alkohole, oraz przygotowywaæ tytoñ.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_03"); //To wcale nie jest takie trudne.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_04"); //Przede wszystkim potrzebujesz przepisu.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_05"); //Szczególnie dla trudniejszych mikstur.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_06"); //Podstawowe mo¿esz próbowaæ uwarzyæ sam.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_07"); //Kieruj siê zdrowym rozs¹dkiem i b¹dŸ spokojny.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_08"); //Ostro¿nie dawkuj sk³adniki. 
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);
		PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 150);
		hero.lp = hero.lp - 10;
		DIA_DAMAROK_KnowsAlchemy2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_03_09"); //Nie mogê ciê tego nauczyæ.
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
    AI_Output (other, self ,"DIA_DAMAROK_KnowsAlchemy2_L2_15_01"); //Naucz mnie z³o¿onej alchemii.
    if  (hero.lp >= 20) && (Npc_HasItems (hero, ItMiNugget)>=360)
    {
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_02"); //Aby przyrz¹dziæ trudniejsze mikstury, bêdziesz potrzebowa³ przepisu.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_03"); //Nigdy nie próbuj sam wytwarzaæ silnych mikstur. Wielu alchemików przyp³aci³o to ¿yciem.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_04"); //Wa¿ne s¹ tutaj sk³adniki. To, z czym bêdziesz mia³ do czynienia, to nie byle ziele - to swoiste pok³ady magicznej energii drzemi¹cej w liœciach i ³odygach.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_05"); //Bogowie obdarzyli nas umiejêtnoœci¹ syntezy tej energii.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_06"); //Gotowe mikstury bêdziesz móg³ ulepszyæ.
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_07"); //Podstawowym czynnikiem wzmacniaj¹cym jest czysty alkohol. 
        AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_08"); //To tyle. B¹dŸ ostro¿ny.
		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 2);
		PrintScreen	("Postêp w umiejêtnoœci: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_GiveInvItems (other, self, ItMiNugget, 360);
		hero.lp = hero.lp - 20;
		DIA_DAMAROK_KnowsAlchemy2_l2.permanent = false;
    }
    else
    {
    AI_Output (self, other ,"DIA_DAMAROK_KnowsAlchemy2_l2_03_09"); //Nie mogê ciê tego nauczyæ.
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
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_02"); //Innos z tob¹, synu. Co ciê do mnie sprowadza?
    AI_Output (other, self ,"DIA_Damarok_HELLO1_15_03"); //Jestem po prostu ciekaw, czym siê zajmujesz. 
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_04"); //Jestem alchemikiem, jednym z najlepszych w ca³ej Kolonii. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_05"); //Dawniej, gdy nie by³o jeszcze Bariery, wspiera³em moimi miksturami grupy wydobywcze i królewskich stra¿ników.
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_06"); //Jednak te czasy minê³y. Teraz nie dbamy ju¿ o ¿ycie górników. Jeœli któryœ z nich zemrze w kopalni, jest zastêpowany kimœ innym. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_07"); //Od kiedy skazañcy przejêli kontrolê nad Koloni¹, ka¿dy musi sam o siebie zadbaæ. 
	AI_Output (self, other ,"DIA_Damarok_HELLO1_03_08"); //Zaj¹³em siê wiêc zaopatrywaniem w mikstury pozosta³ych Magów oraz Magnatów. 
    AI_Output (self, other ,"DIA_Damarok_HELLO1_03_09"); //Moje wyroby sprzedaje równie¿ jeden z Cieni na placu targowym. Jeœli kogoœ na nie staæ, nie ma przeszkód by siê zaopatrzy³. 
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
   description	= "Mo¿e mogê ci w czymœ pomóc?";
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
    AI_Output (other, self ,"DIA_Damarok_HELLO2_15_01"); //Mo¿e mogê ci w czymœ pomóc?
    AI_Output (self, other ,"DIA_Damarok_HELLO2_03_02"); //Pracujê teraz nad doœæ intryguj¹cym eksperymentem. Odkry³em, ¿e ¿¹d³a krwiopijców mo¿na wykorzystywaæ w innych celach, ni¿ jako trofeum myœliwskie.
    AI_Output (self, other ,"DIA_Damarok_HELLO2_03_03"); //Znajduj¹ca siê w nich wydzielina dzia³a jak mikstura lecznicza. Niestety, efekt ten jest ograniczony, gdy¿ organizm ludzki z czasem przestaje nañ reagowaæ.
	AI_Output (other, self ,"DIA_Damarok_HELLO2_15_04"); //S¹dzi³em, ¿e w ¿¹d³ach raczej znajduje siê trucizna.
	AI_Output (self, other ,"DIA_Damarok_HELLO2_03_05"); //I nie mylisz siê. Jednak na stole alchemicznym mo¿na ³atwo rozdzieliæ te substancje. 
	AI_Output (self, other ,"DIA_Damarok_HELLO2_03_06"); //Przykro mi, pomoc przy takim eksperymencie mogê przyj¹æ wy³¹cznie od innego Maga Ognia. 
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
   description	= "Corristo przyj¹³ mnie do Krêgu Ognia. Mogê ci teraz pomóc?";
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
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_01"); //Corristo przyj¹³ mnie do Krêgu Ognia. Mogê ci teraz pomóc?
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_02"); //Oczywiœcie, bracie. Wci¹¿ pracujê nad leczniczymi w³aœciwoœciami wydzieliny z ¿¹de³ krwiopijców.
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_03"); //Niestety, brakuje mi ¿¹de³ do przeprowadzenia ostatecznych testów, a nie mogê poprosiæ o pomoc innych Magów. Ka¿dy ma swoje zajêcia. Zgadzasz siê?
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_04"); //Oczywiœcie, ile ¿¹de³ potrzebujesz? 
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_05"); //Przynajmniej 25. Wiem, ¿e to du¿o, jednak moje odkrycie mo¿e byæ prze³omowe.
    AI_Output (other, self ,"DIA_Damarok_HELLO3_15_06"); //Rozejrzê siê za nimi. Wiesz mo¿e, gdzie znajdê wiêksz¹ iloœæ tych stworzeñ?
    AI_Output (self, other ,"DIA_Damarok_HELLO3_03_07"); //Krwiopijcy uwielbiaj¹ wilgotne powietrze oraz zaduch. Najlepiej rozejrzyj siê na bagnach w pobli¿u Obozu Bractwa. 
	AI_Output (self, other ,"DIA_Damarok_HELLO3_03_08"); //PrzejdŸ siê tak¿e wzd³u¿ rzeki odchodz¹cej z wodospadu w Nowym Obozie. Po drodze powinieneœ spotkaæ ich ca³e mnóstwo.
    MIS_BloodflyStings = LOG_RUNNING;

    Log_CreateTopic          (CH2_BloodflyStings, LOG_MISSION);
    Log_SetTopicStatus       (CH2_BloodflyStings, LOG_RUNNING);
    B_LogEntry               (CH2_BloodflyStings,"Damarok kaza³ mi przynieœæ 25 ¿¹de³ krwiopijców. Narz¹dy s¹ mu potrzebne do badañ.");
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
   description	= "Mo¿esz mnie nauczyæ jak pozyskiwaæ ¿¹d³a krwiopijców?";
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
    AI_Output (other, self ,"DIA_Damarok_HELLO4_15_01"); //Mo¿esz mnie nauczyæ, jak pozyskiwaæ ¿¹d³a krwiopijców?
    AI_Output (self, other ,"DIA_Damarok_HELLO4_03_02"); //Przykro mi, sam nigdy na nie polowa³em. Sk³adniki dostarczali mi myœliwi i ludzie z Nowego Obozu. 
	AI_Output (self, other ,"DIA_Damarok_HELLO4_03_03"); //Nasz kurier, którego wysy³aliœmy z listami do Saturasa, jednak opowiedzia³ mi o cz³owieku imieniem Wilk.
    AI_Output (self, other ,"DIA_Damarok_HELLO4_03_04"); //Ma on na stanie ksiêgê pod tytu³em "Krwiopijcy". Myœlê, ¿e handlarze w Bractwie równie¿ powinni dysponowaæ jednym egzemplarzem. 
    AI_Output (other, self ,"DIA_Damarok_HELLO4_15_05"); //W takim razie ruszam w dalsz¹ drogê. 
    B_LogEntry          (CH2_BloodflyStings,"W pewnej ksiêdze opisany jest sposób pozyskiwania ¿¹de³ krwiopijców. Byæ mo¿e Wilk lub ktoœ z Sekty bêdzie w jej posiadaniu.");
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
   description	= "Przynios³em 25 ¿¹de³ krwiopijców.";
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
    AI_Output (other, self ,"DIA_Damarok_HELLO5_15_01"); //Przynios³em 25 ¿¹de³ krwiopijców.
    AI_Output (self, other ,"DIA_Damarok_HELLO5_03_02"); //Doskonale, doskonale. W koñcu zakoñczê mój eksperyment. Daj mi je szybko. Oczywiœcie nie pozwolê odejœæ ci st¹d z pustymi rêkami. 
   AI_Output (self, other ,"DIA_Damarok_HELLO5_03_03"); //WeŸ proszê ten zwój z zaklêciem i niech Innos rozœwietla twoj¹ œcie¿kê. 
    B_LogEntry                     (CH2_BloodflyStings,"Zabi³em 25 krwiopijców i przekaza³em ich ¿¹d³a Damarokowi.");
    Log_SetTopicStatus       (CH2_BloodflyStings, LOG_SUCCESS);
    MIS_BloodflyStings = LOG_SUCCESS;

    B_GiveXP (200);
    CreateInvItems (self, ItArScrollFireRain, 1);
    B_GiveInvItems (self, other, ItArScrollFireRain, 1);
	B_GiveInvItems (other, self, ItAt_Bloodfly_02, 25);
    AI_StopProcessInfos	(self);
};