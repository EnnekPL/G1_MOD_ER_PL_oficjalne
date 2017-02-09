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
   description	= "Kim jesteœ?";
};

FUNC INT DIA_Buddler_LOTH1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Buddler_LOTH1_Info()
{
    AI_Output (other, self ,"DIA_Buddler_LOTH1_15_01"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Buddler_LOTH1_03_02"); //A co je¿eli powiedzia³bym, ¿e jestem Loth – robotnik porwany z portu w Vengardzie?
    AI_Output (other, self ,"DIA_Buddler_LOTH1_15_03"); //Odpowiedzia³bym, ¿e ja jestem skazañcem.
    AI_Output (self, other ,"DIA_Buddler_LOTH1_03_04"); //Wiêc jestem Loth.
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
   description	= "Od dawna tu jesteœ? ";
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
    AI_Output (other, self ,"DIA_Buddler_LOTH2_15_01"); //Od dawna tu jesteœ? 
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_02"); //Od kilku lat. Ja i czterech takich byliœmy ostatni¹ parti¹ ¿ywego towaru, któr¹ szajka Sandora dostarczy³a do Kolonii przed rozbiciem przez królewskich.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_03"); //To siê dopiero nazywa pech.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_04"); //Pech, pech i ca³e ¿ycie pech. Pechowe ma³¿eñstwo, pechowa praca – straci³em w stoczni dwa palce – i na koñcu jeszcze porwany przez bandytów i zmuszony do do¿ywotniej pracy ponad si³y w kopalni.
    AI_Output (self, other ,"DIA_Buddler_LOTH2_03_05"); //Chyba jedyn¹ dobr¹ rzecz¹ jaka mi siê przydarzy³a w ¿yciu jest to, ¿e Magiczna Bariera uwolni³a mnie od tej starej jêdzy.
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
   description	= "Co s³ychaæ?";
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
    AI_Output (other, self ,"DIA_Buddler_LOTH3_15_01"); //Co s³ychaæ?
    AI_Output (self, other ,"DIA_Buddler_LOTH3_03_02"); //Harowa³em jak dziki wó³, by móc teraz przez jakiœ czas posiedzieæ w Starym Obozie.
    AI_Output (self, other ,"DIA_Buddler_LOTH3_03_03"); //Jaka szkoda, ¿e ten wolny czas prêdzej, czy póŸniej dobiegnie koñca i znów ca³ymi dniami bêdê musia³ tyraæ w tej przeklêtej kopalni.
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
   description	= "Kto tu rz¹dzi?";
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
    AI_Output (other, self ,"DIA_Buddler_LOTH4_15_01"); //Kto tu rz¹dzi?
    AI_Output (self, other ,"DIA_Buddler_LOTH4_03_02"); //Powiedzia³bym, ¿e bandyci, ale to miano chyba równie dobrze pasuje do wielkich kupców z gildii Araxos, posiadaczy stoczni, królewskich urzêdników i do samego króla Rhobara.
    AI_Output (self, other ,"DIA_Buddler_LOTH4_03_03"); //W sumie to sam móg³byœ mi odpowiedzieæ na to pytanie, ale skoro je zada³eœ to raczej mi nie odpowiesz.
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
   description	= "Co mo¿esz mi powiedzieæ o tym miejscu?";
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
    AI_Output (other, self ,"DIA_Buddler_LOTH5_15_01"); //Co mo¿esz mi powiedzieæ o tym miejscu?
    AI_Output (self, other ,"DIA_Buddler_LOTH5_03_02"); //Lekko tu nie jest, ale o niebo lepiej ni¿ przy wydobyciu rudy w Starej Kopalni. Tam to dopiero ¿ycie daje w koœæ.
    AI_Output (self, other ,"DIA_Buddler_LOTH5_03_03"); //Tutaj musisz uwa¿aæ jedynie na Bloodwyna i innych co bardziej agresywnych typków, a tam na agresywnych typków i na wszechobecne pe³zacze.
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
   description	= "Podobno Oned to twój kumpel.";
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
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_01"); //Podobno Oned to twój kumpel.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_02"); //Tak, i co ci do tego?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_03"); //Nie p³aci Stra¿nikom za ochronê.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_04"); //To nie moja sprawa.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_15_05"); //Teraz ju¿ twoja.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_03_06"); //Bo co? Nie bêdê spiskowa³ przeciwko Onedowi!

    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "Có¿, skoro nie rozumiesz moich s³ów to mo¿e zrozumiesz czyny!", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "Có¿, ka¿dy ma swoj¹ cenê... Zw³aszcza w tej Kolonii. ", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY);
    Info_AddChoice		(DIA_Buddler_NIEPOKORNY1, "Nied³ugo Oned dostanie baty od Stra¿ników , zapewne nie zapomn¹ równie¿ o jego dobrym kumplu. ", DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_15_01"); //Có¿, skoro nie rozumiesz moich s³ów to mo¿e zrozumiesz czyny!
	AI_DrawWeapon (other);
    if ((hero.attribute[ATR_STRENGTH] >= 30) && (hero.attribute[ATR_DEXTERITY] >= 20))
    {
        NiepokornyKopacz = 1;
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_03_02"); //No dobrze ju¿! Schowaj ten miecz. W³aœciwie czego ode mnie chcesz?
		AI_RemoveWeapon (other);
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1SCARE_03_03"); //Nie boje siê. Nie tak ³atwo mnie zastraszyæ!
        B_LogEntry                     (CH1_Niepokorny_Kopacz,"Próbowa³em porozmawiaæ z Lothem. Nie da³ siê zastraszyæ.");
        Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_FAILED);
        MIS_Niepokorny_Kopacz = LOG_FAILED;
    };
    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_15_01"); //Có¿, ka¿dy ma swoj¹ cenê... Zw³aszcza w Kolonii. 
	
    if Npc_HasItems(other, ItMiNugget) >= 30
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_02"); //Nie najlepiej u mnie z rud¹, ledwo starcza na jedzenie… Daj 30 bry³ek i mo¿emy kontynuowaæ rozmowê. 
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_03"); //Proszê bardzo.
        B_GiveInvItems (other, self, ItMiNugget, 30);
        NiepokornyKopacz = 1;
    }
    else
    {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1BUY_03_04"); //Nie, bez tej rudy dam sobie radê. A jeœli ci nie pomogê to Onedowi pewnie te¿ nic nie bêdzie.
        B_LogEntry                     (CH1_Niepokorny_Kopacz,"Próbowa³em porozmawiaæ z Lothem. Nie uda³o mi siê go przekupiæ.");
        Log_SetTopicStatus       (CH1_Niepokorny_Kopacz, LOG_FAILED);
        MIS_Niepokorny_Kopacz = LOG_FAILED;
    };
    Info_ClearChoices		(DIA_Buddler_NIEPOKORNY1);
};

