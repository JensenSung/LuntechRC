//
//  DigitViewController.m
//  ServerLess
//
//  Created by zfm on 13-7-8.
//

#import "DigitViewController.h"
#import "igrstypedef.h"


@implementation DigitViewController
//@synthesize friend_TV;


@synthesize oneBtn,twoBtn,threeBtn,fourBtn,fiveBtn,sixBtn,sevenBtn,
eightBtn,nightBtn,zeroBtn,pauseBtn,infoBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    if  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            self.view.frame=CGRectMake(0, 0, 320, (480+88));
        } else
        {
            self.view.frame=CGRectMake(0, 0, 320, 480);
        }
    } else
    {
        self.view.frame=CGRectMake(0, 0, 768,1024);
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        Yoffset=Yoffset+10;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480+88-20)];
            imageview.image= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg" ofType:@"png"]];//[UIImage imageNamed:@"bg.png"];
            [self.view addSubview:imageview];
            [imageview release];
        } else
        {
            UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320+44, 480)];
            imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg" ofType:@"png"]];
            [self.view addSubview:imageview];
            [imageview release];         
        }
    }else
    {
        UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
        imageview.image= [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg_pad" ofType:@"png"]] ;
        [self.view addSubview:imageview];
        [imageview release];
    }
    
    
    UIImage *imageground=[UIImage imageNamed:@"normal_btn.9.png"];
    UIImage *imagegroundlight=[UIImage imageNamed:@"normal_btn_clicked.9.png"];
    
    oneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [oneBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [oneBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [oneBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_1" ofType:@"png"]]  forState:UIControlStateNormal];
    [oneBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_1_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    oneBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:oneBtn];
    
    twoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [twoBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [twoBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [twoBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_2" ofType:@"png"]]  forState:UIControlStateNormal];
    [twoBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_2_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    twoBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:twoBtn];
    
    threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [threeBtn setBackgroundImage:imageground forState:UIControlStateNormal];
    [threeBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [threeBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_3" ofType:@"png"]]  forState:UIControlStateNormal];
    [threeBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_3_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    threeBtn.backgroundColor = [UIColor clearColor];        
    [self.view addSubview:threeBtn];
    
    fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fourBtn setBackgroundImage:imageground forState:UIControlStateNormal];
    [fourBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [fourBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_4" ofType:@"png"]]  forState:UIControlStateNormal];
    [fourBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_4_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    fourBtn.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:fourBtn];
    
    fiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fiveBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [fiveBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [fiveBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_5" ofType:@"png"]]  forState:UIControlStateNormal];
    [fiveBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_5_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    fiveBtn.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:fiveBtn];
    
    sixBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sixBtn setBackgroundImage:imageground forState:UIControlStateNormal];
    [sixBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [sixBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_6" ofType:@"png"]]  forState:UIControlStateNormal];
    [sixBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_6_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    sixBtn.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:sixBtn];
    
    sevenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sevenBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [sevenBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [sevenBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_7" ofType:@"png"]]  forState:UIControlStateNormal];
    [sevenBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_7_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    sevenBtn.backgroundColor = [UIColor clearColor];
    

    [self.view addSubview:sevenBtn];
    
    eightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [eightBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [eightBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [eightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_8" ofType:@"png"]]  forState:UIControlStateNormal];
    [eightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_8_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    eightBtn.backgroundColor = [UIColor clearColor];
    

    [self.view addSubview:eightBtn];
    
    nightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nightBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [nightBtn setBackgroundImage:imagegroundlight  forState:UIControlStateHighlighted];
    [nightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_9" ofType:@"png"]]  forState:UIControlStateNormal];
    [nightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_9_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    nightBtn.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:nightBtn];
    
    infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [infoBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [infoBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_star" ofType:@"png"]]  forState:UIControlStateNormal];
    [infoBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_star_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    infoBtn.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:infoBtn];
    
    zeroBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [zeroBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [zeroBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [zeroBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_0" ofType:@"png"]]  forState:UIControlStateNormal];
    [zeroBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_0_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    zeroBtn.backgroundColor = [UIColor clearColor];

    [self.view addSubview:zeroBtn];
    
    pauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pauseBtn setBackgroundImage:imageground  forState:UIControlStateNormal];
    [pauseBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];
    [pauseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_well" ofType:@"png"]]  forState:UIControlStateNormal];
    [pauseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"number_well_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    pauseBtn.backgroundColor = [UIColor clearColor];    
    [self.view addSubview:pauseBtn];
//    [imageground release];
//    [imagegroundlight release];
    


    if (iPhone5) {
        oneBtn.frame = CGRectMake(18.5, 150-20, 93, 70);
        twoBtn.frame = CGRectMake(18.5+95, 150-20, 93, 70);
        threeBtn.frame = CGRectMake(18.5+95+95, 150-20, 93, 70);
        fourBtn.frame = CGRectMake(18.5, 150-20+71.5, 93, 70);
        fiveBtn.frame = CGRectMake(18.5+95, 150-20+71.5, 93, 70);
        sixBtn.frame = CGRectMake(18.5+95+95, 150-20+71.5, 93, 70);
        sevenBtn.frame = CGRectMake(18.5, 150-20+71.5+71.5, 93, 70);
        eightBtn.frame = CGRectMake(18.5+95, 150-20+71.5+71.5, 93, 70);
        nightBtn.frame = CGRectMake(18.5+95+95, 150-20+71.5+71.5, 93, 70);
        infoBtn.frame = CGRectMake(18.5, 150-20+71.5+71.5+71.5, 93, 70);
        zeroBtn.frame = CGRectMake(18.5+95, 150-20+71.5+71.5+71.5, 93, 70);
        pauseBtn.frame = CGRectMake(18.5+95+95, 150-20+71.5+71.5+71.5, 93, 70);
    } else
    {
        oneBtn.frame = CGRectMake(18.5*Times+Xoffset, (110-20)*Times+Yoffset, 93*Times, 70*Times);
        twoBtn.frame = CGRectMake((18.5+95)*Times+Xoffset, (110-20)*Times+Yoffset, 93*Times, 70*Times);
        threeBtn.frame = CGRectMake((18.5+95+95)*Times+Xoffset, (110-20)*Times+Yoffset, 93*Times, 70*Times);
        fourBtn.frame = CGRectMake(18.5*Times+Xoffset, (110-20+71.5)*Times+Yoffset, 93*Times, 70*Times);
        fiveBtn.frame = CGRectMake((18.5+95)*Times+Xoffset, (110-20+71.5)*Times+Yoffset, 93*Times, 70*Times);
        sixBtn.frame = CGRectMake((18.5+95+95)*Times+Xoffset, (110-20+71.5)*Times+Yoffset, 93*Times, 70*Times);
        sevenBtn.frame = CGRectMake(18.5*Times+Xoffset, (110-20+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
        eightBtn.frame = CGRectMake((18.5+95)*Times+Xoffset, (110-20+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
        nightBtn.frame = CGRectMake((18.5+95+95)*Times+Xoffset, (110-20+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
        infoBtn.frame = CGRectMake(18.5*Times+Xoffset, (110-20+71.5+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
        zeroBtn.frame = CGRectMake((18.5+95)*Times+Xoffset, (110-20+71.5+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
        pauseBtn.frame = CGRectMake((18.5+95+95)*Times+Xoffset, (110-20+71.5+71.5+71.5)*Times+Yoffset, 93*Times, 70*Times);
    }


    

    pauseBtn.tag = 31;
    zeroBtn.tag = 30;
    nightBtn.tag = 28;
    eightBtn.tag = 27;
    sevenBtn.tag = 26;
    sixBtn.tag = 25;
    fiveBtn.tag = 24;
    fourBtn.tag = 23;
    threeBtn.tag = 22;
    twoBtn.tag = 21;
    oneBtn.tag = 20;
    infoBtn.tag=29; //info


    [oneBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [twoBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [threeBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [fourBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [fiveBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [sixBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [sevenBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [eightBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [nightBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [zeroBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [infoBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [pauseBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        Yoffset=Yoffset-10;
    
}

- (void)buttonPress:(id)sender
{
    [Header buttonPressed:sender];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [oneBtn release];
    [twoBtn release];
    [threeBtn release];
    [fourBtn release];
    [fiveBtn release];
    [sixBtn release];
    [sevenBtn release];
    [eightBtn release];
    [nightBtn release];
    [infoBtn release];
    [zeroBtn release];
    [pauseBtn release];

    [super dealloc];
}

@end
