/*
 * Copyright (C) 2007-2012 IGRSLab
 *
 * \author 
 * \date   2011-07-25
 *
 * \brief  igrs typedef 
 *
 * \file   igrstypedef.h
 *
 * \remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */

#ifndef _IGRSTYPEDEF_H_
#define _IGRSTYPEDEF_H_



#include "igrsmacros.h"
//#define 	IGRS_WIN32
#define 	IGRS_DEBUG
#define 	IGRS_WAN
#define 	IGRS_LAN
#define     CLOUD_RESOURCE
#define     SMART_AIRCONDITION
//#define     SMART_AIRCONDITION_TEST

//#define     BACKGROUND_DEBUG
#define     AUDIO_BACKGROUND_DEBUG
#define     IGRS_RC

#define     CLOUD_RESOURCE_MASK_TEMP
#define     VER_DIFF
#define     MASK_LOG
//#define     NEVER_STOP
//#define     IGRS_EPG
//#define     IGRS_TEST
//#define  IGRS_PLAYER




#ifdef IGRS_LIB
#include "igrs_config.h"
#include "igrs_os.h"
#else
//#define IGRS_API
#define DLLLOCAL
#endif

#ifdef IGRS_WIN32
	#define IGRS_API __declspec(dllexport)
#else
	#define IGRS_API
#endif

//#define 	testP2P

#ifdef __cplusplus
#define IGRS_BEGIN_DECLS extern "C" {
#define IGRS_END_DECLS }
#else
#define IGRS_BEGIN_DECLS
#define IGRS_END_DECLS
#endif

#ifdef IGRS_WIN32
#define snprintf _snprintf
#endif

#define IGRS_MAX_ID_LENGTH          128
#define IGRS_MAX_RESOURCE_NAME_LEN  128
#define IGRS_MAX_RESOURCE_PATH_LEN  128

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/** 
 * @ingroup MacroDefs
 * IGRS  common
 */
#define HOST_SERVER_NAME		("proxy.internetat.tv")	// Openfire Server is same with chgroup IP
#define HOST_SERVER_IP			("168.219.192.145") // Openfire Server IP

#ifdef _TARGET
#define LOGFILE_PATH		("/mtd_rwarea")
#define MACRO_FILE		("/mtd_rwarea/macro.txt")
#else
#define LOGFILE_PATH		(".")
#define MACRO_FILE		("./macro.txt")
#endif

#define NOTICE_PREFIX  ("$NOTICE")   /* Alarm/Teasing message has this */
#define RECOMMEND_PREFIX ("$RECOMMEND") /* Alarm/Teasing recommend */
#define MDSHARE_PREFIX ("$MDSHARE/1/")  /* mdshare validity */
#define LOG_FILE_EXT			("_log.txt")		// to predefine type of logfile
#define MAX_USER				(512) 										
#define MACRO_NUM				(5)
#define MAX_MACRO_LENGTH		(128)

#define MD_FULLDIR		("/mtd_rwarea/_Mediasharing")
#define MD_HOMEDIR		("_Mediasharing")
#define PRESENCE_FILE	("_Presence.info")
#define MDTITLE_WORD	("MDSHARE_TITLE")
#define MDDESC_WORD 	("MDSHARE_DESC")

#define EPG_WORD		("EPG:")
#define PRIVATE_WORD	("PRIVATE:")
#define MDSHARE_WORD	("MDSHARE:")

#define CB_XML_BUDDY_ID_BARE    "</BuddyIdBare>"
#define CB_XML_RESRC_ID         "</ResrcId>"
#define CB_XML_STATUS           "</Status>"

#define EVENT_WAN_NOTIFY		@"wanNotifyEvent"
#define EVENT_REACHABILITYAPP	@"reachabilityApp"
#define EVENT_DOWN_UPLOAD       @"down_uploadEvent"

#define IGRS_VERSION 	2
#define NO_BLOCK 		0
#define IS_BLOCK 		1


