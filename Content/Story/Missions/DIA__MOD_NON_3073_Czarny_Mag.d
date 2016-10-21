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
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_01"); //No prosz�, widz�, �e po tylu latach znalaz� si� �mia�ek, kt�ry odwa�y� si� wej�� do kopalni.
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_03"); //Kim�, kto nie pozwoli �y� ludziom normalnie w dolinie po�wi�conej dla Beliara.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_04"); //Kim�, kto ze�le na wszystkich skaza�c�w gniew mego Pana.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_05"); //I wreszcie kim�, kto umorzy ci� we w�asnej krwi! JAM JEST NEKROMANTA ISENTHOR!
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_06"); //A wi�c to ty odpowiadasz za upadek kopalni? Postanowi�e� po prostu zabi� tych wszystkich ludzi?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_07"); //Jestem pot�ny, jednak upadek kopalni to niestety nie moja zas�uga. To ci chciwi g�upcy wykopali sobie gr�b.
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_08"); //W takim razie co tu robisz? I dlaczego cia�a o�ywaj�?
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_09"); //Obra�em to ponure miejsce jako swoj� now� siedzib�. C�, po tej ca�ej katastrofie mam tu ogrom materia�u do bada�.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_10"); //Mog� w spokoju przygotowywa� moj� armi�, kt�ra wkr�tce opanuje to miejsce!
    AI_Output (other, self ,"DIA_Czarny_Mag_FIGHT_15_11"); //Wkr�tce b�dziesz �a�owa�, ze sprzeniewierzy�e� si� pozosta�ym bogom. Zaraz si� z tob� rozprawi�.
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_12"); //Tak my�lisz? No to chod� i spr�buj!
    AI_Output (self, other ,"DIA_Czarny_Mag_FIGHT_03_13"); //Przyb�d� Beliarze, i zniszcz s�ugi Innosa!
	Log_CreateTopic(Bossowie, LOG_NOTE);
	B_LogEntry (Bossowie, "Powodem pojawiania si� nieumar�ych w Opuszczonej Kopalni by� Nekromanta Isenthor, kt�ry jedn� z jaski� w kopalni obra� sobie za miejsce plugawego kultu Beliara. Po katastrofie w kopalni, Czarny Mag m�g� swobodnie wskrzesza� cia�a g�rnik�w i wykorzystywa� je do stworzenia w�asnej armii. Teraz w samotno�ci kontynuuje obrz�dy i niszczy ka�dego, kto zejdzie do kopalni.. ");
    AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self, other);
    AI_StartState (self, ZS_ATTACK, 1, "");
	
	if (MIS_BanditsInAbadonedMine  == LOG_RUNNING)
	{
	B_LogEntry    (CH4_BanditsInAbadonedMine,"Odnalaz�em przyczyn� pojawiania si� o�ywie�c�w w kopalni. To przekl�ty nekromanta przyzywa nieumar�ych i wykorzystuje przy tym jaki� artefakt. Musz� go pokona� i zabra� st�d magiczny kamie�.");
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
	B_LogEntry               (CH1_lekiDlaAva,"Poszed�em walczy� z Czarnym Magiem. Avallach po�wi�ci� si�, ale �ycie ludzi w Kolonii jest wa�niejsze.");
    Log_SetTopicStatus       (CH1_lekiDlaAva, LOG_FAILED);
	B_KillNpc		        	(NON_3078_Avallach);
	};
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_01"); //A wi�c wreszcie si� spotykamy.
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_02"); //To ty jeste� tym Czarnym Magiem?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_03"); //Jak na to wpad�e�? 
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_04"); //Darujmy sobie gr� s�own�.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_05"); //Podj��e� ju� decyzj�?
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_15_06"); //Chodzi ci o t� paplanin� z przy��czeniem si� do si� z�a? 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_07"); //Widz�, �e jeste� tylko g�upim cz�owiekiem, kt�remu po prostu uda�o si� prze�y� troch� d�u�ej.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_03_08"); //No c�. B�d� musia� ci� wyeliminowa� jak pozosta�ych niewiernych. 

    Info_ClearChoices		(DIA_Czarny_Mag_IMPORTANT);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Po co wam dusze ludzi?", DIA_Czarny_Mag_IMPORTANT_pocOWamDusze);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Komu s�u�ysz?", DIA_Czarny_Mag_IMPORTANT_KomuSluzysz);
	Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Kim ty w og�le jeste�?!", DIA_Czarny_Mag_IMPORTANT_KimJestes);
    Info_AddChoice		(DIA_Czarny_Mag_IMPORTANT, "Walczmy wi�c.", DIA_Czarny_Mag_IMPORTANT_Fight);
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_pocOWamDusze()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_01"); //Po co wam dusze ludzi?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_02"); //To proste. Potrzebujemy ich do przygotowania tego �wiata na przyj�cie naszego Pana. 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_03"); //Z dusz pozyskujemy specjaln� energi�, kt�r� rozpraszamy na tym obszarze.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_04"); //By nasz Pan po przebudzeniu m�g� od razu wzi�� ten �wiat w swoje r�ce. 
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_05"); //Chcecie tu sprowadzi� Beliara?!
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_06"); //Chcemy tu sprowadzi� jego najpot�niejszego wys�annika, kt�ry w imi� Beliara przejmie ten �wiat.
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_15_07"); //Nie mog� ju� tego s�ucha�. 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_pocOWamDusze_03_08"); //Nie potrafisz poj�� naszej pot�gi. Ot co!
    B_LogEntry (CH1_Poszukiwacze,"Od Czarnego Maga dowiedzia�em si�, �e dusze, kt�rych szukaj� Poszukiwacze, s� im potrzebne do przygotowania tego �wiata na przyj�cie wys�annika Beliara.");
    Log_SetTopicStatus (CH1_Poszukiwacze, LOG_SUCCESS);
    MIS_Poszukiwacze = LOG_SUCCESS;
    B_GiveXP (500);
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_KimJestes()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_15_01"); //Kim ty w og�le jeste�? Dlaczego to robisz?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_03_02"); //Dlaczego ci� to interesuje? 
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KimJestes_03_03"); //Zosta�em wys�any przez mego Pana, by przygotowa� ten �wiat do jego nadej�cia.
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_KomuSluzysz()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_15_01"); //Komu s�u�ysz? Kim jest ten wys�annik Beliara?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_03_02"); //Ha ha ha. �a�osny cz�owieku! Chcesz zna� imi� mego Pana?
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_KomuSluzysz_03_03"); //Nigdy go nie spotkasz, bo nie prze�yjesz tego spotkania.
};

FUNC VOID DIA_Czarny_Mag_IMPORTANT_Fight()
{
    AI_Output (other, self ,"DIA_Czarny_Mag_IMPORTANT_Fight_15_01"); //Walczmy wi�c! Zobaczymy, jakim jeste� wojownikiem.
    AI_Output (self, other ,"DIA_Czarny_Mag_IMPORTANT_Fight_03_02"); //Z�ap ostanie tchnienie, �miertelniku.
    B_LogEntry                     (CH1_WlakaZczarym,"Wyzwa�em Czarnego Maga na pojedynek. Od mojego zwyci�stwa zale�y los ca�ej Kolonii.");
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