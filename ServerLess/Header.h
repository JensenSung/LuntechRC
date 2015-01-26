//
//  Header.h
//  ServerLess
//
//  Created by zfm on 13-6-28.
//
//

#ifndef ServerLess_Header_h
#define ServerLess_Header_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "AudioToolbox/AudioToolbox.h"
#import "igrstypedef.h"
#import "igrs_serverless_base.h"


#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPad2 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768, 1024), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPad4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1536, 2048), [[UIScreen mainScreen] currentMode].size) : NO)
#define apgeTabarName @"apgeTabarName"
#define PopView_TAG 2000000
#define APP_URL @"http://itunes.apple.com/lookup?id=我程序的APPID"
//遥控器id=519942740
#define ContentOffset 260
#define ContentMinOffset 40
//#define MouseQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
//#define InputQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define APP_UPDATE_PATH @"http://tvlist.dnet-home.net/nettv/multiscreens/api/hall.php?platform=ios&device=iphone"
#define SOUNDID 1104 //键盘点击声音
//#define SBC
#define kDeviceName @"DeviceName"
#define kDeviceID @"DeviceID"
#define kIPAddress @"IPAddress"
#define kPort @"Port"
#define kDeviceType @"DeviceType"
#define kHostName @"HostName"

#endif
//GET_TV_ABILITY$1110
/*
 第一位：代表输入法；0-不支持手机输入；1-支持；
 第二位：代表语音；0-不支持；1-支持；
 第三位：代表电视汇；0-不支持；1-支持；
 第四位：遥控器类型；0-A遥控器；1-B遥控器；
 */
//
//NSString *devicename;
//当前版本信息
NSString *AppVersion;
//电视名字
NSString *friend;
//设备状态  0-不在线；1-在线
NSInteger IsOnline;
//遥控器类型 0-B 1-A
NSInteger IsA;
//是否支持输入法
NSInteger IsSupportKeyBoard;

//成功获取设备支持能力
NSInteger IsGetTvAbility;

//是否支持语音
NSInteger IsSupportVoice;
//是否支持电视汇
NSInteger IsSupportTvDepart;

// 根据设备类型设置倍数的值 PAD=2；Phone=1;
NSInteger Times;
//根据设备类型选择偏移量  
NSInteger Yoffset;
NSInteger Xoffset;
dispatch_queue_t MouseQueue;
dispatch_queue_t InputQueue;
//dispatch_queue_t AppQueue;
//dispatch_queue_t DeviceQueue;

@interface Header: NSObject
//{
//}
+(BOOL)isPreferredLanguageHans;
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize) size;
+(void)buttonPressed:(id)sender;
+(void)sendTvCmd:(id)sender;
+(void)getTvAbility:(id)sender;
+(void)start_input_method;
+(void)close_input_method;
+(void)send_input_method:(id)sender;
+(void)get_tv_content;
+(void)MouseSingleTap;
+(void)MouseMove:(id)sender;
@end