FUNC VOID DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE()
{
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_15_01"); //Nied³ugo Oned dostanie baty od Stra¿ników, zapewne nie zapomn¹ równie¿ o jego dobrym kumplu. 
   // if (hero.attribute[ATR_DEXTERITY] >= 2)
  //  {
        AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_03_02"); //Có¿... Jednak jest w tym trochê racji, czego chcesz?
        NiepokornyKopacz = 1;
  //  }
  //  else
   // {
        //AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY1_NIEPOKORNY1PERSUADE_03_03"); //To tylko gdybanie. Mo¿e ¿aden Stra¿nik go nie tknie, w koñcu wtedy inni Kopacze by go poparli.
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
   description	= "Skoro ju¿ ciê przekona³em to zrobisz co ci ka¿ê. Nak³onisz Oneda do wspólnej ucieczki.";
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
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_01"); //Skoro ju¿ ciê przekona³em to zrobisz co ci ka¿ê. Nak³onisz Oneda do wspólnej ucieczki.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_02"); //Chcesz, ¿ebyœmy siê wynieœli z tego Obozu?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_03"); //Oszala³eœ. Gdybyœcie nawali wkrótce reszta Kopaczy by tego spróbowa³a.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_04"); //W czasie waszej ucieczki wpadniecie w zasadzkê. 
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_05"); //Mamy wpaœæ w ³apy Stra¿y?
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_06"); //Nie, powinni byæ to Kopacze. To pokaza³oby ich sprzeciw wobec dzia³añ Oneda. 
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_07"); //Którzy Kopacze by siê do tego nadali?
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_08"); //Chocia¿by Tippler , Uscan no i pewnie Herek.
    AI_Output (other, self ,"DIA_Buddler_NIEPOKORNY2_15_09"); //Dobrze. Pogadaj teraz z Onedem, ustal termin ucieczki na najbli¿sz¹ pó³noc.
    AI_Output (self, other ,"DIA_Buddler_NIEPOKORNY2_03_10"); //Zrozumia³em.
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Uda³o mi siê przekonaæ Lotha do wspó³pracy. Zaproponuje Onedowi ucieczkê z Obozu podczas której obaj wpadn¹ w przygotowan¹ przez przekupionych Kopaczy zasadzkê.");
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
   description	= "Ustali³eœ termin? ";
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
    AI_Output (other, self ,"DIA_Buddler_BuddlersPaid_15_01"); //Ustali³eœ termin?
    AI_Output (self, other ,"DIA_Buddler_BuddlersPaid_03_02"); //Tak, o pó³nocy wiejemy.
    AI_Output (other, self ,"DIA_Buddler_BuddlersPaid_15_03"); //Doskonale. 
    
    B_LogEntry                     (CH1_Niepokorny_Kopacz,"Loth ustali³ termin ucieczki z Onedem. Wkrótce obaj dostan¹ nauczkê.");
	
	 NiepokornyKopacz = Wld_GetDay();
};

