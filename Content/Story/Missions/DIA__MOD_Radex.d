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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Radex_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Radex_Hello_Info()
{	
	AI_Output (other, self,"Info_Radex_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Radex_Hello_09_01"); //Jakie to ma znaczenie? Chcesz siê napiæ piwa?
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
	AI_Output (self, other,"Info_Radex_Help_09_01"); //Czeka ciê niezwyk³a przygoda.
	AI_Output (self, other,"Info_Radex_Help_09_02"); //Rozgl¹daj siê uwa¿nie i zwiedzaj ka¿dy zak¹tek kolonii. Czêsto trafisz na rzeczy w miejscach, w których kompletnie mo¿esz siê ich nie spodziewaæ.
	AI_Output (self, other,"Info_Radex_Help_09_03"); //Pamiêtaj, ¿e góry s¹ bardzo niebezpieczne. Jeden fa³szywy krok i spadasz w przepaœæ.
	AI_Output (self, other,"Info_Radex_Help_09_04"); //I jeszcze jedno...
	AI_Output (self, other,"Info_Radex_Help_09_05"); //Znajdujesz siê w kolonii. Tutaj nikt nie jest niewinny. A czasami bêdziesz musia³ wybraæ mniejsze z³o dla wiêkszej koniecznoœci.
	AI_Output (self, other,"Info_Radex_Help_09_06"); //Tutaj poznasz coœ gorszego ni¿ œmieræ. Na w³asnej skórze poczujesz smak zdrady...
	AI_UseItem (self, itfobeer);
};