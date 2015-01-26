//
//  ImageDataDownLoad.h
//  TestJiaMao
//
//  Created by bvtuser on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"

@interface ImageDataDownLoad : NSObject
{
    ASINetworkQueue *networkQueue;
    BOOL failed;
    NSMutableString *picName;
    NSString *picType;
}

@property(nonatomic,retain) ASINetworkQueue *networkQueue;
@property(nonatomic,retain) NSString *picType;;
- (void)imageFetchComplete:(ASIHTTPRequest *)request;
- (void)imageFetchFailed:(ASIHTTPRequest *)request;
- (void)downLoadImage:(NSString *)urlStr;
+(ImageDataDownLoad *)shareImageDataDL;
@end
