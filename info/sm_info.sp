#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR ""
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <multicolors>
#include <cstrike>
#include <sdkhooks>
#include <clientprefs>
#include <mapchooser>
#pragma semicolon 1
#pragma newdecls required


public Plugin myinfo = 
{
	name = "Server Info",
	author = "T1ME0UT",
	description = "My first plugin",
	version = "1.0",
	url = "https://steamcommunity.com/id/t1mee0ut/"
};

public void OnPluginStart()
{	
	RegConsoleCmd("sm_info", CMD_info);
	LoadTranslations("sm_info.phrases");
}
public Action CMD_info(int client, int args)
{
	
	char sBuffer[256];
	GetConVarString(FindConVar("hostname"), sBuffer,sizeof(sBuffer));

	int iTimeleft;
	char sTime[256], sPlayers[256], sMap[256];
	GetMapTimeLeft(iTimeleft);
	if(iTimeleft > 0)
			{
				char sHour[30];
				FormatTime(sTime, sizeof(sTime), "%M:%S", iTimeleft);
				FormatTime(sHour, sizeof(sHour), "%H:%M:%S", GetTime());
			}

	FormatEx(sPlayers, sizeof(sPlayers), "%d", GetClientCount(true)-1);
	GetCurrentMap(sMap, sizeof(sMap));
	CPrintToChat(client, "{yellow}********************************");
	CPrintToChat(client, "{green}>{default} %t: {darkred} %s","ServerName",sBuffer);
	CPrintToChat(client, "{green}>{default} %t: {darkred}%s","Map",sMap);
	CPrintToChat(client, "{green}>{default} %t:{darkred} %s","PlayerCount",sPlayers);
	CPrintToChat(client, "{green}>{default} %t:{darkred} %s","Time",sTime);
	CPrintToChat(client,"{yellow}********************************");
	return Plugin_Continue;
}

