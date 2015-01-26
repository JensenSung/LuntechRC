//
//  LANDeviceManagerView.m
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import "MessageView.h"


@implementation MessageView
@synthesize mainViewController = _mainViewController;
@synthesize delegate = _delegate;
@synthesize Note;


- (id)initWithFrame:(CGRect)frame MainViewController:(UIViewController *)viewController  Message:(NSString*)message
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        Note=[[UITextView alloc]initWithFrame:CGRectMake(0, 2*Times, 316*Times, 50*Times)];

        Note.backgroundColor = [UIColor clearColor];
        
        
        [Note  setText:message];
        [Note setTextColor:[UIColor colorWithRed:69/255.0 green:75/255.0 blue:80/255.0 alpha:1]] ;
        
        Note.font = [UIFont systemFontOfSize:16*Times];
        Note.userInteractionEnabled=NO;
        if (![Header isPreferredLanguageHans])
        {
            Note.font = [UIFont systemFontOfSize:13*Times];
        }        
        Note.textAlignment =NSTextAlignmentCenter;

        [self addSubview:Note];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerfired) userInfo:nil repeats:NO ];

    }
    return self;
}



-(void)timerfired
{
    
    if ([self.delegate respondsToSelector:@selector(dissmissAndCancelSubmit)])
    {
        [self.delegate dissmissAndCancelSubmit];
    };
    
    
}


-(void)dealloc
{
    [Note release];
    self.delegate=nil;
    [_mainViewController release];
    [super dealloc];
}



@end
