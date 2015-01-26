/*
 * Copyright (C) 2007-2012 IGRSLab
 *
 * \author fanjx@igrslab.com
 * \date   2011-06-27
 *
 * \brief  implement of igrs register module
 *
 * \file   register.h
 *
 * \remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */

#if !defined(__IGRS_RREGISTER_H)
#define __IGRS_RREGISTER_H



#include "igrstypedef.h"
#include "igrsutil_WAN.h"

#define IGRS_MAX_HTTP_URL_LEN     2048
#define IGRS_MAX_HTTP_POST_LEN    2048
#define IGRS_MAX_ID_LEN           2048

#define IGRS_LOGIN_REGISTER_DOMAIN "igrslink.com"
//#define IGRS_USER_LOGIN_DOMAIN @"@igrslink.com"

#if 1
#define IGRS_REGISTER_USER_SERVER "https://portal.igrslink.com:8443/rest/v1/user/register.xml" 
#define IGRS_REGISTER_DEVICE_SERVER "https://portal.igrslink.com:8443/rest/v1/device/register.xml" 
#define IGRS_REGISTER_DOMAIN "192.168.1.100"
#else
#define IGRS_REGISTER_USER_SERVER "https://192.168.1.173:8443/rest/v1/user/register.xml" 
//#define IGRS_REGISTER_USER_SERVER "http://192.168.1.100:8080/rest/v1/user/register.xml" 
#define IGRS_REGISTER_DEVICE_SERVER "https://192.168.1.173:8443/rest/v1/device/register.xml" 
#define IGRS_REGISTER_DOMAIN "hisense.igrslink.com"

#endif

#include <stdio.h>

#ifdef __cplusplus
    extern "C" {
#endif

typedef 
void (* cb_success) (const char *igrsID, const char *xml, void *userdata);

typedef
void (* cb_failed) (const char *igrsID, const char *xml, void *userdata);

IGRS_API
int registerUser (int version, 
    const char * domain, 
    const char * userName, 
    const char * password,
    cb_success  on_success,
    cb_failed   on_failed,
    int isBlock);

IGRS_API
int registerDevice (int version, 
    const char * domain, 
    const char * deviceName, 
    const char * password, 
    const char * verifyCode,
    const char * deviceType,
    const char * vendor,
    const char * model,
    cb_success  on_result_success,
    cb_failed   on_result_failed,
    int isBlock);

#ifdef __cplusplus
}
#endif

#endif /*__IGRS_RREGISTER_H */
