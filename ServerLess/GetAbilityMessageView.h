//
//  InputView
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@protocol GetAbilityMessageViewDelegate <NSObject>

@optional
-(void)dissmissAndCancelSubmit;
@end
@interface GetAbilityMessageView : UIView<UITextFieldDelegate>



@property(nonatomic,assign)id<GetAbilityMessageViewDelegate> delegate;
@property(nonatomic,retain)UIViewController * mainViewController;
@property(nonatomic,retain)UITextView *Note;


- (id)initWithFrame:(CGRect)frame MainViewController:(UIViewController *)viewController Message:(NSString*)message;
@end
