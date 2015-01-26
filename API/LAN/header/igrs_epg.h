#ifndef __IGRS_EPG_H___
#define __IGRS_EPG_H___

//#include "../porting/ipanel_typedef.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum __IGRS_PLAY_TYPE{
	GRS_PLAY_TYPE_NONE,
	IGRS_PLAY_TYPE_LOCAL,      
	IGRS_PLAY_TYPE_PUSH_TS,
	IGRS_PLAY_TYPE_LOCAL_AND_PUSH_TS
}IGRS_PLAY_TYPE;

/*******************************************************************************
获取频道列表接口
input:	currentPage： 当前页号，在数据量过大时，需要多页传输
input:	pageSize：    当前分页获取的channel数目
input:	xml：         分页buffer
input:  req_id：      闪联提供的数据获取标识
output:	None
return:	1：成功，无需继续分页，0: 需继续分页  -1：失败  
*******************************************************************************/
int igrs_get_channel_list (
    int currentPage,                                        /*当前页号，在数据量过大时，需要多页传输*/
    int pageSize,                                           /*当前分页获取的channel数目*/
    char *xml,
	const int req_id);                                            /*分页buffer*/


/*******************************************************************************
数据回调接口
input:	xml：         回传频道列表信息对应的buffer
input:	xml_len：     实际回传的数据长度
input:	userdat：     闪联传递的用户句柄
input:  req_id：      闪联提供的数据获取标识
output:	None
*******************************************************************************/
typedef void (*cb_epg_info) ( char *xml ,int *xml_len,const void * userdat,const int req_id);      /*回调函数声明*/


/*******************************************************************************
获取指定频道节目信息的接口
input:	service_id：  频道对应的service_id
input:	service_freq：频道对应的频率
input:	day：         日期索引，0，表示当天，1表示第二天，依次类推，最多支持7天数据，-1,表示取所有日期的数据
input:	startTime：   节目播出开始时间，从当天00:00:00开始，到23:59:00 结束，单位为分钟
input:	endTime：     节目结束时间，从当天00:00:00开始，到23:59:00 结束，单位为分钟，允许startTime和endTime相同，
                      此时获取的是这个时间点播出的节目。不允许endTime<startTime
input:	on_result：   数据回调函数
input:	userdata：    闪联提供的用户上下文句柄
input:  req_id：      闪联提供的数据获取标识
output:	None
return:	1 成功    -1：失败
备注:   数据传递遵照epg信息的xml文件格式。闪联不能关联该xml文件buffer，回调返回时，该xml文件buffer即销毁
*******************************************************************************/
int igrs_get_epg_info (        
    unsigned short service_id,                                      /**/
    unsigned int service_freq,
    int day,
    int startTime,
    int endTime,
    cb_epg_info on_result,
    const void * userdata,
	const int req_id);


/*******************************************************************************
搜索指定名称的节目信息
input:	searchName：  节目名称
input:	service_id：  频道对应的service_id列表
input:	service_freq：频道对应的频率列表
input:	day：         日期索引，0，表示当天，1表示第二天，依次类推，最多支持7天数据，-1,表示取所有日期的数据
input:	startTime：   节目播出开始时间，从当天00:00:00开始，到23:59:00 结束，单位为分钟
input:	endTime：     节目结束时间，从当天00:00:00开始，到23:59:00 结束，单位为分钟，允许startTime和endTime相同，
                      此时获取的是这个时间点播出的节目。不允许endTime<startTime
input:	on_result：   数据回调函数
input:	userdata：    闪联提供的用户上下文句柄
input:  req_id：      闪联提供的数据获取标识
output:	None
return:	1 成功 -1：失败 
备注：service_id 或者 service_freq为NULL时，将进行全网搜索，否则搜索指定的service列表。数组的最后一个元素以0为结束
例如：service_id[0] = 0x19,service_id[1] = 0x20,service_id[2] = 0;
      service_freq[0] = 2590000,service_freq[1] = 2510000,service_freq[2] = 0;
*******************************************************************************/
int igrs_search_specify_epg_info(
    const char* searchName,
    unsigned short *service_id,
    unsigned int *service_freq,
    int day,
    int startTime,
    int endTime,
    cb_epg_info on_result,
    const void * userdata,
	const int req_id);



/*******************************************************************************
获取指定节目的描述信息
input:	service_id：  节目所在频道对应的service_id
input:	event_id：    节目的event_id
input:	service_freq：节目所在频道对应的频率
input:	on_result：   数据回调函数
input:	userdata：    闪联提供的用户上下文句柄
input:  req_id：      闪联提供的数据获取标识
output:	None
return:	1 成功， -1：失败 
*******************************************************************************/
int igrs_get_specify_epg_description (
	  unsigned short service_id,
	  unsigned short event_id,
	  unsigned int service_freq,
	  cb_epg_info on_result,
	  const void * userdata,
	  const int    req_id);



/*******************************************************************************
终止数据获取
input:  req_id：      闪联提供的数据获取标识
output:	None
return:	1 成功， -1：失败 
*******************************************************************************/
int igrs_terimate_epg_dat_req (
								   const int    req_id);



/********************************新增接口******************************************/
/*******************************************************************************
播放过程通知函数
input:  handle:       闪联提供的句柄，可以为NULL
input:  error_code:   播放错误码 
output:	None
return:	None 
备注:   error_code为0,表示没有任何错误，否则表明播放过程中有异常发生
*******************************************************************************/
typedef void  (*open_callback)(const void *handle,int error_code);
/*******************************************************************************
播放一个指定的service
input:  open_id：     闪联提供的service播放标识
input:  service_id：  播放service 的service_id
input:  frequency：   播放servcie 对应的频率
input:  play_type：   播放方式 [1:本地STB播放，2:推送网络播放，3: 同时支持本地播放和推送网络播放]
input:  handle：      闪联提供的句柄
input:  on_result:    播放回调通知函数，用来通知播放过程中的例外
output:	None
return:	1 成功， -1：失败 
备注:   开始一个新的播放之前，必须主动调用播放关闭接口
*******************************************************************************/
int igrs_open_service (
	   unsigned short    open_id,
	   unsigned short    service_id,
	   unsigned int    frequency,
	   const int   play_type,
	   const void *    handle,
	   open_callback on_result);


/*******************************************************************************
终止指定的播放类型
input:  open_id：      闪联提供的service播放标识
input:  play_type：    播放方式
output:	None
return:	1 成功， -1：失败 
备注:如果play_type与播放时相同，将自动关闭播放,发生例外时将以播放时注册的回调通知
*******************************************************************************/
int igrs_play_stop (
		unsigned short    open_id,
		const int   play_type);


/*******************************************************************************
关闭播放
input:  open_id：      闪联提供的service播放标识
output:	None
return:	1 成功， -1：失败 
备注：关闭播放将停止所有的播放类型，发生例外时将以播放时注册的回调通知
*******************************************************************************/
int igrs_play_close (
	unsigned short    open_id);



/*******************************************************************************
获取正在播放和推流的的service信息
input:	xml：        buffer
return:	1 成功， -1：失败 
*******************************************************************************/
int igrs_get_current_playinfo (char *xml);

#ifdef __cplusplus
}
#endif

#endif//__IGRS_EPG_H___


