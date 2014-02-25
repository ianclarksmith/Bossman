//
//  ISTmuxInterface.h
//  Bossman
//
//  Created by Ian Smith on 2/19/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISTmuxInterface : NSObject

+ (NSString*)runTmux:(NSArray*)arguments;
+ (NSString*)sendKeys:(NSString*)command;

@end
