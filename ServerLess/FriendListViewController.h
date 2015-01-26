
/*!
 @header FriendListViewController.h
 @abstract Friend List ViewController headers
 Created by zfm on 13-7-8.
 */

#import "ServerBrowserDelegate.h"
#import "ServerBrowser.h"
#import "Header.h"
@class OperationVC;


/*!
 @class
 @abstract FriendListViewController class
 */
@interface FriendListViewController : UIViewController <ServerBrowserDelegate,UIScrollViewDelegate
>//UITableViewDataSource,UITableViewDelegate,
{
    NSTimer *timer;
    
    NSString *name;


}

@property(nonatomic,retain) ServerBrowser* serverBrowser;

@property(nonatomic, retain) NSMutableArray *list;
//@property(nonatomic, retain) UITableView* serverList;
@property(nonatomic,retain)  UIScrollView *serverList;


@property(nonatomic,retain)UIButton * buttonRefresh;
@property(nonatomic,retain)UIView *searchView;
@property(nonatomic,retain)UIImageView *searchimage;
@property(nonatomic,retain)UILabel  *searchlabel;
@property(nonatomic,retain)UIView *noDeviceView;
@property(nonatomic,retain)UILabel *noDevice;
@property(nonatomic,retain)UITextView *noDevicePromt ;
@property(nonatomic,retain) UIImageView *background;
@property(nonatomic,retain) UIImageView *navigation;
@property(nonatomic,retain) UIImageView *selectedView;
/*!
 @method
 @abstract get share object of FriendListViewController
 @discussion xxx = (FriendListViewController *)shareFriendListViewController;
 @param text NULL
 @result void
 */
+(FriendListViewController *)shareFriendListViewController;
-(void)refresh;
-(void)demo;
-(void)clearDevice:(UIScrollView*)sender;
-(CGRect)frameForItemAtIndex:(NSUInteger)index;
-(void)loadData:(UIScrollView*)scroll;


@end