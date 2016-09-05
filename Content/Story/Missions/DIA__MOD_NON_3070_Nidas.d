// *Script was make in Easy Dialog Maker (EDM)

//========================================
//-----------------> HELLO1
//========================================

INSTANCE DIA_Nidas_HELLO1 (C_INFO)
{
   npc          = NON_3070_Nidas;
   nr           = 1;
   condition    = DIA_Nidas_HELLO1_Condition;
   information  = DIA_Nidas_HELLO1_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Nidas_HELLO1_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Nidas_HELLO1_Info()
{
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_01"); //Czeka�em tu na ciebie.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_03"); //Jestem Nidas, mroczny s�uga Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_04"); //Pewnie zastanawiasz si�, dlaczego ci� tu sprowadzi�em.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_05"); //Mam dla ciebie pewn� propozycj�. Przy��cz si� do nas.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_06"); //Nas? Czyli kogo?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_07"); //Jestem pot�nym s�ug� Czarnego Maga, Czarny Mag jest wys�annikiem mrocznych si�.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_08"); //Sta� po naszej stronie.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_09"); //A je�eli odm�wi�?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_10"); //Wtedy czeka ci� �mier�.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_15_11"); //Nie jeste� pierwszym, kt�ry czyha na moje �ycie.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_12"); //Ty g�upcze! Nawet nie wiesz jak� moc m�g�by� posiada�!
    AI_Output (self, other ,"DIA_Nidas_HELLO1_03_13"); //Masz jakie� ostatnie �yczenie przed �mierci�?
  B_GiveXP (300);
    Info_ClearChoices		(DIA_Nidas_HELLO1);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Walczmy.", DIA_Nidas_HELLO1_Fight);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Kim jest Czarny Mag?", DIA_Nidas_HELLO1_WhoIsBlackMage);
    Info_AddChoice		(DIA_Nidas_HELLO1, "Czy Poszukiwacze s� waszymi s�ugami?", DIA_Nidas_HELLO1_WhoIsPoszukiwacze);
};

FUNC VOID DIA_Nidas_HELLO1_Fight()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_Fight_15_01"); //Walczmy.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_Fight_03_02"); //N�dzny g�upiec.
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
    B_LogEntry                     (CH1_WlakaZczarym,"W wyznaczonym miejscu spotka�em Nidasa, mrocznego s�ug�. Chcia� z�o�y� mi propozycj� dotycz�c� przystania do z�ych mocy, kt�re reprezentuje. Podj��em si� walki z nim.");

  
    Info_ClearChoices		(DIA_Nidas_HELLO1);

};

FUNC VOID DIA_Nidas_HELLO1_WhoIsBlackMage()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsBlackMage_15_01"); //Kim jest Czarny Mag?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_02"); //Czarny Mag to jeden z najpot�niejszych wys�annik�w Pana.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_03"); //Ma pot�n� moc. W�ada lokalnymi si�ami Beliara.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsBlackMage_15_04"); //Gdzie znajd� tego Czarnego Maga?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_05"); //Marny cz�owieku, naprawd� s�dzisz, �e zdradz� ci miejsce przebywania naszego Pana.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_06"); //My�lisz, �e poszed�by� tak poprostu w TO miejsce i pokona� Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_07"); //Zbytnio przeceniasz swoje mo�liwo�ci. S� moce, z kt�rymi lepiej nie walczy�.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_08"); //Lepiej si� do nich przy��czy�.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsBlackMage_03_09"); //Jednak ty wybra�e� inn� drog�, dlatego czeka ci� �mier�.
    B_LogEntry                     (CH1_WlakaZczarym,"Nie uda�o mi si� ustali�, gdzie znajduje si� Czarny Mag. Wiem tylko, �e walka z nim nie b�dzie �atwa.");
};

FUNC VOID DIA_Nidas_HELLO1_WhoIsPoszukiwacze()
{
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_01"); //Czy Poszukiwacze s� waszymi s�ugami?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_02"); //Oczywi�cie, �e tak.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_03"); //Jaki jest ich cel?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_04"); //Poszukiwacze werbuj� s�ug�w dla Czarnego Maga.
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_05"); //A od niewiernych zbieraj� dusze.
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_06"); //Po co Czarnemu Magowi te dusze?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_07"); //Jeste� dociekliwy, cz�owieku. Po co ci ta wiedza, skoro i tak zaraz umrzesz?
    AI_Output (other, self ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_15_08"); //Dlaczego mi tego nie powiesz, skoro i tak zaraz umr�?
    AI_Output (self, other ,"DIA_Nidas_HELLO1_WhoIsPoszukiwacze_03_09"); //Aarrgg! MILCZ!
    B_LogEntry                     (CH1_WlakaZczarym,"Poszukiwacze podlegaj� Czarnemu Magowi.");
    heroKnowsPoszukiwacze = true;
    B_GiveXP (200);
    B_LogEntry                     (CH1_Poszukiwacze,"Poszukiwacze podlegaj� Czarnemu Magowi. Wys�a� ich, aby zabierali dusz� od niewiernych. Jednak nie wiem po co im one.");
};

