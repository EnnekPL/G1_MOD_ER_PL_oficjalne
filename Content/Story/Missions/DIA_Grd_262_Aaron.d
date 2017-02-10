//poprawione i sprawdzone - Nocturn

// ************************ EXIT **************************

instance  GRD_262_Aaron_Exit (C_INFO)
{
	npc			=  GRD_262_Aaron;
	nr			=  999;
	condition	=  GRD_262_Aaron_Exit_Condition;
	information	=  GRD_262_Aaron_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//************************ EXIT **************************
instance  GRD_262_Aaron_CHEST (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_CHEST_Condition;
	information	=  GRD_262_Aaron_CHEST_Info;
	important	= 0;	
	permanent	= 1;
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC int  GRD_262_Aaron_CHEST_Condition()
{	
	if ( Npc_GetDistToWp (self,"OM_CAVE1_34") <400 )
	&& (!Npc_KnowsInfo   (hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_CHEST_Info()
{
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //Czym siê tutaj zajmujesz?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //Pilnujê, ¿eby Kopacze, tacy jak nasz drogi Snipes, trzymali ³apy z dala od mojej skrzyni.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(odci¹gnij Aarona)"; 
};

FUNC int  GRD_262_Aaron_BLUFF_Condition()
{	
	if	Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL)
	&&	(Aaron_lock != LOG_RUNNING)
	&&	(Aaron_lock != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,DIALOG_BACK												,GRD_262_Aaron_BLUFF_BACK);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Przysy³a mnie Ian. Masz siê do niego natychmiast zg³osiæ!"		,GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Podobno w waszej kopalni s¹ jacyœ rabusie."			,GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Kopacze znaleŸli ogromn¹ bry³ê rudy!"	,GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Kopacze znaleŸli ogromn¹ bry³ê rudy!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//I co z tego?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Powinieneœ na ni¹ rzuciæ okiem.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Nie ma mowy.
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Podobno w waszej kopalni s¹ jacyœ rabusie. Zamierzaj¹ ukraœæ ³adunek rudy!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Masz mnie za g³upca? Nie odwa¿yliby siê na coœ takiego!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Przysy³a mnie Ian. Masz siê do niego natychmiast zg³osiæ!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //A czego ode mnie chce?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Nie wiem."					,GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Ma ju¿ doœæ twojego lenistwa."		,GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Ma ci wrêczyæ nagrodê za przyk³adn¹ pracê."	,GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Ma ci wrêczyæ nagrodê za przyk³adn¹ pracê.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Czy¿by? Wiesz co? Lepiej ju¿ st¹d idŸ.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Ma ju¿ doœæ twojego lenistwa.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //Phi. To nic nowego. Spadaj!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Nie wiem. Pewnie sam ci to powie. Inaczej po co by ciê wzywa³?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Ach, trudno. W takim razie zajrzê do niego.

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,	"Odci¹gn¹³em Aarona od skrzyni pod pretekstem spotkania z Ianem. Mam nadziejê, ¿e siê na mnie nie wœcieknie.");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
};

// ***************** Aaron ist angepisst *****************************
instance  GRD_262_Aaron_PISSED (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_PISSED_Condition;
	information	=  GRD_262_Aaron_PISSED_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC int  GRD_262_Aaron_PISSED_Condition()
{
	if	(Aaron_lock == LOG_RUNNING)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_47") < 1000)
	{
		return TRUE;
	};
};
FUNC VOID  GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon		(self);
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //HEJ, TY! Jeœli jeszcze raz spróbujesz wystrychn¹æ mnie na dudka, pogadamy inaczej. Zrozumiano?!
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,	"Spotka³em Aarona. Jednak siê na mnie wœciek³!"); 
};

// ***************** Schlüssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Nie zgubi³eœ przypadkiem klucza do swojej skrzyni?";
};                       

FUNC int  GRD_262_Aaron_SELL_Condition()
{
	if ( Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL_RUN )) 
	{
		return 1;
	};
};

