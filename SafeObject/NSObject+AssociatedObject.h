//
//  NSObject+AssociatedObject.h
//  Weibo
//
//  Created by Stephen Liu on 12-11-26.
//  Copyright (c) 2012年 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)
- (id)objectWithAssociatedKey:(void *)key;
- (void)setObject:(id)object forAssociatedKey:(void *)key retained:(BOOL)retain;
@end
