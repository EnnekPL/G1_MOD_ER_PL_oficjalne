// *Script was make in Easy Dialog Maker (EDM)
/*
//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Ashton_HELLO1 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_HELLO1_Condition;
   information  = DIA_Ashton_HELLO1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Ashton_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ashton_HELLO1_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_02"); //Jestem Ashton, wojownik Innosa!
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_03"); //�owca Poszukiwaczy i innego plugastwa.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_04"); //Niegdy� by�em paladynem Innosa, ale dopu�ci�em si� straszliwej zbrodni.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_05"); //Przez to zosta�em tutaj wrzucony.
    AI_Output (self, other ,"DIA_Ashton_HELLO1_03_06"); //Ale nie upad�em. B�d� dalej kontynuowa� swoj� misj� - misj� oczyszczania.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Ashton by� paladynem. Teraz jako �owca Poszukiwaczy kontynuuje swoj� misj�. Mog� go znale�� przy starej Cytadeli.");
};

//========================================
//-----------------> HELLO2
//========================================
var int AshtonTeach;
INSTANCE DIA_Ashton_HELLO2 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_HELLO2_Condition;
   information  = DIA_Ashton_HELLO2_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_Ashton_HELLO2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO2_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO2_15_01"); //Mo�esz mnie czego� nauczy�?
    AI_Output (self, other ,"DIA_Ashton_HELLO2_03_02"); //Mog� nauczy� ci� jak strzela� z kuszy.
	if (AshtonTeach == false)
	{
	Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Ashton, �owca Poszukiwaczy, nauczy mnie jak strzela� z kuszy.");
	AshtonTeach = true;
	};
    if (Wld_IsTime     (00,00,04,00))
    {
        AI_Output (self, other ,"DIA_Ashton_HELLO2_03_03"); //Mo�emy zacz�� trening.
	Info_ClearChoices (DIA_Ashton_HELLO2);
	Info_Addchoice 	(DIA_Ashton_HELLO2,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),AshtonCros1);
	Info_Addchoice 	(DIA_Ashton_HELLO2,DIALOG_BACK,Ashton_CROSSBOW_BACK);
    }
    else
    {
        AI_Output (self, other ,"DIA_Ashton_HELLO2_03_04"); //Przyjd� wieczorem na nasze spotkanie. Teraz nie mam czasu.
    };
};
func void Ashton_CROSSBOW_BACK()
{
	Info_ClearChoices (DIA_Ashton_HELLO2);
};

func void AshtonCros1()
{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"Ashton_AshtonCros1_13_02"); //Dobra. Bierzmy si� do roboty.
			AI_Output (self, other,"Ashton_AshtonCros1_13_03"); //Z�ap kusz� mocno i oprzyj j� o rami�. To powinno zwi�kszy� celno�� strza�u.
			AI_Output (self, other,"Ashton_AshtonCros1_13_04"); //Przez kilka pierwszych dni twoje rami� da ci si� nie�le we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"Ashton_AshtonCros1_13_05"); //Po jakim� tygodniu b�dziesz mia� r�ce ze stali!
			AI_Output (self, other,"Ashton_AshtonCros1_13_06"); //Wyceluj spokojnie i powoli �ci�gnij spust. Be�t niesie ze sob� wi�cej si�y ni� strza�a, dlatego powoduje wi�ksze zniszczenia.
			//B_GiveInvItems (hero,other,ItMiNugget,200);
			DIA_Ashton_HELLO2.permanent = 0;
		};
};
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Ashton_EXIT(C_INFO)
{
	npc             = NON_3089_Ashton;
	nr              = 999;
	condition		= DIA_Ashton_EXIT_Condition;
	information		= DIA_Ashton_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Ashton_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ashton_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/
/*
instance  Ashton_CROSSBOW2 (C_INFO)
{
	npc				= NON_3089_Ashton;
	condition		= Ashton_CROSSBOW2_Condition;
	information		= Ashton_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy."; 
};

FUNC int  Ashton_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  (hero, NPC_TALENT_CROSSBOW) == 1) 
	{
		return TRUE;
	};

};
FUNC void  Ashton_CROSSBOW2_Info()
{
	AI_Output (other, self,"Ashton_CROSSBOW2_Info_15_01"); //Chcia�bym dowiedzie� si� czego� wi�cej o strzelaniu z kuszy.
	AI_Output (self, other,"Ashton_CROSSBOW2_Info_13_02"); //To ci� b�dzie kosztowa� 300 bry�ek rudy.
  
	Info_ClearChoices (Ashton_CROSSBOW2);
	Info_Addchoice 	(Ashton_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),Ashton_CROSSBOW2_OK);
	Info_Addchoice 	(Ashton_CROSSBOW2,DIALOG_BACK,  Ashton_CROSSBOW2_BACK);
	

};  
func void Ashton_CROSSBOW2_BACK()
{
	Info_ClearChoices (Ashton_CROSSBOW2);
};

func void Ashton_CROSSBOW2_OK()
{
	AI_Output (other, self,"Ashton_CROSSBOW2_OK_15_01"); //Zaczynajmy.
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza�y b�d� celniejsze, je�li przed �ci�gni�ciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_03"); //Naucz si� poprawnie ocenia� pr�dko�� z jak� porusza si� tw�j cel.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci�� �cie�k�, kt�r� porusza si� cel.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_05"); //Je�li atakujesz wi�cej ni� jeden cel, nie tra� czasu: musisz mo�liwie szybko przygwo�dzi� jeden za drugim dobrze wymierzonymi strza�ami.
		AI_Output (self, other,"Ashton_CROSSBOW2_OK_13_06"); //To by by�o na tyle.
		//B_GiveInvItems (hero,other,ItMiNugget,300);
		Ashton_CROSSBOW2.permanent = 0;
		};
};
//========================================
//-----------------> HELLO3
//========================================

INSTANCE DIA_Ashton_HELLO3 (C_INFO)
{
   npc          = NON_3089_Ashton ;
   nr           = 3;
   condition    = DIA_Ashton_HELLO3_Condition;
   information  = DIA_Ashton_HELLO3_Info;
   permanent	= FALSE;
   description	= "Jak walczysz z Poszukiwaczami?";
};

FUNC INT DIA_Ashton_HELLO3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    && (Wld_IsTime     (00,00,04,00))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO3_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO3_15_01"); //Jak walczysz z Poszukiwaczami?
    AI_Output (self, other ,"DIA_Ashton_HELLO3_03_02"); //Atakuj� przyczajony. Ostrzeliwuj� ich z kuszy i uwa�am na ich magi�.
    B_LogEntry                     (CH1_LowcyPoszukiwaczy,"Ashton atakuje przy u�yciu kuszy. Trzyma si� na dystans i uwa�a na magi�.");

    B_GiveXP (50);
};

//========================================
//-----------------> HELLO4
//========================================

INSTANCE DIA_Ashton_HELLO4 (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 4;
   condition    = DIA_Ashton_HELLO4_Condition;
   information  = DIA_Ashton_HELLO4_Info;
   permanent	= FALSE;
   description	= "Szukasz tu czego�?";
};

FUNC INT DIA_Ashton_HELLO4_Condition()
{
    if (Wld_IsTime (06,00,00,00))
    && (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELLO4_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELLO4_15_01"); //Szukasz tu czego�?
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_02"); //Tak w�a�ciwie to ju� znalaz�em.
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_03"); //Przy tej Cytadeli znajduje si� o�tarz, na kt�rym Poszukiwacze odprawiaj� dziwne obrz�dy.
    AI_Output (self, other ,"DIA_Ashton_HELLO4_03_04"); //Musimy si� go pozby�. Chod� za mn�!
	Npc_ExchangeRoutine (NON_3089_Ashton,"bicz");
    MIS_Cytadelaposzukiwacz = LOG_RUNNING;
	Wld_InsertNpc				(NON_3081_Poszukiwacz,"OC1");	
	B_SetPermAttitude	(NON_3081_Poszukiwacz,	ATT_HOSTILE);
	NON_3081_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3082_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_3082_Poszukiwacz,	ATT_HOSTILE);
	NON_3082_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3083_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_3083_Poszukiwacz,	ATT_HOSTILE);
	NON_3083_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_3084_Poszukiwacz,"OC1");	
	B_SetPermAttitude	(NON_3084_Poszukiwacz,	ATT_HOSTILE);
	NON_3084_Poszukiwacz.guild = GIL_MOLERAT;
	Wld_InsertNpc				(NON_7067_Poszukiwacz,"OC1");
	B_SetPermAttitude	(NON_7067_Poszukiwacz,	ATT_HOSTILE);
	NON_7067_Poszukiwacz.guild = GIL_MOLERAT;
    Log_CreateTopic            (CH1_Cytadelaposzukiwacz, LOG_MISSION);
    Log_SetTopicStatus       (CH1_Cytadelaposzukiwacz, LOG_RUNNING);
    B_LogEntry                     (CH1_Cytadelaposzukiwacz,"Ashton odkry� tajemniczy o�tarz Poszukiwaczy w pobli�u starej Cytadeli. Musimy go zniszczy� nim stanie si� co� z�ego.");
    self.aivar[AIV_PARTYMEMBER] = TRUE;
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> KillAll
//========================================

INSTANCE DIA_Ashton_KillAll (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_KillAll_Condition;
   information  = DIA_Ashton_KillAll_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_KillAll_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO4))
    && (Npc_IsDead(NON_3081_Poszukiwacz))
    && (Npc_IsDead(NON_3082_Poszukiwacz))
    && (Npc_IsDead(NON_3083_Poszukiwacz))
    && (Npc_IsDead(NON_3084_Poszukiwacz))
    && (Npc_IsDead(NON_7067_Poszukiwacz))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_KillAll_Info()
{
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_01"); //Pozbyli�my si� ich! 
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_02"); //�wietna robota!
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_03"); //Je�eli chcesz mo�esz sprawdzi� jeszcze t� jaskini�.
    AI_Output (self, other ,"DIA_Ashton_KillAll_03_04"); //Ja wracam szuka� Czarnego Maga.
    B_LogEntry                     (CH1_Cytadelaposzukiwacz,"Wyeliminowali�my Poszukiwaczy odprawiaj�cych rytua�y w pobli�u starej Cytadeli.");
    Log_SetTopicStatus       (CH1_Cytadelaposzukiwacz, LOG_SUCCESS);
    MIS_Cytadelaposzukiwacz = LOG_SUCCESS;

    B_GiveXP (500);
    Npc_ExchangeRoutine (self,"START");
};
//========================================
//-----------------> Zbrodnia
//========================================

INSTANCE DIA_Ashton_Zbrodnia (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_Zbrodnia_Condition;
   information  = DIA_Ashton_Zbrodnia_Info;
   permanent	= FALSE;
   description	= "Jakiej zbrodni si� dopu�ci�e�?";
};

FUNC INT DIA_Ashton_Zbrodnia_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_HELLO1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_Zbrodnia_Info()
{
    AI_Output (other, self ,"DIA_Ashton_Zbrodnia_15_01"); //Jakiej zbrodni si� dopu�ci�e�?
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_02"); //Zabi�em jednego z Nowicjuszy Ognia. To by� oszust. Przyby� do Klasztoru tylko w poszukiwaniu �atwego zarobku.
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_03"); //Zbezcze�ci� �wi�te mury!
    AI_Output (other, self ,"DIA_Ashton_Zbrodnia_15_04"); //To haniebne, ale chyba nie zas�ugiwa� na �mier�. S� gorsi ludzie na tym �wiecie. 
    AI_Output (self, other ,"DIA_Ashton_Zbrodnia_03_05"); //C�... Teraz nie przywr�c� mu �ycia.
};

//========================================
//-----------------> PosuzkiwaczeInfo
//========================================

INSTANCE DIA_Ashton_PosuzkiwaczeInfo (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_PosuzkiwaczeInfo_Condition;
   information  = DIA_Ashton_PosuzkiwaczeInfo_Info;
   permanent	= FALSE;
   description	= "Wiesz co� o Poszukiwaczach?";
};

FUNC INT DIA_Ashton_PosuzkiwaczeInfo_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Ashton_PosuzkiwaczeInfo_Info()
{
    AI_Output (other, self ,"DIA_Ashton_PosuzkiwaczeInfo_15_01"); //Wiesz co� o Poszukiwaczach?
    AI_Output (self, other ,"DIA_Ashton_PosuzkiwaczeInfo_03_02"); //Z tego co s�ysza�em od Jefreya to s�u�� Czarnemu Magowi. Nie wiem nawet kim jest ten mag. 
    AI_Output (other, self ,"DIA_Ashton_PosuzkiwaczeInfo_15_03"); //Jefrey dowiedzia� si� tego ode mnie. Spotka�em si� ze s�ug� Czarnego Maga - niejakim Nidasem. 
    AI_Output (self, other ,"DIA_Ashton_PosuzkiwaczeInfo_03_04"); //Sam widzisz. Ledwo wiemy z czym walczymy. 
};

//========================================
//-----------------> POMOC
//========================================

INSTANCE DIA_Ashton_POMOC (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_POMOC_Condition;
   information  = DIA_Ashton_POMOC_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_POMOC_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Avallach_Zabity))
    && (!Npc_KnowsInfo (hero, DIA_Avallach_Lekikurwa))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_POMOC_Info()
{
    AI_Output (self, other ,"DIA_Ashton_POMOC_03_01"); //Jasna cholera! Co si� tam dzieje?! Ha�asy s�ysza�em ju� z Cytadeli! 
    AI_Output (self, other ,"DIA_Ashton_POMOC_03_02"); //P�dzi�em co si� w nogach. Co si� sta�o?!
    AI_Output (other, self ,"DIA_Ashton_POMOC_15_03"); //Czarny Mag ukrywa si� w twierdzy! To pewne. Avallach zosta� trafiony zatrut� strza�� i pilnie potrzebuje lekarstwa. Lester go os�ania.
    AI_Output (other, self ,"DIA_Ashton_POMOC_15_04"); //Id� szybko mu pom�c! Mamy ma�o czasu.
    B_LogEntry                     (CH1_WlakaZczarym,"Ashton przyby� z Cytadeli. Pomo�e w zamku. Tymczasem ja musz� si� pospieszy�.");

    B_GiveXP (400);
    Npc_ExchangeRoutine (NON_3089_Ashton, "defAv");
    AI_StopProcessInfos	(self);
};
//========================================
//-----------------> SUKCES
//========================================

INSTANCE DIA_Ashton_SUKCES (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_SUKCES_Condition;
   information  = DIA_Ashton_SUKCES_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_SUKCES_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(NON_3073_Czarny_Mag);
    if (Npc_KnowsInfo (hero, DIA_Ashton_POMOC))
    && (Npc_IsDead(whodie0)) && (Er_StoryBM_Run == true)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_SUKCES_Info()
{
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_01"); //Pokona�e� go! Dobra robota, bracie! Wreszcie mo�emy odetchn��.
    AI_Output (other, self ,"DIA_Ashton_SUKCES_15_02"); //Niestety dla mnie to nie koniec pracy.
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_03"); //Wiem. Dlatego zanim odejd�, chcia�bym ci da� ten miecz. Znalaz�em go w okolicy Cytadeli. 
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_04"); //To dobra bro�. My�l�, �e b�dzie ci dobrze s�u�y�.
    CreateInvItems (self, Miecz2H1, 1);
    B_GiveInvItems (self, other, Miecz2H1, 1);
    AI_Output (self, other ,"DIA_Ashton_SUKCES_03_05"); //Je�eli b�dziesz mnie kiedy� szuka�, to b�d� w Nowym Obozie. Znajd� sobie jakie� ciche miejsce.
    Npc_ExchangeRoutine (self, "camp");
	B_givexp (250);
    AI_StopProcessInfos	(self);
};


//========================================
//-----------------> AGAIN
//========================================

INSTANCE DIA_Ashton_AGAIN (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 1;
   condition    = DIA_Ashton_AGAIN_Condition;
   information  = DIA_Ashton_AGAIN_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Ashton_AGAIN_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_SUKCES))
    && (Npc_GetDistToWP (self, "NC_LO_11") < 3000)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_AGAIN_Info()
{
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_01"); //A wi�c znowu si� spotykamy! Wiedzia�em, �e tak si� stanie.
    AI_Output (other, self ,"DIA_Ashton_AGAIN_15_02"); //Widz�, �e zosta�e� Najemnikiem. 
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_03"); //Tak, masz racj�. Wybra�em spokojne �ycie w Nowym Obozie. 
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_04"); //Zajmuj� si� tu g��wnie stra�� i wypatrywaniem zagro�enia ze strony Starego Obozu.
    AI_Output (self, other ,"DIA_Ashton_AGAIN_03_05"); //Wprawdzie �pi� pod go�ym niebem, ale wielu mieszka�c�w Kolonii ma gorzej. Tym si� pocieszam i przy tej my�li zostan�.
    AI_Output (other, self ,"DIA_Ashton_AGAIN_15_06"); //Powodzenia.
};

//========================================
//-----------------> HELEOLLL
//========================================

INSTANCE DIA_Ashton_HELEOLLL (C_INFO)
{
   npc          = NON_3089_Ashton;
   nr           = 2;
   condition    = DIA_Ashton_HELEOLLL_Condition;
   information  = DIA_Ashton_HELEOLLL_Info;
   permanent	= TRUE;
   description	= "Jak leci?";
};

FUNC INT DIA_Ashton_HELEOLLL_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Ashton_AGAIN))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Ashton_HELEOLLL_Info()
{
    AI_Output (other, self ,"DIA_Ashton_HELEOLLL_15_01"); //Jak leci?
    AI_Output (self, other ,"DIA_Ashton_HELEOLLL_03_02"); //W porz�dku. Nowy Ob�z na razie jest bezpieczny.
};
*/
