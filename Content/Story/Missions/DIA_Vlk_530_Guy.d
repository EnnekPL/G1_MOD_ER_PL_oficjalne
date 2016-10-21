//poprawione i sprawdzone - Nocturn

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Witam!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if  (Kapitel < 4) 
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia³em ciê jeszcze tutaj. Jesteœ nowy, prawda?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Tak, trafi³em tu niedawno...
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Zdecydowa³eœ ju¿, do którego obozu do³¹czysz?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Nie. Masz dla mnie jakieœ sugestie?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Có¿, to zale¿y. Ka¿dy obóz ma swoje wady i zalety.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dopóki nie podejmiesz decyzji, mo¿esz zostaæ tutaj. W³aœnie zwolni³a siê jedna chata.
	};
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 0;
	description 	= "Jakie s¹ zalety Starego Obozu?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jakie s¹ zalety Starego Obozu?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Jeœli zap³acisz Stra¿nikom za ochronê, bêdziesz móg³ ¿yæ we wzglêdnym spokoju. Stra¿nicy pilnuj¹, ¿eby ich ludziom nie dzia³a siê krzywda.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Poza tym, tylko tutaj dostaniesz towary z Zewnêtrznego Œwiata po przyzwoitych cenach. W innych obozach zap³acisz za nie fortunê!

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC, "Chyba doœæ ju¿ us³ysza³em o Starym Obozie." ,DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC, "Jakie towary s¹ tu szczególnie cenne?"			,DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC, "A co, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?"			,DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Chyba doœæ ju¿ us³ysza³em o Starym Obozie.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Podoba mi siê tutaj.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jakie towary s¹ tu szczególnie cenne?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Wszystko, co pochodzi z Zewnêtrznego Œwiata: chleb, ser, boczek, ale przede wszystkim piwo i wino. W Kolonii wytwarza siê tylko tê paskudn¹ ry¿ówkê!
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Zawsze mo¿na zarobiæ na broni, a zbroje s¹ NIEZWYKLE kosztowne.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Stra¿nicy zdjêli zbroje z zabitych królewskich rycerzy.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Zreszt¹ ³atwo ich rozpoznaæ w³aœnie po ich zbroi - tylko Stra¿nicy mog¹ takie nosiæ.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co siê dzieje, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //W takiej sytuacji Stra¿nicy po prostu siê przygl¹daj¹, czekaj¹c a¿ jeden z walcz¹cych zginie. Wtedy zabijaj¹ drugiego!
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Jakie s¹ zalety Nowego Obozu?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jakie s¹ zalety Nowego Obozu?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Jeœli nie masz nic przeciwko poder¿niêtemu gard³u, mo¿esz tam œmia³o iœæ.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Nie, nie jest tam a¿ tak Ÿle, ale to zupe³nie inne osiedle.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tutaj o wzglêdny porz¹dek troszczy siê Gomez. W Nowym Obozie natomiast pojêcie porz¹dku nie istnieje.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jedyni ludzie, którzy maj¹ tam coœ do powiedzenia to Magowie Wody. Ale oni spêdzaj¹ ca³e dnie na badaniu Bariery.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 	= "A co przemawia za przy³¹czeniem siê do Sekty?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //A co przemawia za przy³¹czeniem siê do Sekty?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //O to zapytaj ju¿ kogoœ z Obozu Bractwa.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Kilku ich Nowicjuszy zawsze krêci siê po obozie. Jestem pewien, ¿e udziel¹ ci wyczerpuj¹cych informacji.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Osobiœcie nigdy tam nie by³em, ale jeœli wierzyæ we wszystko, co o nich mówi¹, musz¹ byæ bardzo hojni.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Ze wszystkich trzech osiedli chyba naj³atwiej zostaæ cz³onkiem obozu na bagnie.
};

//========================================
//-- Advantages BD
//========================================

INSTANCE DIA_Guy_AdBD (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_AdBD_Condition;
   information  = DIA_Guy_AdBD_Info;
   permanent	= FALSE;
   description	= "A co mo¿esz mi powiedzieæ o Bandytach?";
};

FUNC INT DIA_Guy_AdBD_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_AdBD_Info()
{
    AI_Output (other, self ,"DIA_Guy_AdBD_15_01"); //A co mo¿esz mi powiedzieæ o Bandytach?
    AI_Output (self, other ,"DIA_Guy_AdBD_03_02"); //W³aœciwie niezbyt wiele. Wiem tylko tyle, ¿e mieszkaj¹ w górach i prowadz¹ ma³¹ wojnê ze Starym Obozem.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_03"); //Nie mam pojêcia, kto do nich nale¿y, ani gdzie mo¿esz spotkaæ któregoœ z nich. Wiem jednak, ¿e s¹ to twarde skurczybyki, które nie lêkaj¹ siê niczego.
    AI_Output (self, other ,"DIA_Guy_AdBD_03_04"); //Jeœli chcesz do nich do³¹czyæ, to nie mów o tym nikomu w Starym Obozie. Za coœ takiego skoñczysz w lochu. 
    AI_Output (other, self ,"DIA_Guy_AdBD_15_05"); //Lepiej uwa¿aæ. Dziêki. 
};

//========================================
//-----------------> OtherCamps
//========================================

INSTANCE DIA_Guy_OtherCamps (C_INFO)
{
   npc          = Vlk_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_OtherCamps_Condition;
   information  = DIA_Guy_OtherCamps_Info;
   permanent	= FALSE;
   description	= "Czy w Kolonii s¹ jeszcze inne obozy?";
};

