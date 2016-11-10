INSTANCE Info_Radex_EXIT(C_INFO)
{
	npc			= Radex ;
	nr			= 999;
	condition	= Info_Radex_EXIT_Condition;
	information	= Info_Radex_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Radex_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Radex_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Radex_Hello(C_INFO)
{
	npc			= Radex;
	nr			= 1;
	condition	= Info_Radex_Hello_Condition;
	information	= Info_Radex_Hello_Info;
	permanent	= 0;
	description = "Kim jeste�?";
};                       

FUNC INT Info_Radex_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Radex_Hello_Info()
{	
	AI_Output (other, self,"Info_Radex_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Radex_Hello_09_01"); //Jakie to ma znaczenie? Chcesz si� napi� piwa?
};

INSTANCE Info_Radex_Help(C_INFO)
{
	npc			= Radex;
	nr			= 1;
	condition	= Info_Radex_Help_Condition;
	information	= Info_Radex_Help_Info;
	permanent	= 0;
	description = "Jasne!";
};                       

FUNC INT Info_Radex_Help_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Radex_Hello))
	{
	return 1;
	};
};

FUNC VOID Info_Radex_Help_Info()
{	
	AI_Output (other, self,"Info_Radex_Help_15_00"); //Jasne!
	CreateInvItems (self,itfobeer,5);
	B_GiveInvItems (self, hero, itfobeer,1);
	AI_UseItem (self, itfobeer);
	AI_UseItem (hero, itfobeer);
	AI_Output (self, other,"Info_Radex_Help_09_01"); //Czeka ci� niezwyk�a przygoda.
	AI_Output (self, other,"Info_Radex_Help_09_02"); //Rozgl�daj si� uwa�nie i zwiedzaj ka�dy zak�tek kolonii. Cz�sto trafisz na rzeczy w miejscach, w kt�rych kompletnie mo�esz si� ich nie spodziewa�.
	AI_Output (self, other,"Info_Radex_Help_09_03"); //Pami�taj, �e g�ry s� bardzo niebezpieczne. Jeden fa�szywy krok i spadasz w przepa��.
	AI_Output (self, other,"Info_Radex_Help_09_04"); //I jeszcze jedno...
	AI_Output (self, other,"Info_Radex_Help_09_05"); //Znajdujesz si� w kolonii. Tutaj nikt nie jest niewinny. A czasami b�dziesz musia� wybra� mniejsze z�o dla wi�kszej konieczno�ci.
	AI_Output (self, other,"Info_Radex_Help_09_06"); //Tutaj poznasz co� gorszego ni� �mier�. Na w�asnej sk�rze poczujesz smak zdrady...
	AI_UseItem (self, itfobeer);
};