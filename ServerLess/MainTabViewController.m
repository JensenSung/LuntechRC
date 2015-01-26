//
//  MainTabViewController.m
//  ServerLess
//  导航栏、工具栏等的控制
//  Created by zfm on 13-7-8.
//

#import "MainTabViewController.h"

#import "OrientViewController.h"
#import "DigitViewController.h"
#import "MouseViewController.h"


#import "Reachability.h"


static MainTabViewController *g_mainview;
//收到局域网消息后得回调

static void  get_Tv_buffer(const char *op_value) //(const char *password),const char *op_class,const char *op_type,const char *op_param,const char *op_ctrl,const char *op_value)
{
    //NSLog(@"收到电视返回信息源码：%s",op_value);

    NSString * string =[NSString stringWithCString:(char *)op_value encoding:NSUTF8StringEncoding];
    //NSLog(@"收到电视返回信息解码：%@",string);
    
    
   //解析数据
    NSRange range1;
    range1 = [string rangeOfString:@"value='"];
    NSString * string1 = [string substringFromIndex:range1.location+range1.length];
   // NSLog(@"收到电视返回信息解码3：:%@",string1);
   // NSLog(@"收到电视返回信息解码4：:%d",range1.length);
    NSRange range2;
    range2 = [string1 rangeOfString:@"'/><pwd>(null)</pwd></query></message>"];
    //NSLog(@"收到电视返回信息解码4：:%d",range2.location);
    NSString * result = [string1 substringToIndex:range2.location];
    NSLog(@"收到电视返回值：%@",result);

    NSRange range3;
    if (result) {
        NSLog(@"开始处理");
        if ([result rangeOfString:@"START_INPUT_METHOD$"].length > 0)
        {
            range3 = [result rangeOfString:@"START_INPUT_METHOD$"];
            //输入焦点返回信息
            NSString *InputMsg=[[result substringFromIndex:range3.location+range3.length] copy];
            NSLog(@"输入法返回:%@",InputMsg);
            if (InputMsg.length>0)
            {
                dispatch_async(dispatch_get_main_queue(),^{
                    [[NSNotificationCenter defaultCenter] postNotificationName: @"showInputMsg" object: InputMsg];
                });

            }
            [InputMsg release];
        } else if ([result rangeOfString:@"GET_TV_ABILITY$"].length > 0)
        {
            //GET_TV_ABILITY$1110
            // 第一位：代表输入法；0-不支持手机输入；1-支持；
            // 第二位：代表语音；0-不支持；1-支持；
            // 第三位：代表电视汇；0-不支持；1-支持；
            // 第四位：遥控器类型；0-A遥控器；1-B遥控器；

            range3 = [result rangeOfString:@"GET_TV_ABILITY$"];
            NSString *tvability;
            tvability=[result substringFromIndex:range3.location+range3.length];
            NSLog(@"设备支持能力返回:%@",tvability);
            if (tvability.length>0)
            {
                NSString *tv;
                if (tvability.length>0)
                    tv=[tvability substringToIndex:1];
                else
                    tv=nil;
                if ([tv isEqualToString:@"1"])
                {
                    IsSupportKeyBoard=1;
                }
                else
                {
                    IsSupportKeyBoard=0;
                }
                if (tvability.length>0)
                    tvability=[tvability substringFromIndex:1];
                else
                    tvability=nil;
                if (tvability.length>0)
                    tv=[tvability substringToIndex:1];
                else
                    tv=nil;
                if ([tv isEqualToString:@"1"])
                {
                    IsSupportVoice=1;
                } else
                {
                    IsSupportVoice=0;
                }
                if (tvability.length>0)
                    tvability=[tvability substringFromIndex:1];
                else
                    tvability=nil;
                
                if (tvability.length>0)
                    tv=[tvability substringToIndex:1];
                else
                    tv=nil;
                if ([tv isEqualToString:@"1"])
                {
                    IsSupportTvDepart=1;
                } else
                {
                    IsSupportTvDepart=0;
                }
                if (tvability.length>0)
                    tvability=[tvability substringFromIndex:1];
                else
                    tvability=nil;
                if (tvability.length>0)
                    tv=[tvability substringToIndex:1];
                else
                    tv=nil;
                if ([tv isEqualToString:@"1"])
                {
                    //B遥控器
                    IsA=0;
                } else
                {
                    //A遥控器
                    IsA=1;
                }
                IsGetTvAbility=1;
            }
        }
    }
    
}

