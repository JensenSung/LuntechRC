/*
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author ouyangcf@igrslab.com
 * @date   2010-5-22
 *
 * @brief  IGRS 2.0 configration
 *
 * @file   igrs_config.h
 *
 * @remark
 *
 */
#ifndef _IGRS_CONFIG_H_
#define _IGRS_CONFIG_H_

#define IGRS_SERVER_IP      "igrslink.com"
#define IGRS_SERVER_PORT    5001

/**
 * @ingroup MacroDefs
 * HFS?˿?
 */
#define IGRS_HTTP_FILE_SERVER_PORT	8880

/**
 * @ingroup MacroDefs
 * ??????xml?ı??????ֽ???
 */
#define IGRS_MAX_XML_LEN			1024*20

/**
 * @ingroup MacroDefs
 * ??????xml?ı??????ֽ?????ת???????ֽ??? = IGRS_MAX_XML_LEN * 1.3??
 */
#define IGRS_OUT_XML_LEN            1024*26
#define IGRS_MAX_JID_LEN            256
#define IGRS_VERSION_DAILY          20111015

#define IGRS_MAX_NS_LEN             512
#define IGRS_MAX_URL_LEN            2048
#define IGRS_MAX_CMD_SECTION_LEN    64 

#ifdef TCL
	#define IGRS_VENDOR				"tcl"
#elif KONKA
	#define IGRS_VENDOR				"konka"
#elif HISENSE 
	#define IGRS_VENDOR				"hisense"
#elif LINKSEE
	#define IGRS_VENDOR				"linksee"			
#elif IPANEL
	#define IGRS_VENDOR				"ipanel"			
#else
	#define IGRS_VENDOR				"hisense"
#endif

/** 
 * @ingroup MacroDefs
 * ??ȡ??????С
 */
#define DIM(a) (int)(sizeof(a)/sizeof(a[0]))

/** 
 * @ingroup MacroDefs
 * ?ڶ?̬��?ӿ??????ط???
 */

#ifdef _MSC_VER
	#ifdef IGRS_DLL
        #define DLLEXPORT __declspec(dllexport)
	#else
		#ifdef IGRS_LIB
			#define DLLEXPORT __declspec(dllexport)
		#else
			#define DLLEXPORT __declspec(dllimport)
		#endif
    #endif

    #define DLLLOCAL
#else
    #ifdef IGRS_EHOME
        #define DLLEXPORT
        #define DLLLOCAL
    #else
        #define DLLEXPORT __attribute__ ((visibility("default")))
        #define DLLLOCAL __attribute__ ((visibility("hidden")))
    #endif
#endif

//#define IGRS_API DLLEXPORT

/**
 * @ingroup IgrsNsDefs IGRS???ֿռ�??. 
 */
#define IGRS_NS_ROSTER						"jabber:iq:roster"
#define IGRS_NS_OTHERS_DEVICES				"http://www.igrs.org/spec2.0/basic#devicesinfo"
#define IGRS_NS_BINDDEVICE					"http://www.igrs.org/spec2.0/basic#devicebind"
#define IGRS_NS_DEVICES						"http://www.igrs.org/spec2.0/basic#user#devicesinfo"
#define IGRS_NS_USERBINDDEVICE				"http://www.igrs.org/spec2.0/basic#userbind"
#define IGRS_NS_UNBINDDEVICE				"http://www.igrs.org/spec2.0/basic#unbind"
#define IGRS_NS_QUERYBIND					"http://www.igrs.org/spec2.0/basic#querybind"
#define IGRS_NS_GETVERIFYCODE				"http://www.igrs.org/spec2.0/mobile#verifycode"
#define IGRS_NS_BOOKMARK_ADD				"http://www.igrs.org/spec2.0/basic#bookmark#add"
#define IGRS_NS_BOOKMARK_REMOVE				"http://www.igrs.org/spec2.0/basic#bookmark#remove"
#define IGRS_NS_BOOKMARK_GET				"http://www.igrs.org/spec2.0/basic#bookmark#get"
#define IGRS_NS_DEVICE_BIND_DEVICE			"http://www.igrs.org/spec2.0/basic#device#add"
#define IGRS_NS_DEVICE_UNBIND_DEVICE		"http://www.igrs.org/spec2.0/basic#device#unlink"
#define IGRS_NS_DEVICE_GET_BIND_DEVICE		"http://www.igrs.org/spec2.0/basic#linkeddevicesinfo"
#define IGRS_NS_EXTENSION					"http://www.igrs.org/spec2.0/extenstion"
#define IGRS_NS_MODIFY_DEVICE_LOCATION		"http://www.igrs.org/spec2.0/basic#modify#location"
#define IGRS_NS_MODIFY_DEVICE_NAME			"http://jabber.org/protocol/rosterx"

