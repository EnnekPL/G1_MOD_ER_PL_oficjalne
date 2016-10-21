//poprawione i sprawdzone - Nocturn
//========================================
//-----------------> FIGHT
//========================================

INSTANCE DIA_Czarny_Mag_FIGHT (C_INFO)
{
   npc          = NON_3073_Czarny_Mag;
   nr           = 1;
   condition    = DIA_Czarny_Mag_FIGHT_Condition;
   information  = DIA_Czarny_Mag_FIGHT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Czarny_Mag_FIGHT_Condition()
{
    if (kapitel >= 4)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Czarny_Mag_FIGHT_Info()
{
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_01"); //No proszê, widzê, ¿e po tylu latach znalaz³ siê œmia³ek, który odwa¿y³ siê wejœæ do kopalni.
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_02"); //Kim jesteœ?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_03"); //Kimœ, kto nie pozwoli ¿yæ ludziom normalnie w dolinie poœwiêconej dla Beliara.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_04"); //Kimœ, kto zeœle na wszystkich skazañców gniew mego Pana.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_05"); //I wreszcie kimœ, kto umorzy ciê we w³asnej krwi! JAM JEST NEKROMANTA ISENTHOR!
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_06"); //A wiêc to ty odpowiadasz za upadek kopalni? Postanowi³eœ po prostu zabiæ tych wszystkich ludzi?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_07"); //Jestem potê¿ny, jednak upadek kopalni to niestety nie moja zas³uga. To ci chciwi g³upcy wykopali sobie grób.
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_08"); //W takim razie co tu robisz? I dlaczego cia³a o¿ywaj¹?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_09"); //Obra³em to ponure miejsce jako swoj¹ now¹ siedzibê. Có¿, po tej ca³ej katastrofie mam tu ogrom materia³u do badañ.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_10"); //Mogê w spokoju przygotowywaæ moj¹ armiê, która wkrótce opanuje to miejsce!
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_11"); //Wkrótce bêdziesz ¿a³owa³, ze sprzeniewierzy³eœ siê pozosta³ym bogom. Zaraz siê z tob¹ rozprawiê.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_12"); //Tak myœlisz? No to chodŸ i spróbuj!
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_13"); //Przyb¹dŸ Beliarze, i zniszcz s³ugi Innosa!
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Powodem pojawiania siê nieumar³ych w Opuszczonej Kopalni by³ Nekromanta Isenthor, który jedn¹ z jaskiñ w kopalni obra³ sobie za miejsce plugawego kultu Beliara. Po katastrofie w kopalni, Czarny Mag móg³ swobodnie wskrzeszaæ cia³a górników i wykorzystywaæ je do stworzenia w³asnej armii. Teraz w samotnoœci kontynuuje obrzêdy i niszczy ka¿dego, kto zejdzie do kopalni.. ");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	if (MIS_BanditsInAbadonedMine  == LOG_RUNNING)
	{
	B_LogEntry    (CH4_BanditsInAbadonedMine,"Odnalaz³em przyczynê pojawiania siê o¿ywieñców w kopalni. To przeklêty nekromanta przyzywa nieumar³ych i wykorzystuje przy tym jakiœ artefakt. Muszê go pokonaæ i zabraæ st¹d magiczny kamieñ.");
	};
};