/** 
 * @ingroup MacroDefs
 * IGRS Macro definition 
 */

#define SAFE_DEL(X) 		if((X)!=NULL) {delete (X); \
											X=NULL;}
#define CHECK_CB(X) 		if((X)==NULL) {printf("\n !!! callback is not registered !!!\n");} \
							else 


/** 
 * @ingroup MacroDefs
 * IGRS  string max length 
 */
#define IGRS_MAX_STRING_LENGTH  (512)
#define MAX_USER_PWD_LENGTH 	(100)
#define DEFAULT_SMALL_WAITTIME 	(1000) //default time for recv/send
#define MAX_JID_LENGTH			(128)
#define MAX_MESSAGE_LENGTH		(1255) //cb message size
#define BUDDYLIST_STRING_SIZE	(4096)
#define MAX_USER_NAME_LENGTH 	(128)
#define MAX_USER_ID_LENGTH		(128)
#define MAX_GROUP_NAME_LENGTH	(128)
#define MAX_GROUPINFO_SIZE		(20)
#define MAX_RESRCINFO_SIZE		(20)
#define MAX_RESRC_NAME_LENGTH 	(128)
#define PCWEB_MS_MARKER  		(".MS") //presence marker of PC-Web Media Sharing 
#define LENGTH_PCWEB_MS_MARKER 	(3) //length of PCWEB_MS_MARKER
#define MAX_PRESENCEDESC_LENGTH (255)
#define MAX_FILE_NAME_LENGTH	(255)
#define MAX_STRING_SIZE			1024*4
#define MAX_LOG_SIZE			1024*15//this is MAX_RECV_BUF_LEN

#define MAX_FEATURES_COUNT		50
#define INITRRC					("init_resource")

/** 
 * @ingroup MacroDefs
 * IGRS  user/device type 
 */
#define IGRS_USER   	0
#define IGRS_DEVICE   	1

#define IGRSPORT  5001 //5222	 


/** 
 * @ingroup MacroDefs
 * IGRS 
 */
//#define IGRS_MAX_ID_LENGTH   1023
#define 	TRUE		1
#define 	FALSE		0
#define 	SUCCESS		1
#define     FAIL        0

/**
 * @ingroup EnumTypeDefs
 * IGRS bool
 */
typedef enum _IgrsBool
{
     IGRS_TRUE  = 1,
     IGRS_FALSE = 0,
} IgrsBool;



/**
 * @ingroup EnumTypeDefs
 * IGRS return value
 */
