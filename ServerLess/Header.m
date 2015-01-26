//
//  Header.m
//  ServerLess
//
//  Created by zfm on 13-6-28.
//
//
#import "Header.h"

@implementation Header
+(BOOL)isPreferredLanguageHans
{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSArray * languages = [defs objectForKey:@"AppleLanguages"];
    NSString * preferredLang = [languages objectAtIndex:0];
    if ([preferredLang isEqualToString:@"zh-Hans"])//||[preferredLang isEqualToString:@"zh-Hant"])  //简体中文  繁体中文
    {
        return YES;
    }
    return NO;
}
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


+ (void)buttonPressed:(id)sender
{
    //1S蜂鸣音
    AudioServicesPlaySystemSound(SOUNDID);//kSystemSoundID_Vibrate 如果有声音震动设置，可以有1-3S的振动音

    if ((friend==nil) || (IsOnline==0)) {
        NSLog(@"设备不在线、演示等提示信息");
        NSString *message;
        
        if (friend==nil) {
            message=NSLocalizedString(@"演示状态",@"演示状态");
        } else
        {
            message=NSLocalizedString(@"该设备已下线",@"该设备已下线");
        }
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];
        
    } else
        //    if ((friend!==nil)&&(IsOnline=YES))
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self sendTvCmd:sender];
        });
    }
    
}
+ (void)sendTvCmd:(id)sender
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
            
        case 20://09键 也是数字1
            NSLog(@"press the 1");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_1");
            break;
        case 21://MEDIA center
            NSLog(@"press the 2");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_2");
            break;
        case 22://APPS
            NSLog(@"press the 3");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_3");
            break;
        case 23:
            NSLog(@"press the 4");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_4");
            break;
        case 24:
            NSLog(@"press the 5");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_5");
            break;
        case 25:
            NSLog(@"press the 6");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_6");
            break;
        case 26:
            NSLog(@"press the 7");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_7");
            break;
        case 27:
            NSLog(@"press the 8");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_8");
            break;
        case 28:
            NSLog(@"press the 9");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_9");
            break;
        case 29://* INFO
            NSLog(@"press the 信息*");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_INFO");
            break;
        case 30:
            NSLog(@"press the 0");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_0");
            break;
        case 31://播放暂停 #
            NSLog(@"press the message");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_ALTERNATES");
            break;
            
        case 99://电源
            NSLog(@"you press the 电源");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_POWER");
            break;
        case 100:
            NSLog(@"press the up");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_UP");
            break;
        case 101:
            NSLog(@"press the left");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_LEFT");
            break;
        case 102:
            NSLog(@"press the down");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_DOWN");
            break;
        case 103:
            NSLog(@"press the right");
            //NSLog(@"%@",friend);
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_RIGHT");
            break;
            
        case 104:
            NSLog(@"you press the menuBtn");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_MENU");
            break;
        case 105:
            NSLog(@"you press the returnBtn");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_RETURNS");
            break;
        case 106://主页
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_HOME");
            break;
        case 107://静音
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_MUTE");
            break;
        case 108://信号源
            NSLog(@"press the 信号源");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_SOURCES");
            break;
        case 109://OK键盘
            NSLog(@"press the ok");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_OK");
            break;
        case 110://
            NSLog(@"you press the VolumnDown");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_VOLUMEDOWN");
            break;
        case 111:
            NSLog(@"you press the VolumnUp");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_VOLUMEUP");
            break;
            
        case 113:
            NSLog(@"press the channel up");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_CHANNELUP");
            break;
        case 114:
            NSLog(@"press the channel down");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_CHANNELDOWN");
            break;
            
        case 115://VOD
            NSLog(@"press the 3D");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_3DS");
            break;
            
        case 116://电视汇 ATV/DTV
            NSLog(@"press the 电视汇");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_TVS");
            break;
        case 117:
            NSLog(@"press the KEY_RED");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_RED");
            break;
        case 118:
            NSLog(@"press the KEY_GREEN");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_GREEN");
            break;
        case 119:
            NSLog(@"press the KEY_YELLOW");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_YELLOW");
            break;
        case 120:
            NSLog(@"press the KEY_BLUE");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_BLUE");
            break;
        case 121://设置键
            NSLog(@"press the 设置");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "com.android.settings");
            break;
        case 122://删除键
            NSLog(@"press the 删除");
            igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "delete", "KEY_BACKSPACE");
            break;
            
        default:
            break;
    }
    [pool release];

}


+ (void)getTvAbility:(id)sender
{
    NSString *name=sender;
    NSLog(@"获取设备%@支持能力",name);
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    IgrsRet ret= igrs_serverless_send_tv_command_base([name UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "GET_TV_ABILITY");
    
    if (!ret==0)
    {
        NSLog(@"获取设备支持能力失败！");
    }
    [pool release];
}
+(void)start_input_method
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    // NSString *message;
    igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "START_INPUT_METHOD");
    
    /*if (!ret==0)
     {
     NSLog(@"输入法打开失败！");
     message=NSLocalizedString(@"输入法打开失败！",@"输入法打开失败！");
     [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];
     return;
     }*/
    [pool release];
}

+(void)close_input_method
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    
    IgrsRet ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "CLOSE_INPUT_METHOD");
    if (!ret==0)
    {
        NSLog(@"输入法关闭失败！");
    }
    [pool release];
}
+(void)get_tv_content
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    IgrsRet ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "GET_TV_CONTENT");
    if (!ret==0)
    {
        NSLog(@"读取电视内容失败！");
    } else
    {
    }
    [pool release];
}

+ (void)send_input_method:(id)sender
{
    NSString *keycode=sender;
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];

    igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL",[keycode UTF8String]);;
    [pool release];

}

+ (void)MouseSingleTap
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    NSLog(@"向电视传送鼠标单击命令：");
    igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set", "KEY_LEFTMOUSEKEYS");
    [pool release];
}

+(void)MouseMove:(id)sender //(NSNotification *)notification
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc]init];
    NSString *keycode;
    keycode=[NSString stringWithFormat:@"%@",sender];//notification.object
    NSLog(@"send Move command to tv:%@",keycode);
    //    usleep(200000);
    int ret;
    ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set",[keycode UTF8String]);
    if (!ret==0) {
        NSLog(@"鼠标移动命令执行失败！");
    }
    [pool release];
}

@end
