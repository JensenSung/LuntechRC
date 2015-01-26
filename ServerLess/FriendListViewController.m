#import "FriendListViewController.h"
#import "ServerLessAppDelegate.h"

#import "MainTabViewController.h"
#import "Reachability.h"


static FriendListViewController *g_frilstCtr;

@implementation FriendListViewController
@synthesize list;
@synthesize serverBrowser;
@synthesize buttonRefresh;
@synthesize serverList;
@synthesize searchView;
@synthesize searchimage;
@synthesize noDeviceView;
@synthesize noDevicePromt;
@synthesize noDevice;
@synthesize background;
@synthesize navigation;
@synthesize searchlabel;
@synthesize selectedView;

// View loaded
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refresh) name:@"updateServerList" object:nil];
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationItem setHidesBackButton:true animated:NO];
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
    background = [[UIImageView alloc]initWithFrame:CGRectMake(0-5, 0, 260+5, 480-20)];//60

    if (iPhone5)
    {
        background.frame = CGRectMake(0-5, 0, 260+5, 480+88-20);
    } 
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        background.frame= CGRectMake(0*Times-5*Times, 0, 260*Times+10, 1024-20);
    }
    background.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_devicelist_bg" ofType:@"png"]];

    [self.view addSubview:background];
    
    
    navigation=[[UIImageView alloc]initWithFrame:CGRectMake(0*Times-5*Times, 0, 260*Times+5*Times, 44*Times)];
    navigation.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_title_bg" ofType:@"png"]];

    navigation.userInteractionEnabled=YES;
    
    
    UIButton *left = [[UIButton alloc] init];
    left.frame = CGRectMake(10, 8, 42, 28);//42
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        left.frame = CGRectMake(10*Times, 16, 42*Times, 28*Times);//42
    left.backgroundColor=[UIColor clearColor];
    [left setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_back" ofType:@"png"]] forState:UIControlStateNormal];
    [left setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_back" ofType:@"png"]] forState:UIControlStateHighlighted];
    [left setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_backbg" ofType:@"png"]] forState:UIControlStateHighlighted];
    //旋转
 //   left.transform=CGAffineTransformMakeRotation(0.15*3.1415926);//1.57079633
 //   [left setBackgroundImage:[UIImage imageNamed:@"顶图标点击背景.png"] forState:UIControlStateHighlighted];
    
    [left addTarget:self action:@selector(demo) forControlEvents:UIControlEventTouchUpInside];
    [navigation addSubview:left];
    [left release];
    
    UILabel *title=[[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 260*Times, 44*Times)]autorelease];
    title.backgroundColor = [UIColor clearColor];

    title.text =NSLocalizedString(@"选择设备",@"选择设备");
    title.font = [UIFont boldSystemFontOfSize:21*Times];
    [title setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]] ;
    title.textAlignment =NSTextAlignmentCenter;
    [navigation addSubview:title];

    [self.view addSubview:navigation];
    
    
    /*serverList = [[UITableView alloc]initWithFrame:CGRectMake(0, 50*Times+Yoffset, 260*Times, 250*Times) style:UITableViewStylePlain];
    serverList.delegate = self;
    serverList.dataSource = self;
    serverList.backgroundColor = [UIColor clearColor];
    //#b8c1c4
    serverList.separatorColor=[UIColor colorWithRed:184/255.0 green:193/255.0 blue:196/255.0 alpha:1];*/
    //节目列表
    serverList=[[UIScrollView alloc]init];
    serverList.frame =CGRectMake(0, 50*Times+Yoffset, 260*Times, 250*Times);
    serverList.showsHorizontalScrollIndicator=NO;
    serverList.showsVerticalScrollIndicator=YES;
    serverList.pagingEnabled=NO;
    serverList.scrollEnabled=YES;
    serverList.delegate=self;
    
    //遇到边框是否反弹
    serverList.bounces=NO;
    //缩放的时候是否会反弹
    serverList.bouncesZoom=YES;
    //只能一个方向滑动
    serverList.directionalLockEnabled=YES;
    //不能翻页
    serverList.pagingEnabled=NO;
    
    //滚动风格
    serverList.indicatorStyle=UIScrollViewIndicatorStyleDefault;
    
    serverList.delegate=self;
    serverList.scrollEnabled=YES;
    //触底是否反弹
    serverList.alwaysBounceHorizontal=NO;
    serverList.backgroundColor=[UIColor clearColor];
    serverList.delaysContentTouches=NO;
    [self.view addSubview:serverList];
    

    /*if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7)
    {
        serverList.separatorInset=UIEdgeInsetsMake(0,0,0,0);
    }

    [self.view addSubview:serverList];*/
    
    
    // 查找设备
    searchView=[[UIView alloc]initWithFrame:CGRectMake((80-60)*Times, 44*Times+Yoffset, 220*Times, 280*Times)];
    searchimage = [[UIImageView alloc]initWithFrame:CGRectMake(110-30, 60, 60, 60)] ;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        searchimage.frame =CGRectMake((110-30)*Times, 60, 60*Times, 60*Times);
    }
    searchimage.animationImages=[NSArray arrayWithObjects:[UIImage imageNamed:@"rcolumn_standby_07.png"],[UIImage imageNamed:@"rcolumn_standby_06.png"],[UIImage imageNamed:@"rcolumn_standby_05.png"],[UIImage imageNamed:@"rcolumn_standby_04.png"],[UIImage imageNamed:@"rcolumn_standby_03.png"],[UIImage imageNamed:@"rcolumn_standby_02.png"],[UIImage imageNamed:@"rcolumn_standby_01.png"], nil];
    searchimage.animationDuration=1.0f;
    searchimage.animationRepeatCount=2;
    
    [searchView addSubview:searchimage];
    
    searchlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 220, 30)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        searchlabel.frame =CGRectMake(0, 160*Times, 220*Times, 30*Times);
    }
    searchlabel.backgroundColor = [UIColor clearColor] ;
    
    searchlabel.textColor = [UIColor colorWithRed:69/255.0 green:75/255.0 blue:80/255.0 alpha:1] ;
    searchlabel.text =NSLocalizedString(@"正在努力查找设备...","正在努力查找设备...");
    searchlabel.textAlignment = NSTextAlignmentCenter;
    searchlabel.font = [UIFont systemFontOfSize:14*Times];
    [searchView addSubview:searchlabel];
    searchView.hidden=YES;
    [self.view addSubview:searchView];
    
    
    //设备未找到以及未找到设备提示
    noDeviceView=[[UIView alloc]initWithFrame:CGRectMake((80-60)*Times, 44*Times+Yoffset, 280*Times-(320-ContentOffset)*Times, 320*Times)];
   // noDeviceView.backgroundColor=[UIColor blackColor];
    
    UIImageView  *nodeviceimage = [[[UIImageView alloc]initWithFrame:CGRectMake(82, 26, 55, 55)] autorelease];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        nodeviceimage.frame =CGRectMake(82*Times, 26, 55*Times, 55*Times);
    }
    nodeviceimage.image =[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_errorhint" ofType:@"png"]];
    
    [noDeviceView addSubview:nodeviceimage];
    
    
    noDevice = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 220, 30)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        noDevice.frame =CGRectMake(0, 90*Times, 220*Times, 30*Times);
    }
    noDevice.backgroundColor = [UIColor clearColor] ;
    noDevice.textColor = [UIColor colorWithRed:69/255.0 green:75/255.0 blue:80/255.0 alpha:1] ;
    noDevice.text =NSLocalizedString(@"未能找到设备","未能找到设备");
    noDevice.textAlignment = NSTextAlignmentCenter;
    noDevice.font = [UIFont systemFontOfSize:17*Times];
    [noDeviceView addSubview:noDevice];

    
    noDevicePromt = [[UITextView alloc] initWithFrame:CGRectMake(0, 130, 220*Times, 200)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        noDevicePromt.frame =CGRectMake(0, 130*Times,220*Times, 200*Times);
    }
    noDevicePromt.backgroundColor = [UIColor clearColor];
    noDevicePromt.textColor = [UIColor colorWithRed:69/255.0 green:75/255.0 blue:80/255.0 alpha:1];

    noDevicePromt.text =NSLocalizedString(@"未找到设备提示","未找到设备提示");
    noDevicePromt.textAlignment = NSTextAlignmentLeft;
    noDevicePromt.userInteractionEnabled=NO;
    
    noDevicePromt.font = [UIFont systemFontOfSize:14*Times];
    
    if (![Header isPreferredLanguageHans])
        noDevicePromt.font = [UIFont systemFontOfSize:14*Times];
    
    [noDeviceView addSubview:noDevicePromt];
    noDeviceView.hidden=YES;

    [self.view addSubview:noDeviceView];


    buttonRefresh =  [UIButton buttonWithType:UIButtonTypeCustom];
    buttonRefresh.frame =CGRectMake((80-60)*Times, 370*Times+Yoffset, 220*Times, 35*Times);
    [buttonRefresh setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_refresh" ofType:@"png"]] forState:UIControlStateNormal];
    [buttonRefresh setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_refresh_click" ofType:@"png"]]forState:UIControlStateHighlighted];
    //初始状态  #2b3a45 
    [buttonRefresh setTitleColor:[UIColor colorWithRed:43/255.0 green:58/255.0 blue:69/255.0 alpha:1] forState:UIControlStateNormal];

    //选择状态  #6d3907
     [buttonRefresh setTitleColor:[UIColor colorWithRed:109/255.0 green:57/255.0 blue:7/255.0 alpha:1] forState:UIControlStateHighlighted];
    
    [buttonRefresh setTitle:NSLocalizedString(@"查找设备", @"查找设备") forState:UIControlStateNormal];
    buttonRefresh.titleLabel.font = [UIFont systemFontOfSize:17*Times];
    [buttonRefresh addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];

    buttonRefresh.userInteractionEnabled=YES;
    [self.view addSubview:buttonRefresh];



    selectedView=[[UIImageView alloc]initWithFrame: CGRectMake(225*Times, 12*Times, 20*Times, 20*Times)];
    selectedView.image=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"rcolumn_deviceselect" ofType:@"png"]];
    [self updateServerList];

}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"friendlistviewController willappear");
    [super viewWillAppear:animated];
