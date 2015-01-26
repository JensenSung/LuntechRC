//
//  message.m
//  ServerLess
//
//  Created by sjb on 13-9-29.
//
//

#import "message.h"

@interface message ()

@end

@implementation message

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


//注册回调函数
igrs_serverless_subscribe_tv_command_base(get_Tv_buffer);

//回调函数
static void  get_Tv_buffer(const char *password,const char *op_class,const char *op_type,const char *op_param,const char *op_ctrl,const char *op_value)
{
    NSLog(@"收到电视返回信息");
    NSString * string = [NSString stringWithUTF8String:op_value];
    NSLog(@"收到电视返回信息:%@",string);
    //..........
}


//(@"获取设备支持能力");
IgrsRet ret= igrs_serverless_send_tv_command_base([name UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "GET_TV_ABILITY");
if (!ret==0)
{
    NSLog(@"获取设备支持能力失败！");
    //   return;
}

//打开输入法
IgrsRet ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "START_INPUT_METHOD");

//重新读取电视内容

IgrsRet ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "INPUTMETHOD_CONTROL", "input", NULL, "INPUTMETHOD_CONTROL", "GET_TV_CONTENT");


//发送鼠标命令
ret=igrs_serverless_send_tv_command_base([friend UTF8String], "pwd123", "input", "input", NULL, "set","REL_0003_0002");