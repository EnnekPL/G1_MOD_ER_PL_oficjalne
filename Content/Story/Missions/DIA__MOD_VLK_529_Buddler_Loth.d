//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Buddler529_EXIT(C_INFO)
{
	npc             = VLK_529_Buddler;
	nr              = 999;
	condition		= DIA_Buddler529_EXIT_Condition;
	information		= DIA_Buddler529_EXIT_Info;
	permanent		= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Buddler529_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Buddler529_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LOTH1
//========================================

INSTANCE DIA_Buddler_LOTH1 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_LOTH1_Condition;
   information  = DIA_Buddler_LOTH1_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Buddler_LOTH1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_LOTH1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH1_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Buddler_LOTH1_03_02"); //A co je�eli powiedzia�bym, �e jestem Loth � robotnik porwany z portu w Vengardzie?
    AI_Output (other, self ,"DIA_Buddler_LOTH1_15_03"); //Odpowiedzia�bym, �e ja jestem skaza�cem.
    AI_Output (self, other ,"DIA_Buddler_LOTH1_03_04"); //Wi�c jestem Loth.
};

//========================================
//-----------------> LOTH2
//========================================

INSTANCE DIA_Buddler_LOTH2 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_LOTH2_Condition;
   information  = DIA_Buddler_LOTH2_Info;
   permanent	= FALSE;
   description	= "Od dawna tu jeste�? ";
};

FUNC INT DIA_Buddler_LOTH2_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_LOTH1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_LOTH2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH2_15_01"); //Od dawna tu jeste�? 
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_02"); //Od kilku lat. Ja i czterech takich byli�my ostatni� parti� �ywego towaru, kt�r� szajka Sandora dostarczy�a do Kolonii przed rozbiciem przez kr�lewskich.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_03"); //To si� dopiero nazywa pech.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_04"); //Pech, pech i ca�e �ycie pech. Pechowe ma��e�stwo, pechowa praca � straci�em w stoczni dwa palce � i na ko�cu jeszcze porwany przez bandyt�w i zmuszony do do�ywotniej pracy ponad si�y w kopalni.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_05"); //Chyba jedyn� dobr� rzecz� jaka mi si� przydarzy�a w �yciu jest to, �e Magiczna Bariera uwolni�a mnie od tej starej j�dzy.
};

//========================================
//-----------------> LOTH3
//========================================

INSTANCE DIA_Buddler_LOTH3 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 3;
   condition    = DIA_Buddler_LOTH3_Condition;
   information  = DIA_Buddler_LOTH3_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Buddler_LOTH3_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_LOTH1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_LOTH3_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH3_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Buddler_LOTH3_03_02"); //Harowa�em jak dziki w�, by m�c teraz przez jaki� czas posiedzie� w Starym Obozie.
    AI_Output (self, other ,"DIA_Buddler_LOTH3_03_03"); //Jaka szkoda, �e ten wolny czas pr�dzej, czy p�niej dobiegnie ko�ca i zn�w ca�ymi dniami b�d� musia� tyra� w tej przekl�tej kopalni.
};

//========================================
//-----------------> LOTH4
//========================================

INSTANCE DIA_Buddler_LOTH4 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 4;
   condition    = DIA_Buddler_LOTH4_Condition;
   information  = DIA_Buddler_LOTH4_Info;
   permanent	= FALSE;
   description	= "Kto tu rz�dzi?";
};

FUNC INT DIA_Buddler_LOTH4_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_LOTH1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_LOTH4_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH4_15_01"); //Kto tu rz�dzi?
    AI_Output (self, other ,"DIA_Buddler_LOTH4_03_02"); //Powiedzia�bym, �e bandyci, ale to miano chyba r�wnie dobrze pasuje do wielkich kupc�w z gildii Araxos, posiadaczy stoczni, kr�lewskich urz�dnik�w i do samego kr�la Rhobara.
    AI_Output (self, other ,"DIA_Buddler_LOTH4_03_03"); //W sumie to sam m�g�by� mi odpowiedzie� na to pytanie, ale skoro je zada�e� to raczej mi nie odpowiesz.
};

//========================================
//-----------------> LOTH5
//========================================