//    [self.view bringSubviewToFront:buttonRefresh];
//    buttonRefresh.userInteractionEnabled=YES;
//    self.navigationController.navigationBar.hidden = YES
    

}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"friendlistviewController viewDidAppear");
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"friendlistviewController viewDidDisappear");
	[super viewDidDisappear:animated];
}


- (void)dealloc
{
    NSLog(@"friendListViewController Dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"updateServerList" object:nil];
    self.serverBrowser=nil;
    [searchlabel release];
    [background release];
    [serverList release];
    [noDevice release];
    [noDevicePromt release];
    [noDeviceView release];
    [searchimage release];
    [searchView release];
    [buttonRefresh release];
    [selectedView release];
    [super dealloc];
}


#pragma mark -
#pragma mark ServerBrowserDelegate Method Implementations

- (void)updateServerList {
    @synchronized(self)
    {
        NSLog(@"refresh device list");
       // [serverList reloadData];
        NSLog(@"serverBrowser.TVNames count=%lu",(unsigned long)[serverBrowser.TVNames count]);
        if ([serverBrowser.TVNames count]) {
            noDeviceView.hidden=YES;
            searchView.hidden=YES;
            serverList.hidden = NO;
        } else
        {
            noDeviceView.hidden = NO;
            searchView.hidden=YES;
            serverList.hidden = YES;
        }
        

        [self clearDevice:serverList];
        [self updateScrollSize:serverList ];

        [self loadData:serverList];

        //刷新之前设置状态为下线
        IsOnline=0;
        [selectedView removeFromSuperview];
        
        //如果存在选择的设备，则将选择设备图标置上
        @try {
            if ((friend) && (serverBrowser.TVNames.count>0))
            {
                NSInteger i;
                i=0;
                while (i<serverBrowser.TVNames.count)
                {
                    NSNetService* server = [serverBrowser.TVNames objectAtIndex:i];
                    if ([friend  isEqualToString:server.name])  //(friend==server.name)
                    {
                        IsOnline=1;
                        selectedView.frame=CGRectMake(225*Times, 12*Times+i*45*Times, 20*Times, 20*Times);
                        [serverList addSubview:selectedView];
                        break;
                    }
                    i++;
                }
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }


        
       // [[NSNotificationCenter defaultCenter]postNotificationName:@"viewCanUse" object:nil];
        //初始状态  #2b3a45
        [buttonRefresh setTitleColor:[UIColor colorWithRed:43/255.0 green:58/255.0 blue:69/255.0 alpha:1] forState:UIControlStateNormal];
        buttonRefresh.userInteractionEnabled=YES;
    }

}
#pragma mark - 
#pragma mark Table View Data Source Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


+(FriendListViewController *)shareFriendListViewController
{
    @synchronized(self)
    {
        if (g_frilstCtr == nil) 
        {
            g_frilstCtr = [[FriendListViewController alloc] init];
        }
    }
    return g_frilstCtr;
}


#pragma mark Button
-(void)select:(id)sender
{
 /*   UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];*/
    
    UIButton *view=(UIButton*)sender;
    [selectedView removeFromSuperview];
    selectedView.frame=CGRectMake(225*Times, 12*Times, 20*Times, 20*Times);
    [view addSubview:selectedView];
 
    if (view.tag<=serverBrowser.TVNames.count-1)
    {
        NSNetService *selectedSerer = [serverBrowser.TVNames objectAtIndex:view.tag];

        // if (!([friend  isEqualToString:selectedSerer.name]))

        name=[NSString stringWithString:[selectedSerer name]];
        IsGetTvAbility=0;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [Header getTvAbility:name];
        });
        
        NSString *message;
        
        message=NSLocalizedString(@"获取设备支持能力",@"获取设备支持能力");
        
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showGetAbilityAlert" object: message];
        
        [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(getAbilityTimerFired) userInfo:nil repeats:NO ];
    }/* else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"swipeNone" object: nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showTeleSelect" object: nil];
        
    }*/
}

