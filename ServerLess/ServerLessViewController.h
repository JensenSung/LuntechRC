//
//  ServerLessViewController.h
//  ServerLess
//
//  Created by chen on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ServerBrowserDelegate;
@interface ServerLessViewController : UIViewController
{ 
    time_t timeG;
    struct tm *p;
    UITextField *textField;
}
@property (nonatomic, retain) IBOutlet UITextField *textField;

-(IBAction)IGRS;

@end