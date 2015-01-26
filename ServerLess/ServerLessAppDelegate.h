/*!
 @header ServerLessAppDelegate.h
 @abstract ServerLess App Delegate headers
//  Created by zfm on 13-7-8.
 */


#import <stdio.h>
#import <assert.h>
#import <stdlib.h>
#import <string.h>
#import <pthread.h>
#import "Header.h"



@class MainTabViewController, TVControlViewController,
OrientViewController,ServerBrowser,MouseViewController;
#import "BeginingViewController.h"
#import "ServerBrowser.h"
/*!
 @class
 @abstract ServerLessAppDelegate class
 */
@interface ServerLessAppDelegate : NSObject <UIApplicationDelegate>
{	
    UIWindow *window;
    MainTabViewController *mainTabViewController;
    UINavigationController *rootNav;
    BeginingViewController *login;

    
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain)  MainTabViewController *mainTabViewController;
@property (nonatomic, retain)  BeginingViewController *login;

- (void) alertInfo:(NSString *) info;
@end




