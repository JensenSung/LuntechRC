//
//  MouseViewController.h
//  hisense
//
//  Created by zfm on 13-7-8.
//

#import "Header.h"



@interface MouseViewController : UIViewController<UIGestureRecognizerDelegate>



@property (nonatomic,retain)UITapGestureRecognizer    *singleTap;
@property (nonatomic,retain)UIPanGestureRecognizer    *panRecognizer;
@property (nonatomic,retain) UIImageView *swipeRect;
@property (nonatomic,retain) UIView *swipeRectView;
@property (nonatomic,retain) UIButton *voiceDownBtn;
@property (nonatomic,retain) UIButton *returnBtn;
@property (nonatomic,retain) UIButton *voiceUpBtn;
@property (nonatomic,retain) UIImageView *mouse;
@property (nonatomic,retain) UIImageView *imageview;



@end
