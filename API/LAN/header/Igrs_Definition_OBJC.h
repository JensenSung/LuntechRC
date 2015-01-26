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
BOOL    isHTTPServerRunning;
BOOL    isIGRSRestartOK;
BOOL isGetDirData;
BOOL isGetLogFile;
BOOL isGetShareImage;
BOOL isGetShareVideo;
BOOL isGetShareAudio;
BOOL isGetShareThumb;
BOOL isRangeRequest;
BOOL isWaitingRrc;
BOOL isCancelUL;
NSMutableArray *thumbArray;
int selectedContentType;

// Define chunk size used to read in data for responses
// This is how much data will be read from disk into RAM at a time
#define READ_CHUNKSIZE (1024 * 128)//65535//3234168//  32182//(256*128) //
#endif
