//
//  MainTabViewController.h
//  ServerLess
//
//  Created by zfm on 13/07/01.
//

#import "Header.h"


#import "HXTabBarController.h"
#import "FriendListViewController.h"
#import "ServerBrowser.h"
#import "MessageView.h"
#import "GetAbilityMessageView.h"
typedef enum _SwipDirection
{
    SwipDirectionNone = 0,
    SwipDirectionLeft = 1,
    SwipDirectionRight = 2
}SwipDirection;


@interface MainTabViewController : UIViewController<UIAlertViewDelegate,MessageViewDelegate,GetAbilityMessageViewDelegate>
{
    NSString *name;
    BOOL friendShowing;
    CGFloat currentTranslate;
}




@property(nonatomic,retain) ServerBrowser* serverBrowser;
@property(nonatomic,retain) NSTimer *timer;
@property (nonatomic,retain)HXTabBarController *tabBarController;
@property (nonatomic,retain)HXTabBarController *teleBtabBarController;
@property (nonatomic,retain)UIAlertView *alter;
@property (nonatomic,assign)int pageTabar;
@property (nonatomic,assign)FriendListViewController  *friendListView;
@property(nonatomic,retain) UIImageView *navigationbar;
@property (nonatomic,retain)UIPanGestureRecognizer  *panGestureRecognizer;
@property (nonatomic,retain)UIView *contentView;
@property (nonatomic,retain)UIView *friendView;
@property (nonatomic,retain)UIView *grayView;


-(void)selectedTabBarController:(int)aapgeTabar;
-(void)handleOpenTabar:(NSNotification*)notification;
-(void)buttonAction_setting:(id)sender;
-(void)viewCannotUse;//关闭交互
-(void)viewCanUse;//打开交互
-(void)swipeLeft;
-(void)startIGRSLAN;
-(void)stopIGRSLAN;

-(void)moveAnimationWithDirection:(SwipDirection)direction duration:(float)duration;//UISwipeGestureRecognizerDirection


+(MainTabViewController *)mainTabViewController;


@end
