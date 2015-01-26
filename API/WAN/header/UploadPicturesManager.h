//
//  UploadPicturesManager.h
//  TestJiaMao
//
//  Created by apple on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"

typedef enum ParserResponseType {
    NoneType = 0,
    UserLogin,
    CreatFile,
    upLoad,
    Commit,
    GenerateLink
} ParserResponseType;

@protocol UploadPicturesManagerDelegate;

@interface UploadPicturesManager : NSObject <ASIHTTPRequestDelegate> {
    NSUInteger expiration;
    NSMutableString *userToken;
    NSMutableString *userName;
    NSMutableString *userPassword;
    
    NSMutableString *object_name;
    NSMutableString *objectID;
    NSMutableString *SDNServer;
    NSMutableString *SDNServerKey;
    NSInteger imageSize;
    NSDate *Time;
    
    NSInteger currentUploadSize;
    NSInteger blockCountSent;
    NSInteger blockCountRecv;
    NSInteger blockSize;
    id <UploadPicturesManagerDelegate> delegate;
    ParserResponseType requestType;
}

@property (nonatomic, retain) NSDate *Time;

+ (UploadPicturesManager *)shareInstance;
- (void)setDelegate:(id <UploadPicturesManagerDelegate>)dlg;
- (void)userLoginByName:(NSString *)name password:(NSString *)password;

- (void)createFileByName:(NSString *)object_key 
                fileType:(NSString *)type 
                fileSize:(NSInteger)size 
                isOption:(BOOL)option 
     userDefineParameter:(NSString *)parameter;

- (void)commitByObjectID:(NSString *)token fileName:(NSString *)oid size:(NSInteger)size lastModifyTime:(NSDate *)lastModifyTime;
-(void) uploadFile:(NSString *)fileName start:(long long)startBytes end:(long long)endBytes;

@end
