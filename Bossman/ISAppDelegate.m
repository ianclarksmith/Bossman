//
//  ISAppDelegate.m
//  Bossman
//
//  Created by Ian Smith on 2/19/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import "ISAppDelegate.h"
#import "ISTmuxInterface.h"

@implementation ISAppDelegate

@synthesize menubarWindowController;
@synthesize preferencesWindowController;

+ (void)initialize {
    [self setupDefaults];
}

+ (void)setupDefaults {
    NSDictionary* defaults = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"/usr/local/bin/tmux", @"TmuxPath",
                              @"bossman-app", @"TmuxSession",
                              @"", @"InitCommand",
                              @"", @"AlternateCommand",
                              @YES, @"KillOnQuit", nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    // // Unnecessary?
    // [[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:...];
}

- (void)awakeFromNib {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    self.statusItem.action = @selector(clickStatusItem:);
    // self.statusItem.title = @"T*";
    self.statusItem.image = [NSImage imageNamed:@"StatusIcon"];
    self.statusItem.highlightMode = YES;

    self.menubarWindowController = [[ISMenubarWindowController alloc] init];
    self.preferencesWindowController = [[ISPreferencesWindowController alloc] init];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Create new tmux session
    [ISTmuxInterface runTmux:@[@"new", @"-d", @"-s", [[NSUserDefaults standardUserDefaults] objectForKey:@"TmuxSession"]]];
    
    // Allow user to set a command to be run at launch
    NSString* initCommand = [[NSUserDefaults standardUserDefaults] objectForKey:@"InitCommand"];
    if ([initCommand length] != 0) {
        [ISTmuxInterface sendKeys:initCommand];
    }
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"KillOnQuit"] isEqualToValue:@YES]) {
        [ISTmuxInterface runTmux:@[@"kill-session", @"-t", [[NSUserDefaults standardUserDefaults] objectForKey:@"TmuxSession"]]];
    }
}

- (void)clickStatusItem:(id)sender {
    NSEvent *event = [NSApp currentEvent];
    
    if ([event modifierFlags] & NSAlternateKeyMask) {
        [self.preferencesWindowController showWindow:self];
    } else {
        [self.menubarWindowController toggleCommandWindow:sender];
    }
}

@end
