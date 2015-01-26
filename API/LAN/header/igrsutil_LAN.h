/**
 *
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author zhangchuan@igrslab.com
 * @date   2011-07-01
 *
 * @file   igrsutil_LAN.h
 *
 * @version 2011.07.01

 * @remark
 *      set tabstop=4  
 *      set shiftwidth=4
 *      set expandtab
 */



#ifndef _IGRSUTIL_LAN_H_
#define _IGRSUTIL_LAN_H_

#include "igrs_typedef.h"

#define MESSENGER_DEBUG 		(printf)

#define IGRS_IOS_DEBUG

#ifdef IGRS_IOS_DEBUG
    #define SPF 					(sprintf)

    #define LOGERRORINFO(logData, errorInfo) 	MakeErrorLogData_LAN(logData, errorInfo); \
                                                WriteToLog_LAN(1, logData, TRUE, TRUE);
    #define LOGDEBUGINFO(logData, debugInfo)   	MakeDebugLogData_LAN(logData, debugInfo); \
                                                WriteToLog_LAN(1, logData, TRUE, TRUE);

    #define UPCCOMMONDEFINE char logData[MAX_LOG_SIZE];    char debugInfo[MAX_LOG_SIZE]; sprintf(logData, "1"); sprintf(debugInfo, "1"); 
#else
    #define SPF 					(sprintf)

    #define LOGERRORINFO(logData, errorInfo) ""; 
    #define LOGDEBUGINFO(logData, debugInfo) ""; 

    #define UPCCOMMONDEFINE  char logData[MAX_LOG_SIZE];    char debugInfo[MAX_LOG_SIZE]; sprintf(logData, "1"); sprintf(debugInfo, "1"); 
#endif


int CreateNewIGRSLogFile_LAN();
void MakeErrorLogData_LAN(char logData[], char strData[]);
void MakeDebugLogData_LAN(char logData[], char strData[]);
void WriteToLog_LAN(int varNum, char *info, int writeToLogFile, int writeToWindow);
int WriteIGRSLogFile_LAN(char *buffer);

int CheckIfWANDevice(char JID[]);
char *replaceStr(char *source, char *sub, char *rep);
#endif /* _IGRSUTIL_LAN_H_ */