INSTANCE DIA_Buddler_LOTH5 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 5;
   condition    = DIA_Buddler_LOTH5_Condition;
   information  = DIA_Buddler_LOTH5_Info;
   permanent	= FALSE;
   description	= "Co mo�esz mi powiedzie� o tym miejscu?";
};

FUNC INT DIA_Buddler_LOTH5_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Buddler_LOTH1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_LOTH5_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH5_15_01"); //Co mo�esz mi powiedzie� o tym miejscu?
    AI_Output (self, other ,"DIA_Buddler_LOTH5_03_02"); //Lekko tu nie jest, ale o niebo lepiej ni� przy wydobyciu rudy w Starej Kopalni. Tam to dopiero �ycie daje w ko��.
    AI_Output (self, other ,"DIA_Buddler_LOTH5_03_03"); //Tutaj musisz uwa�a� jedynie na Bloodwyna i innych co bardziej agresywnych typk�w, a tam na agresywnych typk�w i na wszechobecne pe�zacze.
    AI_Output (self, other ,"DIA_Buddler_LOTH5_03_04"); //Wybierz sobie, co ci lepiej pasuje.
};


//========================================
//-----------------> NIEPOKORNY1
//========================================

INSTANCE DIA_Buddler_NIEPOKORNY1 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 1;
   condition    = DIA_Buddler_NIEPOKORNY1_Condition;
   information  = DIA_Buddler_NIEPOKORNY1_Info;
   permanent	= FALSE;
   description	= "Podobno Oned to tw�j kumpel.";
};

FUNC INT DIA_Buddler_NIEPOKORNY1_Condition()
{
    if (Npc_KnowsInfo (hero, DIA_Gardist_NIEPOKORNY1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_NIEPOKORNY1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_01"); //Podobno Oned to tw�j kumpel.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_02"); //Tak, i co ci do tego?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_03"); //Nie p�aci Stra�nikom za ochron�.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_04"); //To nie moja sprawa.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_05"); //Teraz ju� twoja.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_06"); //Bo co? Nie b�d� spiskowa� przeciwko Onedowi!

    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "C�, skoro nie rozumiesz moich s��w to mo�e zrozumiesz czyny!", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "C�, ka�dy ma swoj� cen�... Zw�aszcza w tej Kolonii. ", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "Nied�ugo Oned dostanie baty od Stra�nik�w , zapewne nie zapomn� r�wnie� o jego dobrym kumplu. ", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_15_01"); //C�, skoro nie rozumiesz moich s��w to mo�e zrozumiesz czyny!
	AI_DrawWeapon (other);
    if ((hero.attribute[ATR_STRENGTH] >= 30) && (hero.attribute[ATR_DEXTERITY] >= 20))
    {
        NiepokornyKopacz = 1;
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_03_02"); //No dobrze ju�! Schowaj ten miecz. W�a�ciwie czego ode mnie chcesz?
		AI_RemoveWeapon (other);
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_03_03"); //Nie boje si�. Nie tak �atwo mnie zastraszy�!
        B_LogEntry                     (CH1_Niepokorny_Kopacz,"Pr�bowa�em porozmawia� z Lothem. Nie da� si� zastraszy�.");
        Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_FAILED);
        MIS_Niepokorny_Kopacz = LOG_FAILED;
    };
    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_15_01"); //C�, ka�dy ma swoj� cen�... Zw�aszcza w Kolonii. 
	
    if Npc_HasItems(other, ItMiNugget) >= 30
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_02"); //Nie najlepiej u mnie z rud�, ledwo starcza na jedzenie� Daj 30 bry�ek i mo�emy kontynuowa� rozmow�. 
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_03"); //Prosz� bardzo.
        B_GiveInvItems (other, self, ItMiNugget, 30);
        NiepokornyKopacz = 1;
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_04"); //Nie, bez tej rudy dam sobie rad�. A je�li ci nie pomog� to Onedowi pewnie te� nic nie b�dzie.
        B_LogEntry                     (CH1_Niepokorny_Kopacz,"Pr�bowa�em porozmawia� z Lothem. Nie uda�o mi si� go przekupi�.");
        Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_FAILED);
        MIS_Niepokorny_Kopacz = LOG_FAILED;
    };
    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_15_01"); //Nied�ugo Oned dostanie baty od Stra�nik�w, zapewne nie zapomn� r�wnie� o jego dobrym kumplu. 
   // if (hero.attribute[ATR_DEXTERITY] >= 2)
  //  {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_03_02"); //C�... Jednak jest w tym troch� racji, czego chcesz?
        NiepokornyKopacz = 1;
  //  }
  //  else
   // {
        //AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_03_03"); //To tylko gdybanie. Mo�e �aden Stra�nik go nie tknie, w ko�cu wtedy inni Kopacze by go poparli.
     //   B_LogEntry                     (CH1_Niepokorny_Kopacz,"");
    //    Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_FAILED);
    //    MIS_Niepokorny_Kopacz = LOG_FAILED;
   // };
    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
};

