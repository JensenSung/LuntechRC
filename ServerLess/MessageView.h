//
//  InputView
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@protocol MessageViewDelegate <NSObject>

@optional
-(void)dissmissAndCancelSubmit;
@end
@interface MessageView : UIView<UITextFieldDelegate>


@property(nonatomic,assign)id<MessageViewDelegate> delegate;
@property(nonatomic,retain)UIViewController * mainViewController;
@property(nonatomic,retain)UITextView *Note;


- (id)initWithFrame:(CGRect)frame MainViewController:(UIViewController *)viewController Message:(NSString*)message;
@end
