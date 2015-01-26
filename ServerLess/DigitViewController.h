/*!
 @header DigitViewController.h
 @abstract Digit View Controller headers
//  Created by zfm on 13-7-8.
 */

#import "Header.h"

@interface DigitViewController : UIViewController


@property (nonatomic,retain)UIButton *oneBtn;
@property (nonatomic,retain)UIButton *twoBtn;
@property (nonatomic,retain)UIButton *threeBtn;
@property (nonatomic,retain)UIButton *fourBtn;
@property (nonatomic,retain)UIButton *fiveBtn;
@property (nonatomic,retain)UIButton *sixBtn;
@property (nonatomic,retain)UIButton *sevenBtn;
@property (nonatomic,retain)UIButton *eightBtn;
@property (nonatomic,retain)UIButton *nightBtn;
@property (nonatomic,retain)UIButton *infoBtn;
@property (nonatomic,retain)UIButton *zeroBtn;
@property (nonatomic,retain)UIButton *pauseBtn;



/*!
 @method
 @abstract buttonPress:(id)sender;
 @discussion xxx = buttonPress:(id)sender;
 @param text NULL
 @result void
 */
- (void)buttonPress:(id)sender;

@end