-(void)refresh
{
    dispatch_async(dispatch_get_main_queue(),^{
        NSLog(@"refresh device list");
        buttonRefresh.userInteractionEnabled=NO;
        //查询状态  #abb1b5
        [buttonRefresh setTitleColor:[UIColor colorWithRed:171/255.0 green:177/255.0 blue:181/255.0 alpha:1] forState:UIControlStateNormal];
        noDeviceView.hidden=YES;
        searchView.hidden=NO;
        serverList.hidden = YES;
        [searchimage stopAnimating];
        [searchimage startAnimating];
        [NSTimer scheduledTimerWithTimeInterval:1.75f target:self selector:@selector(updateServerList) userInfo:nil repeats:NO ];
    });

}
-(void)demo
{
    NSLog(@"demo mode");
    //    [self  dismissViewControllerAnimated:YES completion:^{NSLog(@"call back");}];
  /*  旧的PUSH模式
   self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
   */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"swipeNone" object: nil];

 //   [[NSNotificationCenter defaultCenter] postNotificationName:@"viewCanUse" object: nil];
    
 //   [[NSNotificationCenter defaultCenter] postNotificationName:@"showTeleSelect" object: nil];
    
}


-(void)getAbilityTimerFired
{
    if (friend==nil) {
        friend=[[NSString alloc]init];
    }
    friend=[name copy];
    IsOnline=1;
    if (IsGetTvAbility==0)
    {
        NSString *message;
        message=NSLocalizedString(@"设备支持能力获取失败",@"设备支持能力获取失败");
        [[NSNotificationCenter defaultCenter] postNotificationName: @"showAlert" object: message];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"swipeNone" object: nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showTeleSelect" object: nil];

    
}


- (void)clearDevice:(UIScrollView*)sender
{
    UIScrollView *scroll = (UIScrollView *)sender;
    for(UIView *view in scroll.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
        
    }
}

-(void)updateScrollSize:(UIScrollView*)sender
{
    UIScrollView *scroll = (UIScrollView *)sender;
    unsigned long i;
    i=serverBrowser.TVNames.count;
    if (i<5)
        i=5;
	float contentHeight =45*i;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        contentHeight =90*i;
    }

	[scroll setContentSize:CGSizeMake(scroll.bounds.size.width,contentHeight)];
}

