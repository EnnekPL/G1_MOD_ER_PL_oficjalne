//poprawione i sprawdzone - Nocturn

// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240
//sprawdzone przez gothic1210
// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Do zobaczenia.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Trzymaj siê, kolego.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //W Obozie nie musisz siê niczego obawiaæ. Bêdziemy mieli na ciebie oko.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 1) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24 //1.4.02
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hej, ty!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Mówisz do mnie?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ostrzegam ciê! Tacy jak ty ³atwo mog¹ napytaæ sobie biedy!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //W koñcu wiêkszoœæ z tutejszych ludzi to straszne zbiry!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Wydaje siê im, ¿e mog¹ tu robiæ, co im siê ¿ywnie podoba. No, ale my im na to nie pozwalamy.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomezowi zale¿y na spokoju w Obozie, a do nas - Stra¿ników - nale¿y dbanie o porz¹dek. Oczywiœcie jest to bardzo wyczerpuj¹ce... i KOSZTOWNE zajêcie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Dlatego w³aœnie chcê ciê prosiæ o drobne wsparcie finansowe... Na znak przyjaŸni. Ty pomo¿esz nam, a my pomo¿emy tobie. Jeœli bêdziesz mia³ k³opoty - mo¿esz na nas liczyæ.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Czemu by nie? Ile mam ci zap³aciæ?"	,Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To znaczy, ¿e mam ci zap³aciæ za ochronê? Dziêki, ale nie! Sam sobie dam radê!"	,Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Grozisz mi?"	,Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //To znaczy, ¿e mam ci zap³aciæ za ochronê? Dziêki, ale nie! Sam sobie dam radê!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Jak sobie chcesz, ch³opcze. Ale wkrótce po¿a³ujesz, ¿e odrzuci³eœ tê przyjacielsk¹ propozycjê!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Grozisz mi?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Wrêcz przeciwnie! Oferujê ci pomoc!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Czemu by nie? Ile mam ci zap³aciæ?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Niewiele. 10 bry³ek rudy, to wszystko.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nie mam tyle przy sobie."	,Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Proszê, oto ruda. Przyjació³ nigdy nie za wielu."	,Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Proszê, oto ruda. Przyjació³ nigdy nie za wielu.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Widzê, ¿e m¹dry z ciebie goœæ. Od tej pory bêdziemy ciê mieli na oku.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Ale to nie znaczy, ¿e mo¿esz tu robiæ, co ci siê ¿ywnie podoba, jasne?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nie mam tyle przy sobie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Trudno. Wezmê co masz. Resztê dop³acisz przy nastêpnym spotkaniu.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Zobaczmy...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //No patrzcie pañstwo! Ktoœ tu nie umie liczyæ do 10, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Wezmê wszystko co masz. To mi pomo¿e zapomnieæ, ¿e próbowa³eœ mnie wykiwaæ.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //O, przyjmujê równie¿ mniejsze datki. W koñcu liczy siê pamiêæ! Dziêki za rudê, ch³opcze!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od tej pory bêdê mia³ na ciebie oko. W Obozie nic ci ju¿ nie grozi.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hmmm, naprawdê jesteœ sp³ukany, co? Trudno. Mo¿e innym razem...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) ) && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Mi³o ciê widzieæ, przyjacielu!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //No i jak tam z twoim wsparciem finansowym? Wci¹¿ zalegasz z 10 bry³kami rudy!
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Proszê. Czym jest 10 bry³ek rudy wobec prawdziwej przyjaŸni."	,Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nie bêdê ci wiêcej p³aci³. Doœæ ju¿ ode mnie dosta³eœ!"	,Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Czego znowu?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Pora udowodniæ, ¿e jesteœ prawdziwym przyjacielem.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Marne 10 bry³ek rudy, i wszystko bêdzie w porz¹dku. Co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Proszê. Czym jest 10 bry³ek rudy wobec prawdziwej przyjaŸni.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Czytasz w moich myœlach!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nie bêdê ci wiêcej p³aci³. Doœæ ju¿ ode mnie dosta³eœ!
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zawiod³em siê na tobie! Taki z ciebie przyjaciel? Dobrze, jak sobie chcesz! Od tej pory sam dbaj o siebie. Ja umywam rêce.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Bez obawy. Jakoœ sobie poradzê bez twojej pomocy.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //To siê dopiero oka¿e...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Zmieni³em zdanie. Postanowi³em jednak zap³aciæ ci te 10 bry³ek rudy.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE) && (Kapitel <= 1)  && ((Npc_GetTrueGuild (other)==GIL_NONE) || (Npc_GetTrueGuild (other)==GIL_VLK) || (Npc_GetTrueGuild (other)==GIL_SFB))//1.24
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Zmieni³em zdanie. Postanowi³em jednak zap³aciæ ci te 10 bry³ek rudy.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Trzeba tak by³o od razu! M¹dry z ciebie goœæ.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Ale od tej pory bêdziesz p³aci³ swoj¹ dzienn¹ sk³adkê, co? 
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
		B_GiveInvItems 	    (other, self, itminugget, 10);
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //To wróæ, jak bêdziesz mia³ trochê rudy.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse przysy³a mnie, ¿ebym zap³aci³ jego 10 bry³ek.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING) && (Kapitel <= 1) 
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse przysy³a mnie, ¿ebym zap³aci³ jego 10 bry³ek.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Powinieneœ raczej zap³aciæ SWOJE 10 bry³ek.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Zapomnij o tym facecie, Jesse i tak d³ugo nie poci¹gnie.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Nie - zap³acê za niego. Masz tu jego 10 bry³ek i zostaw go w spokoju.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobra, jak sobie chcesz.
		Jesse_PayForMe = LOG_SUCCESS;
		B_GiveInvItems 	    (other, self, itminugget, 10);
		 B_LogEntry               (CH1_HelpJesse,"Odda³em 10 bry³ek rudy Bloodowynowi.");
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Hmmm... W³aœnie sobie przypomnia³em, ¿e nie mam teraz tyle rudy.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To znak, cz³owieku! Przemyœl to sobie. P³ac¹c za tego goœcia, wyrzucasz rudê w b³oto!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Teraz jesteœ jednym z nas! Dobra robota! Stra¿y przyda siê ktoœ taki jak ty!
};

