//
//  LANDeviceManagerView.m
//  Hisense
//
//  Created by zfm on 13-7-8.
//

#import "UITextFieldEx.h"


@implementation UITextFieldEx


-(CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x+6, bounds.origin.y, bounds.size.width-6,bounds.size.height);
}

-(CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x+6, bounds.origin.y, bounds.size.width-6,bounds.size.height);
}

@end