-(CGRect)frameForItemAtIndex:(NSUInteger)index
{
    CGRect itemFrame = CGRectMake(0, 0, 280*Times, 45*Times);
    
    itemFrame.origin.x =0;
    itemFrame.origin.y = (itemFrame.size.height)*(index);
    
    return itemFrame;
}
-(void)loadData:(UIScrollView*)scroll
{
   /* if (index < 0 || index >= serverBrowser.TVNames.count) {
        return;
    }*/
    NSString *devicename;
    for (int i=0;i<[serverBrowser.TVNames count]; i++)
    {
        NSNetService* server = [serverBrowser.TVNames objectAtIndex:i];
        devicename=[server name];
      //大小
        CGRect frame =[self frameForItemAtIndex:i];
        UIButton *view=[[UIButton alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor clearColor];
        view.tag=i;
        
        //横向分割线
        UIImageView *separatorview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 45, view.frame.size.width, 1)];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            separatorview.frame =CGRectMake(0, 89, view.frame.size.width, 2);
        }
        separatorview.backgroundColor=[UIColor colorWithRed:184/255.0 green:193/255.0 blue:196/255.0 alpha:1];
        [view addSubview:separatorview];
        [separatorview release];
        
       
        //选择设备背景
        [view setBackgroundImage:[UIImage imageNamed:@"rcolumn_deviceselect_bg.png"] forState:UIControlStateHighlighted];


        //图片
        UIImageView *deviceview=[[UIImageView alloc]initWithFrame: CGRectMake(20*Times, 12*Times, 20*Times, 20*Times)];
        deviceview.image=[UIImage imageNamed:@"rcolumn_device.png"];
        [view addSubview:deviceview];
        [deviceview release];
        
        //标题


        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50*Times, 12*Times, 175*Times, 20*Times)];
        label.text=devicename;
        label.textColor=[UIColor colorWithRed:40/255.0 green:41/255.0 blue:42/255.0 alpha:1];
        label.font=[UIFont systemFontOfSize:17*Times];
        label.backgroundColor=[UIColor clearColor];
        [view addSubview:label];
        [label release];
        
        [view addTarget:self action:@selector(select:) forControlEvents:UIControlEventTouchUpInside];
        
        [scroll addSubview:view];
        [view release];
    }
    
}

@end

