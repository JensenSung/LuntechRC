//
//  File.cpp
//  Irgs
//
//  Created by chen on 2/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <iostream>
#include "igrstypedef.h"
#include "igrs_base.h"
#include "callback.h"
#include "igrsutil_WAN.h"
#include "LoginViewController.h"
#include "ResourcesInfo.h"
#import "IrgsViewController.h"


//wan 
static void on_user_register_success(IgrsRet result, void *userdata)
{//现在使用 on_user_registerHttps_success
    /*
	printf("\n TestMain: on_user_register_success:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",userdata);
    
    switch (result)
	{
		case IGRS_RET_USER_REGISTER_SUCCESS:
			printf("return  IGRS_RET_USER_REGISTER_SUCCESS \n");
            
            IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
            [igrsViewController performSelectorOnMainThread:@selector(registerSuccess) withObject:nil waitUntilDone:NO];
            
            
            
            break;
    }
     */
}
//wan 
static void on_user_register_fail(IgrsRet result, void *userdata)
{
    /*
	printf("\n TestMain: on_user_register_fail:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",userdata);
    
    switch (result)
	{
		case IGRS_RET_USER_REGISTER_FAIL:
			printf("return  IGRS_RET_USER_REGISTER_FAIL \n");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"请重新注册" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
            [alertView  show];
            [alertView release];
            
            break;
    }
     */
    
    
    
}

static void on_device_register_success(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_register_success:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    switch (result)
	{
		case IGRS_RET_DEVICE_REGISTER_SUCCESS:
			printf("return  IGRS_RET_DEVICE_REGISTER_SUCCESS \n");
            break;
    }
}

static void on_device_register_fail(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_register_fail:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    switch (result)
	{
		case IGRS_RET_DEVICE_REGISTER_FAIL:
			printf("return  IGRS_RET_DEVICE_REGISTER_FAIL \n");
            break;
    }
}


//wan 登录 以及注销回调
static void on_user_login_result(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_login_result:######################################################## result=%d \n",result);
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
    
    switch (result)
	{
		case IGRS_RET_USER_CONNECTED:
        {
            printf("return  IGRS_RET_OK \n");
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.5f];
            igrsViewController.wanLoginView.hidden = YES;
            igrsViewController.userLabel.text = igrsViewController.userNameStr;
            igrsViewController.wanLoginButton.selected = YES;
            [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"hasPopupAlert_reachablity"];
        //      [igrsViewController performSelectorOnMainThread:@selector(isOnLine) withObject:nil waitUntilDone:NO];
            [UIView commitAnimations];
            [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];
            break;
        }
        
        case IGRS_RET_FAIL:
        {
			printf("login failed\n");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"登录失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];
			break;
        }
            
		case IGRS_RET_USER_DISCONNECTED:	
        {
			printf("\n \n");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"网络链接问题" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];
			break;
        }
            
		case IGRS_RET_USER_AUTH_FAILED:
        {
			printf("password or regeister error\n");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"用户或密码不正确 " delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];
			break;
        }
        case IGRS_RET_DEVICE_CONNECTION_REFUSED:
        {
            printf(" logout \n");

            igrsViewController.userLabel.text = @"";
            igrsViewController.wanLoginButton.selected = NO;
            [igrsViewController performSelectorOnMainThread:@selector(logoutFresh) withObject:nil waitUntilDone:NO];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"未知原因" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            break;
        }
        case IGRS_RET_USER_LOGOUT:
        {
            printf(" logout \n");
            
            igrsViewController.userLabel.text = @"";
            igrsViewController.wanLoginButton.selected = NO;
            [igrsViewController performSelectorOnMainThread:@selector(logoutFresh) withObject:nil waitUntilDone:NO];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"与服务器链接断开" message:@"用户退出" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            break;
        }

        default:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"与服务器链接断开" message:@"请重新登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            
            [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];

        }
    }
      [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];

}


static void on_device_login_result(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_login_result:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{
		case IGRS_RET_OK:
			printf("return  IGRS_RET_OK \n");
            break;
            
		case IGRS_RET_FAIL:
			printf("login failed\n");
			break;
            
		case IGRS_RET_DEVICE_DISCONNECTED:	
			printf("\n \n");
			break;
            
		case IGRS_RET_DEVICE_AUTH_FAILED:
			printf("password or regeister error\n");
			break;
    }
}

