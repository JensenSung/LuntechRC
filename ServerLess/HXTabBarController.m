//
//  HXTabBarController.m
//  hisense
//
//  Created by zfm on 13-7-8.
//

#import "HXTabBarController.h"
#import "Header.h"

@implementation HXTabBarController
@synthesize tab_btn,barView,btn;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

//    self.tabBar.backgroundColor = [UIColor clearColor];
    self.tabBarController.tabBar.hidden = YES;
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
        
        
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            [view removeFromSuperview];
        }
            
    }


    self.view.backgroundColor = [UIColor clearColor];
    [self init_tab];
    [self when_tabbar_is_unselected];
    [self add_custom_tabbar_elements];
}

- (void)init_tab
{
    if (barView == nil) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            if (iPhone5) {
                barView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 367+88+44, 320, 49)];
            } else
            {
               barView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 367+44, 320, 49)];
            }

            
            barView.userInteractionEnabled = YES;
            [self.view addSubview:barView];
        }
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {//844

            barView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 862+44, 768, 49*Times)];
            barView.userInteractionEnabled = YES;
            [self.view addSubview:barView];
        }
        
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [super viewWillAppear:animated];
}
 
- (void)when_tabbar_is_unselected
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

-(void)add_custom_tabbar_elements
{
  //  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

    int tab_num = 3;//TABbar个数
    if (!IsA)
    {
        tab_num = 2;//TABbar个数
    }
    int i = 0;
    
    tab_btn = [[NSMutableArray alloc] initWithCapacity:0];
    UIImage *image213=[UIImage imageNamed:@"bottom_bg213_leftbrightrightdark"];
    UIImage *image213click=[UIImage imageNamed:@"bottom_bg213_click"];
    UIImage *image256=[UIImage imageNamed:@"bottom_bg256_leftbrightrightdark"];
    UIImage *image256focus=[UIImage imageNamed:@"bottom_bg256_click"];

    for (; i < tab_num; i++)
    {

        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
       // [btn setFrame:CGRectMake(i*108, 0, 106, 49)];
        /*
         初始状态：左亮右暗，点中之后：点击状态（无边），前面的按钮是左亮右亮
         */
        switch (i) {
            case 0:
                if (IsA) {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [btn setFrame:CGRectMake(0, 0, 106*Times, 49*Times)];
                        [btn setBackgroundImage:image213 forState:UIControlStateNormal];
                        [btn setBackgroundImage:image213 forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:image213click forState:UIControlStateSelected];
                    } else
                    {
                        [btn setFrame:CGRectMake(0, 0, 256, 49*Times)];
                        [btn setBackgroundImage:image256 forState:UIControlStateNormal];
                        [btn setBackgroundImage:image256 forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:image256focus forState:UIControlStateSelected];
                    }
                    
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_director" ofType:@"png"]] forState:UIControlStateNormal];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_director_click" ofType:@"png"]] forState:UIControlStateHighlighted];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_director_click" ofType:@"png"]] forState:UIControlStateSelected];
                
                    [btn setTitle:NSLocalizedString(@"方向",@"方向") forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor colorWithRed:130/255.0 green:133/255.0 blue:140/255.0 alpha:1] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                    [btn setImageEdgeInsets:UIEdgeInsetsMake(2,37,15,37)];
                    [btn setTitleEdgeInsets:UIEdgeInsetsMake(37,-50,4,10)];
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        [btn setImageEdgeInsets:UIEdgeInsetsMake(0-6,48*Times,15+6,45)];
                        [btn setTitleEdgeInsets:UIEdgeInsetsMake(37*Times-3,-50,4,10)];
                    }
                    btn.titleLabel.font=[UIFont boldSystemFontOfSize:11.0*Times];
                    btn.titleLabel.textAlignment=NSTextAlignmentCenter;
                }
                break;
                
            case 1:
                if (IsA) {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [btn setFrame:CGRectMake(106*Times, 0, 109*Times, 49*Times)];
                        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_bg214_leftbrightrightdark" ofType:@"png"]] forState:UIControlStateNormal];
                        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_bg214_leftbrightrightdark" ofType:@"png"]] forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_bg214_click" ofType:@"png"]] forState:UIControlStateSelected];
                    } else
                    {
                        [btn setFrame:CGRectMake(256, 0, 256, 49*Times)];
                        [btn setBackgroundImage:image256 forState:UIControlStateNormal];
                        [btn setBackgroundImage:image256 forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:image256focus forState:UIControlStateSelected];
                    }

                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_number" ofType:@"png"]] forState:UIControlStateNormal];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_number_click" ofType:@"png"]] forState:UIControlStateHighlighted];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_number_click" ofType:@"png"]] forState:UIControlStateSelected];
                    [btn setTitle:NSLocalizedString(@"数字",@"数字") forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor colorWithRed:130/255.0 green:133/255.0 blue:140/255.0 alpha:1] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                    [btn setImageEdgeInsets:UIEdgeInsetsMake(2,37,15,37)];
                    [btn setTitleEdgeInsets:UIEdgeInsetsMake(37,-50,4,10)];
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        [btn setImageEdgeInsets:UIEdgeInsetsMake(0-6,48*Times,15+6,45)];
                        [btn setTitleEdgeInsets:UIEdgeInsetsMake(37*Times-3,-50,4,10)];
                    }
                    btn.titleLabel.font=[UIFont boldSystemFontOfSize:11.0*Times];
                }
                break;
                
            case 2:
                if (IsA) {

                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [btn setFrame:CGRectMake(214*Times, 0, 106*Times, 49*Times)];
                        [btn setBackgroundImage:image213 forState:UIControlStateNormal];
                        [btn setBackgroundImage:image213 forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:image213click forState:UIControlStateSelected];
                    } else
                    {
                        [btn setFrame:CGRectMake(256*2, 0, 256, 49*Times)];
                        [btn setBackgroundImage:image256 forState:UIControlStateNormal];
                        [btn setBackgroundImage:image256 forState:UIControlStateHighlighted];
                        [btn setBackgroundImage:image256focus forState:UIControlStateSelected];
                    }
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_mouse" ofType:@"png"]] forState:UIControlStateNormal];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_mouse_click" ofType:@"png"]] forState:UIControlStateHighlighted];
                    [btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"bottom_mouse_click" ofType:@"png"]] forState:UIControlStateSelected];
                    [btn setTitle:NSLocalizedString(@"鼠标",@"鼠标") forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor colorWithRed:130/255.0 green:133/255.0  blue:140/255.0 alpha:1] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                    [btn setImageEdgeInsets:UIEdgeInsetsMake(2,37,15,37)];
                    [btn setTitleEdgeInsets:UIEdgeInsetsMake(37*Times,-50,4,10)];
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    {
                        [btn setImageEdgeInsets:UIEdgeInsetsMake(0-6,45*Times,15+6,45)];
                        [btn setTitleEdgeInsets:UIEdgeInsetsMake(37*Times-3,-50,4,10)];
                    }
                    btn.titleLabel.font=[UIFont boldSystemFontOfSize:11.0*Times];
                }
                break;
                
            default:
                break;
        }
        if (i == 0)
        {
            [btn setSelected:YES];
        }
        [btn setTag:i];
        [tab_btn addObject:btn];
        [barView addSubview:btn];
        [btn addTarget:self action:@selector(button_clicked_tag:) forControlEvents:UIControlEventTouchUpInside];
        [btn release];
    }
	
}