typedef enum _IgrsRet
{
    IGRS_RET_OK,               ///user sent msg successfully
    IGRS_RET_FAIL,             ///user sent msg failed

//////on_user_register_success	  
	IGRS_RET_USER_REGISTER_SUCCESS,	///< IGRS user register is ok
	IGRS_RET_USER_REGISTER_FAIL,   	///< IGRS user register is fail
	
//////on_device_register_success	  
	IGRS_RET_DEVICE_REGISTER_SUCCESS, ///< IGRS device register is ok
	IGRS_RET_DEVICE_REGISTER_FAIL,	///< IGRS device register is fail


//////on_user_login_result    
	IGRS_RET_USER_CONNECTED,			///< IGRS user connect is ok
	IGRS_RET_USER_LOGIN_FAILED,		///< IGRS user login failed
	IGRS_RET_USER_DISCONNECTED,			///< IGRS user disconnect as normal action
    IGRS_RET_USER_AUTH_FAILED,			///< IGRS user username/password not match or user does not exist
	IGRS_RET_USER_STREAM_CLOSED,		///< IGRS user socket stream is closed
	IGRS_RET_USER_IO_ERROR,				///< IGRS user connection IO error
	IGRS_RET_USER_PARSE_ERROR, 			///< IGRS user connection parse error
	IGRS_RET_USER_CONNECTION_REFUSED,	///< IGRS user connection is refused
 	IGRS_RET_USER_LOGOUT,               ///< IGRS user logout
   
//////on_device_login_result	  
	IGRS_RET_DEVICE_CONNECTED,			///< IGRS device connect is ok
	IGRS_RET_DEVICE_LOGIN_FAILED,		///< IGRS device login failed
	IGRS_RET_DEVICE_DISCONNECTED, 		///< IGRS device disconnect as normal action
	IGRS_RET_DEVICE_AUTH_FAILED,		///< IGRS device username/password not match or user does not exist
	IGRS_RET_DEVICE_STREAM_CLOSED,		///< IGRS device socket stream is closed
	IGRS_RET_DEVICE_IO_ERROR, 			///< IGRS device connection IO error
	IGRS_RET_DEVICE_PARSE_ERROR,		///< IGRS device connection parse error
	IGRS_RET_DEVICE_CONNECTION_REFUSED,	///< IGRS device connection is refused
	IGRS_RET_DEVICE_LOGOUT,             ///< IGRS device logout

//////on_user_roster_receiver	  
	IGRS_RET_USER_RECV_PUSH_CONTROL,
    
//////on_user_roster_clear	  
	IGRS_RET_USER_ROSTER_CLEAR,
//////on_user_roster_receiver	  
	IGRS_RET_USER_ROSTER_RECEIVER,
//////on_user_roster_presence	  
	IGRS_RET_USER_ROSTER_PRESENCE,
//////on_user_receive_subscribtion	 
	IGRS_RET_USER_RECV_SUBSCRIPTION,
//////on_user_receive_unsubscribtion   
	IGRS_RET_USER_RECV_UNSUBSCRIPTION,
//////on_user_receive_acpt_deny	  
	IGRS_RET_USER_ADD_FRIEND_OK, 	
    IGRS_RET_USER_ADD_FRIEND_DENY,
//////on_user_buddy_deleted 
	IGRS_RET_USER_BUDDY_DELETED,
//////on_user_capability_presence 
	IGRS_RET_USER_CAPABILITY_PRESENCE,
//////on_user_nick_presence 
	IGRS_RET_USER_NICK_PRESENCE,


//////on_user_receive_message	  
	IGRS_RET_USER_RECV_MESSAGE,
//////on_device_receive_message	  
	IGRS_RET_DEVICE_RECV_MESSAGE,

	
//////on_user_receive_P2PRequest	  
	IGRS_RET_USER_RECV_P2PREQUEST,
//////on_user_receive_P2PAccept	  
	IGRS_RET_USER_RECV_P2PACCEPT,
//////on_user_receive_P2PReject   
	IGRS_RET_USER_RECV_P2PREJECT,
//////on_user_receive_P2PExecute  
	IGRS_RET_USER_RECV_P2PEXECUTE,

//////on_device_receive_P2PRequest	  
	IGRS_RET_DEVICE_RECV_P2PREQUEST,
//////on_device_receive_P2PAccept   
	IGRS_RET_DEVICE_RECV_P2PACCEPT,
//////on_device_receive_P2PReject   
	IGRS_RET_DEVICE_RECV_P2PREJECT,
//////on_device_receive_P2PExecute  
	IGRS_RET_DEVICE_RECV_P2PEXECUTE,



//////on_device_roster_clear   
	IGRS_RET_DEVICE_ROSTER_CLEAR,
//////on_device_roster_receiver   
	IGRS_RET_DEVICE_ROSTER_RECEIVER,
//////on_device_roster_presence   
	IGRS_RET_DEVICE_ROSTER_PRESENCE,
//////on_device_buddy_deleted
	IGRS_RET_DEVICE_BUDDY_DELETED,
//////on_device_capability_presence 
	IGRS_RET_DEVICE_CAPABILITY_PRESENCE,
//////on_device_nick_presence 
	IGRS_RET_DEVICE_NICK_PRESENCE,


	
//////on_device_receive_acpt_deny  , no use
	IGRS_RET_DEVICE_ADD_FRIEND_OK,
	IGRS_RET_DEVICE_ADD_FRIEND_DENY,
	
//////on_device_receive_subscribtion, no use 
	IGRS_RET_DEVICE_RECV_SUBSCRIPTION,

	IGRS_RET_USER_ROSTER_ERROR,



//////no use 
    IGRS_RET_START_FAIL,       ///< IGRS±@◊Ó?–€áÍ‡¢
    IGRS_RET_NOT_RUNNING,      ///< IGRS±@◊Ó¡ÉÙ¨‹¢Çk
    IGRS_RET_ERR_NOT_INIT,     ///< ¡ÉÙ¨àˆåa⁄w
    IGRS_RET_ERR_NET,          ///< Öá·ç‘¸ïd
    IGRS_RET_ERR_DEVICE_ID,    ///< íMæÚID‘¸ïd
    IGRS_RET_ERR_USER_ID,      ///< Õ[’c√“‘¸ïd
    IGRS_RET_ERR_PASSWORD,     ///< ≥˘Êu‘¸ïd
    IGRS_RET_ERR_PARAM,        ///< Ωyñf‘¸ïd
    IGRS_RET_ERR_NO_BINDING,   ///< íMæÚ¡ÉÙ¨Ã√”ÁÕ[’c
    IGRS_RET_ALREADY_RUNNING,	///< IGRS±mÉÁ‹¢Çk
    IGRS_RET_ERR_DISCONNECT,	///< IGRSÛ∞’ÜΩÀÙÀ

//	IGRS_RET_FINISH,			   ///only finished

} IgrsRet;