@implementation MainTabViewController
@synthesize tabBarController;
@synthesize teleBtabBarController;
@synthesize pageTabar;
@synthesize alter;
@synthesize serverBrowser;
@synthesize timer;
@synthesize friendListView;
@synthesize navigationbar;
@synthesize panGestureRecognizer;
@synthesize friendView;
@synthesize contentView;
@synthesize grayView;



-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.pageTabar=0;
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

    [self startIGRSLAN];
    [self viewCannotUse];

    friendShowing=NO;
    currentTranslate=0;
    
    self.view.backgroundColor=[UIColor clearColor];
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

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            contentView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 320, 480+88-20)] ;
            grayView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 320, 480+88-20)] ;
        } else
        {
            contentView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 320, 480-20)] ;
            grayView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 320, 480-20)] ;
        }
    } else
    {
        contentView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 768, 1024)];
        grayView=[[UIView alloc]initWithFrame: CGRectMake(0, 0, 768, 1024)];
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7)
    {
        contentView.frame=CGRectMake(0, 20, contentView.frame.size.width, contentView.frame.size.height);
    }
    
    
    [self.view addSubview:contentView];
    grayView.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    [contentView addSubview:grayView];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            friendView=[[UIView alloc]initWithFrame: CGRectMake(320, 0, ContentOffset, 480+88-20)] ;
        } else
            friendView=[[UIView alloc]initWithFrame: CGRectMake(320, 0, ContentOffset, 480-20)] ;
    } else
    {
        friendView=[[UIView alloc]initWithFrame: CGRectMake(768, 0, ContentOffset*Times, 1024-20)] ;
        //  backView.backgroundColor=[UIColor clearColor];
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7)
    {
        friendView.frame=CGRectMake(friendView.frame.origin.x, 20, friendView.frame.size.width, friendView.frame.size.height);
    }
    friendView.userInteractionEnabled=YES;
    friendView.hidden=YES;
    [self.view addSubview:friendView];
    
    self.navigationController.navigationBar.hidden = YES;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        navigationbar=[[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)]autorelease];
        navigationbar.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"title_column_bar88" ofType:@"png"]];//[UIImage imageNamed:@"title_column_bar88.png"];
    } else
    {
        navigationbar=[[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 44*Times)]autorelease];
        navigationbar.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"顶" ofType:@"png"]];// [UIImage imageNamed:@"顶.png"];
    }

    navigationbar.userInteractionEnabled=YES;
    [contentView addSubview:navigationbar];
    


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(swipeNone) name:@"swipeNone" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(viewCannotUse) name:@"viewCannotUse" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(viewCanUse) name:@"viewCanUse" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showAlert:) name:@"showAlert" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showGetAbilityAlert:) name:@"showGetAbilityAlert" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showTeleSelect) name:@"showTeleSelect" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOpenTabar:) name:apgeTabarName object:nil];

    //自定义标题
    
    //self.navigationItem.title=NSLocalizedString(@"智能遥控器",nil);
    UILabel *titleview=[[UILabel alloc]initWithFrame:CGRectMake(85, 6, 150, 30)];  
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        titleview.frame = CGRectMake(234, 12, 150*Times, 30*Times);//42
    }
    [titleview setText:NSLocalizedString(@"智盒遥控器",@"智盒遥控器")];
    titleview.backgroundColor=[UIColor clearColor];
    titleview.textAlignment=NSTextAlignmentCenter;

    [titleview setFont:[UIFont boldSystemFontOfSize:21*Times]];
    titleview.textColor=[UIColor whiteColor];
    [navigationbar addSubview:titleview];
    [titleview release];

        

    if (friendListView==nil) {
        NSLog(@"创建friendlistview");
        friendListView = [[FriendListViewController alloc]init];
        friendListView.serverBrowser=serverBrowser;
    } ;
    [self addChildViewController:friendListView];
    [friendView addSubview:friendListView.view];
    
    // 搜算设备的旋转//283, 11, 20, 20
    
    UIImageView *imageView=[[[UIImageView alloc]initWithFrame:CGRectMake(235+50, 12, 20, 20)]autorelease];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        imageView.frame =CGRectMake(660+34, 20, 20*Times, 20*Times);
    imageView.animationImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"07.png"],[UIImage imageNamed:@"06.png"],[UIImage imageNamed:@"05.png"],[UIImage imageNamed:@"04.png"],[UIImage imageNamed:@"03.png"],[UIImage imageNamed:@"02.png"],[UIImage imageNamed:@"01.png"], nil];
    imageView.animationDuration=1.0f;
    imageView.animationRepeatCount=2;
     
    [imageView startAnimating];

   // self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithCustomView:right]autorelease];
    [navigationbar addSubview:imageView];
    imageView.userInteractionEnabled=YES;
    timer=[NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(searchdevicetimerfired) userInfo:nil repeats:NO ];


    [[NSNotificationCenter defaultCenter] postNotificationName:@"showTeleSelect" object: nil];
}
-(void)getAbilityTimerFired;
{
    if (friend==nil) {
        friend=[[NSString alloc]init];
    }
    friend=[name copy];
    IsOnline=1;
    [self viewCanUse];
    if (IsGetTvAbility==0) {
        NSString *message;
        message=NSLocalizedString(@"设备支持能力获取失败",@"设备支持能力获取失败");
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];
    }
    //设置选择设备标识
    friendListView.selectedView.frame=CGRectMake(225*Times, 12*Times, 20*Times, 20*Times);
    [friendListView.serverList addSubview:friendListView.selectedView];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showTeleSelect" object: nil];
}
-(void)searchdevicetimerfired;
{
    NSLog(@"stopAnimating;");
    UIButton *buttonSetting = [[UIButton alloc] init] ;

    buttonSetting.frame = CGRectMake(255+20, 8, 42, 28);// CGRectMake(20, 7, 42, 28)

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
      
        buttonSetting.frame = CGRectMake(660+12, 16, 42*Times, 28*Times);//273
    }
    
    [buttonSetting setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"title_column_swichsetbox" ofType:@"png"]] forState:UIControlStateNormal];
    [buttonSetting setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"title_column_swichsetbox" ofType:@"png"]]  forState:UIControlStateHighlighted];
    [buttonSetting setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"title_column_pressbg" ofType:@"png"]] forState:UIControlStateHighlighted];

    [buttonSetting addTarget:self action:@selector(buttonAction_setting:) forControlEvents:UIControlEventTouchUpInside];
    
    [navigationbar addSubview:buttonSetting];
    [buttonSetting release];
    
    panGestureRecognizer  = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    if (serverBrowser.TVNames.count==1)
    {
        NSNetService *selectedSerer = [serverBrowser.TVNames objectAtIndex:0];
        name=[NSString stringWithString:[selectedSerer name]];
        IsGetTvAbility=0;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [Header getTvAbility:name];
        });
        NSString *message;
        
        message=NSLocalizedString(@"获取设备支持能力",@"获取设备支持能力");
        
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showGetAbilityAlert" object: message];

        [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(getAbilityTimerFired) userInfo:nil repeats:NO ];
        
        return;
    }
    [self viewCanUse];
    //如果有多个设备
    [self swipeLeft];

}


