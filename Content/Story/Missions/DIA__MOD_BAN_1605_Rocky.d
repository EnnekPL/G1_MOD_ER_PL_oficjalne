//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Rocky_EXIT(C_INFO)
{
	npc             = BAN_1605_Rocky;
	nr              = 999;
	condition	= DIA_Rocky_EXIT_Condition;
	information	= DIA_Rocky_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Rocky_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rocky_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> EqDoWalki
//========================================

INSTANCE DIA_Rocky_EqDoWalki (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_EqDoWalki_Condition;
   information  = DIA_Rocky_EqDoWalki_Info;
   permanent	= FALSE;
   description	= "Potrzebujemy ekwipunku.";
};

FUNC INT DIA_Rocky_EqDoWalki_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_nextWork22))
	&& (kapitel == 10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_EqDoWalki_Info()
{
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_01"); //Potrzebujemy ekwipunku.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_02"); //S³ysza³em ju¿ o waszych ambitnych planach. Jak zwykle muszê zostaæ w Obozie.
    AI_Output (other, self ,"DIA_Rocky_EqDoWalki_15_03"); //Daj mi ten ekwipunek.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_04"); //Nie tak prêdko. Myœlisz, ¿e w godzinê naprawiê 15 skórzanych pancerzy?!
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_05"); //Potrzebujê materia³ów.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_06"); //Przynieœ mi 30 k³ów i 10 wilczych skór.
    AI_Output (self, other ,"DIA_Rocky_EqDoWalki_03_07"); //Tylko siê poœpiesz z tym wszystkim.
	
    MIS_materials4Rocky = LOG_RUNNING;

    Log_CreateTopic            (CH1_materials4Rocky, LOG_MISSION);
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_RUNNING);
    B_LogEntry                     (CH1_materials4Rocky,"Aby Rocky móg³ naprawiæ pancerze, potrzebuje 30 k³ów oraz 10 wilczych skór.");
};
//========================================
//-----------------> Towary
//========================================

INSTANCE DIA_Rocky_Towary (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Towary_Condition;
   information  = DIA_Rocky_Towary_Info;
   permanent	= FALSE;
   description	= "Mam to, o co prosi³eœ.";
};

FUNC INT DIA_Rocky_Towary_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_EqDoWalki))
    && (Npc_HasItems (other, ItAt_Teeth_01) >=30)
    && (Npc_HasItems (other, ItAt_Wolf_01) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_Towary_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Towary_15_01"); //Mam to, o co prosi³eœ.
    AI_Output (self, other ,"DIA_Rocky_Towary_03_02"); //Œwietnie. Daj mi to.
    B_LogEntry                     (CH1_materials4Rocky,"Przynios³em Rockiemu materia³y potrzebne do naprawienia ekwipunku.");
    Log_SetTopicStatus       (CH1_materials4Rocky, LOG_SUCCESS);
    MIS_materials4Rocky = LOG_SUCCESS;
    B_GiveInvItems (other, self, ItAt_Wolf_01, 10);
    B_GiveInvItems (other, self, ItAt_Teeth_01, 30);


    B_GiveXP (300);
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 1
// Pogaduchy
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> POGADUCHY
//========================================

INSTANCE DIA_Rocky_POGADUCHY (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_POGADUCHY_Condition;
   information  = DIA_Rocky_POGADUCHY_Info;
   permanent	= FALSE;
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Rocky_POGADUCHY_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rocky_POGADUCHY_Info()
{
    AI_Output (other, self ,"DIA_Rocky_POGADUCHY_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_02"); //Nazywam siê Rocky. By³em marynarzem, ale zszed³em na z³¹ drogê.
    AI_Output (self, other ,"DIA_Rocky_POGADUCHY_03_03"); //Tak czy inaczej, nie powinno ciê to obchodziæ.
};

//========================================
//-----------------> PAST
//========================================

INSTANCE DIA_Rocky_PAST (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_PAST_Condition;
   information  = DIA_Rocky_PAST_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi o swojej przesz³oœci.";
};

FUNC INT DIA_Rocky_PAST_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    && (Npc_KnowsInfo (hero, DIA_Quentin_DOOBOZU))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_PAST_Info()
{
    AI_Output (other, self ,"DIA_Rocky_PAST_15_01"); //Opowiedz mi o swojej przesz³oœci.
    AI_Output (self, other ,"DIA_Rocky_PAST_03_02"); //Có¿... Niegdyœ by³em marynarzem.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_03"); //Dlaczego trafi³eœ do Kolonii?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_04"); //Zacz¹³em zadawaæ siê z piratami. W koñcu zgarnêli mnie paladyni.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_05"); //Dlaczego w takim razie zszed³eœ na l¹d?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_06"); //¯ycie na morzu by³o ciê¿kie. Chcia³em siê wyrwaæ ze statku. Potrzebowa³em gotówki...
    AI_Output (self, other ,"DIA_Rocky_PAST_03_07"); //Kradzie¿ by³a jedynym sposobem, by prze¿yæ.
    AI_Output (other, self ,"DIA_Rocky_PAST_15_08"); //A wiêc znasz siê na tym?
    AI_Output (self, other ,"DIA_Rocky_PAST_03_09"); //Mo¿e.
};

//========================================
//-----------------> CHATA
//========================================

INSTANCE DIA_Rocky_CHATA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_CHATA_Condition;
   information  = DIA_Rocky_CHATA_Info;
   permanent	= FALSE;
   description	= "Dlaczego dzielisz chatê z Quentinem?";
};

FUNC INT DIA_Rocky_CHATA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_CHATA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_CHATA_15_01"); //Dlaczego dzielisz chatê z Quentinem?
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_02"); //To proste - jesteœmy przyjació³mi. Pomog³em mu nie raz. Poza tym w Obozie jest zbyt ma³o miejsca na fanaberie.
    AI_Output (self, other ,"DIA_Rocky_CHATA_03_03"); //Quentin to rozumie, dlatego mieszkam u niego.
};