/**
 * @ingroup EnumTypeDefs
 * IGRS device type
 */

typedef enum _IgrsDeviceType
{
    IGRS_DEVICE_TYPE_PC,		    ///< êLåd»O˝e 
    IGRS_DEVICE_TYPE_PDA,           ///< pda
    IGRS_DEVICE_TYPE_MOBILEPHONE,   ///< ﬂØÉz
    IGRS_DEVICE_TYPE_TV,		    ///< »OèyÉz
    IGRS_DEVICE_TYPE_STB,		    ///< »OèyÉz
    IGRS_DEVICE_TYPE_PAD,           ///< PAD   
    IGRS_DEVICE_TYPE_UNION,         ///< UNION          //peter 2012_0412   
    IGRS_DEVICE_TYPE_AIRCONDITION,  ///< airCondition   //peter 2012_0827   
    IGRS_DEVICE_TYPE_UNKNOWN,	    ///< unknown
} IgrsDeviceType;

/**
 * @ingroup EnumTypeDefs
 * IGRS device status
 */
typedef enum _IgrsDeviceStatus
{
    IGRS_DEVICE_STATUS_ONLINE,     ///< ????
    IGRS_DEVICE_STATUS_OFFLINE,    ///< ?∂\??
    IGRS_DEVICE_STATUS_UNKNOWN,    ///< ?øó?∑v?øó?∏[
} IgrsDeviceStatus;

/**
 * @ingroup EnumTypeDefs
 * IGRS user status
 */
typedef enum _IgrsUserStatus
{
    IGRS_USER_STATUS_ONLINE,     ///< ????
    IGRS_USER_STATUS_OFFLINE,    ///< ?∂\??
    IGRS_USER_STATUS_UNKNOWN,    ///< ?øó?∑v?øó?∏[
} IgrsUserStatus;

/*
 * @ingrup EnumTypeDefs
 */
typedef enum  _IgrsMessageType {
    IGRS_MESSAGE_TYPE_REALTIME,
    IGRS_MESSAGE_TYPE_NORMAL,
} IgrsMessageType;

typedef
void (* cb_result_ret)(IgrsRet result, void *userdata);





