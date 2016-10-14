//poprawione i sprawdzone - Nocturn

/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							G�RTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kim jeste�?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kim jeste�?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jestem Guru z obozu na bagnie. Moi s�udzy m�wi� na mnie Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //S�udzy? Nie widz� tu �adnej s�u�by.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Och, ale� oni s� wsz�dzie. Sp�jrz na drzewa. Jak one ta�cz�! 
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //Eee, rozumiem. C�, chyba p�jd� ju� dalej...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Zaczekaj, m�g�by� pom�c mi przekszta�ci� to bagno w ogromn� ��k� pe�n� kwiat�w!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Mo�e zaczniesz beze mnie? Wr�c�... nied�ugo.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ten cz�owiek raczej mi nie pomo�e...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Cze��, co s�ycha�?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Cze��, co s�ycha�?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Tylko uwa�aj, �eby� nie skrzywdzi� moich kochanych drzew! 
};  

/*------------------------------------------------------------------------
							QUEST							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_QUEST (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_QUEST_Condition;
	information		= Nov_1371_BaalNetbek_QUEST_Info;
	important		= 0;
	description		= "Wiesz co� o handlarzu, kt�ry sprzedaje amulety?"; 
};

FUNC int  Nov_1371_BaalNetbek_QUEST_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Talas_ABOUT_STEH))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_QUEST_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_01"); //Wiesz co� o handlarzu, kt�ry sprzedaje amulety?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_02"); //Krzywdzi drzewa...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_03"); //Skupmy si� mo�e na czym� innym. Siedzisz tu ca�y czas. Widzia�e� co� podejrzanego?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_04"); //To by�o kilka dni temu. Rozmawia�em z moj� ulubion� paproci�, gdy spostrzeg�em jak kto� czai si� za chat� Nyrasa. 
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_05"); //Postanowi�em schowa� si� za du�ym drzewem rosn�cym nieopodal.
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_06"); //Nie uwierzysz co si� potem sta�o. Schyli�em si� i dostrzeg�em, �e na korzeniu mojego ulubionego drzewa ro�nie olbrzymi mech!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_07"); //Pr�bowa�em go zerwa�, ale wr�s� strasznie mocno!
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_08"); //Moje pytanie brzmi: czy znasz jakie� magiczne preparaty nie bazuj�ce na alkoholu dzi�ki kt�rym pozb�d� si� tego paskudztwa?
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_09"); //...
	AI_Output (other, self,"Nov_1371_BaalNetbek_QUEST_Info_15_10"); //Co si� sta�o dalej?! Handlarz! Pami�tasz?
	AI_Output (self, other,"Nov_1371_BaalNetbek_QUEST_Info_03_11"); //No pr�bowa�em oderwa� ten mech... Gdy ponownie si� rozejrza�em, zobaczy�em tylko sylwetk� biegn�c� w stron� tartaku. 
	B_LogEntry               (CH3_StrangeResearcher,"Baal Netbek podobno widzia� wieczorem Nowicjusza, kt�ry kr�ci� si� w okolicach chaty Nyrasa. Nie wiem co by�o p�niej, ale Nowicjusz oddali� si� w stron� tartaku. Czy�by to Hanson? ");
	};  