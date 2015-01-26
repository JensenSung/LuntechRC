#import "igrs_serverless_base.h"
#import "ServerLessViewController.h"
#import "ServerLessAppDelegate.h"

@class ServerBrowserDelegate;

@implementation ServerLessViewController

@synthesize textField;



- (id)init {
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

void print_media (const char *user,
                  const char *password,
                  const char *title,
                  const char *imgurl,
                  const char *contentProvider,
                  const char *resource,
                  int filesize,
                  IgrsResourceType type,
                  IgrsBool isPalyNow,
                  long offset)
{
    printf("recv lan internet recommend from : %s\n"
           "password = %s\n"
           "title = %s\n"
           "imgurl = %s\n"
           "contentProvider = %s\n"
           "resource = %s\n"
           "filesize = %d\n"
           "type = %d\n"
           "play = %d\n"
           "offset = %ld\n",
           user,
           password,
           title,
           imgurl,
           contentProvider,
           resource,
           filesize,
           type,
           isPalyNow,
           offset);
}


void print_cmd (
                const char *password,
                const char *op_class,  /*  */
                const char *op_type,   /*  */
                const char *op_param,  /*  */
                const char *op_ctrl,   /*  */
                const char *op_value)  /*  */
{
    printf("recv tv key password: '%s'\n class:'%s'\n type:'%s'\n param:'%s'\n ctrl:'%s'\n value:'%s'\n",
           password,
           op_class, 
           op_type, 
           op_param, 
           op_ctrl,
           op_value);
}

void print_resource (const char*jid, const char *id)
{
    printf("recv recommend resource '%s' from %s\n", id, jid);
}

void print_device (const char *xml)
{
    printf ("recv device info is '%s'\n", xml);
}

void print_epg (const char *xml)
{
    printf ("recv epg list is '%s'\n", xml);
}

void print_epginfo (const char *xml)
{
    printf ("recv epg info is '%s'\n", xml);
}

void print_epgplay (const char *xml)
{
    printf ("recv epg info is '%s'\n", xml);
}

/* ---------------------------------------------------------------- */
#if 0
void help_print(void)
{
	printf ("Command available:\n");
	printf ("00.R  -- random test 100000 times\n");
    printf ("01.f  -- get friends list\n");
	printf ("02.s  -- send message to friend\n");
	printf ("03.c  -- chat with friend\n");
	printf ("06.r  -- request resource at specify device\n");
	printf ("07.m  -- send one time tv key command\n");
	printf ("08.sp -- send 100000 times recommend\n");
	printf ("10.d  -- get device infomation\n");
	printf ("12.i  -- recommend internet media\n");
	printf ("13.a  -- test all function\n");
	printf ("14.q  -- quit program\n");
}
#endif
void help_print(void)
{
	printf ("Command available:\n");
	printf ("1、R  -- 每次间隔1-10秒随机推送消息到指定设备\n");
    printf ("2、f  -- 获取局域网在线设备列表\n");
	printf ("3、s  -- 推送消息给指定的在线设备\n");
	printf ("4、r  -- 请求指定设备的图片列表\n");
	printf ("4、o  -- 请求指定设备的音频列表\n");
	printf ("4、w  -- 请求指定设备的视频列表\n");
	printf ("5、m  -- 推送按键给指定的在线设备\n");
	printf ("6、sp -- 每次间隔3秒请求指定设备的资源列表,类型0-9，20\n");
	printf ("7、i  -- 推送互联网视频到指定设备\n");
	printf ("8、e  -- 请求获取epg列表\n");
	printf ("9、g  -- 请求获取详细epg信息\n");
	printf ("10、p  -- 请求epg play信息\n");
	printf ("0、q  -- 退出程序\n");
}

void friend_print(void)
{
    //igrs_serverless_roster_print (stack);
    igrs_serverless_roster_print_base ();
}

void send_msg(char *arg1, char *arg2)
{
    IgrsRet ret = IGRS_RET_FAIL;
	
	//ret = igrs_serverless_sendpacket(stack, arg1, arg2);
    ret = igrs_serverless_sendpacket_base(arg1, arg2);
	if (ret != IGRS_RET_OK)
		printf ("send message failed, Usage: s device_id\n");
	else
		printf ("send message success\n");
}

void recommend_media_repeat_print(char *arg1)
{
	int i = 0;
	for (i = 0; i < 10; i++) 
	{
#if 1
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 0, NULL, NULL, print_resource);        /* photo */
        igrs_serverless_browse_resource_base (arg1, 1, 20, 0, NULL, NULL, print_resource);        /* photo */
	    sleep(SECS);
	    igrs_serverless_browse_resource_base (arg1, 1, 20, 1, NULL, NULL, print_resource); 
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 1, NULL, NULL, print_resource);
	    sleep(SECS);
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 2, NULL, NULL, print_resource); 
	    igrs_serverless_browse_resource_base (arg1, 1, 20, 2, NULL, NULL, print_resource);        /* video */
	    sleep(SECS);