/**
* @brief	Media push message information structure.
*			   
* @version 1.0
*
*/
typedef struct ST_Push_Playto_Msg_Inf
{
	char		title[MAX_STRING_SIZE];
	char		imgurl[MAX_STRING_SIZE];
	char		cid[MAX_STRING_SIZE];
	char		gid[MAX_STRING_SIZE];
	char		filesize[MAX_STRING_SIZE];
	char		type[MAX_STRING_SIZE];
	char		playnow[MAX_STRING_SIZE];
	char		timestamp[MAX_STRING_SIZE];
	char		pwd[MAX_STRING_SIZE];
} SPush_Playto_Msg_Inf;

typedef struct ST_Push_Control_Msg_Inf
{
	char		command[MAX_STRING_SIZE];
	char		pwd[MAX_STRING_SIZE];
	char		value[MAX_STRING_SIZE];
} SPush_Control_Msg_Inf;

/*
 * @ingroup DataStructureDefs
 */
struct _IgrsDeviceInfo {
    char id			[IGRS_MAX_ID_LENGTH];
    char owner_id	[IGRS_MAX_ID_LENGTH];
    char name		[IGRS_MAX_ID_LENGTH];
    char location	[IGRS_MAX_ID_LENGTH];
    char model		[IGRS_MAX_ID_LENGTH];
    IgrsDeviceType type;
    IgrsDeviceStatus status;
};
typedef struct _IgrsDeviceInfo IgrsDeviceInfo;

/*
 * @ingroup DataStructureDefs
 */
struct _IgrsUserInfo {
    char id[IGRS_MAX_ID_LENGTH];
    IgrsUserStatus status;
};
typedef struct _IgrsUserInfo IgrsUserInfo;

/**
 * @ingroup EnumTypeDefs
 * @brief IGRS‘I‹§ûFÇí
 */
typedef enum _IgrsResourceType
{
    IGRS_RESOURCE_TYPE_PHOTO        = 0,        ///< picture
    IGRS_RESOURCE_TYPE_MUSIC        = 1,        ///< music
    IGRS_RESOURCE_TYPE_VIDEO        = 2,        ///< video
    IGRS_RESOURCE_TYPE_DOCUMENT     = 3,        ///< document
    IGRS_RESOURCE_TYPE_FOLDER       = 4,        ///< folder
    IGRS_RESOURCE_TYPE_QIYI         = 5,        ///< qiyi.com
    IGRS_RESOURCE_TYPE_LESHI        = 6,        ///< leShi.com
    IGRS_RESOURCE_TYPE_HUAN         = 7,        ///< huan.tv
    IGRS_RESOURCE_TYPE_UNSHARE      = 8,        ///< unshare
    IGRS_RESOURCE_TYPE_BESTV        = 9,        ///< bestv
    IGRS_RESOURCE_TYPE_UNKOWN       = 10,       ///< unkown
    IGRS_RESOURCE_TYPE_FILE         = 11,       ///< download
    IGRS_RESOURCE_TYPE_WEBPAGE      = 12,       ///< web page
    IGRS_RESOURCE_TYPE_STRING       = 13,       ///< string
    IGRS_RESOURCE_TYPE_POSTDATA     = 14,       ///< post data
    IGRS_RESOURCE_TYPE_ANDROIDAPP   = 15,       ///< android app
    IGRS_RESOURCE_TYPE_IOSAPP       = 16,       ///< ios app
    IGRS_RESOURCE_TYPE_EPG          = 17,       ///< epg
    IGRS_RESOURCE_TYPE_STREAM       = 18,       ///< stream
    IGRS_RESOURCE_TYPE_REMOTEDESK   = 19,       ///< remote desktop
    IGRS_RESOURCE_TYPE_CLASSIC      = 20,       ///< classic

} IgrsResourceType;

/*
 * @ingroup DataStructureDefs
 * @brief ÁRíS‘I‹§Í|õü
 */
