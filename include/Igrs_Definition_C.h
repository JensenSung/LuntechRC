//
//  Igrs_Definition_C.h
//  ServerLess
//
//  Created by chen on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#ifndef Igrs_Definition_C_h
#define Igrs_Definition_C_h

#define IGRS_HTTP_PORT              "12347"
#define IGRS_SEVERLESS_PORT         5251

#define MAX_MEDIA_AMOUNT            1000
   


#define IGRS_IMAGE_FLAG_LENGTH      13
#define IGRS_VIDEO_FLAG_LENGTH      13
#define IGRS_AUDIO_FLAG_LENGTH      13

#define NORMAL_STRING_LENGTH        300
#define MAX_PAGE_SIZE               10
#define IP_ADDRESS_LENGTH           32
#define IGRS_IOS_VERSION            @"igrs_ios_2012_03_12_16:40"
#define IGRS_DEVICE_TYPE_STRING     "pda"



char    myIPAddress[IP_ADDRESS_LENGTH];
int     mediaIndex;
int isTargetSimulator;


static struct AudioInfo 
{   
    char name[NORMAL_STRING_LENGTH];
    long size;
    char httpUrl[NORMAL_STRING_LENGTH];
    char appleUrl[NORMAL_STRING_LENGTH];    
};
struct AudioInfo audio[MAX_MEDIA_AMOUNT];
int audioIndex ;

static struct ImageInfo 
{   
    char name[NORMAL_STRING_LENGTH];
    long size;
    char httpUrl[NORMAL_STRING_LENGTH];
    char appleUrl[NORMAL_STRING_LENGTH];    
};
struct ImageInfo image[MAX_MEDIA_AMOUNT];
int imageIndex ;

static struct VideoInfo 
{   
    char name[NORMAL_STRING_LENGTH];
    long size;
    char httpUrl[NORMAL_STRING_LENGTH];
    char appleUrl[NORMAL_STRING_LENGTH];    
};
struct VideoInfo video[MAX_MEDIA_AMOUNT];
int videoIndex ;




#endif