- (void)button_clicked_tag:(id)sender
{
	long tagNum = [sender tag];
	[self when_tabbar_is_selected:(int)tagNum];
}

- (void)when_tabbar_is_selected:(int)tabID
{
    /* [UIView beginAnimations:@"" context:nil];
     [UIView setAnimationDuration:0.5f];//动画时长
     [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     [UIView  setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];//给视图添加过度效果*/

    UIImage *image213=[UIImage imageNamed:@"bottom_bg213_leftbrightrightdark"];
    UIImage *image256=[UIImage imageNamed:@"bottom_bg256_leftbrightrightdark"];
    UIImage *image256light=[UIImage imageNamed:@"bottom_bg256_leftbrightrightbright"];
    UIImage *imagebottom=[UIImage imageNamed:@"bottom非选择状态－左亮右暗"];  
    UIImage *imagebottompad=[UIImage imageNamed:@"bottom非选择状态－左亮右暗-pad"];

    
    
    
    //if (self.selectedIndex != tabID) {
        switch(tabID)
        {
            case 0:
                [[tab_btn objectAtIndex:0] setSelected:true];
                if (tab_btn.count>=3)
                {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [[tab_btn objectAtIndex:1] setBackgroundImage:[UIImage imageNamed:@"bottom_bg214_leftbrightrightdark"] forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:1] setSelected:false];
                        [[tab_btn objectAtIndex:2] setBackgroundImage:image213 forState:UIControlStateNormal];
                    } else
                    {
                        [[tab_btn objectAtIndex:1] setBackgroundImage:image256 forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:1] setSelected:false];
                        [[tab_btn objectAtIndex:2] setBackgroundImage:image256 forState:UIControlStateNormal];
                    }

                    [[tab_btn objectAtIndex:2] setSelected:false];
                } else if (tab_btn.count==2)//B遥控器
                {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [[tab_btn objectAtIndex:1] setBackgroundImage:imagebottom forState:UIControlStateNormal];
                    } else
                    {
                        [[tab_btn objectAtIndex:1] setBackgroundImage:imagebottompad forState:UIControlStateNormal];
                    }
                    [[tab_btn objectAtIndex:1] setSelected:false];
                }
                if (tab_btn.count==4)
                {
                    
                    [[tab_btn objectAtIndex:3] setSelected:false];

                }
                break;
            case 1:
                [[tab_btn objectAtIndex:1] setSelected:true];
                if (tab_btn.count>=3)
                {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [[tab_btn objectAtIndex:0] setBackgroundImage:[UIImage imageNamed:@"bottom_bg213_leftbrightrightbright"] forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:0] setSelected:false];
                        [[tab_btn objectAtIndex:2] setBackgroundImage:image213 forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:2] setSelected:false];
                    } else
                    {
                        [[tab_btn objectAtIndex:0] setBackgroundImage:image256light forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:0] setSelected:false];
                        [[tab_btn objectAtIndex:2] setBackgroundImage:image256 forState:UIControlStateNormal];
                        [[tab_btn objectAtIndex:2] setSelected:false];
                    }
                } else if (tab_btn.count==2)
                {
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                    {
                        [[tab_btn objectAtIndex:0] setBackgroundImage:[UIImage imageNamed:@"bottom选择的左侧背景－左亮右亮"] forState:UIControlStateNormal];
                    } else
                    {
                        [[tab_btn objectAtIndex:0] setBackgroundImage:[UIImage imageNamed:@"bottom选择的左侧背景－左亮右亮-pad"] forState:UIControlStateNormal];
                    }
                    [[tab_btn objectAtIndex:0] setSelected:false];
                }
                if  (tab_btn.count==4)
                {
                    [[tab_btn objectAtIndex:3] setSelected:false];
                    
                }
                break;
            case 2:
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
                {
                    [[tab_btn objectAtIndex:0] setBackgroundImage:image213 forState:UIControlStateNormal];
                    [[tab_btn objectAtIndex:0] setSelected:false];
                    [[tab_btn objectAtIndex:1] setBackgroundImage:[UIImage imageNamed:@"bottom_bg214_leftbrightrightbright"] forState:UIControlStateNormal];
                    [[tab_btn objectAtIndex:1] setSelected:false];
                } else
                {
                    [[tab_btn objectAtIndex:0] setBackgroundImage:image256 forState:UIControlStateNormal];
                    [[tab_btn objectAtIndex:0] setSelected:false];
                    [[tab_btn objectAtIndex:1] setBackgroundImage:image256light forState:UIControlStateNormal];
                    [[tab_btn objectAtIndex:1] setSelected:false];
                }
                if (tab_btn.count>=3)
                {
                    [[tab_btn objectAtIndex:2] setSelected:true];
                }
                if (tab_btn.count==4)
                {
                    [[tab_btn objectAtIndex:3] setSelected:false];
                    
                }

                break;
                
            case 3:
                [[tab_btn objectAtIndex:0] setSelected:false];
                [[tab_btn objectAtIndex:1] setSelected:false];
                if (tab_btn.count>=3)
                {
                    [[tab_btn objectAtIndex:2] setSelected:false];
                }
                if (tab_btn.count==4)
                {
                    [[                                                                                                                                                                                                                                                tab_btn objectAtIndex:3] setSelected:true];
                    
                }
                break;
               
            default:
                break;
        }
        self.selectedIndex = tabID;

    
}


- (void)dealloc {
    NSLog(@"TabBarController Dealloc");
	[tab_btn release];
    [barView release];
    [btn release];
    [super dealloc];
}

@end