static void on_user_recv_push_control(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_recv_push_control:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    char tmpChar[MAX_STRING_SIZE];
    sprintf(tmpChar, (char *)userdata);
    
    NSString *tmpStr = [[NSString alloc] initWithUTF8String:tmpChar];
    
    
    IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
    [igrsViewController performSelectorOnMainThread:@selector(showReceivedPushControl:) withObject:tmpStr  waitUntilDone:NO];
}


static void on_user_roster_clear(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_roster_clear:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_ROSTER_CLEAR:
			printf("user roster clear\n");
			break;		
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_roster_receiver(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_roster_receiver:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_ROSTER_RECEIVER:
			printf("user roster receive\n");
			break;		
		default:
			printf("default:\n");
			break;
    }
    
    
    char temp[MAX_STRING_SIZE];
    sprintf(temp, "%s", (char *)userdata);
    
    
    NSString *str = [NSString stringWithUTF8String:temp];
    NSLog(@"%@",str);
    
    
    IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
    
    
    [igrsViewController performSelectorOnMainThread:@selector(friendListXML:) withObject:str  waitUntilDone:NO];
    
    
}




static void on_user_roster_presence(IgrsRet result, void *userdata)
{
    UPCCOMMONDEFINE
    int ret;
	printf("\n TestMain: on_user_roster_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    char tempUserdata[MAX_STRING_SIZE];
    char buddyIdBareStr[MAX_JID_LENGTH];
    char resrcIdStr[MAX_JID_LENGTH];
    char statusStr[MAX_STRING_SIZE];
    
    sprintf(tempUserdata, "%s", (char *)userdata);
    
    ret = getValueFromXml(tempUserdata, CB_XML_BUDDY_ID_BARE, buddyIdBareStr);
    if (FAIL == ret) 
    {
        SPF(debugInfo, "on_user_roster_presence, get buddyIdBareStr error");
        LOGDEBUGINFO_WAN(logData, debugInfo);
        return;
    }
    ret = getValueFromXml(tempUserdata, CB_XML_RESRC_ID, resrcIdStr);
    if (FAIL == ret) 
    {
        SPF(debugInfo, "on_user_roster_presence, get resrcIdStr error");
        LOGDEBUGINFO_WAN(logData, debugInfo);
        return;
    }   
    ret = getValueFromXml(tempUserdata, CB_XML_STATUS, statusStr);
    if (FAIL == ret) 
    {
        SPF(debugInfo, "on_user_roster_presence, get statusStr error");
        LOGDEBUGINFO_WAN(logData, debugInfo);
        return;
    }
    
    SPF(debugInfo, "buddyIdBareStr=%s, resrcIdStr=%s, statusStr=%s", buddyIdBareStr, resrcIdStr, statusStr);
    LOGDEBUGINFO_WAN(logData, debugInfo);
    char buddyIDFullStr[MAX_STRING_SIZE] = "";
    sprintf(buddyIDFullStr, "%s/%s", buddyIdBareStr, resrcIdStr);
    
    switch (result)
	{			
		case IGRS_RET_USER_ROSTER_PRESENCE:
        {
            SPF(debugInfo, "%s ------ %s", buddyIdBareStr, statusStr);
            LOGDEBUGINFO_WAN(logData, debugInfo);
            
            
            NotifDeviceInfo *info1 = [[NotifDeviceInfo alloc] init];
            
            if (!(strcmp(statusStr, "Available")))
            {
                info1.name = [NSString stringWithUTF8String:buddyIDFullStr];
                info1.type = 1;
                info1.status = 0;  
                
                
            }
            else if (!(strcmp(statusStr, "Unavailable")))
            {
                info1.name = [NSString stringWithUTF8String:buddyIDFullStr];
                info1.type = 1;
                info1.status = 1;  
            }
            
            IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
            
             [igrsViewController performSelectorOnMainThread:@selector(RefeshFamilyResourceState:) withObject:info1 waitUntilDone:NO];
            //[igrsViewController performSelectorOnMainThread:@selector(RefeshFamilyResourceState:) withObject:info1 afterDelay:5.0f];
            
            //[igrsViewController performSelector:@selector(RefeshFamilyResourceState:) withObject:info1 afterDelay:5.0f];
            
            //[igrsViewController performSelector:@selector(RefeshFamilyResourceState:) withObject:info1];
            //[info1 release];
            break;
        }
        default:
            printf("default:\n");
            break;
    }
}

static void on_device_roster_clear(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_roster_clear:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_ROSTER_CLEAR:
			printf("device roster clear\n");
			break;		
		default:
			printf("default:\n");
			break;
    }
}

