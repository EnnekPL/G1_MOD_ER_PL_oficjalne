//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Hanson_EXIT(C_INFO)
{
	npc             = NOV_1378_Hanson;
	nr              = 999;
	condition		= DIA_Hanson_EXIT_Condition;
	information		= DIA_Hanson_EXIT_Info;
	permanent		= TRUE;
	description  	= DIALOG_ENDE;
};

FUNC INT DIA_Hanson_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hanson_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

/////////////////////////////////////////////////
// DIALOGI OGÓLNE
////////////////////////////////////////////////

//========================================
//-----------------> WHO
//========================================

INSTANCE DIA_Hanson_WHO (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_WHO_Condition;
   information  = DIA_Hanson_WHO_Info;
   permanent	= FALSE;
   description	= "Jesteœ drwalem?";
};

FUNC INT DIA_Hanson_WHO_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_WHO_Info()
{
    AI_Output (other, self ,"DIA_Hanson_WHO_15_01"); //Jesteœ drwalem?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_02"); //Nie widaæ?
    AI_Output (self, other ,"DIA_Hanson_WHO_03_03"); //Wyci¹³em ju¿ po³owê tego dziadostwa. Drewno z bagien w wiêkszoœci jest kiepskiej jakoœci. Przegni³e i zbutwia³e...
	AI_Output (self, other ,"DIA_Hanson_WHO_03_04"); //Tylko niektóre drzewa s¹ naprawdê w dobrym stanie, ale je z kolei nie sposób wyci¹æ. S¹ strasznie twarde, a ¿aden z tych obiboków z Obozu nie chce mi pomóc. 
    AI_Output (self, other ,"DIA_Hanson_WHO_03_05"); //Ale gdy któryœ chce, ¿eby mu coœ wystrugaæ z drewna to przychodzi od razu...
};

//========================================
//-----------------> PRACA
//========================================

INSTANCE DIA_Hanson_PRACA (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 2;
   condition    = DIA_Hanson_PRACA_Condition;
   information  = DIA_Hanson_PRACA_Info;
   permanent	= FALSE;
   description	= "Jak praca?";
};

FUNC INT DIA_Hanson_PRACA_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Hanson_PRACA_Info()
{
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_01"); //Jak praca? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_02"); //Po prostu wspaniale! Siedzê po uszy w b³otnistym gównie i wycinam drzewa. Spe³nienie marzeñ...
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_03"); //Dlaczego ci¹gle narzekasz?
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_04"); //Bo jestem chory! le siê czujê, a ci¹gle przychodzi do mnie ktoœ, komu potrzebne jest drewno na chatê.
    AI_Output (other, self ,"DIA_Hanson_PRACA_15_05"); //Mo¿e powinieneœ st¹d odejœæ, skoro ta praca ci nie odpowiada? 
    AI_Output (self, other ,"DIA_Hanson_PRACA_03_06"); //Nie mam dok¹d...
};

////////////////////////////////////////////
// TAJEMNICZY HANDLARZ
////////////////////////////////////////////

//========================================
//-----------------> STEH
//========================================

INSTANCE DIA_Hanson_STEH (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 1;
   condition    = DIA_Hanson_STEH_Condition;
   information  = DIA_Hanson_STEH_Info;
   permanent	= FALSE;
   description	= "To ty zajmujesz siê handlem artefaktami?!";
};

FUNC INT DIA_Hanson_STEH_Condition()
{
	if (Npc_KnowsInfo (hero, Nov_1371_BaalNetbek_QUEST)) 
	{
    return TRUE;
	};
};

FUNC VOID DIA_Hanson_STEH_Info()
{
    AI_Output (other, self ,"DIA_Hanson_STEH_15_01"); //To ty zajmujesz siê handlem artefaktami?!
    AI_Output (self, other ,"DIA_Hanson_STEH_03_02"); //Mistrzu, naprawdê nie wiem o czym mówisz!
	AI_Output (other, self ,"DIA_Hanson_STEH_15_03"); //K³amiesz! Baal Netbek wskaza³ na kogoœ, kto krêci siê w tych okolicach. 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_04"); //Naprawdê? Guru bierze na powa¿nie s³owa tego ob³¹kanego popaprañca?! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_05"); //Nie mam sobie nic do zarzucenia! Mo¿esz przeszukaæ mnie i moj¹ chatê. Nie mam nic do ukrycia! 
	AI_Output (self, other ,"DIA_Hanson_STEH_03_06"); //Lepiej zainteresuj siê tym cz³owiekiem, który od kilku dni przesiaduje przy palisadzie, a normalnym ludziom daj spokój.
	AI_Output (other, self ,"DIA_Hanson_STEH_15_07"); //Sprawdzê to, ale jeœli k³amiesz to wrócê. 
	B_LogEntry     (CH3_StrangeResearcher,"Rozmawia³em z Hansonem na temat handlu. Wszystkiego siê wypiera. Twierdzi, ¿e Baal Netbek siê pomyli³ i powinienem poszukaæ Nowicjusza, który krêci siê przy palisadzie. ");
};