//========================================
//-----------------> ADVENTURE
//========================================

INSTANCE DIA_Rocky_ADVENTURE (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_ADVENTURE_Condition;
   information  = DIA_Rocky_ADVENTURE_Info;
   permanent	= FALSE;
   description	= "Opowiedz mi jedn¹ z waszych przygód.";
};

FUNC INT DIA_Rocky_ADVENTURE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_CHATA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_ADVENTURE_Info()
{
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_01"); //Opowiedz mi jedn¹ z waszych przygód. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_02"); //Chyba najbardziej utkwi³a mi w pamiêci historia odnalezienia doliny. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_03"); //Pewnej wrzeœniowej nocy postanowiliœmy uciec z Nowego Obozu. Wziêliœmy ze sob¹ kilku zaufanych ludzi i po prostu daliœmy nogê.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_04"); //Po drodze spotkaliœmy Jensa. By³ wtedy zwyczajnym ³achmyt¹. £azi³ noc¹ po lesie. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_05"); //Zgarnêliœmy go. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_06"); //Quentin zaproponowa³ iœæ w góry. Pozbyliœmy siê zêbaczy i poszliœmy dalej. W koñcu naszym oczom ukaza³a siê ta dolina.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_07"); //Usiedliœmy na œrodku i przysiêgliœmy sobie, ¿e bêdziemy zawsze trzymaæ siê razem, choæby nie wiem co!
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_08"); //Nikt nigdy nie zostawi swoich kumpli. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_09"); //Wtedy jeden z naszych opar³ siê o wielk¹ ska³ê. Rozleg³ siê g³oœny ryk, a ziemia zadr¿a³a.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_10"); //To by³ troll. Zacz¹³ st¹paæ w naszym kierunku. Nie wiedzieliœmy, co zrobiæ. Razem z Quentinem chwyciliœmy za broñ i rzuciliœmy siê na to monstrum.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_11"); //Reszta strzela³a z ³uków. Wprawdzie nic to nie da³o, ale przynajmniej nie zwiali jak Jens.
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_12"); //Jens uciek³?
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_13"); //Tak. Sp³ywa³ gdzie pieprz roœnie. 
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_14"); //Z³ama³ przysiêgê... zaraz po jej z³o¿eniu.
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_15"); //A jednak jest w Obozie.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_16"); //Za karê kazaliœmy mu polowaæ na wilki i przygotowaæ skóry na pancerze dla wszystkich Bandytów.
    AI_Output (self, other ,"DIA_Rocky_ADVENTURE_03_17"); //Tak siê w to wczu³, ¿e zosta³ mistrzem w swoim fachu. 
    AI_Output (other, self ,"DIA_Rocky_ADVENTURE_15_18"); //Ha ha. To ci dopiero historia.
};

//========================================
//-----------------> BUDOWA_OBOZU
//========================================

INSTANCE DIA_Rocky_BUDOWA_OBOZU (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_BUDOWA_OBOZU_Condition;
   information  = DIA_Rocky_BUDOWA_OBOZU_Info;
   permanent	= FALSE;
   description	= "A jak wygl¹da³a sprawa z budow¹ Obozu?";
};

FUNC INT DIA_Rocky_BUDOWA_OBOZU_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_ADVENTURE))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BUDOWA_OBOZU_Info()
{
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_01"); //A jak wygl¹da³a sprawa z budow¹ Obozu?
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_02"); //Có¿... Mieliœmy bardzo ma³o zasobów koniecznych do budowy wystarczaj¹co du¿ej iloœci chat.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_03"); //Ju¿ teraz jest ma³o miejsca.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_04"); //Sk¹d braki w surowcach? Przecie¿ drzew w Kolonii pod dostatkiem.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_05"); //No w³aœnie! Quentin zabroni³ nam karczowania lasu. Powiedzia³, ¿e wtedy ujawnimy swoj¹ obecnoœæ.
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_06"); //Musieliœmy siê pos³u¿yæ tym, co by³o w dolinie. £ó¿ka zrobiliœmy z drewnianych desek i suchej trawy. Chaty z drewna, które by³o pod rêk¹. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_07"); //Reszta sprzêtów "przypadkiem" wpad³a w nasze rêce.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_08"); //Ukraœæ kowad³o - to dopiero wyczyn! 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_09"); //Ha ha. Racja. O tym ju¿ pogadaj z Punem. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_10"); //Dziêki m³ody.
    AI_Output (other, self ,"DIA_Rocky_BUDOWA_OBOZU_15_11"); //Za co?
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_12"); //Sporo sobie przypomnia³em podczas naszych rozmów. Dobre czasy. 
    AI_Output (self, other ,"DIA_Rocky_BUDOWA_OBOZU_03_13"); //No, dosyæ tych wspominek. Zmiataj do jakiejœ roboty.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GLUPIEC
