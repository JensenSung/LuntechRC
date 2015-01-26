//
//  MouseViewController.m
//  hisense
//
//  Created by zfm on 13-7-8.
//

#import "MouseViewController.h"



@implementation MouseViewController

@synthesize singleTap;
@synthesize panRecognizer;
@synthesize swipeRect;
@synthesize swipeRectView;
@synthesize returnBtn; //返回键
@synthesize voiceDownBtn; //音量减
@synthesize voiceUpBtn; //音量加
@synthesize mouse;
@synthesize imageview;



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
    NSInteger i;
    i=0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        i=42;
    }

    self.view.backgroundColor=[UIColor blackColor];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480+88-20)];
        } else
            imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0+44*Times, 320*Times, 480*Times+Yoffset-20)];

        imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg" ofType:@"png"]];
    } else
    {
        imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024-20)];
        
        imageview.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"splash_bg_pad" ofType:@"png"]];
    }



    [self.view addSubview:imageview];
    
    UIImage *imageground=[UIImage imageNamed:@"remote_btn_circle.png"];
    UIImage *imagegroundlight=[UIImage imageNamed:@"remote_btn_circle_press.png"];

    //音量减
    voiceDownBtn =[UIButton buttonWithType:UIButtonTypeCustom];

    [voiceDownBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_minus" ofType:@"png"]] forState:UIControlStateNormal];
    [voiceDownBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_minus_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    [voiceDownBtn setBackgroundImage:imageground forState:UIControlStateNormal];
    [voiceDownBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];



    voiceDownBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:voiceDownBtn];



    //返回键
    returnBtn =[UIButton buttonWithType:UIButtonTypeCustom];

    [returnBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return" ofType:@"png"]] forState:UIControlStateNormal];
    [returnBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    [returnBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle" ofType:@"png"]] forState:UIControlStateNormal];
    [returnBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_return_circle_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    returnBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:returnBtn];

    //音量加
    voiceUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [voiceUpBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_plus" ofType:@"png"]] forState:UIControlStateNormal];
    [voiceUpBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"remote_voice_plus_press" ofType:@"png"]] forState:UIControlStateHighlighted];
    [voiceUpBtn setBackgroundImage:imageground forState:UIControlStateNormal];
    [voiceUpBtn setBackgroundImage:imagegroundlight forState:UIControlStateHighlighted];

    
    voiceUpBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:voiceUpBtn];
    
    swipeRectView=[[UIView alloc]init];
    swipeRect = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_bg" ofType:@"png"]]];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            swipeRectView.frame=CGRectMake(0,76-20, 290+30, 340);//-15
            swipeRect.frame =CGRectMake(15,0, 290, 340);

            voiceUpBtn.frame = CGRectMake(240, 421.5-20, 65, 69);
            returnBtn.frame = CGRectMake(119, 431-20, 80, 86);
            voiceDownBtn.frame = CGRectMake(15, 421.5-20, 65, 69);

        } else
        {
            swipeRectView.frame =CGRectMake(23.5-23.5,(72-20), 273+47, 268);
            swipeRect.frame =CGRectMake(23.5,0, 273, 268);

            voiceUpBtn.frame = CGRectMake(241, (347-20), 58, 62);
            returnBtn.frame = CGRectMake(126, (360-20), 69, 75);
            voiceDownBtn.frame = CGRectMake(23, (347-20), 58, 62);

        }
    } else
    {
        swipeRectView.frame =CGRectMake(0,(72-44-20+44)*Times+Yoffset, 355*Times+29*2,278*Times+25);
        swipeRect.frame =CGRectMake(29,0, 355*Times,278*Times+25);

        voiceUpBtn.frame = CGRectMake(241*Times+Xoffset+60, (347-20)*Times+Yoffset+i, 58*Times, 62*Times);
        returnBtn.frame = CGRectMake(126*Times+Xoffset, (360-20)*Times+Yoffset+i, 69*Times, 75*Times);
        voiceDownBtn.frame = CGRectMake(50, (347-20)*Times+Yoffset+i, 58*Times, 62*Times);
    }


    
    [self.view addSubview:voiceDownBtn];
    [self.view addSubview:returnBtn];

    [self.view addSubview:voiceUpBtn];

    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            
            UIImageView  *promt =[[UIImageView alloc] initWithFrame:CGRectMake(75, 138+72, 139, 88)];
            promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_zh" ofType:@"png"]] ;
            if (![Header isPreferredLanguageHans])
            {
                promt.frame=CGRectMake(50, 138+72, 189, 88);
                promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_en" ofType:@"png"]];
            }
            [swipeRect addSubview:promt];
            [promt release];
        } else
        {
            UIImageView  *promt =[[UIImageView alloc] initWithFrame:CGRectMake(65, 138, 139, 88)];
            promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_zh" ofType:@"png"]] ;
            if (![Header isPreferredLanguageHans])
            {
                promt.frame=CGRectMake(50, 138, 189, 88);
                promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_en" ofType:@"png"]];
            }
            [swipeRect addSubview:promt];
            [promt release];

        }
    } else
    {
        UIImageView  *promt =[[UIImageView alloc] initWithFrame:CGRectMake(70*Times+Xoffset, 138*Times-Yoffset+i, 139*Times, 88*Times)];
        promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_zh" ofType:@"png"]] ;
        if (![Header isPreferredLanguageHans])
        {
            promt.frame=CGRectMake(50*Times+Xoffset, 138*Times+Yoffset+i, 189*Times, 88*Times);
            promt.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"mouse_hints_en" ofType:@"png"]] ;
        }
        [swipeRect addSubview:promt];
        [promt release];
    }
    
    swipeRect.userInteractionEnabled=YES;
    //创建一次点击事件
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired=1;//手指数
    singleTap.numberOfTouchesRequired=1;//tap次数
    [swipeRectView addGestureRecognizer:singleTap];
    singleTap.delegate=self;
    
    
    panRecognizer=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panRecognizer.delegate=self;
  //  [panRecognizer setDelaysTouchesEnded:FALSE];


    [swipeRectView addGestureRecognizer:panRecognizer];
    [singleTap requireGestureRecognizerToFail:panRecognizer];
    [self.view addSubview:swipeRectView];
    [swipeRectView addSubview:swipeRect];

    mouse=[[UIImageView alloc] initWithFrame:CGRectMake(160, 160, 160, 160)];
    if (IsA) {
        mouse.image=[UIImage imageNamed:@"mouse_pointerA.png"];
    } else
        mouse.image=[UIImage imageNamed:@"mouse_pointerB.png"];
    mouse.hidden=YES;
    
    [self.view addSubview:mouse];
    

    
    voiceDownBtn.tag = 110;
    voiceUpBtn.tag = 111;
    returnBtn.tag=105;

    [voiceDownBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [voiceUpBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [returnBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    

}



#pragma mark -
#pragma mark 按键操作
- (void)buttonPressed:(id)sender
{
    [Header buttonPressed:sender];
}

-(void)handleSingleTap:(UITapGestureRecognizer*)recognizer
{
    NSLog(@"鼠标单击：");
    if ((friend==nil) || (IsOnline==0)) {
        NSLog(@"鼠标单击提示信息");
       /* NSString *message;
        
        if (friend==nil) {
            message=NSLocalizedString(@"演示状态",@"演示状态");
        } else
        {
            message=NSLocalizedString(@"该设备已下线",@"该设备已下线");
        }
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];*/
        
    } else
    {

        
        CGPoint currentPosition=[recognizer locationInView:self.view];
        if ((currentPosition.x>=swipeRect.frame.origin.x)
            &&(currentPosition.x<=(swipeRect.frame.origin.x+swipeRect.frame.size.width))
            && (currentPosition.y>=swipeRectView.frame.origin.y)
            && (currentPosition.y<=swipeRectView.frame.origin.y+swipeRectView.frame.size.height))
        {
            dispatch_async(MouseQueue, ^{ [Header MouseSingleTap];
            });
        }
    };



}

-(void)handlePan:(UIPanGestureRecognizer*)recognizer
{    
//    NSLog(@"鼠标拖动：");
    short offsetx,offsety;
    static int x,y,i;
    CGPoint translation=[recognizer translationInView:self.view];
                         
    
    offsetx=translation.x;
    offsety=translation.y;

    
    CGPoint currentPosition=[recognizer locationInView:self.view];
    if ((currentPosition.x>=swipeRect.frame.origin.x)
        &&(currentPosition.x<=(swipeRect.frame.origin.x+swipeRect.frame.size.width))
        && (currentPosition.y>=swipeRectView.frame.origin.y)
        && (currentPosition.y<=swipeRectView.frame.origin.y+swipeRectView.frame.size.height))
    {
        mouse.hidden=NO;
    //    NSLog(@"亮光移动");
        [mouse setCenter:currentPosition];
            
        if ( (abs(offsetx)>3)||(abs(offsety)>3    	))
        {   NSLog(@"I=%d",i);

            
           // if (i%2==0) //%取余运算
            {
                NSLog(@"offsetX=%d,offsetY=%d",offsetx,offsety);
                x=x+offsetx;
                y=y+offsety;

                [recognizer setTranslation:CGPointZero inView:self.view];
            
                //发送位移命令给电视
                if ((friend==nil) || (IsOnline==0)) {
                    NSLog(@"鼠标拖动提示信息");
                    /*NSString *message;
                
                    if (friend==nil) {
                        message=NSLocalizedString(@"演示状态",@"演示状态");
                    } else
                    {
                        message=NSLocalizedString(@"该设备已下线",@"该设备已下线");
                    }
                    [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];*/
                
                } else
                {
                    NSLog(@"鼠标拖动向电视发送命令");
                    //  NSLog(@"send to tv about mouse:%04d,%04d",offsetx,offsety);
                    NSString *sOffsetx,*sOffsety;
                    sOffsetx=[NSString stringWithFormat:@"%04X",offsetx];
                    sOffsety=[NSString stringWithFormat:@"%04X",offsety];    
                    if (offsetx<0)
                        sOffsetx=[sOffsetx  substringFromIndex:sOffsetx.length-4];
                    if (offsety<0)
                        sOffsety=[sOffsety  substringFromIndex:sOffsety.length-4];
                
                    NSString *KeyCode=[NSString stringWithFormat:@"REL_%@_%@",sOffsetx,sOffsety];
                   // [Header MouseMove:KeyCode];
                    
                    dispatch_async(MouseQueue, ^{ [Header MouseMove:KeyCode];
                    });

                };
                
            };

            i++;
        }
    } else
    {
        mouse.hidden=YES;
    }
    //如果在移动状态则高亮鼠标
    if ((panRecognizer.state==UIGestureRecognizerStateEnded)
        ||(panRecognizer.state==UIGestureRecognizerStateFailed)
        ||(panRecognizer.state==UIGestureRecognizerStateCancelled) )
    {
        mouse.hidden=YES;
    }
    

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    
    return NO;// (interfaceOrientation == UIInterfaceOrientationPortrait);
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (void)dealloc
{
    [swipeRect release];
    [swipeRectView release];
    [singleTap release];
    [imageview release];
    [voiceDownBtn release];
    [returnBtn release];
    [voiceUpBtn release];
    [mouse release];
    [super dealloc];
}
@end
