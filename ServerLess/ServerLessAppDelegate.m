#import "ServerLessAppDelegate.h"
#import "MainTabViewController.h"
#import "BeginingViewController.h"

//#import "ASIFormDataRequest.h"


@implementation ServerLessAppDelegate

@synthesize window;
@synthesize mainTabViewController;
@synthesize login;


char logFilePath[MAX_FILE_NAME_LENGTH];
char logFileName[MAX_FILE_NAME_LENGTH];


- (void)applicationDidFinishLaunching:(UIApplication *)application { 

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    friend=nil;
   // devicename=nil;

    IsOnline=0;
    IsA=1;
    IsSupportKeyBoard=0;
    IsGetTvAbility=0;
   //鼠标移动创建串行队列
    MouseQueue=dispatch_queue_create("MouseQueue", NULL);
    dispatch_retain(MouseQueue);
    
    InputQueue=dispatch_queue_create("InputQueue", NULL);
    dispatch_retain(InputQueue);
    
    
    
    Times=1;
    Yoffset=0; //192;
    Xoffset=0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        Yoffset=20; //([[UIScreen mainScreen] currentMode].size.height-960)/2
        Xoffset=64;
        Times=2;
    }
    
    self.window.multipleTouchEnabled = NO;//关闭多点，默认为关闭

    
    mainTabViewController=[MainTabViewController mainTabViewController];


    rootNav = [[UINavigationController alloc] initWithRootViewController:mainTabViewController];
    [self.window addSubview: rootNav.view];
    
    [self.window makeKeyAndVisible];


}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSLog(@"- (void)applicationWillResignActive:(UIApplication *)application"); 
    
    //[myFriLstCtl cleanDeviceList];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"- (void)applicationWillEnterForeground:(UIApplication *)application");    
    NSLog(@"start IGRS Stack");
    [mainTabViewController startIGRSLAN];
  //  [NSThread detachNewThreadSelector:@selector(startIGRSLAN) toTarget:self withObject:nil];
    NSLog(@"start igrs end");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    NSLog(@"- (void)applicationDidEnterBackground:(UIApplication *)application");    
    NSLog(@"stop IGRS Stack");

    
    [mainTabViewController   stopIGRSLAN];
    
    NSLog(@"release igrs end");   
    
}

- (void)dealloc
{
    [mainTabViewController release];
    [login release];
    [rootNav release];
    [window release];
    if (friend) {
        [friend release];
    }
    dispatch_release(MouseQueue);
    dispatch_release(InputQueue);
    [super dealloc];
}

- (void) alertInfo:(NSString *) info
{
    NSString *temp1 = [NSString stringWithFormat:@"%@",info];  
    
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:NSLocalizedString(@"操作失败",@"操作失败")
                          message:temp1
                          delegate:self 
                          cancelButtonTitle:NSLocalizedString(@"确定",@"确定")
                          otherButtonTitles:nil];
    [alert show];
    [alert release];    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"exit program!!!");
    exit(0);
}

-(void)pushMainController;
{

    mainTabViewController=[MainTabViewController mainTabViewController];
    
        
    rootNav = [[UINavigationController alloc] initWithRootViewController:mainTabViewController];
    [self.window addSubview: rootNav.view];
    CATransition *transition=[CATransition animation];
    transition.duration=1.0f;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type=kCATransitionPush;
    transition.subtype=kCATransitionFromRight;
    transition.delegate=self;
    [self.login.view.layer.superlayer addAnimation:transition forKey:nil];
    [self.login.view.layer addAnimation:transition forKey:nil];
    [self.login.view removeFromSuperview ];
    [mainTabViewController buttonAction_setting:nil];

}

@end