-(void)selectedTabBarController:(int)aapgeTabar
{    
    if (tabBarController == nil) {
        tabBarController = [[HXTabBarController alloc] init];
       
        OrientViewController *orientView=[[OrientViewController alloc] init];

        
        DigitViewController *digitView=[[DigitViewController alloc] init];
        
        MouseViewController *mouseView=[[MouseViewController alloc] init] ;

        
        NSArray *viewContrArray=[[NSArray alloc] initWithObjects:orientView,digitView,mouseView, nil];
        
        //tabbarViewContr.viewControllers=viewContrArray;
        tabBarController.viewControllers = viewContrArray;
        //必须增加子视图控制器，否则坐标位置下移了20
        [self addChildViewController:tabBarController];

        [contentView addSubview:self.tabBarController.view];
        [tabBarController when_tabbar_is_selected:aapgeTabar];
        [digitView release];
        [mouseView release];
        [orientView release];
        [viewContrArray release];
    }
    else{
        [tabBarController when_tabbar_is_selected:aapgeTabar];
        [contentView bringSubviewToFront:self.tabBarController.view];
    }
    [contentView bringSubviewToFront:navigationbar];
}



- (void) handleOpenTabar:(NSNotification*)notification
{
	// override to handle urls sent to your app
	// register your url schemes in your App-Info.plist
    NSLog(@"%@",notification.userInfo);
    if (notification.userInfo)
    {
        NSDictionary* userInfo=notification.userInfo;
        pageTabar=[[userInfo objectForKey:@"page"] intValue];
        NSLog(@"%d",pageTabar);
        [self selectedTabBarController:pageTabar];
    }
    
}


