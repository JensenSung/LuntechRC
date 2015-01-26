/**
 *
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author zhangchuan@igrslab.com
 * @date   2011-07-01
 *
 * @file   igrs_serverless_base.h
 *
 * @version 2011.07.01

 * @remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */

/*!
 @header igrs_serverless_base.h
 @abstract igrs serverless base headers
 @author Peter
 @version 1.00 2012/05/15 Creation 
 */


#ifndef _IGRS_SERVERLESS_BASE_H_
#define _IGRS_SERVERLESS_BASE_H_


#include <signal.h>
#include <stdio.h>
#include <stdlib.h> 
#ifdef IGRS_WIN32
#include <windows.h> 
#endif
#include "igrs_typedef.h"
#include <string.h>

IGRS_BEGIN_DECLS

/*!
 @method
 @abstract igrs serverless init base
 @discussion xxx = igrs_serverless_init_base(const char *device_id;
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_init_base(const char *device_id, 
											    IgrsDeviceType device_type,
											    //const char *device_type_in_string,
											    const char *model,
											    const char *vendor,
											    const char *verson,
											    const char *reserve);
/*!
 @method
 @abstract igrs serverless start base
 @discussion xxx = igrs_serverless_start_base int port,
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_start_base( int port,
								    cb_start_notify onAnnounceSuccess,
								    cb_start_notify onAnnounceFailed);
/*!
 @method
 @abstract igrs serverless subscribe recommend base
 @discussion xxx = igrs_serverless_subscribe_recommend_base (cb_media_recommend cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_subscribe_recommend_base (cb_media_recommend cb);

/*!
 @method
 @abstract igrs serverless subscribe tv command base
 @discussion xxx = igrs_serverless_subscribe_tv_command_base (cb_tv_cmd cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_subscribe_tv_command_base (cb_tv_cmd cb);

/*!
 @method
 @abstract igrs serverless subscribe device presence _base
 @discussion xxx = igrs_serverless_subscribe_device_presence_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_subscribe_device_presence_base (cb_lan_device_status cb);

/*!
 @method
 @abstract igrs serverless subscribe device presence _base
 @discussion xxx = igrs_serverless_unsubscribe_device_presence_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_unsubscribe_device_presence_base ();
/*!
 @method
 @abstract igrs_serverless_roster_clean_base
 @discussion xxx = igrs_serverless_roster_clean_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_roster_clean_base ();
/*!
 @method
 @abstract igrs_serverless_roster_print_base
 @discussion xxx = igrs_serverless_roster_print_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_roster_print_base ();
/*!
 @method
 @abstract igrs_serverless_roster_list_base
 @discussion xxx = igrs_serverless_roster_list_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_roster_list_base (cb_lan_roster_list cb);
/*!
 @method
 @abstract igrs_serverless_sendpacket_base
 @discussion xxx = igrs_serverless_sendpacket_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_sendpacket_base (char *arg1, char *arg2);
/*!
 @method
 @abstract igrs_serverless_browse_resource_base
 @discussion xxx = igrs_serverless_browse_resource_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_browse_resource_base (
								    const char *toJid,
								    int currentPage,
								    int pageSize,
								    IgrsResourceType contentType,
								    const char *filter,
								    const char *password,
								    cb_resource_browse_notify on_recv);
/*!
 @method
 @abstract igrs_serverless_stop_base
 @discussion xxx = igrs_serverless_stop_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_stop_base ();

IGRS_API
IgrsRet igrs_serverless_release_base ();

/*!
 @method
 @abstract igrs_serverless_send_tv_command_base
 @discussion xxx = igrs_serverless_send_tv_command_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_send_tv_command_base (const char *toJid,
													    const char *password,
													    const char *op_class,
													    const char *op_type, 
													    const char *op_param, 
													    const char *op_ctrl, 
													    const char *op_value);
/*!
 @method
 @abstract igrs_serverless_recommend_base
 @discussion xxx = igrs_serverless_recommend_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_recommend_base (const char *toJid,
											    const char *password,
											    const char *title,
											    const char *imgurl,
											    const char *contentProvider,
											    const char *resource,
											    int filesize,
											    IgrsResourceType type,
												IgrsBool isPlayNow,
											    long offset);
/*!
 @method
 @abstract igrs_serverless_request_epgservice_base
 @discussion xxx = igrs_serverless_request_epgservice_base (cb_lan_device_status cb);
 @result void
 */
IGRS_API
IgrsRet igrs_serverless_request_epgservice_base (const char * toJid,
												    const char * vendor,
												    int currentPage,
												    int pageSize,
												    const char *password,
												    cb_result_xml on_recv);


IGRS_API
IgrsRet igrs_serverless_request_epgplay_base ( const char * toJid,
												    cb_result_xml on_recv,
												    void *userdata);


IGRS_API
IgrsRet igrs_serverless_request_epginfo_base (const char * toJid,
                                              const char * vendor,
                                              const char * searchWord,
                                              int serviceid,
                                              unsigned int frequency,
                                              unsigned int day,
                                              unsigned int startTime,
                                              unsigned int endTime,
                                              int currentPage,
                                              int pageSize,
                                              const char *password,
                                              int eventid,
                                              cb_result_xml on_recv);	



IGRS_END_DECLS 
#endif /* _IGRS_SERVERLESS_BASE_H_ */

