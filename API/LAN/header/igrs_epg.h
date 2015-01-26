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
��ȡƵ���б�ӿ�
input:	currentPage�� ��ǰҳ�ţ�������������ʱ����Ҫ��ҳ����
input:	pageSize��    ��ǰ��ҳ��ȡ��channel��Ŀ
input:	xml��         ��ҳbuffer
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
return:	1���ɹ������������ҳ��0: �������ҳ  -1��ʧ��  
*******************************************************************************/
int igrs_get_channel_list (
    int currentPage,                                        /*��ǰҳ�ţ�������������ʱ����Ҫ��ҳ����*/
    int pageSize,                                           /*��ǰ��ҳ��ȡ��channel��Ŀ*/
    char *xml,
	const int req_id);                                            /*��ҳbuffer*/


/*******************************************************************************
���ݻص��ӿ�
input:	xml��         �ش�Ƶ���б���Ϣ��Ӧ��buffer
input:	xml_len��     ʵ�ʻش������ݳ���
input:	userdat��     �������ݵ��û����
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
*******************************************************************************/
typedef void (*cb_epg_info) ( char *xml ,int *xml_len,const void * userdat,const int req_id);      /*�ص���������*/


/*******************************************************************************
��ȡָ��Ƶ����Ŀ��Ϣ�Ľӿ�
input:	service_id��  Ƶ����Ӧ��service_id
input:	service_freq��Ƶ����Ӧ��Ƶ��
input:	day��         ����������0����ʾ���죬1��ʾ�ڶ��죬�������ƣ����֧��7�����ݣ�-1,��ʾȡ�������ڵ�����
input:	startTime��   ��Ŀ������ʼʱ�䣬�ӵ���00:00:00��ʼ����23:59:00 ��������λΪ����
input:	endTime��     ��Ŀ����ʱ�䣬�ӵ���00:00:00��ʼ����23:59:00 ��������λΪ���ӣ�����startTime��endTime��ͬ��
                      ��ʱ��ȡ�������ʱ��㲥���Ľ�Ŀ��������endTime<startTime
input:	on_result��   ���ݻص�����
input:	userdata��    �����ṩ���û������ľ��
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
return:	1 �ɹ�    -1��ʧ��
��ע:   ���ݴ�������epg��Ϣ��xml�ļ���ʽ���������ܹ�����xml�ļ�buffer���ص�����ʱ����xml�ļ�buffer������
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
����ָ�����ƵĽ�Ŀ��Ϣ
input:	searchName��  ��Ŀ����
input:	service_id��  Ƶ����Ӧ��service_id�б�
input:	service_freq��Ƶ����Ӧ��Ƶ���б�
input:	day��         ����������0����ʾ���죬1��ʾ�ڶ��죬�������ƣ����֧��7�����ݣ�-1,��ʾȡ�������ڵ�����
input:	startTime��   ��Ŀ������ʼʱ�䣬�ӵ���00:00:00��ʼ����23:59:00 ��������λΪ����
input:	endTime��     ��Ŀ����ʱ�䣬�ӵ���00:00:00��ʼ����23:59:00 ��������λΪ���ӣ�����startTime��endTime��ͬ��
                      ��ʱ��ȡ�������ʱ��㲥���Ľ�Ŀ��������endTime<startTime
input:	on_result��   ���ݻص�����
input:	userdata��    �����ṩ���û������ľ��
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
return:	1 �ɹ� -1��ʧ�� 
��ע��service_id ���� service_freqΪNULLʱ��������ȫ����������������ָ����service�б���������һ��Ԫ����0Ϊ����
���磺service_id[0] = 0x19,service_id[1] = 0x20,service_id[2] = 0;
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
��ȡָ����Ŀ��������Ϣ
input:	service_id��  ��Ŀ����Ƶ����Ӧ��service_id
input:	event_id��    ��Ŀ��event_id
input:	service_freq����Ŀ����Ƶ����Ӧ��Ƶ��
input:	on_result��   ���ݻص�����
input:	userdata��    �����ṩ���û������ľ��
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
return:	1 �ɹ��� -1��ʧ�� 
*******************************************************************************/
int igrs_get_specify_epg_description (
	  unsigned short service_id,
	  unsigned short event_id,
	  unsigned int service_freq,
	  cb_epg_info on_result,
	  const void * userdata,
	  const int    req_id);



/*******************************************************************************
��ֹ���ݻ�ȡ
input:  req_id��      �����ṩ�����ݻ�ȡ��ʶ
output:	None
return:	1 �ɹ��� -1��ʧ�� 
*******************************************************************************/
int igrs_terimate_epg_dat_req (
								   const int    req_id);



/********************************�����ӿ�******************************************/
/*******************************************************************************
���Ź���֪ͨ����
input:  handle:       �����ṩ�ľ��������ΪNULL
input:  error_code:   ���Ŵ����� 
output:	None
return:	None 
��ע:   error_codeΪ0,��ʾû���κδ��󣬷���������Ź��������쳣����
*******************************************************************************/
typedef void  (*open_callback)(const void *handle,int error_code);
/*******************************************************************************
����һ��ָ����service
input:  open_id��     �����ṩ��service���ű�ʶ
input:  service_id��  ����service ��service_id
input:  frequency��   ����servcie ��Ӧ��Ƶ��
input:  play_type��   ���ŷ�ʽ [1:����STB���ţ�2:�������粥�ţ�3: ͬʱ֧�ֱ��ز��ź��������粥��]
input:  handle��      �����ṩ�ľ��
input:  on_result:    ���Żص�֪ͨ����������֪ͨ���Ź����е�����
output:	None
return:	1 �ɹ��� -1��ʧ�� 
��ע:   ��ʼһ���µĲ���֮ǰ�������������ò��Źرսӿ�
*******************************************************************************/
int igrs_open_service (
	   unsigned short    open_id,
	   unsigned short    service_id,
	   unsigned int    frequency,
	   const int   play_type,
	   const void *    handle,
	   open_callback on_result);


/*******************************************************************************
��ָֹ���Ĳ�������
input:  open_id��      �����ṩ��service���ű�ʶ
input:  play_type��    ���ŷ�ʽ
output:	None
return:	1 �ɹ��� -1��ʧ�� 
��ע:���play_type�벥��ʱ��ͬ�����Զ��رղ���,��������ʱ���Բ���ʱע��Ļص�֪ͨ
*******************************************************************************/
int igrs_play_stop (
		unsigned short    open_id,
		const int   play_type);


/*******************************************************************************
�رղ���
input:  open_id��      �����ṩ��service���ű�ʶ
output:	None
return:	1 �ɹ��� -1��ʧ�� 
��ע���رղ��Ž�ֹͣ���еĲ������ͣ���������ʱ���Բ���ʱע��Ļص�֪ͨ
*******************************************************************************/
int igrs_play_close (
	unsigned short    open_id);



/*******************************************************************************
��ȡ���ڲ��ź������ĵ�service��Ϣ
input:	xml��        buffer
return:	1 �ɹ��� -1��ʧ�� 
*******************************************************************************/
int igrs_get_current_playinfo (char *xml);

#ifdef __cplusplus
}
#endif

#endif//__IGRS_EPG_H___


