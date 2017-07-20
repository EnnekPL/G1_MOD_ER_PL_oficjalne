func int B_GiveSkill(var C_NPC typ, var int TAL, var int NEW_Wert, var int LP_Cost) //return 1
{
	// ---------- Umwandeln von var in const
	var int TAL_Wert; 
	if 		(TAL == NPC_TALENT_1H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_1H		);	}
	else if (TAL == NPC_TALENT_2H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_2H		);	}
	else if (TAL == NPC_TALENT_BOW)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOW		);	}
	else if (TAL == NPC_TALENT_CROSSBOW)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_CROSSBOW	);	}
	else if (TAL == NPC_TALENT_PICKLOCK)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKLOCK	);	}
	else if (TAL == NPC_TALENT_PICKPOCKET)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKPOCKET);	}
	else if (TAL == NPC_TALENT_MAGE)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_MAGE		);	}
	else if (TAL == NPC_TALENT_SNEAK)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SNEAK		);	}
	else if (TAL == NPC_TALENT_REGENERATE)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGENERATE);	}
	else if (TAL == NPC_TALENT_FIREMASTER)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_FIREMASTER);	}
	else if (TAL == NPC_TALENT_ACROBAT)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ACROBAT	);	};

	// ----------- Bedingungen/LP checken, dann ggf. vergeben
	if ((TAL_Wert+1) == NEW_Wert)
	{	
		if (typ.lp >= LP_cost)
		{
			typ.lp = typ.lp - LP_cost;
			
			if (tal == NPC_TALENT_1H)			
			{	
				Npc_SetTalentSkill(typ, NPC_TALENT_1H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_1H, Npc_GetTalentValue(typ, NPC_TALENT_1H)+5); //zmienione z piêciu na 1 poniewa¿ 10 poziomów x 1pkt krytyka = 10%
				PrintScreen	("Nowa umiejêtnoœæ: Walka jednorêcznym orê¿em", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				if (NEW_Wert == 1)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 60%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 2)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 70%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 3)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 80%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 4)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 90%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 5)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 100%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 6)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 110%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 7)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 120%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 8)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 130%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 9)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 140%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 10)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 150%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				};
				
				return 1;
			}
			else if (tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_2H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_2H, Npc_GetTalentValue(typ, NPC_TALENT_2H)+5); //-II-
				PrintScreen	("Nowa umiejêtnoœæ: Walka dwurêcznym orê¿em", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				if (NEW_Wert == 1)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 60%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 2)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 70%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 3)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 80%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Amator", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 4)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 90%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 5)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 100%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 6)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 110%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Wojownik", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 7)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 120%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 8)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 130%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 9)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 140%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 10)
				{
				PrintScreen	("Mno¿nik obra¿eñ: 150%", -1,55,"FONT_OLD_10_WHITE.TGA",2);
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				};
				return 1;
			}
			else if (tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_BOW, Npc_GetTalentValue(typ, NPC_TALENT_BOW)+15);
				PrintScreen	("Nowa umiejêtnoœæ: Strzelanie z ³uku", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				if (NEW_Wert == 1)
				{
				
				PrintScreen	("Postawa bojowa: Strzelec", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 2)
				{
				
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				};
				return 1;
			}
			else if (tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW)+20);
				PrintScreen	("Nowa umiejêtnoœæ: Strzelanie z kuszy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				if (NEW_Wert == 1)
				{
				
				PrintScreen	("Postawa bojowa: Strzelec", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				}
				else if (NEW_Wert == 2)
				{
				
				PrintScreen	("Postawa bojowa: Mistrz", -1,58,"FONT_OLD_10_WHITE.TGA",2);
				};
				return 1;
			}
			else if (tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKLOCK, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, Npc_GetTalentValue(typ, NPC_TALENT_PICKLOCK)-40);
				PrintScreen	("Nowa umiejêtnoœæ: Otwieranie zamków", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKPOCKET, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, Npc_GetTalentValue(typ, NPC_TALENT_PICKPOCKET)-40);
				PrintScreen	("Nowa umiejêtnoœæ: Kradzie¿ kieszonkowa", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_MAGE, NEW_Wert);
				PrintScreen	("Nowa umiejêtnoœæ: Kolejny kr¹g magii", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SNEAK, NEW_Wert);
				PrintScreen	("Nowa umiejêtnoœæ: Skradanie siê", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_REGENERATE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_REGENERATE, NEW_Wert);
				PrintScreen	("Nowa umiejêtnoœæ: Kowalstwo", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_FIREMASTER)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_FIREMASTER, NEW_Wert);
				PrintScreen	("Nowa umiejêtnoœæ: Alchemia", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ACROBAT, NEW_Wert);
				PrintScreen	("Nowa umiejêtnoœæ: Akrobatyka", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			PrintScreen	("Za ma³o punktów umiejêtnoœci!", -1,-1,"font_new_10_red.tga",2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else // NICHT eine Stufe davor
	{	
		if (TAL_Wert >= NEW_Wert)
		{
			B_Say (self, other, "$NOLEARNYOUREBETTER"); //Jesteœ ju¿ lepszy!
			return 0;
		}
		else if ((TAL_Wert+1) < NEW_Wert) //d.h. i.d.R. TAL_Wert=2 und NEW_Wert=0, außer bei TALENT_MAGE
		{
			B_Say (self, other, "$NOLEARNYOUALREADYKNOW"); //Musisz siê jeszcze wiele nauczyæ zanim zostaniesz Mistrzem!
			return 0;
		};
	};	
};	
	
	

	
	
	


		
	
	
	

	
	
	
	
	

	
	
	

