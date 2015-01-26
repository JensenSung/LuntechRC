//
//  main.m
//  ServerLess
//
//  Created by chen on 10/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerLessAppDelegate.h"


int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([ServerLessAppDelegate class]));
    [pool release];
    return retVal;
}
