
/*!
 @header OrientViewController.h
 @abstract OrientViewController headers
//  Created by zfm on 13-7-8.
 */

#import "Header.h"


/*!
 @class
 @abstract OrientViewController class
 */
@interface OrientViewController : UIViewController


@property (nonatomic,retain) UIImageView *imageview;
@property (nonatomic,retain) UIButton *deleteBtn;
@property (nonatomic,retain) UIButton *settingBtn;
@property (nonatomic,retain) UIButton *voiceBtn;
@property (nonatomic,retain) UIButton *voiceUpBtn;
@property (nonatomic,retain) UIButton *voiceDownBtn;
@property (nonatomic,retain) UIButton *okBtn;
@property (nonatomic,retain) UIButton *menuBtn;
@property (nonatomic,retain) UIButton *returnBtn;
@property (nonatomic,retain) UIButton *homePageBtn;
@property (nonatomic,retain) UIButton *upBtn;
@property (nonatomic,retain) UIButton *downBtn;
@property (nonatomic,retain) UIButton *leftBtn;
@property (nonatomic,retain) UIButton *rightBtn;
@property (nonatomic,retain) UIImageView *round;


- (void)buttonPressed:(id)sender;
@end

#define USECIRCLE_BUTTON 1