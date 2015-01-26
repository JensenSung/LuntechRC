//
//  BeginingViewController.h
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import <UIKit/UIKit.h>
//#import "PushControllerDelegate.h"
@protocol BeginingViewControllerDelegate <NSObject>

@optional
-(void)pushMainController;
@end

@interface BeginingViewController : UIViewController



/*!
 @property
 @abstract  delegate;
 */
@property(nonatomic,assign)id<BeginingViewControllerDelegate> delegate;
@property (nonatomic,retain)   NSTimer *timer;
@end