static void on_device_roster_receiver(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_roster_receiver:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_ROSTER_RECEIVER:
			printf("device roster receive\n");
			break;		
		default:
			printf("default:\n");
			break;
    }
}

static void on_device_roster_presence(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_roster_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_ROSTER_PRESENCE:
			printf("device received roster presence\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_receive_subscribtion(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_receive_subscribtion:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_SUBSCRIPTION:
			printf("user received subscribtion, pls accept or deny it~ \n");
			break;
		default:
			printf("default:\n");
			break;
    }
}
//添加设备成功与否
static void on_user_receive_acpt_deny(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_receive_acpt_deny:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
    
    switch (result)
	{			
		case IGRS_RET_USER_ADD_FRIEND_OK:
        {
            printf("user received Acpt response \n");
            
            //绑定成功
            
            [igrsViewController performSelectorOnMainThread:@selector(bindSuccess) withObject:nil waitUntilDone:NO];
        //    [igrsViewController performSelectorOnMainThread:@selector(cancelMBPView) withObject:nil waitUntilDone:NO];
             
            
			break;
        }

		case IGRS_RET_USER_ADD_FRIEND_DENY:
        {
            printf("user received Deny response \n");
            //绑定失败
 
         //   IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
            
            [igrsViewController performSelectorOnMainThread:@selector(alertInfo:) withObject:@"绑定失败" waitUntilDone:NO];
            
            
			break;

        }
            
		default:
        {
            //绑定失败

            printf("default:\n");
            [igrsViewController performSelectorOnMainThread:@selector(alertInfo:) withObject:@"绑定失败" waitUntilDone:NO];
			break;
        }
			
    }
}


static void on_user_receive_unsubscribtion(IgrsRet result, void *userdata)
{//other send unsubscribtion to me
    
	printf("\n TestMain: on_user_receive_unsubscribtion:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_UNSUBSCRIPTION:
			printf("user received unsubscribtion \n");
			break;
		default:
			printf("default:\n");
			break;
    }
}
//用户解除绑定
static void on_user_buddy_deleted(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_buddy_deleted:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    IrgsViewController *igrsViewController = [IrgsViewController shareIrgsViewController];
    
    
    switch (result)
	{			
		case IGRS_RET_USER_BUDDY_DELETED:
			printf("user's buddy has been deleted successfully \n");
            
            
            
			break;
		default:
        {
            printf("default:\n");
            
            [igrsViewController performSelectorOnMainThread:@selector(alertInfo:) withObject:@"解除绑定失败" waitUntilDone:NO];

            
            
            
            
			break;
        }
		
    }
}

static void on_device_buddy_deleted(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_buddy_deleted:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_BUDDY_DELETED:
			printf("device's buddy has been deleted successfully \n");
			break;
		default:
        {
            printf("default:\n");
			break;
        }
	
    }
}