//========================================

INSTANCE DIA_Rocky_GLUPIEC (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GLUPIEC_Condition;
   information  = DIA_Rocky_GLUPIEC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_GLUPIEC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Quentin_WLADZA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GLUPIEC_Info()
{
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_01"); //Do reszty zg³upia³eœ?
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_02"); //Tak siê nie gada z Quentinem. IdŸ do niego dopiero, gdy masz jakiœ wa¿ny powód. 
    AI_Output (self, other ,"DIA_Rocky_GLUPIEC_03_03"); //Lubi konkrety, nie lubi obcych. Kapujesz?
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NAUKA
//========================================
var int log_rocky_nau;
INSTANCE DIA_Rocky_NAUKA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 3;
   condition    = DIA_Rocky_NAUKA_Condition;
   information  = DIA_Rocky_NAUKA_Info;
   permanent	= 1;
   description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_Rocky_NAUKA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_PAST))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_NAUKA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_NAUKA_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
    AI_Output (self, other ,"DIA_Rocky_NAUKA_03_02"); //Poka¿ê ci, jak zwiêkszyæ si³ê i nauczê umiejêtnoœci z³odziejskich.
	if (log_rocky_nau == FALSE)
	{
		Log_CreateTopic (GE_TeacherBAN,LOG_NOTE);
		B_LogEntry		(GE_TeacherBAN,"Rocky mo¿e mi pomóc zwiêkszyæ si³ê oraz nauczyæ mnie umiejêtnoœci z³odziejskich.");
		log_rocky_nau = TRUE;
	};
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_STR1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 1*LPCOST_ATTRIBUTE_STRENGTH);
    Info_ClearChoices		(DIA_Rocky_NAUKA);
	Info_AddChoice		(DIA_Rocky_NAUKA,DIALOG_BACK, DIA_Rocky_NAUKA_BACK);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR5);
	Info_AddChoice		(DIA_Rocky_NAUKA,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),DIA_Rocky_NAUKA_STR1);
};

FUNC VOID DIA_Rocky_NAUKA_BACK()
{
    Info_ClearChoices	(DIA_Rocky_NAUKA);
};

// **************************************************
// 						 Lehrer
// **************************************************

INSTANCE DIA_Rocky_Lehrer (C_INFO)
{
	npc				= BAN_1605_Rocky;
	nr				= 2;
	condition		= DIA_Rocky_Lehrer_Condition;
	information		= DIA_Rocky_Lehrer_Info;
	permanent		= 1;
	description		= "Naucz mnie okradaæ."; 
};

FUNC INT DIA_Rocky_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Rocky_PAST))
	{
		return 1;	
	};
};

FUNC VOID DIA_Rocky_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_15_00"); //Naucz mnie okradaæ.
	AI_Output (self, other,"DIA_Rocky_Lehrer_05_02"); //Czego konkretnie chcia³byœ siê nauczyæ?



	Info_ClearChoices	(DIA_Rocky_Lehrer );
	Info_AddChoice		(DIA_Rocky_Lehrer,DIALOG_BACK																,DIA_Rocky_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,500)		,DIA_Rocky_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,250)		,DIA_Rocky_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,600)		,DIA_Rocky_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,300)		,DIA_Rocky_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Rocky_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,200)			,DIA_Rocky_Lehrer_Schleichen);
	};
};


func void DIA_Rocky_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (Npc_HasItems (hero, itminugget) >=200)
		{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
	};
	B_GiveInvItems (hero, self, itminugget, 200);
		Npc_RemoveInvItems (self, itminugget, 200);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	if (Npc_HasItems (hero, itminugget) >=300)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
	B_GiveInvItems (hero, self, itminugget, 300);
		Npc_RemoveInvItems (self, itminugget, 300);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	if (Npc_HasItems (hero, itminugget) >=600)
		{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Rocky_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
	B_GiveInvItems (hero, self, itminugget, 600);
		Npc_RemoveInvItems (self, itminugget, 600);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func void DIA_Rocky_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (Npc_HasItems (hero, itminugget) >=250)
		{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Rocky_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
		B_GiveInvItems (hero, self, itminugget, 250);
		Npc_RemoveInvItems (self, itminugget, 250);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Rocky_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Rocky_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Rocky_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	if (Npc_HasItems (hero, itminugget) >=500)
	{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Rocky_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
		B_GiveInvItems (hero, self, itminugget, 500);
		Npc_RemoveInvItems (self, itminugget, 500);
		}
		else
		{
		AI_Output (self, other,"DIA_Rocky_Lehrer_NOORE"); //Nie ma nic za darmo!
		};
};

func VOID DIA_Rocky_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Rocky_Lehrer );
};
///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Zadania
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> RAYAN
//========================================

INSTANCE DIA_Rocky_RAYAN (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_RAYAN_Condition;
   information  = DIA_Rocky_RAYAN_Info;
   permanent	= FALSE;
   description	= "Co wiesz o œmierci Rayana?";
};