-(void)buttonAction_setting:(id)sender
{
    NSLog(@"select device");
    
    [self swipeLeft];
    
}


-(void)timerFireMethod:(NSTimer*)theTimer
{
    UIAlertView *promt=(UIAlertView*)[theTimer userInfo];
    [promt dismissWithClickedButtonIndex:0 animated:NO];
    //[promt release];
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
    //     [self selectedTabBarController:pageTabar];
	[super viewWillDisappear:animated];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)handleSwipeFrom:(UIPanGestureRecognizer *)sender//UIPanGestureRecognizer UISwipeGestureRecognizer
{
    CGFloat translation = [sender translationInView:self.contentView].x;
    NSLog(@"Change:currentTranslate=%f,translation=%f,tx=%f",currentTranslate,translation,self.contentView.transform.tx);
    if (((translation<0)&&(friendShowing))) {
        [self moveAnimationWithDirection:SwipDirectionLeft duration:0.2];
        NSLog(@"friedShowing == YES");
        return;
    }else if((translation>0)&&(!friendShowing)){
        return;
    }
    
    self.friendView.hidden=NO;

    [contentView bringSubviewToFront:grayView];
    if (sender.state == UIGestureRecognizerStateChanged)
    {
       // NSLog(@"Change:currentTranslate=%f,translation=%f,tx=%f",currentTranslate,translation,self.contentView.transform.tx);
        self.contentView.transform = CGAffineTransformMakeTranslation(translation+currentTranslate, 0);
        self.friendView.transform = CGAffineTransformMakeTranslation(translation+currentTranslate, 0);
        
        if (fabs(self.contentView.transform.tx*1.00)/(ContentOffset*Times*1.00)<1) {
          //  NSLog(@"alpha=%f",fabs(self.contentView.transform.tx*1.00)/(ContentOffset*Times*1.00)*0.4);
            self.grayView.alpha=fabs(self.contentView.transform.tx*1.00)/(ContentOffset*Times*1.00)*0.4;
        } else
        {
            self.grayView.alpha=0.4;
        }


	} else //if (panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
      //  NSLog(@"end:currentTranslate=%f,translation=%f",currentTranslate,translation);
		currentTranslate = self.contentView.transform.tx;

        //friend
        if (currentTranslate<0) {
            if (!friendShowing) {
                if (fabs(currentTranslate)<ContentMinOffset*Times) {
                    [self moveAnimationWithDirection:SwipDirectionNone duration:0.2];
                }else
                {
                    [self moveAnimationWithDirection:SwipDirectionLeft duration:0.2];
                }
            }else
            {
                if (fabs(currentTranslate)>ContentOffset*Times-ContentMinOffset*Times)  {
                    [self moveAnimationWithDirection:SwipDirectionLeft duration:0.2];
                } else
                {
                    [self moveAnimationWithDirection:SwipDirectionNone duration:0.2];
                }
            }
        }
	}
    
    
    
}
- (void)moveAnimationWithDirection:(SwipDirection)direction duration:(float)duration //(UISwipeGestureRecognizerDirection)
{
    NSLog(@"moveAnimationWithDirection");
    void (^animations)(void) = ^{
		switch (direction) {
            case SwipDirectionNone:
            {
                self.contentView.transform  = CGAffineTransformMakeTranslation(0, 0);
                self.friendView.transform  = CGAffineTransformMakeTranslation(0, 0);
            }
            break;

            case SwipDirectionLeft:
             {
                self.contentView.transform  = CGAffineTransformMakeTranslation(-ContentOffset*Times, 0);
                self.friendView.transform  = CGAffineTransformMakeTranslation(-ContentOffset*Times, 0);
             }
            break;
            default:
                break;
        }
	};
    void (^complete)(BOOL) = ^(BOOL finished)
    {
        currentTranslate = self.contentView.transform.tx;
        
        if (direction == SwipDirectionLeft)
        {
            friendShowing=YES;
            self.contentView.userInteractionEnabled = NO;
            self.grayView.alpha=0.4;
            [contentView bringSubviewToFront:grayView];
        } else if (direction == SwipDirectionNone)
        {
            friendShowing=NO;
            self.contentView.userInteractionEnabled = YES;
            self.friendView.hidden=YES;
            self.grayView.alpha=0;
            [contentView sendSubviewToBack:grayView];

        }

	};
    [UIView animateWithDuration:duration animations:animations completion:complete];
}
- (void)dealloc
{
    [panGestureRecognizer release];
    [tabBarController release];
    [teleBtabBarController release];
    [friendView release];
    [contentView release];
    [grayView release];
    [timer release];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:apgeTabarName object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"swipeNone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"viewCannotUse" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"viewCanUse"  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showAlert"  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showGetAbilityAlert"  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showTeleSelect"  object:nil];
    [super dealloc];
    
}
+(MainTabViewController *)mainTabViewController
{
    @synchronized(self)
    {
        if (g_mainview == nil)
        {
            g_mainview = [[MainTabViewController alloc] init];
        }
    }
    return g_mainview;
}