#endif
#if 0
        // igrs_serverless_browse_resource (stack, arg1, 1, 20, 3, NULL, NULL, print_resource); 
        igrs_serverless_browse_resource_base (arg1, 1, 20, 3, NULL, NULL, print_resource);    /* document */
	    sleep(SECS);
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 4, NULL, NULL, print_resource); 
	    igrs_serverless_browse_resource_base (arg1, 1, 20, 4, NULL, NULL, print_resource);    /* folder */
	    sleep(SECS);
        igrs_serverless_browse_resource_base (arg1, 1, 20, 5, NULL, NULL, print_resource);	
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 5, NULL, NULL, print_resource);    /* qiyi */
	    sleep(SECS);
	    //igrs_serverless_browse_resource (stack, arg1, 1, 20, 6, NULL, NULL, print_resource);  
        igrs_serverless_browse_resource_base (arg1, 1, 20, 6, NULL, NULL, print_resource); 
	    sleep(SECS);
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 7, NULL, NULL, print_resource); 	   
        igrs_serverless_browse_resource_base (arg1, 1, 20, 7, NULL, NULL, print_resource);    /* huan */
	    sleep(SECS);
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 9, NULL, NULL, print_resource);
	    igrs_serverless_browse_resource_base (arg1, 1, 20, 9, NULL, NULL, print_resource);
	    sleep(SECS);
#endif
        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 20, NULL, NULL, print_resource);         
        igrs_serverless_browse_resource_base (arg1, 1, 20, 20, NULL, NULL, print_resource);   /* Classic */
	    sleep(SECS);
	}
    
}

void quit_program(void)
{
    IgrsRet ret = IGRS_RET_FAIL;
	//ret = igrs_serverless_stop (stack);
    ret = igrs_serverless_stop_base ();
	if (ret != IGRS_RET_OK)
		printf ("stop ret is %d\n", ret);
    
    //ret = igrs_serverless_release (stack);
	ret = igrs_serverless_release_base();
	if (ret != IGRS_RET_OK)
		printf ("release ret is %d\n", ret);
}

int check_param(const char *arg1)
{
    if (strlen(arg1) == 0)
    {
        printf ("参数错误，必须指定在线的设备id\n");
        return -1;
    }
    else
    {
        printf ("参数正确---string is:%s  strlen(arg1)=%d------\n", arg1, strlen(arg1));
        return 0;
    }
}