FUNC INT DIA_Rocky_RAYAN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Jens_TalkWithSmith))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_RAYAN_Info()
{
    AI_Output (other, self ,"DIA_Rocky_RAYAN_15_01"); //Co wiesz o œmierci Rayana?
    AI_Output (self, other ,"DIA_Rocky_RAYAN_03_02"); //Poza tym, ¿e to mi Quentin kaza³ wykopaæ grób to niezbyt wiele. Okolicznoœci chyba nie zosta³y wyjaœnione. 
	AI_Output (self, other ,"DIA_Rocky_RAYAN_03_03"); //Moim zdaniem napad³a go grupa goblinów. To by by³o logiczne. Gobliny przecie¿ nie ¿rej¹ ludzi, wiêc obrabowa³y cia³o i je zostawi³y. 
};

///////////////////////////////////////////////////////////////////////////////////////////
// Quentin
// Rozdzia³ 1
// Zadanie z napadem
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> QUEST1
//========================================

INSTANCE DIA_Rocky_QUEST1 (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 4;
   condition    = DIA_Rocky_QUEST1_Condition;
   information  = DIA_Rocky_QUEST1_Info;
   permanent	= FALSE;
   description	= "Podobno szykuje siê napad...";
};

FUNC INT DIA_Rocky_QUEST1_Condition()
{
    if (MIS_Rozpierdol2 == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_QUEST1_Info()
{
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_01"); //Podobno szykuje siê napad...
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_02"); //Pora siê przyzwyczaiæ. To jednak bêdzie coœ ma³ego, bardziej dyskretnego. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_03"); //Dobra, do rzeczy! Mamy zaatakowaæ transport towarów do Starej Kopalni. Ian od czasu do czasu wysy³a listê rzeczy potrzebnych w kopalni. 
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_04"); //Wszystko o co poprosi trafia do kopalni. Najbli¿sza dostawa ma byæ wyj¹tkowo obfita. To szansa dla nas.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_05"); //O której zaczynamy?
    AI_Output (self, other ,"DIA_Rocky_QUEST1_03_06"); //PrzyjdŸ tutaj o dwunastej. Konwój wyrusza kilka minut wczeœniej. Nie bêdziemy musieli czekaæ.
    AI_Output (other, self ,"DIA_Rocky_QUEST1_15_07"); //Dobra. Wkrótce siê pojawiê.
    B_LogEntry                     (CH1_Rozpierdol2,"Mam zjawiæ siê u Rockiego oko³o godziny 12, wtedy te¿ zaczniemy.");
};

//========================================
//-----------------> ROZPIERDUCHA
//========================================

INSTANCE DIA_Rocky_ROZPIERDUCHA (C_INFO)
{
   npc          		= BAN_1605_Rocky;
   nr           		= 5;
   condition    	= DIA_Rocky_ROZPIERDUCHA_Condition;
   information  	= DIA_Rocky_ROZPIERDUCHA_Info;
   permanent	= FALSE;
   description	= "Ju¿ czas.";
};

FUNC INT DIA_Rocky_ROZPIERDUCHA_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_QUEST1))
    && (Wld_IsTime     (12,00,12,30))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_ROZPIERDUCHA_Info()
{
    AI_Output (other, self ,"DIA_Rocky_ROZPIERDUCHA_15_01"); //Ju¿ czas.
    AI_Output (self, other ,"DIA_Rocky_ROZPIERDUCHA_03_02"); //Przygotuj miecz i chodŸ za mn¹.
      self.aivar[AIV_PARTYMEMBER] = TRUE;
      Npc_ExchangeRoutine (self,"atak");
	  Npc_ExchangeRoutine (GRD_5054_Gardist,"las");
	  B_ChangeGuild    (GRD_5054_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5053_Gardist,"las");
	  B_ChangeGuild    (GRD_5053_Gardist,GIL_DMB);
	  Npc_ExchangeRoutine (GRD_5055_Eskorta,"las");
	  B_ChangeGuild    (GRD_5055_Eskorta,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5089_Tragaz,"las");
	  CreateInvItems (VLK_5089_Tragaz, eq_z_napadu3, 1);
	  B_ChangeGuild    (VLK_5089_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5090_Tragaz,"las");
	  CreateInvItems (VLK_5090_Tragaz, eq_z_napadu2, 1);
	   B_ChangeGuild    (VLK_5090_Tragaz,GIL_DMB);
	  Npc_ExchangeRoutine (VLK_5088_Tragaz,"las"); //1.24
	  CreateInvItems (VLK_5088_Tragaz, eq_z_napadu1, 1); //poprawiony bug 1.4.5.
	  B_ChangeGuild    (VLK_5088_Tragaz,GIL_DMB);
	//Wld_InsertNpc				(GRD_5054_Gardist,"OC1");
	//Wld_InsertNpc				(GRD_5053_Gardist,"OC1");
	//Wld_InsertNpc				(GRD_5055_Eskorta,"OC1"); //resp tragarzy trzeba dopisaæ
      AI_StopProcessInfos	(self);
};

//========================================
//-----------------> DOTARLI
//========================================