struct _IgrsResourceInfo
{
    char file[IGRS_MAX_RESOURCE_PATH_LEN];      ///< ‘I‹§ÌÒ«⁄øù‡‰
    char name[IGRS_MAX_RESOURCE_NAME_LEN];      ///< ‘I‹§√“
    char path[IGRS_MAX_RESOURCE_PATH_LEN];      ///< ‘I‹§òÔ«⁄øù‡‰
    IgrsResourceType        type;               ///< ‘I‹§ûFÇí
    unsigned long int       size;   /* byte */  ///< ‘I‹§‰Œ‹÷®◊ı¬’u®ÿ
};
typedef struct _IgrsResourceInfo IgrsResourceInfo; 

#define IGRS_MAX_BESTV_LEN 1024
struct _IgrsAppBesTV
{
    IgrsResourceType type;
    char srvaddr    [IGRS_MAX_BESTV_LEN];
    char srvaddr2   [IGRS_MAX_BESTV_LEN];
    char userid     [IGRS_MAX_ID_LENGTH];
    char url        [IGRS_MAX_BESTV_LEN];
    char clientVersion [IGRS_MAX_ID_LENGTH];
    char password [IGRS_MAX_ID_LENGTH];
};

typedef struct _IgrsAppBesTV IgrsAppBesTV;

/**
 * @ingroup CallbackFuncDefs
 * œ∂Ò˚ùBñf®ÈìÌ‡KÖáè≤∂mõüœ∂Ò˚
 * @param packet  è≤…∆«ªãD
 * @return íè
 */
typedef
void (*cb_serverless_receive) (const char *from_id, const char *packet, void * ctx);

/**
 * @ingroup CallbackFuncDefs
 * œ∂Ò˚ùBñf®ÈíMæÚ–ûêF
 * @param device íMæÚÍ|õü
 * @return íè
 */
typedef 
void (* cb_device_status) (const char *device_id, IgrsDeviceStatus status);

typedef 
void (* cb_lan_device_status) (const char *device_id, 
    const char *name,
    const char *hostname, 
    unsigned int ip, 
    int port,
    IgrsDeviceStatus status,
    IgrsDeviceType devicetype);

typedef 
void (* cb_lan_roster_list) (char *roster);

/**
 * @ingroup CallbackFuncDefs
 * œ∂Ò˚ùBñf®È“…–u–ûêF
 * @param user “…–uÍ|õü
 * @return íè
 */
typedef
void (* cb_user_status) (const char *user_id, IgrsUserStatus status);

/**
 * @ingroup CallbackFuncDefs
 * öﬂò«“…–u
 * @param user_id ø¨?öﬂò«“…–u??«ªÕ[’cID
 * @return íè
 */
typedef
void (*cb_add_friend_request) (const char *user_id);

/**
 * @ingroup CallbackFuncDefs
 * öﬂò«“…–u«ª‹ÌœÊ
 * @param user_id ø¨?öﬂò«“…–u??«ªÕ[’cID
 * @param agree 
 *          - IGRS_TRUE ∞πÌ…
 *          - IGRS_FALSE ìÒòÔ
 * @return íè
 */
typedef
void (*cb_add_friend_response) (const char *user_id, IgrsBool agree, void *ctx);

/*
 * œ∂Ò˚ùBñf®€µwº¿µÓœ∂Ÿxèï
 * @param xml ı¬Ωﬁìd®€?èïµÃ‘¸®€xmlæÙãD‰Ù‘¸ïd«ªúyÊu®€?®È<errorcode>400</errorcode>
 */
typedef
void (* cb_result_xml)(const char *xml);

/*
 * œ∂Ò˚ùBñf®€µwº¿µÓœ∂Ÿxèï
 * @param result Ÿxèï?™B®È
 *		IGRS_RET_OK -- Ç·˜’
 *		IGRS_RET_FAIL -- áÍ‡¢
 *		IGRS_RET_ERR_NO_BINDING -- ¡ÉÙ¨Ã√”ÁÕ[’c
 */
/*typedef
void (* cb_result_ret)(IgrsRet result, void *ctx);
*/

