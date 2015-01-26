//
//  Igrs_Definition_OBJC.h
//  ServerLess
//
//  Created by chen on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#ifndef ServerLess_Igrs_Definition_OBJC_h
#define ServerLess_Igrs_Definition_OBJC_h

#import <Foundation/Foundation.h>

#import "IrgsAppDelegate.h"

#import "igrsutil_LAN.h"



BOOL    isIGRSStackLogged;
BOOL    isHTTPServerRunning;
BOOL    canIGRSRecvMes;
BOOL    isIGRSRestartOK;

BOOL isGetDirData;
BOOL isGetLogFile;
BOOL isGetShareImage;
BOOL isGetShareVideo;
BOOL isGetShareAudio;
BOOL isRangeRequest;

int selectedContentType;
//IrgsAppDelegate *myDelegate;



// Define chunk size used to read in data for responses
// This is how much data will be read from disk into RAM at a time
//#if TARGET_OS_IPHONE
#define READ_CHUNKSIZE (1024 * 128)//65535//3234168//  32182//(256*128) //
//#else
//#define READ_CHUNKSIZE  (1024 * 512)
//#endif



#endif