FUNC INT DIA_Guy_OtherCamps_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Hello))
    && (kapitel < 4) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_OtherCamps_Info()
{
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_01"); //Czy w Kolonii s¹ jeszcze inne obozy?
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_02"); //W rzeczy samej s¹. Jednak nie tak potê¿ne, i jeœli do nich do³¹czysz, nie bêdziesz mia³ w³aœciwie ¿adnych przywilejów. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_03"); //Najbli¿ej od Starego Obozu znajduje siê obóz myœliwych. Jego cz³onkowie zajmuj¹ siê polowaniem oraz handlem z innymi obozami. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_04"); //Ich obóz znajdziesz pomiêdzy dwoma wa¿nymi szlakami - obok szlaku ze Starego Obozu do Starej Kopalni, oraz drogi do Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_05"); //Ka¿dy obcy mo¿e u nich pracowaæ. Ponoæ dobrze p³ac¹ i oferuj¹ niez³e pancerze na sprzeda¿.
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_06"); //A to ciekawe. Przyda³by mi siê porz¹dny pancerz.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_07"); //Innym obozem o którym mi wiadomo jest obóz ³owców orków.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_08"); //Zdaje siê, ¿e mieszkaj¹ gdzieœ na terenach orków i trudni¹ siê polowaniem na nich. Jak chcesz obracaæ siê w towarzystwie twardzieli, powinieneœ do nich zajrzeæ. 
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_09"); //Poza tym w Kolonii s¹ jeszcze dwa obozy nale¿¹ce do Starego i Nowego Obozu.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_10"); //Obóz myœliwych-najemników gdzieœ w okolicach Wolnej Kopalni oraz obóz przed Star¹ Kopalni¹.
    AI_Output (self, other ,"DIA_Guy_OtherCamps_03_11"); //Nie wiem o nich zbyt wiele, ale jeœli chcesz z nimi trzymaæ, musisz byæ albo cz³onkiem Starego, albo Nowego Obozu. 
    AI_Output (other, self ,"DIA_Guy_OtherCamps_15_12"); //Dziêki za informacje.
};



// **************************************************
// 				Welche Hütte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Któr¹ chatê mogê zaj¹æ?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Któr¹ chatê mogê zaj¹æ?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Tamt¹, z niewielkim baldachimem.
	guysay_about_hut = true;
	AI_StopPointAt(self);
};	

//========================================
//-----------------> Ucieczka
//========================================

INSTANCE DIA_Guy_Ucieczka (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 1;
   condition    = DIA_Guy_Ucieczka_Condition;
   information  = DIA_Guy_Ucieczka_Info;
   permanent	= FALSE;
   description	= "Co tu robisz?";
};

FUNC INT DIA_Guy_Ucieczka_Condition()
{
    if (Kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_Ucieczka_Info()
{
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_01"); //Co tu robisz?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_02"); //Uciek³em ze Starego Obozu. 
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_03"); //Gomez traci poparcie. Tyle ci powiem.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_04"); //Zosta³o przy nim tylko kilku Stra¿ników, których wys³a³ na œmieræ.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_05"); //Powiem wiêcej.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_06"); //Nawet Kruk uciek³. Wzi¹³ ze sob¹ Thorusa, Bloodwyna i kilku Kopaczy.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_07"); //Gdzie mogli uciec?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_08"); //Nie wiem. Pewnie ukryli siê gdzieœ i czekaj¹, a¿ to wszystko siê skoñczy.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_09"); //Co masz na myœli?
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_10"); //Ostatnimi czasy wszystko tak siê skomplikowa³o, ¿e w koñcu coœ bêdzie musia³o pêkn¹æ.
    AI_Output (other, self ,"DIA_Guy_Ucieczka_15_11"); //W¹tpiê, ¿eby Bariera opad³a.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_12"); //Ja te¿. No, ale przecie¿ nie skoczê z klifu z tego powodu.
    AI_Output (self, other ,"DIA_Guy_Ucieczka_03_13"); //Chêtnie wróci³bym do kopalni i do mojego spokojnego ¿ycia.
};

//========================================
//-----------------> backToMine
//========================================

INSTANCE DIA_Guy_backToMine (C_INFO)
{
   npc          = VLK_530_Guy;
   nr           = 2;
   condition    = DIA_Guy_backToMine_Condition;
   information  = DIA_Guy_backToMine_Info;
   permanent	= FALSE;
   description	= "Chcesz wróciæ do kopalni?";
};

FUNC INT DIA_Guy_backToMine_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Guy_Ucieczka))
    && (MIS_NewEnginer == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Guy_backToMine_Info()
{
    AI_Output (other, self ,"DIA_Guy_backToMine_15_01"); //Chcesz wróciæ do kopalni?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_02"); //Oczywiœcie.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_03"); //Mo¿e w takim razie przy³¹czysz siê do Bandytów?
    AI_Output (other, self ,"DIA_Guy_backToMine_15_04"); //Przejêliœmy Opuszczon¹ Kopalniê i wznowiliœmy wydobycie. 
    AI_Output (self, other ,"DIA_Guy_backToMine_03_05"); //Nie ma mowy! Nie chcê zostaæ rozszarpany przez jakieœ œcierwo!
    AI_Output (other, self ,"DIA_Guy_backToMine_15_06"); //Kopalnia jest ju¿ czysta.
    AI_Output (other, self ,"DIA_Guy_backToMine_15_07"); //Zaj¹³em siê tym.
    AI_Output (self, other ,"DIA_Guy_backToMine_03_08"); //Doprawdy?
    AI_Output (self, other ,"DIA_Guy_backToMine_03_09"); //W takim razie wyruszê w najbli¿szym czasie.
    B_LogEntry                     (CH4_NewEnginer,"Guy z chêci¹ wróci do pracy. Mogê powiedzieæ Quentinowi, ¿e ma nowego robotnika.");
    B_GiveXP (100);
    AI_StopProcessInfos	(self);
};