typedef
void (* cb_recv_msg)(
    const char *user, 
    const char *device, 
    const char *ns,
    const char *xml,
    IgrsMessageType msg_type,
    void *userdata);

typedef
void (* cb_key_notify)(const char *user, const char *xml);

typedef
void (* cb_resource_browse_notify)(const char *user, const char *msg);

typedef
void (* cb_media_recommend)(const char *user, 
    const char *password,
    const char *title,
    const char *imgurl,
    const char *cid,
    const char *gid,
    int filesize,
    IgrsResourceType type,
    IgrsBool isPlayNow,
    long offset);

typedef
void (* cb_tv_cmd) (
    const char *password,
    const char *op_class,  /* 2∆˘®G°•©{?Ω«Ω« */
    const char *op_type,   /* ????Ω«Ω«D≥‡ */
    const char *op_param,  /* 2?ƒ«y     */
    const char *op_ctrl,   /* ƒ«?©{????? */
    const char *op_value); /* ?√◊       */

typedef
void (* cb_airCondition_cmd) (
                    const char *buffer  //透传整个消息
                              ); 

typedef enum _IgrsResourceGetResult
{
    IGRS_RESOURCE_GET_SUCCESS,
    IGRS_RESOURCE_GET_FAILED,
    IGRS_RESOURCE_PUT_SUCCESS,
    IGRS_RESOURCE_PUT_FAILED,
} IgrsResourceGetResult;

typedef
int (* cb_resource_progress) (
    const char *filename, 
    double dltotal, 
    double dlnow, 
    double ultotal, 
    double ulnow);

typedef
void (* cb_resource_offline_notify)(
    const char *userid, 
    const char *resourceid, 
    const char *xml);

typedef
void (* cb_resource_p2p_notify)(
    const char *userid, 
    const char *resourceid, 
    const char *xml);

/*
 * Õq¡ƒŸxèïûFÇí
 */
typedef enum _IgrsHttpsResult 
{ 
    IGRS_HTTPS_UNKNOWN_ERROR		= 0,
    IGRS_HTTPS_SUCCESS              = 200,
    IGRS_HTTPS_BAD_REQUEST 	        = 400,
    IGRS_HTTPS_INVALID_TOKEN 	    = 420,
    IGRS_HTTPS_USER_EXISTED   	    = 421,
    IGRS_HTTPS_EMPTY_PASSWORD	    = 422,
    IGRS_HTTPS_EMPTY_VERIFY_CODE    = 423,
    IGRS_HTTPS_DEVICE_EXISTED  	    = 424,
    IGRS_HTTPS_SERVER_ERROR		    = 500,
} IgrsHttpsResult;

/*
 * Õq¡ƒ’Ü÷Oœ∂Ò˚ùBñf
 */
typedef
void (* cb_register_result) (
        IgrsHttpsResult  result,  
        void * userdata);


/* --------------- LAN defination ---------------*/

typedef
void (*cb_start_notify) (const char *hostname);


//#ifdef IGRS_WIN32
//#include <crtdbg.h>
//#define check_if_valid(p) if(!(p)) \
//		{printf("%s:%d Warning: "#p" failed.\n", \
//		__FILE__, __LINE__); return;}
//	#define check_if_valid(p, ret) if(!(p)) \
//		{printf("%s:%d Warning: "#p" failed.\n", \
//		__FILE__, __LINE__); return (ret);}
//
//#else
//	#define check_if_valid(p) if(!(p)) \
//		{printf("%s:%d Warning: "#p" failed.\n", \
//		__func__, __LINE__); return;}
//	#define check_if_valid(p, ret) if(!(p)) \
//		{printf("%s:%d Warning: "#p" failed.\n", \
//		__func__, __LINE__); return (ret);}
//#endif /* IGRS_WIN32 */


#define MESSENGER_DEBUG 		(printf)

#define IGRS_WAN_DEBUG
#ifdef IGRS_WAN_DEBUG
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





#endif /* _IGRSTYPEDEF_H_ */

