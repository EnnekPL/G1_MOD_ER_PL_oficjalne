///////////////////////////////////////////
//		Unnecessary Death
///////////////////////////////////////////

INSTANCE DIA_OrganisatorWheelGuard_UnnecessaryDeath (C_INFO)
{
	npc			= Org_834_Organisator;
	nr			= 1;
	condition	= DIA_OrganisatorWheelGuard_UnnecessaryDeath_Condition;
	information	= DIA_OrganisatorWheelGuard_UnnecessaryDeath_Info;
	permanent	= 0;
	important	= TRUE;
};                       

FUNC INT DIA_OrganisatorWheelGuard_UnnecessaryDeath_Condition()
{
	if (FoggyKilled)
	{
		return 1;
	};
};

FUNC VOID DIA_OrganisatorWheelGuard_UnnecessaryDeath_Info()
{	
	AI_Output (self, other,"DIA_OrganisatorWheelGuard_UnnecessaryDeath_02_01"); //Hej, dobrze, ¿e sprz¹tn¹³eœ tego kolesia. Strasznie nachalny typ. Ci¹gle ¿ebra³ o skrêta.
	
	AI_StopProcessInfos (self);
};