//========================================
// Zadanie "Parvez w tarapatach"
//========================================

instance DIA_Bloodwyn_TroublesSolved (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 4;
	condition	= DIA_Bloodwyn_TroublesSolved_Condition;
	information	= DIA_Bloodwyn_TroublesSolved_Info;
	permanent	= 0;
	important 	= TRUE;
};                       

FUNC int DIA_Bloodwyn_TroublesSolved_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_TroublesSolved))
	{
		return 1;
	};
};

FUNC VOID DIA_Bloodwyn_TroublesSolved_Info()
{
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_00"); //Proszê, proszê, nowy bohater z Bractwa! Zaraz siê zrzygam z radoœci!
	AI_Output(other, self, "DIA_Bloodwyn_TroublesSolved_15_01"); //Daruj sobie. Tym razem nieco przesadzi³eœ. Musia³em po³o¿yæ temu kres.
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_02"); //Taaa... I ta banda naæpanych ³ysoli dalej podbiera nam ludzi. Ale oczywiœcie to ty masz racje.
	AI_Output(self, other, "DIA_Bloodwyn_TroublesSolved_03_03"); //Przynajmniej na razie...
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
/*
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //No proszê, to¿ to nasz zdrajca! A my ciê uwa¿aliœmy za jednego z nas.
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Widzê, ¿e przeoczyliœmy jednego z Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To ten Cieñ, który nas zdradzi³!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Zaraz! O czym ty mówisz, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Spikn¹³eœ siê z Nowym Obozem, tak?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Nie, czekaj! Ja dalej...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Co, myœla³eœ, ¿e damy siê tak ³atwo wykiwaæ, hê?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Przestañ gadaæ od rzeczy...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zdrajcy tacy jak ty zas³uguj¹ tylko na œmieræ.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //GIÑ!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, który pilnuje teraz g³ównej bramy, zareagowa³ podobnie jak Bloodwyn. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Bloodwyn, który pilnuje teraz po³udniowej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,	"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Postanowi³eœ zobaczyæ, jak wygl¹da œwiat na zewn¹trz Nowego Obozu, co? To by³ b³¹d!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //No proszê, znudzi³ ci siê twój nowy dom na bagnach? Pope³ni³eœ b³¹d przychodz¹c tutaj.
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? O co ci chodzi?!
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Nie s³ysza³eœ o ataku na wasz¹ kopalniê?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Chwileczkê...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nie chcê ¿adnych k³opotów...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Trzeba by³o o tym pomyœleæ trochê wczeœniej!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //S³uchaj, mam tego serdecznie doœæ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Ja te¿! ZABIÆ GO!!!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e Obozu.");
	};
	
	AI_StopProcessInfos	(self);
};
*/
/*
// *Script was make in Easy Dialog Maker (EDM)
var int replyC;
var int przekupiony;
//========================================
//-----------------> UKLAD
//========================================

INSTANCE DIA_Bloodwyn_UKLAD (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 88;
   condition    = DIA_Bloodwyn_UKLAD_Condition;
   information  = DIA_Bloodwyn_UKLAD_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie propozycjê.";
};

FUNC INT DIA_Bloodwyn_UKLAD_Condition()
{
    if (MIS_SpysProblems == LOG_RUNNING)
    && (Npc_KnowsInfo (hero, DIA_Tippler_NEK_DED))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_UKLAD_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_15_01"); //Mam dla ciebie propozycjê.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_03_02"); //Czego?

    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 30 bry³ek rudy.", DIA_Bloodwyn_UKLAD_30B);
   // Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 50 bry³ek rudy.", DIA_Bloodwyn_UKLAD_50B);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Masz tu 100 bry³ek rudy.", DIA_Bloodwyn_UKLAD_100B);
    Info_AddChoice		(DIA_Bloodwyn_UKLAD, "Ju¿ nic.", DIA_Bloodwyn_UKLAD_NO);
};

FUNC VOID DIA_Bloodwyn_UKLAD_30B()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_30B_15_01"); //Masz tu 30 bry³ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_02"); //Co mam za to niby zrobiæ?
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_30B_15_03"); //Nie bêdziesz pomaga³ Z³emu.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_04"); //Zwariowa³eœ? Z³y zap³aci³ mi znacznie wiêcej.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_30B_03_05"); //Powiem mu o tym zajœciu.
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    B_LogEntry                     (CH1_SpysProblems,"Bloodwyn odrzuci³ moj¹ ofertê. Có¿, 30 bry³ek rudy to faktycznie niezbyt wiele. Chyba powinienem zaproponowaæ wiêcej...");
    Npc_SetPermAttitude (STT_315_Sly, ATT_HOSTILE);
	replyC = true; 
    AI_StopProcessInfos	(self);
};

FUNC VOID DIA_Bloodwyn_UKLAD_50B()
{
if (Npc_HasItems (hero, ItMiNugget)>=50)
    {
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_01"); //Masz tu 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_02"); //I co mam z tym zrobiæ?
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_03"); //WeŸ i nie pomagaj Z³emu. Rozumiemy siê?
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_04"); //Trochê ma³o... Niech ci bêdzie.
    B_LogEntry                     (CH1_SpysProblems,"Bloodwyn pomóg³ mi za 50 bry³ek rudy.");
    B_GiveXP (125);
	przekupiony = true;
    B_GiveInvItems (other, self, ItMiNugget, 50);
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
}
else
{
 AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_50B_15_01"); //Masz tu 50 bry³ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_50B_03_02"); //Gdzie? Poæwicz liczenie, ch³opcze.
replyC = true;
AI_StopProcessInfos	(self);
};
};

FUNC VOID DIA_Bloodwyn_UKLAD_100B()
{
    if (Npc_HasItems (hero, ItMiNugget)>=100)
    {
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_01"); //Masz tu 100 bry³ek rudy.
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_02"); //Nie bêdziesz pomaga³ Z³emu. Rozumiesz?!
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_03"); //Nie tym tonem, ch³opcze.
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_04"); //Pomo¿esz mi czy nie?
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_05"); //Dobra. IdŸ ju¿.
    B_GiveInvItems (other, self, ItMiNugget, 100);
    B_LogEntry                     (CH1_SpysProblems,"Przekupi³em Bloodwyna 100 bry³kami rudy. Cholera, ale drogo...");
    B_GiveXP (50);
	przekupiony = true;
    Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
}
else
{
AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_100B_15_01"); //Masz tu 100 bry³ek rudy.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_100B_03_02"); //Jakie 100 bry³ek? Nie widzê tu tyle! Zje¿d¿aj!
replyC = true; 
AI_StopProcessInfos	(self);
};
};

FUNC VOID DIA_Bloodwyn_UKLAD_NO()
{
    AI_Output (other, self ,"DIA_Bloodwyn_UKLAD_NO_15_01"); //Ju¿ nic.
    AI_Output (self, other ,"DIA_Bloodwyn_UKLAD_NO_03_02"); //Wiêc nie zawracaj mi g³owy!
replyC = true;   
 Info_ClearChoices		(DIA_Bloodwyn_UKLAD);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ZGODA
//========================================

INSTANCE DIA_Bloodwyn_ZGODA (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 82;
   condition    = DIA_Bloodwyn_ZGODA_Condition;
   information  = DIA_Bloodwyn_ZGODA_Info;
   permanent	= FALSE;
   description	= "Mo¿e siê jakoœ dogadamy?";
};

FUNC INT DIA_Bloodwyn_ZGODA_Condition()
{
    if (replyC == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_ZGODA_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_01"); //Mo¿e siê jakoœ dogadamy?
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_02"); //Co masz na myœli?
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_03"); //Dam ci tyle rudy, ile za¿¹dasz.
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_04"); //Dobra. Przynieœ mi...
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_05"); //300 bry³ek rudy.
    AI_Output (other, self ,"DIA_Bloodwyn_ZGODA_15_06"); //Ile?!
    AI_Output (self, other ,"DIA_Bloodwyn_ZGODA_03_07"); //PrzyjdŸ, gdy bêdziesz mia³ rudê.
    B_LogEntry                     (CH1_SpysProblems,"Za 300 bry³ek rudy Bloodwyn bêdzie znów skory do rozmowy.");
};

//========================================
//-----------------> REPLYC
//========================================

INSTANCE DIA_Bloodwyn_REPLYC (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 90;
   condition    = DIA_Bloodwyn_REPLYC_Condition;
   information  = DIA_Bloodwyn_REPLYC_Info;
   permanent	= FALSE;
   description	= "Pogadajmy jeszcze. Mam 300 bry³ek.";
};

FUNC INT DIA_Bloodwyn_REPLYC_Condition()
{
    if(Npc_KnowsInfo (hero, DIA_Bloodwyn_ZGODA))
    && (Npc_HasItems (hero, ItMiNugget)>=300)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_REPLYC_Info()
{
    AI_Output (other, self ,"DIA_Bloodwyn_REPLYC_15_01"); //Pogadajmy jeszcze. Mam 300 bry³ek.
    AI_Output (self, other ,"DIA_Bloodwyn_REPLYC_03_02"); //Dobra. Tyle wystarczy.
    AI_Output (other, self ,"DIA_Bloodwyn_REPLYC_15_03"); //Czyli pomo¿esz mi?
    AI_Output (self, other ,"DIA_Bloodwyn_REPLYC_03_04"); //Tak, idŸ ju¿.
    B_LogEntry                     (CH1_SpysProblems,"Zap³aci³em Bloodwynowi za zerwanie umowy ze Z³ym.");
	B_GiveInvItems (other, self, ItMiNugget, 300);
   Npc_SetPermAttitude (STT_315_Sly, ATT_NEUTRAL);
};
*/

//========================================
//-----------------> helloFriendCH4
//========================================

INSTANCE DIA_Bloodwyn_helloFriendCH4 (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 1;
   condition    = DIA_Bloodwyn_helloFriendCH4_Condition;
   information  = DIA_Bloodwyn_helloFriendCH4_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bloodwyn_helloFriendCH4_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_helloFriendCH4_Info()
{
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_01"); //Kogo ja widzê! Cz³owiek, o którym wszscy gadaj¹, ale którego nikt nie zna.
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_02"); //Dobrze ciê widzieæ. Akurat jest pewna rzecz, w której mo¿esz mi pomóc.
    AI_Output (other, self ,"DIA_Bloodwyn_helloFriendCH4_15_03"); //Hm?
    AI_Output (self, other ,"DIA_Bloodwyn_helloFriendCH4_03_04"); //Nie ma czasu na wyjaœnienia. ChodŸ za mn¹, a poznasz tajemnicê Kruka!
    Npc_ExchangeRoutine (self, "motherfucker");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> MysteryOfRaven
//========================================

INSTANCE DIA_Bloodwyn_MysteryOfRaven (C_INFO)
{
   npc          = Grd_233_Bloodwyn;
   nr           = 2;
   condition    = DIA_Bloodwyn_MysteryOfRaven_Condition;
   information  = DIA_Bloodwyn_MysteryOfRaven_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Bloodwyn_MysteryOfRaven_Condition()
{
    if (kapitel >= 4) && (Npc_GetDistToWP (self, "SPAWN_MOLERAT02_SPAWN01") < 500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Bloodwyn_MysteryOfRaven_Info()
{
    AI_Output (self, other ,"DIA_Bloodwyn_MysteryOfRaven_03_01"); //Naprawdê dziwiê siê, ¿e ¿yjesz tak d³ugo. Jesteœ naiwny, a¿ do bólu.
    AI_Output (other, self ,"DIA_Bloodwyn_MysteryOfRaven_15_02"); //A mo¿e po prostu chcia³em wykorzystaæ okazjê, ¿eby ciê zabiæ?
    AI_Output (self, other ,"DIA_Bloodwyn_MysteryOfRaven_03_03"); //Nie dam ci tej przyjemnoœci. Wkrótce wszystko siê zmieni, ale ty ju¿ tego nie zobaczysz. 
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
};