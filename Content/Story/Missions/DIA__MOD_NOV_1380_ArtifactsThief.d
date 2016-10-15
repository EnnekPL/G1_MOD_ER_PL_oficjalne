//poprawione i sprawdzone - Nocturn

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Uciekinier_EXIT(C_INFO)
{
	npc             = NOV_1380_ArtfiactsThief;
	nr              = 999;
	condition	= DIA_Uciekinier_EXIT_Condition;
	information	= DIA_Uciekinier_EXIT_Info;
	permanent	= TRUE;
	description     = DIALOG_ENDE;
};

FUNC INT DIA_Uciekinier_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Uciekinier_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HELLO
//========================================

INSTANCE DIA_Uciekinier_HELLO (C_INFO)
{
   npc          = NOV_1380_ArtfiactsThief;
   nr           = 1;
   condition    = DIA_Uciekinier_HELLO_Condition;
   information  = DIA_Uciekinier_HELLO_Info;
   permanent	= FALSE;
   description	= "Znalaz�em ci�, z�odzieju.";
};

FUNC INT DIA_Uciekinier_HELLO_Condition()
{
	if (MIS_StolenStaff == LOG_RUNNING) {
    return TRUE; };
};

FUNC VOID DIA_Uciekinier_HELLO_Info()
{
    AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_01"); //Znalaz�em ci�, z�odzieju.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_02"); //Je..je.. jeste� Guru! Mmm...my�la�em, �e wy�l� za mn� co najwy�ej jakiego� Nowicjusza...
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_03"); //W takim razie nie�le si� pomyli�e�.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_04"); //Co ze mn� zrobisz?
    AI_Output (other, self ,"DIA_Uciekinier_HELLO_15_05"); //Wszystko zale�y od ciebie...
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_06"); //Mistrzu, pos�uchaj. Nie wiedzia�em co robi�, zagubi�em si�. To na czym budowa�em m�j �wiatopogl�d nagle si� rozpad�o.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_07"); //�ni�cy okaza� si� demonem. Nasza nadzieja na ucieczk� przepad�a...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_08"); //Chcia�em ukra�� kostur i sprzeda� Magom Wody. Liczy�em, �e dzi�ki rudzie zostan� cz�onkiem obozu. Tam m�g�bym zacz�� od nowa.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_03_09"); //Co za ironia... Do Kolonii trafi�em w�a�nie za kradzie�. Zn�w da�em si� z�apa�.
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	Info_AddChoice		(DIA_Uciekinier_HELLO,"Ka�dy zas�uguje na drug� szans�.",DIA_Uciekinier_HELLO_Litosc);
	Info_AddChoice		(DIA_Uciekinier_HELLO,"Przekroczy�e� pewne granice. To tw�j koniec.",DIA_Uciekinier_HELLO_Smierc);
};

func void DIA_Uciekinier_HELLO_Litosc ()
{
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_01"); //Ka�dy zas�uguje na drug� szans�.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_02"); //Dzi�kuj�, Mistrzu. Od pocz�tku wierzy�em, �e jeste� dobrym cz�owiekiem.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_03"); //Te� kiedy� pope�ni�em b��d...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_04"); //W�a�nie dlatego doskonale rozumiesz, co si� teraz dzieje wewn�trz mnie. Kolonia sta�a si� dla ciebie szans� na zmian�.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_05"); //Sp�jrz ile dobrego zrobi�e� odk�d tu przyby�e�. Wcze�niej nic si� nie zmienia�o... Pojawiali si� nowi skaza�cy wraz z towarami ze �wiata Zewn�trznego.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_06"); //Cz�� gin�a w kopalniach, reszta stawa�a si� rozb�jnikami. A od kiedy pojawi�e� si� ty wszystko nabra�o tempa.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_07"); //Odby�o si� przywo�anie, dowiedzieli�my si� o prawdziwej naturze �ni�cego... �wiadomie, czy nie ostrzeg�e� nas o zagro�eniu, kt�re mog�o spowodowa� �mier� setek os�b.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_08"); //Wci�� mo�e. Problem �ni�cego nie zosta� rozwi�zany.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_09"); //Tak, ale Guru wkr�tce co� wymy�l�... Chodzi mi o to, �e nie wiem jakie przest�pstwo pope�ni�e�, ale z pewno�ci� ju� je odpokutowa�e�.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Litosc_15_10"); //Sk�oni�e� mnie do pewnych przemy�le�. Od��my to na razie. Mam jeszcze wiele spraw do za�atwienia.
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_11"); //Prosz�, oto kostur. We� go i zanie� do �wi�tyni. Zostan� tu jaki� czas sam. 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Litosc_03_12"); //Chce si� modli� doY'Beriona, aby przebaczy� mi m�j czyn. 
	CreateInvItems (self, Stab_des_Lichts, 1);
	B_GiveInvItems (self, other, Stab_des_Lichts, 1);
	B_LogEntry     (CH3_StolenStaff,"Odnalaz�em z�odzieja w opuszczonej chacie na bagnie. Nie wyci�gn��em konsekwencji z post�pku Nowicjusza. W zamian odda� mi kostur po dobroci. Odby�em z nim te� bardzo ciekaw� rozmow�.");
	
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	AI_StopProcessInfos	(self);
};

func void DIA_Uciekinier_HELLO_Smierc ()
{
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_01"); //Przekroczy�e� pewne granice. To tw�j koniec.
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_02"); //Zbezcze�ci�e� szcz�tki Y"Beriona. Nie unikniesz kary.
    AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_03"); //S�dzi�em, �e jeste� inny. Liczy�em na drug� szans�. 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_04"); //Tak naprawd� niczym si� nie r�nimy. Ty te� nie trafi�e� tu za nic. By� mo�e masz na sumieniu rzeczy gorsze ni� kradzie�. Mo�e morderstwo...
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_05"); //Pr�bujesz teraz odpokutowa� wymierzaj�c sprawiedliwo�� takim jak ja. My�lisz, �e moja �mier� co� zmieni? 
	AI_Output (self, other ,"DIA_Uciekinier_HELLO_Smierc_03_06"); //Innos nagle ci przebaczy, bo zabi�e� jakiego� z�odziejaszka? Jeste� �a�osny. W tym momencie niczym nie r�nisz si� od tych szumowin...
	AI_Output (other, self ,"DIA_Uciekinier_HELLO_Smierc_15_07"); //Do��!
	CreateInvItems (self, Stab_des_Lichts, 1);
	B_LogEntry     (CH3_StolenStaff,"Odnalaz�em z�odzieja w opuszczonej chacie na bagnie. Zas�u�y� na najwy�sz� kar� za zbezczeszczenie zw�ok Y'Beriona.");
	
	Info_ClearChoices	(DIA_Uciekinier_HELLO);
	AI_StopProcessInfos	(self);
    Npc_SetPermAttitude (self, ATT_HOSTILE);
    Npc_SetTarget (self,other);
    AI_StartState (self,ZS_ATTACK,1,"");
	
};