static void on_user_capability_presence(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_capability_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_CAPABILITY_PRESENCE:
			printf("user received other's capability presence msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_device_capability_presence(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_capability_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_CAPABILITY_PRESENCE:
			printf("device received other's capability presence msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_nick_presence(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_nick_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_NICK_PRESENCE:
			printf("user received other's nick presence msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_device_nick_presence(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_nick_presence:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_NICK_PRESENCE:
			printf("device received other's nick presence msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_receive_message(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_receive_message:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_MESSAGE:
			printf("user received other's chat msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_device_receive_message(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_device_receive_message:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_DEVICE_RECV_MESSAGE:
			printf("device received other's chat msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_recv_P2PRequest(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_recv_P2PRequest:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_P2PREQUEST:
			printf("user received other's P2P request msg, pls accept or reject it\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_recv_P2PAccept(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_recv_P2PAccept:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_P2PACCEPT:
			printf("user received other's P2P accept msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_recv_P2PReject(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_recv_P2PReject:######################################################## \n");
    
	printf("Testmain: userdata=%s\n", (char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_P2PREJECT:
			printf("user received other's P2P reject msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}

static void on_user_recv_P2PExecute(IgrsRet result, void *userdata)
{
    
	printf("\n TestMain: on_user_recv_P2PExecute:######################################################## \n");
    
	printf("Testmain: userdata=%s\n",(char *)userdata);
    
    switch (result)
	{			
		case IGRS_RET_USER_RECV_P2PREJECT:
			printf("user received other's P2P execute msg\n");
			break;
		default:
			printf("default:\n");
			break;
    }
}





/****************************************************************************
 * Function : register all call back 													*
 ****************************************************************************/
extern "C" IGRS_API IgrsRet register_all_callback_wan()
//IGRS_API IgrsRet register_all_callback_wan()
{
    igrs_subscrib_user_register_success(on_user_register_success);  //I am user, when I register success 
	igrs_subscrib_user_register_fail(on_user_register_fail);  		//I am user, when I register fail 
	//igrs_subscrib_device_register_success(on_device_register_success);  //I am device, when I register success 
	//igrs_subscrib_device_register_fail(on_device_register_fail);  		//I am device, when I register fail 
    
    
	igrs_subscrib_user_login_result(on_user_login_result);  		//I am user, when I am online 
	igrs_subscrib_device_login_result(on_user_login_result);  		//I am device, when I am online 
    
  	igrs_subscrib_user_recv_push_control(on_user_recv_push_control); 	//I am user, when I received push control buffer
  
	igrs_subscrib_user_roster_clear(on_user_roster_clear);  		//I am user, when my local roster is cleared 
	igrs_subscrib_user_roster_receiver(on_user_roster_receiver); 	//I am user, when I received roster data from server
	igrs_subscrib_user_roster_presence(on_user_roster_presence);	//I am user, when friend presence or unpresence 
    
	igrs_subscrib_user_recv_subscribtion(on_user_receive_subscribtion);//I am user, I received a subscription msg from opposite, I will decide accept it or deny it.
	igrs_subscrib_user_recv_unsubscribtion(on_user_receive_unsubscribtion);//I am user, I received an Unsubscription msg, NOT USED	
	igrs_subscrib_user_recv_acpt_deny(on_user_receive_acpt_deny);  //I am user, I just sent an adding friend msg to opposite, and I am waiting for accept or deny response
    
	igrs_subscrib_user_buddy_deleted(on_user_buddy_deleted);  	//I am user, I sent del friend msg to server, and now receive delete success msg.
    
	igrs_subscrib_user_capability_presence(on_user_capability_presence);//I am user, I recieved other's capability presence msg
    
	igrs_subscrib_user_nick_presence(on_user_nick_presence);//I am user, I recieved other's nick presence msg
    
	igrs_subscrib_user_recv_message(on_user_receive_message);//I am user, I recieved other's chat msg
    
    
	igrs_subscrib_user_recv_P2PRequst(on_user_recv_P2PRequest);//I am user, I recieved other's P2P Request msg
	igrs_subscrib_user_recv_P2PAccept(on_user_recv_P2PAccept);//I am user, I recieved other's P2P accept msg
	igrs_subscrib_user_recv_P2PReject(on_user_recv_P2PReject);//I am user, I recieved other's P2P reject msg
	igrs_subscrib_user_recv_P2PExecute(on_user_recv_P2PExecute);//I am user, I recieved other's P2P execute msg
    
    
    
    
    
	igrs_subscrib_device_roster_clear(on_device_roster_clear);		//I am device, when my local roster is cleared  NOT USED
	igrs_subscrib_device_roster_receiver(on_device_roster_receiver);//I am device, when I received roster data from server NOT USED
	igrs_subscrib_device_roster_presence(on_device_roster_presence);//I am device, when friend presence or unpresence  NOT USED
    
	
	igrs_subscrib_device_buddy_deleted(on_device_buddy_deleted);//I am device, I sent del friend msg to server, and now receive delete success msg. NOT USED
    
	igrs_subscrib_device_capability_presence(on_device_capability_presence);//I am device, I recieved other's capability presence msg
	
	igrs_subscrib_device_nick_presence(on_device_nick_presence);//I am device, I recieved other's nick presence msg

	return IGRS_RET_OK;
	//return ret;
}

