//poprawione i sprawdzone - Nocturn

// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/
var int log_gornarancrossbow;
instance  GRD_205_gornaran_CROSSBOW (C_INFO)
{
	npc				= TPL_1405_GorNaRan;
	condition		= GRD_205_gornaran_CROSSBOW_Condition;
	information		= GRD_205_gornaran_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC int  GRD_205_gornaran_CROSSBOW_Condition()
{	
if (!kapitel == 6)
{
		return TRUE;
	};

};
FUNC void  GRD_205_gornaran_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_Info_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_Info_13_02"); //Mogê ciê nauczyæ strzelania z kuszy. To ciê bêdzie kosztowaæ 200 bry³ek. 
	if (log_gornarancrossbow == FALSE)
	
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Gor Na Ran poka¿e mi jak strzelaæ z kuszy za 200 bry³ek rudy.");
		log_gornarancrossbow = TRUE;
	};
	
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),GRD_205_gornaran_CROSSBOW_OK);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW,DIALOG_BACK,GRD_205_gornaran_CROSSBOW_BACK);

};  
func void GRD_205_gornaran_CROSSBOW_BACK()
{
	Info_ClearChoices	(GRD_205_gornaran_CROSSBOW );
};

func void GRD_205_gornaran_CROSSBOW_OK()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW_OK_15_01"); //Umowa stoi. Poka¿ mi jak obchodziæ siê z kusz¹.
	if (hero.attribute[ATR_Dexterity] >= 20)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_02"); //Dobra. Bierzmy siê do roboty.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_03"); //Z³ap kuszê mocno i oprzyj j¹ o ramiê. To powinno zwiêkszyæ celnoœæ strza³u.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_04"); //Przez kilka pierwszych dni twoje ramiê da ci siê nieŸle we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_05"); //Po jakimœ tygodniu bêdziesz mia³ rêce ze stali!
			AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_06"); //Wyceluj spokojnie i powoli œci¹gnij spust. Be³t niesie ze sob¹ wiêcej si³y ni¿ strza³a, dlatego powoduje wiêksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_gornaran_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_gornaran_CROSSBOW_OK_13_07"); //Zap³aæ 200 bry³ek, a bêdê ciê uczy³.
	};
		}
	else
	{
	AI_Output			(self,other,"DIA_goran_NO_ENOUGHT_STR_1"); //Musisz byæ znacznie zrêczniejszy!
	PrintScreen	("Warunek: Zrêcznoœæ 20", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  GRD_205_gornaran_CROSSBOW2 (C_INFO)
{
	npc				= TPL_1405_GorNaRan;
	condition		= GRD_205_gornaran_CROSSBOW2_Condition;
	information		= GRD_205_gornaran_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy."; 
};

FUNC int  GRD_205_gornaran_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	{
		return TRUE;
	};

};
FUNC void  GRD_205_gornaran_CROSSBOW2_Info()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy.
	AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_Info_13_02"); //To ciê bêdzie kosztowaæ 300 bry³ek rudy.
  
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW2);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),GRD_205_gornaran_CROSSBOW2_OK);
	Info_Addchoice 	(GRD_205_gornaran_CROSSBOW2,DIALOG_BACK,  GRD_205_gornaran_CROSSBOW2_BACK);
	

};  
func void GRD_205_gornaran_CROSSBOW2_BACK()
{
	Info_ClearChoices (GRD_205_gornaran_CROSSBOW);
};

func void GRD_205_gornaran_CROSSBOW2_OK()
{
	AI_Output (other, self,"GRD_205_gornaran_CROSSBOW2_OK_15_01"); //Zaczynajmy.
	if (hero.attribute[ATR_Dexterity] >= 40)
	{
	if (Npc_HasItems (hero,ItMiNugget)>= 300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza³y bêd¹ celniejsze, jeœli przed œci¹gniêciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_03"); //Naucz siê poprawnie oceniaæ prêdkoœæ z jak¹ porusza siê twój cel.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci¹³ œcie¿kê, któr¹ porusza siê cel.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_05"); //Jeœli atakujesz wiêcej ni¿ jeden cel, nie traæ czasu: musisz mo¿liwie szybko przygwoŸdziæ jeden za drugim dobrze wymierzonymi strza³ami.
		AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_06"); //To by by³o na tyle.
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_gornaran_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_gornaran_CROSSBOW2_OK_13_07"); //Najpierw postaraj siê zdobyæ te TRZYSTA BRY£EK RUDY!
	};
	}
	else
	{
	AI_Output			(self,other,"DIA_goran_NO_ENOUGHT_STR_1"); //Musisz byæ znacznie zrêczniejszy!
	PrintScreen	("Warunek: Zrêcznoœæ 40", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};
// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Co tu robisz?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Pilnujê, ¿eby b³otne wê¿e nie podp³ywa³y zbyt blisko Obozu.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //Na twoim miejscu trzyma³bym siê od nich z dala. W walce z takim potworem nie masz najmniejszych szans!
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //A teraz idŸ ju¿ sobie. Muszê mieæ oczy szeroko otwarte.
	AI_StopProcessInfos	( self );
};