//////////////////////////////////////////////
// SERIA ZABÓJSTW W BRACTWIE
//////////////////////////////////////////////

//========================================
//-----------------> QUEST2_D
//========================================

INSTANCE DIA_Hanson_QUEST2_D (C_INFO)
{
   npc          = NOV_1378_Hanson;
   nr           = 5;
   condition    = DIA_Hanson_QUEST2_D_Condition;
   information  = DIA_Hanson_QUEST2_D_Info;
   permanent	= FALSE;
   description	= "To ty zabija³eœ Nowicjuszy!";
};

FUNC INT DIA_Hanson_QUEST2_D_Condition()
{
    if (MIS_PsionicCSI == LOG_RUNNING)
    && (Npc_HasItems (other, ItMw_SiekieraCSI) >=1)
    && (Npc_HasItems (other, ItMi_OstrzeCSI) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Hanson_QUEST2_D_Info()
{
    AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_01"); //To ty zabija³eœ Nowicjuszy!
    AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_02"); //Wiedzia³em, ¿e w koñcu ktoœ siê zorientuje. 
    AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_03"); //To dziwne. Przyznajesz siê, nawet nie zada³eœ sobie trudu ¿eby ukryæ œlady. Dlaczego?
    AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_04"); //To mia³o byæ ostrze¿enie dla wszystkich. Ci trzej Nowicjusze mieli u mnie d³ugi.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_05"); //Po¿yczali rudê na skrêty i jeszcze brali ode mnie deski na budowê swoich chat. Obiecali, ¿e wkrótce zap³ac¹.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_06"); //Ju¿ od dwóch lat czeka³em. ¯aden z nich nie wpad³ nawet na pomys³, ¿eby mi pomóc i odpracowaæ d³ugi. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_07"); //Œni¹cy jest demonem i ty dobrze o tym wiesz, Guru, którego nikt prawie nie zna... Ja te¿ o tym wiem.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_08"); //Skoro wiara w Œni¹cego ju¿ nie ma sensu to wszystkie zasady, praca wspólnoty i inne pierdo³y równie¿ s¹ bezcelowe. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_09"); //Wracamy do tego, co zawsze rz¹dzi³o naszym ¿yciem - do pieniêdzy. Czy to z³oto, czy ruda... niewa¿ne. 
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_10"); //Po prostu ma siê zgadzaæ.
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_15_11"); //Nawet jeœli nie wierzysz w Œni¹cego to co z pozosta³ymi bogami? Nie upatrujesz w nich jakiejœ nadziei?
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_12"); //Nie, tak jak wiêkszoœæ bandziorów i wyrzutków, którzy tu egzystuj¹. Skoñczmy tê paplaninê.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_03_13"); //Wiem, ¿e nie puœcisz mnie ¿ywcem, dlatego bêdê walczy³ jak wojownik.
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	Info_AddChoice		(DIA_Hanson_QUEST2_D,"(Puœæ Hansona wolno)", DIA_Hanson_QUEST2_D_FREE);
	Info_AddChoice		(DIA_Hanson_QUEST2_D,"(Zabij Hansona)",DIA_Hanson_QUEST2_D_KILL);
};

FUNC VOID DIA_Hanson_QUEST2_D_FREE ()
{
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_01"); //OdejdŸ.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_FREE_03_02"); //CO?
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_03"); //OdejdŸ. Opuœæ Obóz.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_FREE_03_04"); //Dlaczego to robisz?
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_FREE_15_05"); //A powiedz mi czym ró¿ni³bym siê od ciebie, gdybym ciê zabi³.
	B_LogEntry                     (CH3_PsionicCSI,"Morderc¹ okaza³ siê Hanson, który przyzna³ siê do dokonania zabójstw. Kaza³em mu opuœciæ Obóz.");
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	Npc_ExchangeRoutine(self,"tot");
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanson_QUEST2_D_KILL ()
{
	AI_Output (other, self ,"DIA_Hanson_QUEST2_D_KILL_15_01"); //Ka¿dego w koñcu dosiêgnie sprawiedliwoœæ.
	AI_Output (self, other ,"DIA_Hanson_QUEST2_D_KILL_03_02"); //Tego siê spodziewa³em.
	Info_ClearChoices	(DIA_Hanson_QUEST2_D);
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	B_LogEntry                     (CH3_PsionicCSI,"Morderc¹ okaza³ siê Hanson, który przyzna³ siê do dokonania zabójstw. Stan¹³em z nim do walki.");
};
