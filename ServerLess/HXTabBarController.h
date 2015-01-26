//
//  HXTabBarController.h
//  hisense
//
//  Created by zfm on 13-7-8.
//
#import "Header.h"
#define kMinGestureLength 25 //最小手势长度
#define kMaxVariance 5  //手势偏差

@interface HXTabBarController : UITabBarController

@property (nonatomic,assign)NSMutableArray *tab_btn;
@property (nonatomic,retain)	UIButton *btn;
@property (nonatomic,retain)	UIImageView *barView;

- (void) init_tab;
- (void) when_tabbar_is_unselected;
- (void) add_custom_tabbar_elements;
- (void) when_tabbar_is_selected:(int)tabID;


@end
