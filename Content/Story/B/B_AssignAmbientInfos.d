FUNC VOID B_AssignAmbientInfos(var c_NPC amb_self)
{
if  ((Hlp_GetInstanceID(self)==Hlp_GetInstanceID(OrcPeasantDrum )) ||  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(OrcPeasantDance )) ||  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(OrcPeasantEatAndDrink )))
{
B_AssignAmbientInfos_Orcs (amb_self);
};

if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(TPL_1441_TEMPLER )) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(TPL_1442_TEMPLER )) 
{
B_AssignAmbientInfos_Tpl_13(amb_self);
};
//if (amb_self.guild == GIL_SFB) && (amb_self.npctype==NPCTYPE_AMBIENT)
	if ( (amb_self.npctype==NPCTYPE_AMBIENT)||(amb_self.npctype==NPCTYPE_GUARD) ) //Alle Ambient-NPCs in den Lagern
	{	
		if (amb_self.guild == GIL_VLK)
		{
			if (amb_self.voice == 1)
			{
				B_AssignAmbientInfos_Vlk_1(amb_self);
			}
			else if (amb_self.voice == 2)
			{
				B_AssignAmbientInfos_Vlk_2(amb_self);
			}
			else if (amb_self.voice == 3)
			{
				B_AssignAmbientInfos_Vlk_3(amb_self);
			}
			else if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_Vlk_4(amb_self);
			};
		}
		else if (amb_self.guild == GIL_GRD) 
		{
			if (amb_self.voice == 6)
			{
				B_AssignAmbientInfos_Grd_6(amb_self);
			}
			else if (amb_self.voice == 7) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(GRD_218_Gardist ))
			{
				B_AssignAmbientInfos_Grd_7(amb_self);
			}
			else if (amb_self.voice == 13) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(GRD_245_Gardist ))
			{
				B_AssignAmbientInfos_Grd_13(amb_self);
			};
		}
		else if (amb_self.guild == GIL_STT) 
		{
			if (amb_self.voice == 10)
			{
				B_AssignAmbientInfos_Stt_10(amb_self);
			}
			else if (amb_self.voice == 12)
			{
				B_AssignAmbientInfos_Stt_12(amb_self);
			}
			else if (amb_self.voice == 2)//Nowicjusze Ognia
			{
			B_AssignAmbientInfos_fnov_2 (amb_self);
			};
		}
		else if (amb_self.guild == GIL_SFB)
		{
			if (amb_self.voice == 1)
			{
				B_AssignAmbientInfos_Sfb_1(amb_self);
			}
			else if (amb_self.voice == 2) && (amb_self.level >= 5)
			{
				B_AssignAmbientInfos_SFB_2(amb_self);
			}
			else if (amb_self.voice == 2) && (amb_self.level <= 3)
			{
				B_AssignAmbientInfos_BAU_2(amb_self);
			}
			else if (amb_self.voice == 5)
			{
				B_AssignAmbientInfos_SFB_5(amb_self);
			}
			else if (amb_self.voice == 4) //er ZBIERACZE
			{
				B_AssignAmbientInfos_Bau_4(amb_self);
			}
			else if (amb_self.voice == 9) //er ZBIERACZE
			{
				B_AssignAmbientInfos_Bau_9(amb_self);
			};
		}
		else if (amb_self.guild == GIL_NOV)
		{
			if (amb_self.voice == 2)
			{
				B_AssignAmbientInfos_Nov_2(amb_self);
			}
			else if (amb_self.voice == 3)
			{
				B_AssignAmbientInfos_Nov_3(amb_self);
			}
			else if (amb_self.voice == 5)
			{
				B_AssignAmbientInfos_Nov_5(amb_self);
			};
		}
		else if (amb_self.guild == GIL_TPL)
		{
			if (amb_self.voice == 8)
			{
				B_AssignAmbientInfos_Tpl_8(amb_self);
			}
			else if (amb_self.voice == 13)
			{
				B_AssignAmbientInfos_Tpl_13(amb_self);
			};
		//}
		
	}
		else if (amb_self.guild == GIL_ORG)
		{
			if (amb_self.voice == 6)
			{
				B_AssignAmbientInfos_Org_6(amb_self);
			}
			else if (amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Org_7(amb_self);
			}
			else if (amb_self.voice == 13)
			{
				B_AssignAmbientInfos_Org_13(amb_self);
			};
		}
		else if (amb_self.guild == GIL_SLD)
		{
			if (amb_self.voice == 8)
			{
				B_AssignAmbientInfos_Sld_8(amb_self);
			}
			else if (amb_self.voice == 11)
			{
				B_AssignAmbientInfos_Sld_11(amb_self);
			}
			else if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(SLD_723_Soeldner )) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(SLD_732_Soeldner )) 
			{
				B_AssignAmbientInfos_Sld_11(amb_self);
			};
		};
			if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_874_Raeuber)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_869_Raeuber)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_867_Raeuber)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_865_Raeuber))
			|| (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_864_Raeuber)) // (amb_self.voice == 13)
			{
				B_AssignAmbientInfos_Bau_13(amb_self);
			}
			else if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_870_Raeuber)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_871_Raeuber))//(amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Bau_7(amb_self);
			}
			else if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_868_Raeuber)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(BAN_1609_Pun)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(ORG_863_Raeuber))//(amb_self.voice == 9)
			{
				B_AssignAmbientInfos_Bau_7(amb_self);
			};	
			/*if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(NON_1501_WEGELAGERER)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(NON_1503_WEGELAGERER)) || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(NON_1502_WEGELAGERER))  || (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(NON_1504_WEGELAGERER))
			{
			B_AssignAmbientInfos_wczg_2 (amb_self);
			};*/
};
	
	if ( (amb_self.npctype==NPCTYPE_MINE_AMBIENT)||(amb_self.npctype==NPCTYPE_MINE_GUARD) ) //Alle Ambient-NPCs in den Minen
	{	
		if (amb_self.guild == GIL_VLK)
		{
			if (amb_self.voice == 1)
			{
				B_AssignAmbientInfos_Mine_Vlk_1(amb_self);
			}
			else if (amb_self.voice == 2)
			{
				B_AssignAmbientInfos_Mine_Vlk_2(amb_self);
			}
			else if (amb_self.voice == 3)
			{
				B_AssignAmbientInfos_Mine_Vlk_3(amb_self);
			}
			else if (amb_self.voice == 4)
			{
				B_AssignAmbientInfos_Mine_Vlk_4(amb_self);
			};
		}
		else if (amb_self.guild == GIL_GRD) 
		{
			if (amb_self.voice == 6)
			{
				B_AssignAmbientInfos_Mine_Grd_6(amb_self);
			}
			else if (amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Mine_Grd_7(amb_self);
			}
			else if (amb_self.voice == 13)
			{
				B_AssignAmbientInfos_Mine_Grd_13(amb_self);
			};
		}
		else if (amb_self.guild == GIL_SLD) 
		{
			if (amb_self.voice == 8)
			{
				B_AssignAmbientInfos_Mine_Sld_8(amb_self);
			}
			else if (amb_self.voice == 11)
			{
				B_AssignAmbientInfos_Mine_Sld_11(amb_self);
			};
		}
		else if (amb_self.guild == GIL_ORG) 
		{
			if (amb_self.voice == 6)
			{
				B_AssignAmbientInfos_Mine_Org_6(amb_self);
			}
			else if (amb_self.voice == 7)
			{
				B_AssignAmbientInfos_Mine_Org_7(amb_self);
			}
			else if (amb_self.voice == 13)
			{
				B_AssignAmbientInfos_Mine_Org_13(amb_self);
			};
		};
	};
};
