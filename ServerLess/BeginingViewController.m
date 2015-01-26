//
//  BeginingViewController.m
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import "BeginingViewController.h"

@interface BeginingViewController ()
@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@end

@implementation BeginingViewController
@synthesize imageView;
@synthesize delegate;
@synthesize timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
   // timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerfired) userInfo:nil repeats:NO ];
    
}

     
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
//    _weatherData = nil;

    [super viewDidUnload];
}

-(void)dealloc
{
//    [_weatherData release];
    [timer release];
    self.delegate=nil;
    [super dealloc];
}

#pragma mark timer
-(void)timerfired;
{
    if ([self.delegate respondsToSelector:@selector(pushMainController)])
    {
        [self.delegate pushMainController];
    }
}

@end