/*BIEDNA STARA EDYCJA ROZSZERZONA :(       :)
//========================================
//-----------------> IMPORTANT
//========================================

INSTANCE DIA_Czarny_Mag_IMPORTANT (C_INFO)
{
   npc          = NON_3073_Czarny_Mag;
   nr           = 1;
   condition    = DIA_Czarny_Mag_IMPORTANT_Condition;
   information  = DIA_Czarny_Mag_IMPORTANT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Czarny_Mag_IMPORTANT_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_Info()
{
	uplyw_czasu = 0;
	if (MIS_lekiDlaAva == LOG_RUNNING)
	{
	MIS_lekiDlaAva = LOG_FAILED;
	PrintScreen	("Anulowano zadanie: Lekarstwo dla Avallacha! ", 1,-1,"font_new_10_red.tga",2);	
	B_LogEntry               (CH1_lekiDlaAva,"Poszed³em walczyæ z Czarnym Magiem. Avallach poœwiêci³ siê, ale ¿ycie ludzi w Kolonii jest wa¿niejsze.");
    Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_FAILED);
	B_KillNpc		        	(NON_3078_Avallach);
	};
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_01"); //A wiêc wreszcie siê spotykamy.
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_02"); //To ty jesteœ tym Czarnym Magiem?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_03"); //Jak na to wpad³eœ? 
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_04"); //Darujmy sobie grê s³own¹.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_05"); //Podj¹³eœ ju¿ decyzjê?
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_06"); //Chodzi ci o tê paplaninê z przy³¹czeniem siê do si³ z³a? 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_07"); //Widzê, ¿e jesteœ tylko g³upim cz³owiekiem, któremu po prostu uda³o siê prze¿yæ trochê d³u¿ej.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_08"); //No có¿. Bêdê musia³ ciê wyeliminowaæ jak pozosta³ych niewiernych. 

    Info_ClearChoices		(DIA_Czarny_Mag_IMPORTANT);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Po co wam dusze ludzi?", DIA_Czarny_Mag_IMPORTANT_pocOWamDusze);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Komu s³u¿ysz?", DIA_Czarny_Mag_IMPORTANT_KomuSluzysz);
	Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Kim ty w ogóle jesteœ?!", DIA_Czarny_Mag_IMPORTANT_KimJestes);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Walczmy wiêc.", DIA_Czarny_Mag_IMPORTANT_Fight);
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_pocOWamDusze()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_01"); //Po co wam dusze ludzi?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_02"); //To proste. Potrzebujemy ich do przygotowania tego œwiata na przyjœcie naszego Pana. 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_03"); //Z dusz pozyskujemy specjaln¹ energiê, któr¹ rozpraszamy na tym obszarze.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_04"); //By nasz Pan po przebudzeniu móg³ od razu wzi¹æ ten œwiat w swoje rêce. 
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_05"); //Chcecie tu sprowadziæ Beliara?!
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_06"); //Chcemy tu sprowadziæ jego najpotê¿niejszego wys³annika, który w imiê Beliara przejmie ten œwiat.
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_07"); //Nie mogê ju¿ tego s³uchaæ. 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_08"); //Nie potrafisz poj¹æ naszej potêgi. Ot co!
    B_LogEntry (CH1_Poszukiwacze,"Od Czarnego Maga dowiedzia³em siê, ¿e dusze, których szukaj¹ Poszukiwacze, s¹ im potrzebne do przygotowania tego œwiata na przyjœcie wys³annika Beliara.");
    Log_SetTopicStatus (CH1_Poszukiwacze, LOG_SUCCESS);
    MIS_Poszukiwacze = LOG_SUCCESS;
    B_GiveXP (500);
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_KimJestes()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_15_01"); //Kim ty w ogóle jesteœ? Dlaczego to robisz?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_03_02"); //Dlaczego ciê to interesuje? 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_03_03"); //Zosta³em wys³any przez mego Pana, by przygotowaæ ten œwiat do jego nadejœcia.
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_KomuSluzysz()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_15_01"); //Komu s³u¿ysz? Kim jest ten wys³annik Beliara?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_03_02"); //Ha ha ha. ¯a³osny cz³owieku! Chcesz znaæ imiê mego Pana?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_03_03"); //Nigdy go nie spotkasz, bo nie prze¿yjesz tego spotkania.
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_Fight()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_Fight_15_01"); //Walczmy wiêc! Zobaczymy, jakim jesteœ wojownikiem.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_Fight_03_02"); //Z³ap ostanie tchnienie, œmiertelniku.
    B_LogEntry                     (CH1_WlakaZczarym,"Wyzwa³em Czarnego Maga na pojedynek. Od mojego zwyciêstwa zale¿y los ca³ej Kolonii.");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	B_ChangeGuild    (NON_3074_Poszukiwacz,GIL_DMB);  
	B_ChangeGuild    (NON_3075_Poszukiwacz,GIL_DMB);  
	B_ChangeGuild    (NON_3076_Poszukiwacz,GIL_DMB);  
	//Npc_SetPermAttitude (NON_3074_Poszukiwacz, ATT_HOSTILE);
	//Npc_SetPermAttitude (NON_3075_Poszukiwacz, ATT_HOSTILE);
	//Npc_SetPermAttitude (NON_3076_Poszukiwacz, ATT_HOSTILE);
};
*/