/**
 *
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author zhangchuan@igrslab.com
 * @date   2011-07-01
 *
 * @file   igrsutil_WAN.h
 *
 * @version 2011.07.01

 * @remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */



#ifndef _IGRSUTIL_WAN_H_
#define _IGRSUTIL_WAN_H_

#include "igrsutil_LAN.h"
//#include "igrs_typedef.h"

#define MESSENGER_DEBUG 		(printf)

#ifdef IGRS_IOS_DEBUG
    #define SPF 					(sprintf)

    #define LOGERRORINFO_WAN(logData, errorInfo) 	MakeErrorLogData_WAN(logData, errorInfo); \
                                                WriteToLog_WAN(1, logData, TRUE, TRUE);
    #define LOGDEBUGINFO_WAN(logData, debugInfo) 	MakeDebugLogData_WAN(logData, debugInfo); \
                                                WriteToLog_WAN(1, logData, TRUE, TRUE);

#else
    #define SPF 					(sprintf)

    #define LOGERRORINFO_WAN(logData, errorInfo) ""; 
    #define LOGDEBUGINFO_WAN(logData, debugInfo) ""; 

#endif


//char errorInfo[MAX_STRING_SIZE] = "";\
//int resultReturn, i, j; \
//resultReturn=1; i=0; j=0; 
#define USERAVAIL 							if (!userAvail) \
{ \
SPF(debugInfo, "user is NOT avaiable \n"); \
LOGDEBUGINFO_WAN(logData, debugInfo); \
printf("user is NOT avaiable \n"); \
} \
else
#define DEVICEAVAIL 						if (!deviceAvail) \
{ \
SPF(debugInfo, "device is NOT avaiable \n"); \
LOGDEBUGINFO_WAN(logData, debugInfo); \
printf("device is NOT avaiable \n"); \
} \
else





void getRetDetailInfo(char* retString, int *glooxID, char* returnReason);

int getCurrentTime(char *currentTime);
int getStrPtrLen(const char *p);
int midStr(char *strTarget, char *strOrigin, int start, int length);

void getRetDetailInfo(char* retString, int *glooxID, char* returnReason);
//void getRetDetailInfo(char* retString);
int Get1FromWholeString(char strWhole[], char str1[]);
int Get2FromWholeString(char strWhole[], char str2[]);
int getIntFromFirstWholeString(char strWholeReturn[]);

int GetDomainFromString(const char strWhole[], char strDomain[]);

int GetResourceFromString(const char strWhole[], char strRrc[]);
int GetBareJIDFromString(const char strWhole[], char strBareJid[]);


int CheckIfUseDefaultPort(const char *user_id);

int GetIntFromString(char *strOrigin);

int getValueFromXml(char strWholeXML[],char name[], char *value);
void getManyValuesFromXml(char *strWholeXML, char *name, char value[][MAX_STRING_SIZE]);
void getReasonFromID(char *strReason, char *errorID);


int CreateNewIGRSLogFile_WAN();
int WriteIGRSLogFile_WAN(char *buffer);
int MakeErrorLogData_WAN(char logData[], char strData[]);
void MakeDebugLogData_WAN(char logData[], char strData[]);
int WriteToLog_WAN(int varNum, char *info, int writeToLogFile, int writeToWindow);

#endif /* _IGRSUTIL_WAN_H_ */

