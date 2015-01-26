//
//  LANDeviceManagerView.m
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import "GetAbilityMessageView.h"


@implementation GetAbilityMessageView
@synthesize mainViewController = _mainViewController;
@synthesize delegate = _delegate;
@synthesize Note;


- (id)initWithFrame:(CGRect)frame MainViewController:(UIViewController *)viewController  Message:(NSString*)message
{
    self = [super initWithFrame:frame];
    if (self) 
    {

        UIImageView  *searchimage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 18, 20, 20)] ;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
           // if (![Header isPreferredLanguageHans])
            {
                searchimage.frame =CGRectMake(8*Times, 18*Times, 20*Times, 20*Times);
            }/* else
            {
                searchimage.frame =CGRectMake(25*Times, 18*Times, 20*Times, 20*Times);
            }*/
        }
        searchimage.animationImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"07.png"],[UIImage imageNamed:@"06.png"],[UIImage imageNamed:@"05.png"],[UIImage imageNamed:@"04.png"],[UIImage imageNamed:@"03.png"],[UIImage imageNamed:@"02.png"],[UIImage imageNamed:@"01.png"], nil];
        searchimage.animationDuration=1.0f;
        searchimage.animationRepeatCount=3;
        
        [self addSubview:searchimage];
        [searchimage startAnimating];
        [searchimage release];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) 
        {
            if (![Header isPreferredLanguageHans])
            {
                Note=[[UITextView alloc]initWithFrame:CGRectMake(26*Times, 14*Times, (260-26)*Times, 50*Times)];
            } else
            {
                Note=[[UITextView alloc]initWithFrame:CGRectMake(26*Times, 14*Times, (210-26)*Times, 50*Times)];
            }
        }else
        {
            if (![Header isPreferredLanguageHans])
            {
                Note=[[UITextView alloc]initWithFrame:CGRectMake(26, 10, (260-26), 50)];
            } else
                Note=[[UITextView alloc]initWithFrame:CGRectMake(26, 10, (210-26), 50)];
        }
                   
                   

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
        

       /* [Note setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [Note setContentVerticalAlignment:UIControlContentHorizontalAlignmentCenter];*/
        
       /* CGSize size=[[Note text]sizeWithFont:[Note font]];
        int length=size.height;
        int columncount=Note.contentSize.height/length;
        if (columncount<=1) {
            Note.frame=CGRectMake(Note.frame.origin.x, Note.frame.origin.y, Note.frame.size.width, Note.frame.size.height/2.00);
            [Note setCenter:CGPointMake(Note.frame.size.width/2.00, self.frame.size.height/2.00)];
        }*/

        [self addSubview:Note];
        
        [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(timerfired) userInfo:nil repeats:NO ];

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
