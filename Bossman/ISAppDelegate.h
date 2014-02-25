//
//  ISAppDelegate.h
//  Bossman
//
//  Created by Ian Smith on 2/19/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ISMenubarWindowController.h"
#import "ISPreferencesWindowController.h"

@interface ISAppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *inputField;
@property (strong) IBOutlet NSStatusItem *statusItem;

@property (strong) ISMenubarWindowController *menubarWindowController;
@property (strong) ISPreferencesWindowController *preferencesWindowController;

- (IBAction)clickStatusItem:(id)sender;

@end
