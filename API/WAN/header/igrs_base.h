/**
 *
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author zhangchuan@igrslab.com
 * @date   2011-07-01
 *
 * @file   igrs_base.h
 *
 * @version 2011.07.01

 * @remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */



#ifndef _IGRS_BASE_H_
#define _IGRS_BASE_H_


#include <signal.h>
#include <stdio.h>
#include <stdlib.h> 

#include "igrstypedef.h"
#include "igrsutil_WAN.h"

IGRS_BEGIN_DECLS

IGRS_API
void igrs_subscrib_user_login_result(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_login_result(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_register_success(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_register_fail(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_register_success(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_register_fail(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_push_control(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_roster_clear(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_roster_receiver(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_roster_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_roster_clear(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_roster_receiver(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_roster_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_acpt_deny(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_subscribtion(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_unsubscribtion(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_buddy_deleted(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_buddy_deleted(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_capability_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_capability_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_nick_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_device_nick_presence(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_message(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_P2PUrl(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_P2PRequst(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_P2PAccept(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_P2PReject(cb_result_ret on_result);

IGRS_API
void igrs_subscrib_user_recv_P2PExecute(cb_result_ret on_result);

IGRS_API
IgrsRet igrs_init_wan(const char *device_id, IgrsDeviceType device_type, const char *vendor, const char *model);



IGRS_API
IgrsRet igrs_user_login_wan(const char *user_id, const char *password);
//IgrsRet igrs_user_login(const char *user_id, const char *password, cb_result_ret on_result);



IGRS_API 
IgrsRet igrs_user_logout_wan();

IGRS_API
IgrsRet igrs_device_login_wan(char *device_id);

IGRS_API
IgrsRet igrs_device_logout_wan();


IGRS_API
IgrsRet userRegister(const char *user_id, const char *domain, const char *password);

IGRS_API
IgrsRet deviceRegister(const char *device_id, const char *domain, const char *password, \
									const char *verifyCode,const char *deviceType,const char *vendor,const char *model);

IGRS_API 
IgrsRet userAddFriend(char* pJidBare, char* pJidName, char* pJidGroup);

IGRS_API
IgrsRet userDelFriend(char* pJidBare);
//IgrsRet userDelFriend(char* pJidBare, cb_result_ret on_result);

IGRS_API
//IgrsRet userUsubFriend(char* pJidBare, cb_result_ret on_result);
IgrsRet userUsubFriend(char* pJidBare);

IGRS_API
//IgrsRet userModFriend(char* pJidBare, char* pJidName, char* pJidGroup, cb_result_ret on_result);
IgrsRet userModFriend(char* pJidBare, char* pJidName, char* pJidGroup);

IGRS_API
IgrsRet userAcptFriend(char* pJidBare);

IGRS_API
IgrsRet userDenyFriend(char* pJidBare);

IGRS_API
IgrsRet userSendMsg( char * pJidBare, int nMsgType, char * pMessage);

IGRS_API
IgrsRet userBindDevice(char* pJidBare, char* pJidName, char* pJidGroup, char* verifycode);

IGRS_API
IgrsRet userUnbindDevice(char* pJidBare);

IGRS_API
IgrsRet userGetFriends();


IGRS_API
IgrsRet userSendAbilityNick(char *features, char* nickName);
//IgrsRet userSendAbilityNick(char features[MAX_FEATURES_COUNT][MAX_STRING_SIZE], char* nickName);

IGRS_API
IgrsRet userSendP2PUrl(char *type, char *peerJid,  char *url, char *name);


//IGRS_API
//IgrsRet userExchangeP2PJid();

IGRS_API
IgrsRet userSendPushPlayto( char * pType, char * pJid, char * pId, char * pNs, SPush_Playto_Msg_Inf * pPushMedia);

IGRS_API
IgrsRet userSendPushControl( char * pType, char * pJid, char * pId, char * pNs, SPush_Control_Msg_Inf* pPushMedia);

//IGRS_API
//IgrsRet userSendPushPlayto(char * pType, char * pJid);

IGRS_API
IgrsRet deviceUnbindUser(char* pJidBare);

IGRS_API
IgrsRet deviceAcptBind(char* pJidBare);

IGRS_API
IgrsRet deviceSendMsg( char * pJidBare, int nMsgType, char * pMessage);

IGRS_API
void Result_Handle(char* result, char* detailInfo);

IGRS_API
IgrsRet igrs_register_user(const char *user_id, const char *password, cb_result_ret on_result);

IGRS_API
IgrsRet deviceSendPushPlayto( char * pType, char * pJid, char * pId, char * pNs, SPush_Playto_Msg_Inf * pPushMedia);

IGRS_API
IgrsRet deviceSendPushControl( char * pType, char * pJid, char * pId, char * pNs, SPush_Control_Msg_Inf * pPushMedia);

IGRS_API
bool isDeviceID(char id[]);

IGRS_END_DECLS 
#endif /* _IGRS_BASE_H_ */

