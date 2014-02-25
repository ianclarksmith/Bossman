//
//  ISPreferencesWindowController.m
//  Bossman
//
//  Created by Ian Smith on 2/24/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import "ISPreferencesWindowController.h"

@interface ISPreferencesWindowController ()

@end

@implementation ISPreferencesWindowController

- (id)init {
    return [super initWithWindowNibName:@"ISPreferencesWindow"];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (void)showWindow:(id)sender {
    [super self];
    
    // Mark down Friday for a department review.
    NSArray *quotes = @[@"Tea mux? I said coffee, no mux!",
                        @"Bossman just wants it done.",
                        @"Grrreeeaaat job..."];
    NSUInteger randomIndex = arc4random() % [quotes count];
    self.quoteLabel.stringValue = quotes[randomIndex];
    
    // Window demands attention
    [self.window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