int cmd_process(char* cmdline) 
{
	char cmd[50] = {0}, arg1[50] = {0}, arg2[50] = {0};
    IgrsRet ret = IGRS_RET_FAIL;
	int i = 0, j = 0;
    int iret = 0;
    
	//sscanf()函数的功能：把第1个参数cmdline，按照第2个参数format，转换后的值保存到第3-个参数中
	sscanf(cmdline, "%s%s%s", cmd, arg1, arg2);
	switch (cmd[0])
	{
		case 'h':
			help_print();
			break;
		case 'f':
			friend_print();
			break;
		case 's':
        {
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            if (cmd[1] == 'p')
            {
                recommend_media_repeat_print(arg1);
                break;
            }
            else
            {
                send_msg(arg1, arg2);
                break;
            }
        }
			break;
#if 0
		case 'c':
			ret = igrs_serverless_sendmessag(stack, arg1, arg2, 0);
			if (ret == IGRS_RET_OK)
				printf ("chat success\n");
			else
				printf ("chat failed, Usage: c device_id 'msg'\n");
			break;
#endif 
		case 'r':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            // igrs_serverless_browse_resource (stack, arg1, 1, 20, 0, NULL, NULL, print_resource);          
            igrs_serverless_browse_resource_base (arg1, 1, 20, 0, NULL, NULL, print_resource);
			break;
        case 'o':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            //igrs_serverless_browse_resource (stack, arg1, 1, 20, 1, NULL, NULL, print_resource);
            igrs_serverless_browse_resource_base (arg1, 1, 20, 1, NULL, NULL, print_resource);
			break;
        case 'w':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            //igrs_serverless_browse_resource (stack, arg1, 1, 20, 2, NULL, NULL, print_resource);
            igrs_serverless_browse_resource_base (arg1, 1, 20, 2, NULL, NULL, print_resource);
			break;
            
		case 'A':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            //igrs_serverless_browse_resource (stack, arg1, 1, 20, 20, NULL, NULL, print_resource);
            igrs_serverless_browse_resource_base (arg1, 1, 20, 20, NULL, NULL, print_resource);
			break;
            
		case 'm':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            //ret = igrs_serverless_send_tv_command (stack, arg1,"pwd123", "input", "input", NULL, "set", "KEY_A");
			ret = igrs_serverless_send_tv_command_base (arg1,"pwd123", "input", "input", NULL, "set", "KEY_A");
			sleep(1);
            // ret = igrs_serverless_send_tv_command (stack, arg1,"pwd123", "input", "input", NULL, "set", "KEY_LEFT");
            ret = igrs_serverless_send_tv_command_base (arg1,"pwd123", "input", "input", NULL, "set", "KEY_LEFT");
			if (ret == IGRS_RET_OK)
				printf ("send tv command success\n");
			else
                printf ("send tv command failed, Usage: m device_id\n");
			break;
#if 0
		case 'd':
			ret = igrs_serverless_request_deviceinfo (stack, arg1, print_device);
			if (ret == IGRS_RET_OK)
				printf ("get device infomation success\n");
			else
                printf ("get device info failed, Usage: d device_id\n");
			break;
#endif
		case 'i':
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
			//ret = igrs_serverless_recommend (stack, arg1, "pass", "title_tst", "imgurl_tst","contentProvider_tst", "resource_tst", 123, 1, 1, 123);	//倒数第3个参数，0-图片，1-音频，2-视频
            //ret = igrs_serverless_recommend (stack, arg1, "pass", "title_tst", "imgurl_tst","contentProvider_tst", "http://10.1.30.201:8080/http", 123, 2, 1, 123);	//倒数第3个参数，0-图片，1-音频，2-视频
			ret = igrs_serverless_recommend_base (arg1, "pass", "title_tst", "imgurl_tst","contentProvider_tst", "http://10.1.30.201:8080/http", 123, 2, 1, 123);	//倒数第3个参数，0-图片，1-音频，2-视频
			/*
             http://10.1.30.201:8080/http
             rtsp://10.1.30.201:5544/rtsp
             udp://@10.1.30.201:1234
             */
			//ret = igrs_video_recommend_to_device(arg1, "pass", "title_test", "imgurl_test", "cid_test", "url", 9999, 2,  );
			if (ret == IGRS_RET_OK)
				printf ("internet media recommend success\n");
			else 
				printf ("internet media recommend failed, Usage: i device_id\n");
			break;
#if 0
		case 'a':
        {
            igrs_serverless_send_tv_command (stack, arg1, "pwd123", "input", "input", NULL, "set", "KEY_TEST_SV");
            usleep (10);
            igrs_serverless_recommend (stack, arg1, "pass",
                                       "title_tst", "imgurl_tst","contentProvider_tst", "resource_tst", 123, 1, 1, 123);
            usleep (10);
            igrs_serverless_browse_resource (stack, arg1, 1, 20, 0, NULL, NULL, print_resource);
            usleep (10);
            igrs_serverless_send_tv_command (stack, arg1,"pwd123", "input", "input", NULL, "set", "KEY_TEST_A");
            usleep (10);
        }
			break;
#endif
        case 'R':
        {
            if ((iret = check_param(arg1)) == -1) 
                return -1; 
            
            for (j = 0; j < R_TIMES; j++)
            {
                i = random(8);
                
                switch (i)
                {
                    case 0:
                    case 1:
                        // igrs_serverless_send_tv_command (stack, arg1, "pwd123", "input", "input", NULL, "set", "KEY_TEST_SV");                  
                        igrs_serverless_send_tv_command_base (arg1, "pwd123", "input", "input", NULL, "set", "KEY_TEST_SV");
                        //usleep(U_SEC);
                        sleep(SEC);			/* 随机测试间隔1--10秒 */
                        break;
                    case 2:
                        //igrs_serverless_recommend (stack, arg1, "pass","title_tst", "imgurl_tst","contentProvider_tst", "resource_tst", 123, 1, 1, 123);
                        igrs_serverless_recommend_base (arg1, "pass", "title_tst", "imgurl_tst","contentProvider_tst", "resource_tst", 123, 1, 1, 123);
                        usleep(U_SEC);
                        //sleep(SEC);
                        break;
                    case 3:
                        //igrs_serverless_browse_resource (stack, arg1, 1, 20, 0, NULL, NULL, print_resource);                     
                        igrs_serverless_browse_resource_base (arg1, 1, 20, 0, NULL, NULL, print_resource);
                        usleep(U_SEC);
                        //sleep(SEC);
                        break;
                    case 4:
                    case 5:
                        //igrs_serverless_send_tv_command (stack, arg1, "pwd123", "input", "input", NULL, "set", "KEY_TEST_A");
                        igrs_serverless_send_tv_command_base (arg1, "pwd123", "input", "input", NULL, "set", "KEY_TEST_A");
                        usleep(U_SEC);
                        //sleep(SEC);
                        break;
                    default :
                        break;
                }
            }
        }
            break;
            
        case 'e':
            igrs_serverless_request_epgservice_base (
                                                     arg1,
                                                     "ipanel",
                                                     0,
                                                     20,
                                                     "pwd",
                                                     print_epg);
            
            break;
            
        case 'g':
            igrs_serverless_request_epginfo_base(
                                                 arg1,
                                                 "ipanel",
                                                 "igrs_search_word",
                                                 0,
                                                 1,
                                                 2, //unsigned int day,
                                                 3, //unsigned int startTime,
                                                 4, //unsigned int endTime,
                                                 5, //int currentPage,
                                                 6, //int pageSize,
                                                 "pwd",
                                                 111,
                                                 print_epginfo);
            break;
            
        case 'p':
            igrs_serverless_request_epgplay_base (
                                                  arg1,
                                                  print_epgplay,
                                                  NULL);
            
            break;
            
		case 'q':
			quit_program();
			return 0;
			break;
		default :
			break;
	}
	return 1;
}