#define IGRS_NS_RECOMMEND					"http://www.igrs.org/av/playto"
#define IGRS_NS_CONTROL						"http://www.igrs.org/av/control"
#define IGRS_NS_RESOURCE_BROWSE				"http://www.igrs.org/av/browse"
#define IGRS_NS_RESOURCE_RESPONSE			"http://www.igrs.org/av/resources"
#define IGRS_NS_AAA							"http://www.igrs.org/av/AAA-info"
#define IGRS_NS_EPG_SERVICE				    "http://www.igrs.org/av/epg-service-request"
#define IGRS_NS_EPG_SERVICE_RESPONSE	    "http://www.igrs.org/av/epg-service-response"
#define IGRS_NS_EPG_INFO					"http://www.igrs.org/av/epg-info-request"
#define IGRS_NS_EPG_INFO_RESPONSE			"http://www.igrs.org/av/epg-info-response"
#define IGRS_NS_EPG_PLAY					"http://www.igrs.org/av/epg-play-request"
#define IGRS_NS_EPG_PLAY_RESPONSE			"http://www.igrs.org/av/epg-play-response"
#define IGRS_NS_DEVICE_GET_INFO				"http://www.igrs.org/spec2.0/basic#deviceinfo"
#define IGRS_NS_SERVICE_DISCOVERY			"http://jabber.org/protocol/disco#info"

#define IGRS_NS_TS_REQUEST                  "http://www.igrs.org/av/ts-request"
#define IGRS_NS_TS_RESPONSE                 "http://www.igrs.org/av/ts-response"

typedef enum stanza_s
{
    RECOMMEND_STANZA_TYPE,
    RECOMMEND_STANZA_URL,
    RECOMMEND_STANZA_ALBUM,
    RECOMMEND_STANZA_VIDEO,
    RECOMMEND_STANZA_OFFSET,
    RECOMMEND_STANZA_IMGURL,
    RECOMMEND_STANZA_FILESIZE,
    RECOMMEND_STANZA_CID,
    RECOMMEND_STANZA_GID,
    RECOMMEND_STANZA_TITLE,
    RECOMMEND_STANZA_DEVICE,
    RECOMMEND_STANZA_PASSWORD,
    RECOMMEND_STANZA_PLAYNOW,
    RECOMMEND_STANZA_VENDOR,     
    RECOMMEND_STANZA_CURRENTPAGE, 
    RECOMMEND_STANZA_PAGESIZE,   
    RECOMMEND_STANZA_FREQUENCY, 
    RECOMMEND_STANZA_SEARCHWORD,
    RECOMMEND_STANZA_SERVICEID,  
    RECOMMEND_STANZA_EVENTID,  
    RECOMMEND_STANZA_DAY,       
    RECOMMEND_STANZA_STARTTIME, 
    RECOMMEND_STANZA_ENDTIME,   
    RECOMMEND_STANZA_UNKOWN,

} stanza_type_t;


#ifdef IGRS_DEBUG

#ifdef _WIN32
	#include <crtdbg.h>
	#define return_if_fail(p) if(!(p)) \
		{printf("%s:%d Warning: "#p" failed.\n", \
		__FILE__, __LINE__); return;}
	#define return_val_if_fail(p, ret) if(!(p)) \
		{printf("%s:%d Warning: "#p" failed.\n", \
		__FILE__, __LINE__); return (ret);}

#else
	#define return_if_fail(p) if(!(p)) \
		{printf("%s:%d Warning: "#p" failed.\n", \
		__func__, __LINE__); return;}
	#define return_val_if_fail(p, ret) if(!(p)) \
		{printf("%s:%d Warning: "#p" failed.\n", \
		__func__, __LINE__); return (ret);}
#endif /* _WIN32 */

#else /* NDEBUG */
	#define return_if_fal(p)
	#define return_val_if_fail(p, ret)
#endif

#endif /* _IGRS_CONFIG_H_ */
