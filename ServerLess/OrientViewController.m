//
//  OrientViewController.m
//  ServerLess
//  方向控制
//  Created by zfm on 13-7-8.
//

#import "OrientViewController.h"


@implementation OrientViewController
@synthesize imageview;

@synthesize homePageBtn;//智能家居
@synthesize returnBtn; //回车
@synthesize settingBtn; //设置
@synthesize menuBtn; //菜单
@synthesize deleteBtn; //删除

@synthesize voiceDownBtn; //音量减
@synthesize upBtn;  //向上
@synthesize downBtn; //向下
@synthesize leftBtn; //向左
@synthesize rightBtn; //向右
@synthesize voiceUpBtn; //音量加
@synthesize round; //

@synthesize okBtn; //确认


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
    if  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            NSLog(@"current Device = iPhone5");
            self.view.frame=CGRectMake(0, 0, 320, 568);
        }else{
            NSLog(@"current Device = iPhone4");
            self.view.frame=CGRectMake(0, 0, 320, 480);
        }
    } else
    {
        self.view.frame=CGRectMake(0, 0, 768,1024);
    }
    NSInteger i;
    i=0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        //PAD坐标统一下移5个像素
        i=7;
    }
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor clearColor];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480+88-20)];
            imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg" ofType:@"png"]];
           
            [self.view addSubview:imageview];
        }
        else
        {
            imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];            
            imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg" ofType:@"png"]];
            [self.view addSubview:imageview];

        };
    } else
    {
        imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-20)];
        imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg_pad" ofType:@"png"]];
        [self.view addSubview:imageview];
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if(iPhone5)
        {
            round = [[UIImageView alloc]initWithFrame:CGRectMake(34, 165-44-20+44, 255, 255)];
            round.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_bg" ofType:@"png"]];
            [self.view addSubview:round];
        } else
        {
            round = [[UIImageView alloc]initWithFrame:CGRectMake(57.5, (150-44-20+44), 204, 204)];
            round.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_bg" ofType:@"png"]];
            [self.view addSubview:round];
        }
    } else
    {
        round = [[UIImageView alloc]initWithFrame:CGRectMake(57.5*Times+Xoffset, (150-44-20+44)*Times+Yoffset+4*i, 204*Times, 204*Times)];
        round.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_bg" ofType:@"png"]];
        [self.view addSubview:round];
    }

    
    upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (iPhone5) {
        [upBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_up" ofType:@"png"]] forState:UIControlStateHighlighted];
    }else
        [upBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_up" ofType:@"png"]]  forState:UIControlStateHighlighted];
    upBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:upBtn];
    
    downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (iPhone5) {
        [downBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_down" ofType:@"png"]]  forState:UIControlStateHighlighted];
    } else
        [downBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_down" ofType:@"png"]] forState:UIControlStateHighlighted];
    downBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:downBtn];
    
    leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (iPhone5) {
        [leftBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_left" ofType:@"png"]]  forState:UIControlStateHighlighted];
    } else
        [leftBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_left" ofType:@"png"]]   forState:UIControlStateHighlighted];
    leftBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:leftBtn];
    
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (iPhone5) {
        [rightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_right" ofType:@"png"]]  forState:UIControlStateHighlighted];
    } else
        [rightBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_right" ofType:@"png"]] forState:UIControlStateHighlighted];
    rightBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:rightBtn];
    //OK
    okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (iPhone5) {
        [okBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_ok" ofType:@"png"]]  forState:UIControlStateHighlighted];
    } else
        [okBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_navi_ok" ofType:@"png"]]  forState:UIControlStateHighlighted];
  //  [okBtn setImage:[UIImage imageNamed:@"中间-焦点.png"] forState:UIControlStateNormal];
   // [okBtn setImage:[UIImage imageNamed:@"中间-焦点.png"] forState:UIControlStateHighlighted];
    okBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:okBtn];
    
    //智能家居键
    homePageBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [homePageBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_ihome" ofType:@"png"]]  forState:UIControlStateNormal];
    [homePageBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_ihome" ofType:@"png"]] forState:UIControlStateHighlighted];
    [homePageBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle" ofType:@"png"]]  forState:UIControlStateNormal];
    [homePageBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    [self.view addSubview:homePageBtn];

    //菜单键
    menuBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [menuBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_menu" ofType:@"png"]]  forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_menu" ofType:@"png"]]  forState:UIControlStateHighlighted];
    [menuBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle" ofType:@"png"]] forState:UIControlStateNormal];
    [menuBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle_press" ofType:@"png"]]forState:UIControlStateHighlighted];
    [self.view addSubview:menuBtn];
    
    //删除键
    deleteBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_delete" ofType:@"png"]]  forState:UIControlStateNormal];
    [deleteBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_delete" ofType:@"png"]] forState:UIControlStateHighlighted];
    [deleteBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle" ofType:@"png"]]  forState:UIControlStateNormal];
    [deleteBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    [self.view addSubview:deleteBtn];


    //声音减
    voiceDownBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [voiceDownBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_minus" ofType:@"png"]]  forState:UIControlStateNormal];
    [voiceDownBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_minus" ofType:@"png"]] forState:UIControlStateHighlighted];
    [voiceDownBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle" ofType:@"png"]]  forState:UIControlStateNormal];
    [voiceDownBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle_press" ofType:@"png"]] forState:UIControlStateHighlighted];
  //  voiceDownBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:voiceDownBtn];
    //回车
    returnBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return" ofType:@"png"]]  forState:UIControlStateNormal];
    [returnBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    [returnBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle" ofType:@"png"]] forState:UIControlStateNormal];
    [returnBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle_press" ofType:@"png"]]forState:UIControlStateHighlighted];
   // returnBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:returnBtn];
    //音量加
    voiceUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [voiceUpBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_plus" ofType:@"png"]] forState:UIControlStateNormal];
    [voiceUpBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_plus_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    [voiceUpBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle" ofType:@"png"]]  forState:UIControlStateNormal];
    [voiceUpBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_btn_circle_press" ofType:@"png"]]  forState:UIControlStateHighlighted];
    [self.view addSubview:voiceUpBtn];


    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            homePageBtn.frame = CGRectMake(15, 76, 65, 69);
            deleteBtn.frame = CGRectMake(240, 76, 65, 69);
            menuBtn.frame = CGRectMake(119, 52, 80, 86);

            voiceUpBtn.frame = CGRectMake(240, 421.5-20, 65, 69);
            returnBtn.frame = CGRectMake(119, 431-20, 80, 86);
            voiceDownBtn.frame = CGRectMake(15, 421.5-20, 65, 69);
            rightBtn.frame = CGRectMake(194+1+1, 208-2-20, 95, 170);
            leftBtn.frame = CGRectMake(35-1, 204+2-20-1, 95, 170);
            downBtn.frame = CGRectMake(76, 327-20, 170, 95);
            upBtn.frame = CGRectMake(75, 165-20, 170, 95);
            okBtn.frame=CGRectMake(107, 235-20, 111, 111);//108
        } else 
        {

            homePageBtn.frame = CGRectMake(23, 74, 58, 62);
            menuBtn.frame = CGRectMake(126, 52, 69, 75);
            deleteBtn.frame = CGRectMake(241, 74, 58, 62);

            voiceUpBtn.frame = CGRectMake(241, (347-20), 58, 62);
            returnBtn.frame = CGRectMake(126, (360-25), 69, 75);
            voiceDownBtn.frame = CGRectMake(23, (347-20), 58, 62);
            rightBtn.frame = CGRectMake((188+1), (182-20), 73, 140);  //59
            leftBtn.frame = CGRectMake((59-1), (182-20-1), 73, 140);
            downBtn.frame = CGRectMake(90, (282-20), 140, 73);
            upBtn.frame = CGRectMake(90, (150-20), 140, 73);
            okBtn.frame=CGRectMake(112, (203-20), 95, 95);
        }
    } else
    {
        
        homePageBtn.frame = CGRectMake(50, (74-20)*Times+Yoffset, 80*Times, 42*Times);
        settingBtn.frame = CGRectMake(558, (74-20)*Times+Yoffset, 80*Times, 42*Times);
        deleteBtn.frame = CGRectMake(50, (122-20)*Times+Yoffset+2*i, 80*Times, 42*Times);
        menuBtn.frame = CGRectMake(558, (122-20)*Times+Yoffset+2*i, 80*Times, 42*Times);
        voiceUpBtn.frame = CGRectMake(241*Times+Xoffset+60, (347-20)*Times+Yoffset+6*i, 58*Times, 62*Times);
        returnBtn.frame = CGRectMake(126*Times+Xoffset, (360-20)*Times+Yoffset+6*i, 69*Times, 75*Times);
        voiceDownBtn.frame = CGRectMake(50, (347-20)*Times+Yoffset+6*i, 58*Times, 62*Times);
        rightBtn.frame = CGRectMake(188*Times+Xoffset+1, (182-20-1)*Times+Yoffset+4*i, 73*Times, 140*Times);  //59
        leftBtn.frame = CGRectMake(59*Times+Xoffset-3, (182-20-1)*Times+Yoffset+4*i, 73*Times, 140*Times);
        downBtn.frame = CGRectMake(90*Times+Xoffset, (282-20)*Times+Yoffset+4*i, 140*Times, 73*Times);
        upBtn.frame = CGRectMake(90*Times+Xoffset-2, (150-20)*Times+Yoffset+4*i-1    , 140*Times, 73*Times);
        okBtn.frame=CGRectMake(112*Times+Xoffset, (203-20)*Times+Yoffset+4*i, 95*Times, 95*Times);
    }


    upBtn.tag = 100;
    leftBtn.tag = 101;
    downBtn.tag = 102;
    rightBtn.tag = 103;
    menuBtn.tag=104;
    returnBtn.tag=105;
    homePageBtn.tag=29;
    okBtn.tag=109;
    voiceDownBtn.tag = 110;
    voiceUpBtn.tag = 111;
    
    settingBtn.tag=121;
    deleteBtn.tag=31;
    
    
    

    [voiceDownBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [menuBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [voiceUpBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [homePageBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [returnBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [downBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [upBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [okBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    //self.view.backgroundColor = [UIColor orangeColor];
    
    // Do any additional setup after loading the view from its nib.
    NSLog(@"current model = %@",[UIDevice currentDevice].model);
}

- (void)buttonPressed:(id)sender
{
    [Header buttonPressed:sender];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [imageview release];
    [settingBtn release];
    [okBtn release];
    [deleteBtn release];
    [menuBtn release];
    [voiceDownBtn release];
    [voiceUpBtn release];
    [returnBtn release];
    [upBtn release];
    [downBtn release];
    [leftBtn release];
    [rightBtn release];
    [homePageBtn release];
    [round release];
    [super dealloc];
    
}
@end