-(void)viewCannotUse//关闭交互
{
    self.view.userInteractionEnabled = NO;
  //  self.navigationController.navigationBar.userInteractionEnabled=NO;
    self.navigationbar.userInteractionEnabled=NO;
    self.navigationController.tabBarController.tabBar.userInteractionEnabled = NO;
}

-(void)viewCanUse//打开交互
{
    self.view.userInteractionEnabled = YES;
  //  self.navigationController.navigationBar.userInteractionEnabled=YES;
    self.navigationbar.userInteractionEnabled=YES;
    self.navigationController.tabBarController.tabBar.userInteractionEnabled = YES;
}

-(void)swipeLeft
{
    self.friendView.hidden=NO;
    [contentView bringSubviewToFront: self.grayView];
    [self moveAnimationWithDirection:SwipDirectionLeft duration:0.2];
}

-(void)swipeNone
{
    [self moveAnimationWithDirection:SwipDirectionNone duration:0.2];
}

-(void)showGetAbilityAlert:(NSNotification *)notification
{
    id message=notification.object;
    //提示信息
    
    
    /*UIAlertView *prompt=[[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
     prompt.frame=CGRectMake(40,200,200,40);
     [prompt setContentMode:UIViewContentModeScaleAspectFill];
     [prompt show];
     [NSTimer scheduledTimerWithTimeInterval:0.25f target:self selector:@selector(timerFireMethod:) userInfo:prompt repeats:NO];*/
    
    
    //   NSLog(@"按键提示信息");
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"viewCannotUse" object:nil];
    
    UIImageView * view = [[[UIImageView alloc]initWithFrame:CGRectMake(30, (220-44-20), 260, 60)]autorelease];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (![Header isPreferredLanguageHans])
        {
            if (iPhone5) {
                view.frame =CGRectMake(30, 220+44-10, 260, 60);
            } else
            {
                view.frame =CGRectMake(30, (220-10), 260, 60);
            }
        } else
        {
            if (iPhone5) {
                view.frame =CGRectMake(55, 220+44-10, 210, 60);
            } else
            {
                view.frame =CGRectMake(55, (220-10), 210, 60);
            }
        }
    } else
    {
        if (![Header isPreferredLanguageHans])
        {
            view.frame =CGRectMake(30*Times+Xoffset, (220-10)*Times+Yoffset, 260*Times, 60*Times);
        } else
        {
            view.frame =CGRectMake(55*Times+Xoffset, (220-10)*Times+Yoffset, 210*Times, 60*Times);
        }
    }
    
    if (IsA&&!friendShowing) {
        view.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"alert_frame" ofType:@"png"]];
    } else
    {
        view.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"alert_frame_bg" ofType:@"png"]];
    }
    
    view.userInteractionEnabled = YES;
    CALayer * layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5];
    [layer setBorderWidth:0];
    [layer setBorderColor:[[UIColor clearColor]CGColor]];
    view.tag = PopView_TAG;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    //    NSString *message;
    
    GetAbilityMessageView *getabilitymessageview= [[[GetAbilityMessageView alloc]initWithFrame:view.bounds MainViewController:self Message:message]autorelease];
    getabilitymessageview.delegate=self;
    
    [view addSubview:getabilitymessageview];
    
}