INSTANCE DIA_Rocky_DOTARLI (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 6;
   condition    = DIA_Rocky_DOTARLI_Condition;
   information  = DIA_Rocky_DOTARLI_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_DOTARLI_Condition()
{
    if (Npc_GetDistToWP (self, "ATAK009") < 1000)
    && (Npc_KnowsInfo (hero, DIA_Rocky_ROZPIERDUCHA))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_DOTARLI_Info()
{
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_01"); //Jesteœmy. Zobacz, stoj¹ tam. Pewnie boj¹ siê wilków.
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_02"); //Przypuszczam, ¿e siê naradzaj¹.
    AI_Output (other, self ,"DIA_Rocky_DOTARLI_15_03"); //Co mamy teraz robiæ?
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_04"); //Poczekaj, a¿ wydam rozkaz.
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_15_05"); //Trzy, dwa, jeden...
    AI_Output (self, other ,"DIA_Rocky_DOTARLI_03_06"); //ATAKOWAÆ!!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"atak2");
	/*GRD_5054_Gardist.guild = GIL_MOLERAT;
	GRD_5053_Gardist.guild = GIL_MOLERAT;
	GRD_5055_Eskorta.guild = GIL_MOLERAT;
	VLK_5089_Tragaz.guild = GIL_MOLERAT;
	VLK_5088_Tragaz.guild = GIL_MOLERAT;
	VLK_5090_Tragaz.guild = GIL_MOLERAT;
		Npc_SetTarget(GRD_5054_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5054_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5053_Gardist,BAN_1605_Rocky);
		AI_StartState(GRD_5053_Gardist,ZS_ATTACK,1,"");
		Npc_SetTarget(GRD_5055_Eskorta,BAN_1605_Rocky);
		AI_StartState(GRD_5055_Eskorta,ZS_ATTACK,1,"");
    Npc_SetTempAttitude	(GRD_5054_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5053_Gardist,	ATT_HOSTILE);
	Npc_SetTempAttitude	(GRD_5055_Eskorta,	ATT_HOSTILE);
    Npc_SetTempAttitude	(VLK_5089_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5090_Tragaz,	ATT_HOSTILE);
	Npc_SetTempAttitude	(VLK_5088_Tragaz,	ATT_HOSTILE);
	*/
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WIN_O
//========================================

INSTANCE DIA_Rocky_WIN_O (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 7;
   condition    = DIA_Rocky_WIN_O_Condition;
   information  = DIA_Rocky_WIN_O_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WIN_O_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_DOTARLI))
    && (Npc_IsDead(GRD_5055_Eskorta))
    && (Npc_IsDead(GRD_5054_Gardist))
    && (Npc_IsDead(GRD_5053_Gardist))
	&& (Npc_IsDead(VLK_5089_Tragaz))
    && (Npc_IsDead(VLK_5090_Tragaz))
    && (Npc_IsDead(VLK_5088_Tragaz))
//dopisaæ tragarzy      //**** fix 6 sierpieñ 2012
{
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WIN_O_Info()
{
    AI_Output (self, other ,"DIA_Rocky_WIN_O_03_01"); //Œwietna robota, ch³opcze. Zabierz wszystko i wracamy.

    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
    B_LogEntry                     (CH1_Rozpierdol2,"Uda³o nam siê. Rozgromiliœmy Stra¿ników. Pora wracaæ do Quentina.");

    B_GiveXP (XP_AtakNaKonwoj);
};

//========================================
//-----------------> GivEq
//========================================

INSTANCE DIA_Rocky_GivEq (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GivEq_Condition;
   information  = DIA_Rocky_GivEq_Info;
   permanent	= FALSE;
   description	= "Rozdaæ ekwipunek Bandytom?";
};

FUNC INT DIA_Rocky_GivEq_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_Towary))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GivEq_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GivEq_15_01"); //Rozdaæ ekwipunek Bandytom?
    AI_Output (self, other ,"DIA_Rocky_GivEq_03_02"); //Nie, sam to zrobiê. IdŸ do Quentina i powiedz, ¿e wszystko ju¿ zrobione.
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 4
// Odbijanie obozu
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> WtfRozwalaWobozie
//========================================

INSTANCE DIA_Rocky_WtfRozwalaWobozie (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_WtfRozwalaWobozie_Condition;
   information  = DIA_Rocky_WtfRozwalaWobozie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_WtfRozwalaWobozie_Condition()
{
    if (MIS_GardistsCheckpoints == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_WtfRozwalaWobozie_Info()
{
   // AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_01"); //Co ci siê do cholery sta³o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_01"); //Nawet nie wiesz, jak siê cieszê, ¿e widzê was w jednym kawa³ku. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_02"); //Móg³byœ mi wyjaœniæ ca³¹ tê sprawê?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_03"); //Stra¿nicy znaleŸli Obóz! Ot co siê sta³o!
	AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_04"); //Jak do tego dosz³o?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_05"); //Albo zauwa¿yli was, gdy schodziliœcie z gór, albo ktoœ nas zdradzi³...
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_06"); //Nie ma teraz czasu szukaæ winnych.
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_07"); //Jak du¿o Stra¿ników znajduje siê w Obozie?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_08"); //Ciê¿ko mi powiedzieæ... Musia³em szybko uciekaæ. Nie mia³em czasu na zwiady. Myœlê, ¿e jest tam kilkunastu dobrze wyszkolonych ¿o³nierzy. 
    AI_Output (other, self ,"DIA_Rocky_WtfRozwalaWobozie_15_09"); //Jakiœ plan?
    AI_Output (self, other ,"DIA_Rocky_WtfRozwalaWobozie_03_10"); //Z mojej strony nic... Pogadaj z Quentinem.
	
	MIS_GardistsInBC = LOG_RUNNING;

    Log_CreateTopic          (CH4_GardistsInBC, LOG_MISSION);
    Log_SetTopicStatus       (CH4_GardistsInBC, LOG_RUNNING);
    B_LogEntry               (CH4_GardistsInBC,"Obóz Bandytów zosta³ odnaleziony przez Stra¿ników. Na szczêœcie Rocky'emu uda³o siê w porê uciec i zd¹¿y³ nas ostrzec. Muszê porozmawiaæ z Quentinem o naszych kolejnych krokach.");
};

///////////////////////////////////////////////////////////////////////////////////////////
// Rocky
// Rozdzia³ 4
// Kopalnia
///////////////////////////////////////////////////////////////////////////////////////////

//========================================
//-----------------> GoToMine
//========================================

INSTANCE DIA_Rocky_GoToMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_GoToMine_Condition;
   information  = DIA_Rocky_GoToMine_Info;
   permanent	= FALSE;
   description	= "Idziesz ze mn¹ do kopalni?";
};

FUNC INT DIA_Rocky_GoToMine_Condition()
{
    if (MIS_BanditsInAbadonedMine == LOG_RUNNING) && (Npc_KnowsInfo (hero, DIA_Raeuber_GoL))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_GoToMine_Info()
{
    AI_Output (other, self ,"DIA_Rocky_GoToMine_15_01"); //Idziesz ze mn¹ do kopalni?
    AI_Output (self, other ,"DIA_Rocky_GoToMine_03_02"); //No jasne. Tylko potrzebujê jakiegoœ pancerza.
	AI_Output (self, other ,"DIA_Rocky_GoToMine_03_03"); //Skombinuj mi coœ, to pogadamy.
	//CreateInvItems  (self,BAU_ARMOR_H,1);
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (self,"pomoc");
	//AI_StopProcessInfos	(self);
	MIS_RockyArmor = LOG_RUNNING;

    Log_CreateTopic      (CH4_RockyArmor, LOG_MISSION);
    Log_SetTopicStatus   (CH4_RockyArmor, LOG_RUNNING);
    B_LogEntry       	 (CH4_RockyArmor,"Je¿eli chcê, aby Rocky poszed³ ze mn¹ do kopalni, muszê za³atwiæ mu nowy pancerz.");

};
//========================================
//-----------------> AddArmor
//========================================

INSTANCE DIA_Rocky_AddArmor (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_AddArmor_Condition;
   information  = DIA_Rocky_AddArmor_Info;
   permanent	= 1;
   description	= "Mam dla ciebie pancerz...";
};

FUNC INT DIA_Rocky_AddArmor_Condition()
{
    if (MIS_RockyArmor == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_AddArmor_Info()
{
    AI_Output (other, self ,"DIA_Rocky_AddArmor_15_01"); //Mam dla ciebie pancerz...
    AI_Output (self, other ,"DIA_Rocky_AddArmor_03_02"); //Œwietnie. Co dla mnie masz?

    Info_ClearChoices		(DIA_Rocky_AddArmor);
	Info_AddChoice		(DIA_Rocky_AddArmor, DIALOG_BACK, DIA_Quentin_DOOBOZU_BACK);
	if (Npc_HasItems (other, NON_ARMOR1) >=1)
    {
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: zdobiona zbroja myœliwego", DIA_Quentin_DOOBOZU_MYSLIWY);
	};
	if (Npc_HasItems (other, BAU_ARMOR_H) >=1)
    {	
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: ciê¿ka zbroja Bandyty", DIA_Quentin_DOOBOZU_BANDITOSMID);
	};
	if (Npc_HasItems (other, PodroznikArmor) >=1)
    {		
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: zbroja podró¿nika", DIA_Quentin_PODROZNIK);
	};
	if (Npc_HasItems (other, PiratArmor) >=1)
    {		
    Info_AddChoice		(DIA_Rocky_AddArmor, "ODDAJ: strój pirata", DIA_Quentin_DOOBOZU_PIRAT);
	};

};

FUNC VOID DIA_Quentin_DOOBOZU_BACK ()
{
	Info_ClearChoices		(DIA_Rocky_AddArmor);
};

FUNC VOID DIA_Quentin_DOOBOZU_MYSLIWY()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_MYSLIWY_15_01"); //Oto zdobiona zbroja myœliwego.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_MYSLIWY_03_02"); //Sk¹d masz taki pancerz?
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_MYSLIWY_03_03"); //Œwietna robota.
	B_giveXP (400);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu ozdobn¹ zbrojê myœliwego. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, NON_ARMOR1, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_DOOBOZU_BANDITOSMID()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_BANDITOSMID_15_01"); //Oto moja stara zbroja.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_02"); //Wprawdzie to nic nadzwyczajnego, ale dziêki.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_BANDITOSMID_03_03"); //Œwietna robota.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu moj¹ star¹ zbrojê. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, BAU_ARMOR_H, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_PODROZNIK()
{
    AI_Output (other, self ,"DIA_Quentin_PODROZNIK_15_01"); //Oto zbroja podró¿nika.
    AI_Output (self, other ,"DIA_Quentin_PODROZNIK_03_02"); //Hmm... Ciekawy pancerz.
    AI_Output (self, other ,"DIA_Quentin_PODROZNIK_03_03"); //Podoba mi siê! Dziêki.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu moj¹ star¹ zbrojê. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, PodroznikArmor, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};
FUNC VOID DIA_Quentin_DOOBOZU_PIRAT()
{
    AI_Output (other, self ,"DIA_Quentin_DOOBOZU_PIRAT_15_01"); //Oto strój pirata.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_02"); //Pirata? Wygl¹da fajnie, ale nie jest to raczej prawdziwy pancerz.
    AI_Output (self, other ,"DIA_Quentin_DOOBOZU_PIRAT_03_03"); //Wola³bym coœ mocniejszego, ale skoro nie masz nic innego. Dziêki.
	B_giveXP (300);
	MIS_RockyArmor = LOG_SUCCESS;
    Log_SetTopicStatus       (CH4_RockyArmor, LOG_SUCCESS);
    B_LogEntry       (CH4_RockyArmor,"Da³em Rockiemu strój pirata. Jest gotowy ¿eby wyruszyæ.");
	B_GiveInvItems      (hero, self, PiratArmor, 1);
    Info_ClearChoices		(DIA_Rocky_AddArmor);
	DIA_Rocky_AddArmor.permanent	= 0;
	AI_EquipBestArmor	(self); 
    //AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Follow
//========================================

INSTANCE DIA_Rocky_Follow (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_Follow_Condition;
   information  = DIA_Rocky_Follow_Info;
   permanent	= FALSE;
   description	= "ChodŸ za mn¹.";
};

FUNC INT DIA_Rocky_Follow_Condition()
{
    if (MIS_RockyArmor == LOG_SUCCESS) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_Rocky_Follow_Info()
{
    AI_Output (other, self ,"DIA_Rocky_Follow_15_01"); //ChodŸ za mn¹.
    AI_Output (self, other ,"DIA_Rocky_Follow_03_02"); //Jasne!
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    Npc_ExchangeRoutine (self,"odb");
	AI_StopProcessInfos	(self);
	
	//co to za syf?
    RockyRobiZaDoyle  = false;
};

/*
//========================================
//-----------------> BackToCamp
//========================================

INSTANCE DIA_Rocky_BackToCamp (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 2;
   condition    = DIA_Rocky_BackToCamp_Condition;
   information  = DIA_Rocky_BackToCamp_Info;
   permanent	= FALSE;
   description	= "Wracaj do Obozu.";
};

FUNC INT DIA_Rocky_BackToCamp_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Rocky_Follow))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BackToCamp_Info()
{
    AI_Output (other, self ,"DIA_Rocky_BackToCamp_15_01"); //Wracaj do Obozu.
    AI_Output (self, other ,"DIA_Rocky_BackToCamp_03_02"); //W porz¹dku.

    Npc_ExchangeRoutine (self,"start");
    AI_StopProcessInfos	(self);
};
*/
//========================================
//-----------------> BackFromMine
//========================================

INSTANCE DIA_Rocky_BackFromMine (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_BackFromMine_Condition;
   information  = DIA_Rocky_BackFromMine_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_BackFromMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Raeuber_NoNareszcie))
    && (Npc_GetDistToWP (self, "CAMP01") < 1000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_BackFromMine_Info()
{
    AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_01"); //Nareszcie wróci³eœ! Co z kopalni¹?
    AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_02"); //Zosta³a zajêta przez o¿ywieñców, których najprawdopodobniej przywo³uje jakiœ magiczny artefakt. 
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_03"); //Mam go przy sobie. Pozby³em siê te¿ pozosta³ych niedobitków. Mo¿na teraz bezpiecznie zejœæ do szybu.
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_04"); //To ju¿ robota nie dla mnie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Rocky_BackFromMine_03_05"); //I co teraz zrobisz?
        AI_Output (other, self ,"DIA_Rocky_BackFromMine_15_06"); //Muszê odszukaæ ten artefakt i coœ z nim zrobiæ.
    };
    AI_StopProcessInfos	(self);
};

///////////////////////////////////////////
// INNE GILDIE - NIE BANDYTA
// WTEDY ROCKY ROBI ZA DOYLE'A
// NIE WIEM PO CHUJ, ALE ROBI
//////////////////////////////////////////
/*
//========================================
//-----------------> NoNareszcie
//========================================

INSTANCE DIA_Rocky_NoNareszcie (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_NoNareszcie_Condition;
   information  = DIA_Rocky_NoNareszcie_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_NoNareszcie_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Glest_First)) && (RockyRobiZaDoyle == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_NoNareszcie_Info()
{
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_01"); //No nareszcie jesteœ. Ju¿ myœleliœmy, ¿e te potwory rozerwa³y ciê na strzêpy.
    AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_02"); //Spokojnie. Nie tak ³atwo mnie zabiæ.
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_03"); //Co widzia³eœ w kopalni?
    AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_04"); //Nawet tam nie by³em. Prze¿y³ tylko jeden Kopacz. Na szczêœcie wzi¹³ ze sob¹ artefakt odpowiedzialny za ca³e to zamieszanie.
    AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_05"); //Dobra nasza! Czyli mo¿emy zaj¹æ kopalniê?
    if (Npc_HasItems (other, Focus_Corristo) >=1)
    {
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_06"); //W sumie to tak. Mam ze sob¹ kamieñ, który powodowa³ to ca³e zamieszanie ze z³ymi si³ami.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_07"); //To œwietnie!
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_08"); //My zostaniemy tutaj i bêdziemy pilnowaæ wejœcia.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_09"); //Aha, i zabierz ten kamieñ ze sob¹. Nie chcê mieæ z nim nic wspólnego.
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_10"); //Myœla³em, ¿e podarujê ci go w prezencie. No, ale có¿...
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_11"); //Nie denerwuj mnie!
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_12"); //Dobra, ju¿ dobra. Uwa¿aj, bo go wyjmê!
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_13"); //IdŸ ju¿.
		
    //B_LogEntry                     (CH4_BanditsInAbadonedMine,"Wkrótce po odnalezieniu tajemniczego kamienia z Opuszczonej Kopalni uda³em siê na zewn¹trz. Czekali tam ju¿ na mnie sprzymierzeñcy. Bandyta Rocky ");
	HeroMaArtefakt = false;
    B_GiveXP (500);
    }
    else
    {
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_14"); //Jeszcze nie. Nie mam przy sobie kamienia, który znajduje siê gdzieœ w kopalni.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_15"); //Jakiego kamienia?
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_16"); //Podobno jakiœ tajemniczy artefakt jest przyczyn¹ pojawiania siê o¿ywieñców.
        AI_Output (other, self ,"DIA_Rocky_NoNareszcie_15_17"); //Muszê siê go jakoœ pozbyæ.
        AI_Output (self, other ,"DIA_Rocky_NoNareszcie_03_18"); //No to idŸ po niego. Poczekamy tu i postaramy siê odeprzeæ fale o¿ywnieñców.
		HeroMaArtefakt = true;
    };

    AI_StopProcessInfos	(self);
};*/
/*
//========================================
//-----------------> SYTUACJA
//========================================

INSTANCE DIA_Rocky_SYTUACJA (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_SYTUACJA_Condition;
   information  = DIA_Rocky_SYTUACJA_Info;
   permanent	= true;
   description	= "Jak leci?";
};

FUNC INT DIA_Rocky_SYTUACJA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Rocky_SYTUACJA_Info()
{
        AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_01"); //Jak leci?
    if (hero.guild == GIL_BAU)
    {
        if (!Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_02"); //Nawet mnie nie znasz. Co ciê to obchodzi?
            AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_03"); //Chcia³em byæ mi³y.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_04"); //To idŸ to robiæ gdzieœ indziej.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_POGADUCHY))
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_05"); //Na razie jest stabilnie. Zajmij siê robot¹.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_WIN_O)) 
        {
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_06"); //Ha ha! NieŸle ostatnio rozpieprzyliœmy tych gnojków ze Starego Obozu. 
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_07"); //Zaczynasz mi siê podobaæ, ch³opcze! Bêd¹ z ciebie ludzie.
        }
		  else if (Npc_KnowsInfo (hero,DIA_Quentin_HELLO35)) 
        {   
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_13"); //Podobno ostatnio Ÿle siê dzieje w Kolonii. To morderstwo na Magach Ognia przela³o szalê goryczy.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_14"); //Postawa Gomeza wcale a¿ tak bardzo mnie nie zaskoczy³a. Po tym cz³owieku mo¿na siê by³o tego spodziewaæ.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_EqDoWalki)) 
        {           
			AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_08"); //Cholera! Daj mi spokój! Mam teraz masê roboty z tym ekwipunkiem.
            AI_Output (other, self ,"DIA_Rocky_SYTUACJA_15_09"); //Dobrze, dobrze.
        }
        else if (Npc_KnowsInfo (hero, DIA_Rocky_WtfRozwalaWobozie)) 
        {   
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_10"); //Chwilê wstecz i przypominam sobie, jak drwiliœmy ze Stra¿ników Gomeza, atakuj¹c konwój. 
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_11"); //Teraz to my staliœmy siê ofiar¹. Takie ¿ycie w Kolonii... raz na wozie, raz pod wozem.
            AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_12"); //Powiem ci jedno: uwa¿aj, co mówisz. Wszystko mo¿e siê kiedyœ odwróciæ przeciwko tobie.
        };
      } 
	  else 
	  {
	  AI_Output (self, other ,"DIA_Rocky_SYTUACJA_03_13"); //Nie gadam z obcymi. Zje¿d¿aj!
	  };
    };

*/

//========================================
//-----------------> THX_ZA_ROBOTE
//========================================

INSTANCE DIA_Rocky_THX_ZA_ROBOTE (C_INFO)
{
   npc          = BAN_1605_Rocky;
   nr           = 1;
   condition    = DIA_Rocky_THX_ZA_ROBOTE_Condition;
   information  = DIA_Rocky_THX_ZA_ROBOTE_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Rocky_THX_ZA_ROBOTE_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Cord_IHaveStone))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Rocky_THX_ZA_ROBOTE_Info()
{
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_01"); //Stary, kolejny raz ratujesz nam ty³ek. Odda³eœ niecenion¹ pomoc Bandytom.
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_02"); //Wielkie dziêki. Kopalnia jest nasza: Bandytów i Najemników, nie Gomeza. Dobra robota. 
    AI_Output (self, other ,"DIA_Rocky_THX_ZA_ROBOTE_03_03"); //Masz tu trochê rudy.
    CreateInvItems (self, ItMiNugget, 350);
    B_GiveInvItems (self, other, ItMiNugget, 350);
    AI_StopProcessInfos	(self);
};