//========================================
//-----------------> NIEPOKORNY2
//========================================

INSTANCE DIA_Buddler_NIEPOKORNY2 (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_NIEPOKORNY2_Condition;
   information  = DIA_Buddler_NIEPOKORNY2_Info;
   permanent	= FALSE;
   description	= "Skoro ju� ci� przekona�em to zrobisz co ci ka��. Nak�onisz Oneda do wsp�lnej ucieczki.";
};

FUNC INT DIA_Buddler_NIEPOKORNY2_Condition()
{
    if (NiepokornyKopacz == 1)
    && (Npc_KnowsInfo (hero, DIA_Buddler_NIEPOKORNY1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_NIEPOKORNY2_Info()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_01"); //Skoro ju� ci� przekona�em to zrobisz co ci ka��. Nak�onisz Oneda do wsp�lnej ucieczki.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_02"); //Chcesz, �eby�my si� wynie�li z tego Obozu?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_03"); //Oszala�e�. Gdyby�cie nawali wkr�tce reszta Kopaczy by tego spr�bowa�a.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_04"); //W czasie waszej ucieczki wpadniecie w zasadzk�. 
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_05"); //Mamy wpa�� w �apy Stra�y?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_06"); //Nie, powinni by� to Kopacze. To pokaza�oby ich sprzeciw wobec dzia�a� Oneda. 
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_07"); //Kt�rzy Kopacze by si� do tego nadali?
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_08"); //Chocia�by Tippler , Uscan no i pewnie Herek.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_09"); //Dobrze. Pogadaj teraz z Onedem, ustal termin ucieczki na najbli�sz� p�noc.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_10"); //Zrozumia�em.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Uda�o mi si� przekona� Lotha do wsp�pracy. Zaproponuje Onedowi ucieczk� z Obozu podczas kt�rej obaj wpadn� w przygotowan� przez przekupionych Kopaczy zasadzk�.");
};


//========================================
//-----------------> BuddlersPaid
//========================================

INSTANCE DIA_Buddler_BuddlersPaid (C_INFO)
{
   npc          = VLK_529_Buddler;
   nr           = 2;
   condition    = DIA_Buddler_BuddlersPaid_Condition;
   information  = DIA_Buddler_BuddlersPaid_Info;
   permanent	= FALSE;
   description	= "Ustali�e� termin? ";
};

FUNC INT DIA_Buddler_BuddlersPaid_Condition()
{
    if (NiepokornyKopacz == 1)
    && (Npc_KnowsInfo (hero, DIA_Buddler_NIEPOKORNY1USKAN))
	&& (Npc_KnowsInfo (hero, DIA_Herek_NIEPOKORNY1))
	&& (Npc_KnowsInfo (hero, DIA_Tippler_NIEPOKORNY1))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Buddler_BuddlersPaid_Info()
{
    AI_Output (other, self ,"DIA_Buddler_BuddlersPaid_15_01"); //Ustali�e� termin?
    AI_Output (self, other ,"DIA_Buddler_BuddlersPaid_03_02"); //Tak, o p�nocy wiejemy.
    AI_Output (other, self ,"DIA_Buddler_BuddlersPaid_15_03"); //Doskonale. 
    
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Loth ustali� termin ucieczki z Onedem. Wkr�tce obaj dostan� nauczk�.");
	
	 NiepokornyKopacz = Wld_GetDay();
};