-(void)showAlert:(NSNotification *)notification
{
    id message=notification.object;
    //提示信息    
    /*UIAlertView *prompt=[[UIAlertView alloc]initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    prompt.frame=CGRectMake(40,200,200,40);
    [prompt setContentMode:UIViewContentModeScaleAspectFill];
    [prompt show];
    [NSTimer scheduledTimerWithTimeInterval:0.25f target:self selector:@selector(timerFireMethod:) userInfo:prompt repeats:NO];*/
    
    
 //   NSLog(@"按键提示信息");
    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"viewCannotUse" object:nil];

    
    UIImageView * view = [[[UIImageView alloc]initWithFrame:CGRectMake(2, (220-44-20), 316, 60)]autorelease];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (iPhone5) {
            view.frame =CGRectMake(2, 220+44-10, 316, 45);
        } else
        {
            view.frame =CGRectMake(2, (220-10), 316, 45);
        }
    } else
    {
        view.frame =CGRectMake(2*Times+Xoffset, (220-10)*Times+Yoffset, 316*Times, 65);
    }
    
    if (IsA) {
        view.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"alter_background" ofType:@"png"]];
    } else
    {
        view.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"alter_background_shaddow" ofType:@"png"]];
    }
    
    view.userInteractionEnabled = YES;
    CALayer * layer = [view layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5];
    [layer setBorderWidth:0];
    [layer setBorderColor:[[UIColor clearColor]CGColor]];
    view.tag = PopView_TAG;
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    MessageView *messageview= [[[MessageView alloc]initWithFrame:view.bounds MainViewController:self Message:message]autorelease];
    messageview.delegate=self;
    
    [view addSubview:messageview];

}


-(void)dissmissAndCancelSubmit
{
    UIView * view = (UIView *)[[UIApplication sharedApplication].keyWindow viewWithTag:PopView_TAG];
    if (view)
    {
        [view removeFromSuperview];
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"viewCanUse" object:nil];
}

-(void)showTeleSelect
{
    if (IsA) {
        [self selectedTabBarController:pageTabar];
    } 
}




#pragma mark IGRS Stack
- (void) startIGRSLAN
{
    //初始化我们的服务
    int ret;
   /*1、根据设备名称初始化闪联，在IOS7下连读取输入法不行
     2、刚开始固定名称会有并发问题，如输入法环节异常*/
    NSString *devicename=[[[UIDevice currentDevice] name ] stringByAppendingString:@".RC"];
    NSLog(@"DEVICENAME:%@",devicename);
    
    ret = igrs_serverless_init_base([devicename UTF8String], 2, "xt68", "hisense","igrs2.0_hisense_20110812", NULL);//@"hisense_remote"

    if (ret != IGRS_RET_OK)
    {
        return ;
    }
    
    //注册回调函数 本函数解析的字符串被截断了
   // igrs_serverless_subscribe_tv_command_base(get_Tv_buffer);
    igrs_serverless_subscribe_airCondition_command_base(get_Tv_buffer);

    ret=igrs_serverless_start_base(5251, NULL, NULL);
    if (ret != IGRS_RET_OK)
    {
        NSLog(@"igrs_serverless_start_base fail!");
    }
    
    if (serverBrowser==nil) {
        serverBrowser = [[ServerBrowser alloc] init];
    }

    //   serverBrowser.delegate = self;
    [serverBrowser start];
}

- (void) stopIGRSLAN
{
    [serverBrowser stop];
    IgrsRet ret = IGRS_RET_FAIL;
    
    //停止服务
    ret = igrs_serverless_stop_base ();
    if (ret != IGRS_RET_OK)
        NSLog(@"igrs_serverless_stop_base fail!");
    ret = igrs_serverless_release_base ();
    if (ret != IGRS_RET_OK)
        NSLog(@"igrs_serverless_release_base fail!");
    ret = igrs_serverless_unsubscribe_device_presence_base ();
    if (ret != IGRS_RET_OK)
        NSLog(@"igrs_serverless_unsubscribe_device_presence_base fail!");

    if (friendListView) {
        [friendListView updateServerList];
    }
}


@end