FUNC VOID  GRD_262_Aaron_SELL_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //Nie zgubi³eœ przypadkiem klucza do swojej skrzyni?
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //W rzeczy samej. Nawet nie chcê wiedzieæ sk¹d wiesz o jego istnieniu.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //Ale dam ci 20 bry³ek rudy, jeœli mi go oddasz.

	B_LogEntry		(CH2_SnipesDeal,	"Aaron zaoferowa³ mi 20 bry³ek rudy, jeœli zdobêdê dla niego klucze od skrzyni."); 
};

// ***************** Schlüssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(sprzedaj klucz)";
};                       

FUNC int  GRD_262_Aaron_SELLNOW_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_262_Aaron_SELL) ) && ( Npc_HasItems ( hero,ItKe_OM_02))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_SELLNOW_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //Oto twój klucz.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //Tak, to ten. Masz tu swoje 20 bry³ek, zgodnie z umow¹.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //Ale w przysz³oœci radzê ci uwa¿aæ! Od tej pory bêdê ciê mia³ na oku!
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,	"Sprzeda³em Aaronowi jego w³asny klucz. NieŸle mi siê to op³aci³o!"); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_aaron_DIE (C_INFO)
{
	npc			= GRD_262_Aaron;
	condition	= Info_aaron_DIE_Condition;
	information	= Info_aaron_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_aaron_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_aaron_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_aaron_DIE_08_01"); //No proszê, to¿ to nasz zdrajca! A my ciê uwa¿aliœmy za jednego z nas.
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_aaron_DIE_08_02"); //Widzê, ¿e przeoczyliœmy jednego z Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_aaron_DIE_08_03"); //To ten Cieñ, który nas zdradzi³!
		};			

		AI_Output		(hero,self,"Info_aaron_DIE_15_04"); //Zaraz! O czym ty mówisz, Aaron?
		AI_Output		(self,hero,"Info_aaron_DIE_08_05"); //Spikn¹³eœ siê z Nowym Obozem, tak?
		AI_Output		(hero,self,"Info_aaron_DIE_15_06"); //Nie, czekaj! Ja dalej...
		AI_Output		(self,hero,"Info_aaron_DIE_08_07"); //Co, myœla³eœ, ¿e damy siê tak ³atwo wykiwaæ, hê?
		AI_Output		(hero,self,"Info_aaron_DIE_15_08"); //Przestañ gadaæ od rzeczy...
		AI_Output		(self,hero,"Info_aaron_DIE_08_09"); //Zdrajcy tacy jak ty zas³uguj¹ tylko na œmieræ.
		AI_Output		(self,hero,"Info_aaron_DIE_08_10"); //GIÑ!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Bloodwyn, który pilnuje teraz g³ównej bramy, zareagowa³ podobnie jak Aaron. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Aaron, który pilnuje teraz po³udniowej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_aaron_DIE_08_11"); //Postanowi³eœ zobaczyæ, jak wygl¹da œwiat na zewn¹trz Nowego Obozu, co? To by³ b³¹d!
		}
		else
		{
			AI_Output	(self,hero,"Info_aaron_DIE_08_12"); //No proszê, znudzi³ ci siê twój nowy dom na bagnach? Pope³ni³eœ b³¹d przychodz¹c tutaj.
		};

		AI_Output		(hero,self,"Info_aaron_DIE_15_13"); //Co? O co ci chodzi?!
		AI_Output		(self,hero,"Info_aaron_DIE_08_14"); //Nie s³ysza³eœ o ataku na wasz¹ kopalniê?
		AI_Output		(hero,self,"Info_aaron_DIE_15_15"); //Chwileczkê...
		AI_Output		(self,hero,"Info_aaron_DIE_08_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_aaron_DIE_15_17"); //Hej, nie chcê ¿adnych k³opotów...
		AI_Output		(self,hero,"Info_aaron_DIE_08_18"); //Trzeba by³o o tym pomyœleæ trochê wczeœniej!
		AI_Output		(hero,self,"Info_aaron_DIE_15_19"); //S³uchaj, mam tego serdecznie doœæ...
		AI_Output		(self,hero,"Info_aaron_DIE_08_20"); //Ja te¿! ZABIÆ GO!!!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_262_Aaron,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};