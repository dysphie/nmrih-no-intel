#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
    name        = "No Intel Challenge",
    author      = "Dysphie",
    description = "",
    version     = "0.1.0",
    url         = ""
};

ConVar hObjectiveGlow;
ConVar hItemGlow;

public void OnPluginStart()
{
    HookUserMessage(GetUserMessageId("ObjectiveNotify"), OnIntel, true);
    HookUserMessage(GetUserMessageId("ProgressBarShow"), OnIntel, true);
    HookUserMessage(GetUserMessageId("TokensChanged"), OnIntel, true);
    HookUserMessage(GetUserMessageId("RadioText"), OnIntel, true);

    hObjectiveGlow = FindConVar("sv_objective_glow");
    hObjectiveGlow.IntValue = 0;
    hObjectiveGlow.AddChangeHook(OnGlowVar);

    hItemGlow = FindConVar("sv_item_glow");
    hItemGlow.IntValue = 0;
    hItemGlow.AddChangeHook(OnGlowVar);
    
    AddCommandListener(OnBannedCmd, "show_objective");
    AddCommandListener(OnBannedCmd, "+compass");
    AddCommandListener(OnBannedCmd, "+showscores");
}

public void OnGlowVar(ConVar convar, const char[] oldValue, const char[] newValue)
{
	convar.IntValue = 0;
}

public Action OnIntel(UserMsg msg, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)
{
	return Plugin_Handled;
}

public Action OnBannedCmd(int client, const char[] command, int argc)
{
	return Plugin_Handled;
}