void* cmd_loop(void* arg) 
{
	int endflag = 1;
	char cmdline[100] = {0};
	
	while (endflag) {
		//printf(">>");           chen
		//fgets(cmdline, 100, stdin);
		if (strcmp(cmdline, "\n") == 0)  //如果直接输入了回车，continue
			continue;
        
        //  printf ("debug: cmdline=%s\n", cmdline);         chen
        endflag = cmd_process("f");//(cmdline);        chen
	}
	return (void *)0;
}

void on_lan_device_status (const char *device_id, 
                           const char *name,
                           const char *hostname, 
                           unsigned int ip, 
                           int port,
                           IgrsDeviceStatus status,
                           IgrsDeviceType type)
{
   	if (status == IGRS_DEVICE_STATUS_ONLINE)
    {
        
        printf ("lan device online: device_id:%s,name:%s, hostname:%s, ip:%u, port:%d, type:%d\n",device_id,name, hostname, ip, port, type); 
    }   
	else if (status == IGRS_DEVICE_STATUS_OFFLINE)
	{        
        printf ("lan device offline: device_id:%s, name:%s, hostname:%s, ip:%u, port:%d, type:%d\n",device_id,name, hostname, ip, port, type);
         
    }
    else
		printf ("lan device unkown: device_id:%s, name:%s, hostname:%s, ip:%u, port:%d, type:%d\n",device_id,name, hostname, ip, port, type);
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {

    [theTextField resignFirstResponder];
    
    return YES;
    
}

- (IBAction)IGRS
{
    NSString * name; //用于保存输入的用户名
    IgrsRet ret = IGRS_RET_FAIL;
    
    if ( textField.text == nil || [textField.text length] < 1 ) {
        return ;
    }
    name =textField.text;
    //初始化我们的服务
    if ([name UTF8String] != NULL) 
            ret = igrs_serverless_init_base("igrs remote controller", 9, "remote controller", "xt68", "hisense","igrs2.0_hisense_20110812", NULL);  
   
    if (ret != IGRS_RET_OK)
        return ;
    // for remotecontroller
    //igrs_serverless_subscribe_recommend_base (print_media);
    //igrs_serverless_subscribe_tv_command_base (print_cmd);
    //igrs_serverless_subscribe_device_presence_base (on_lan_device_status);
    
	igrs_serverless_start_base(NULL, NULL);  //第1个参数类型是(IgrsServerless *)，第2个参数为端口号，第3，4个参数为用户上下文
    
    [[ServerLessAppDelegate getInstance] showRoomSelection];//next page
    
    [textField resignFirstResponder];   
}


#pragma mark - View lifecycle
- (void)viewDidLoad
{
    textField.text = @"igrs-user";
}

- (void)viewDidUnload
{
    
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
   
    [textField release];
    [super dealloc];
}
@end