//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_GorNaRan_HELLO1 (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_HELLO1_Condition;
   information  = DIA_GorNaRan_HELLO1_Info;
   permanent	= FALSE;
   description	= "Dzia³o siê ostatnio coœ ciekawego?";
};

FUNC INT DIA_GorNaRan_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_GorNaRan_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_HELLO1_15_01"); //Dzia³o siê ostatnio coœ ciekawego?
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_02"); //Niestety b³otny w¹¿ po¿ar³ jednego z naszych ludzi. Na moich oczach bestia wy³oni³a siê z bagna i wci¹gnê³a brodz¹cego w wodzie cz³owieka!
    AI_Output (self, other ,"DIA_GorNaRan_HELLO1_03_03"); //Ha! Ta bestia ze¿ar³a nawet miecz! Oby mu tak utkn¹³ w gardle!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Fumes
//========================================

INSTANCE DIA_GorNaRan_Fumes (C_INFO)
{
   npc          = TPL_1405_GorNaRan;
   nr           = 1;
   condition    = DIA_GorNaRan_Fumes_Condition;
   information  = DIA_GorNaRan_Fumes_Info;
   permanent	= FALSE;
   description	= "Baal Orun wys³a³ mnie za tob¹. Mamy ustaliæ sk¹d unosz¹ siê truj¹ce gazy.";
};

FUNC INT DIA_GorNaRan_Fumes_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_BaalOrun_ToxicFumes))
    {
    return TRUE;
    };
};


FUNC VOID DIA_GorNaRan_Fumes_Info()
{
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_01"); //Baal Orun wys³a³ mnie za tob¹. Mamy ustaliæ sk¹d unosz¹ siê truj¹ce opary.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_02"); //Ju¿ to zrobi³em.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_03"); //A wiêc?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_04"); //Z oddali widzia³em orków na Cmentarzysku, przewodzi³o im jakiœ szaman. Urz¹dzali jakiœ rytua³.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_05"); //Palili ca³e góry zw³ok innych zielonoskórych. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_06"); //To zapewne efekt mojej niedawnej wizyty w tym miejscu. W takim razie trzeba wys³aæ do Beliara równie¿ i tych orków. Pal¹ truch³a, a opary z nich wkrótce wykoñcz¹ ca³e Bractwo.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_07"); //Chyba musimy siê ich pozbyæ.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_08"); //Jacy my? Otrzyma³em rozkaz, by rozejrzeæ siê i ustaliæ sk¹d wydobywaj¹ siê te truj¹ce gazy.
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_09"); //Nikt nie mówi³ mi, ¿e mam walczyæ z orkami. A ju¿ na pewno ty mi tego nie wmówisz.
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_10"); //Chyba nie pójdziesz, sobie st¹d od tak?
    AI_Output (self, other ,"DIA_GorNaRan_Fumes_03_11"); //Mi³ej zabawy z orkami. 
    AI_Output (other, self ,"DIA_GorNaRan_Fumes_15_12"); //Ty... Niewa¿ne.
    AI_StopProcessInfos	(self);
    Npc_ExchangeRoutine (self, "START");
	
	B_LogEntry          (CH4_ToxicFumes,"Spotka³em Gor Na Rana na miejscu. Stwierdzi³, ¿e jakiœ orkowy szaman prowadzi tam wraz z kilkoma orkami rytua³ pogrzebowy. Pal¹ oni cia³a poleg³ych orków. Myœlê, ¿e te trupy pochodz¹ z Cmentarzyska Orków. By³em tam jakiœ czas temu...");
	
	B_GiveXP (100);
};