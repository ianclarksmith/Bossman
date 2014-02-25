//
//  ISMenubarWindowController.m
//  Bossman
//
//  Created by Ian Smith on 2/24/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import "ISMenubarWindowController.h"
#import "ISTmuxInterface.h"

@interface ISMenubarWindowController ()

@end

@implementation ISMenubarWindowController

- (id)init {
    return [super initWithWindowNibName:@"ISMenubarWindow"];
}

- (void)windowDidLoad {
    [self.window setStyleMask:NSBorderlessWindowMask];
    
    NSEvent* event = [NSApp currentEvent];
    
    // Get the frame and origin of the control of the current event
    // (= our NSStatusItem)
    CGRect eventFrame = [[event window] frame];
    CGPoint eventOrigin = eventFrame.origin;
    CGSize eventSize = eventFrame.size;
    
    // Calculate the position of the window to
    // place it centered below of the status item
    CGRect windowFrame = self.window.frame;
    CGSize windowSize = windowFrame.size;
    CGPoint windowTopLeftPosition = CGPointMake(eventOrigin.x, eventOrigin.y);
    
    [self.window setFrameTopLeftPoint:windowTopLeftPosition];
    
    [self.commandField setDelegate:self];
}

- (void)showWindow:(id)sender {
    [super self];
    
    // Window demands attention
    [self.window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}

- (void)toggleCommandWindow:(id)sender {
    if (self.window.isVisible == 0) {
        [self showWindow:self];
    } else {
        [self.window close];
    }
}

- (IBAction)runCommand:(id)sender {
    [ISTmuxInterface sendKeys:[self.commandField stringValue]];
    [self.commandField setStringValue:@""];
}

- (void)cancelOperation:(id)sender {
    [self.commandField setStringValue:@""];
    [self controlTextDidEndEditing:nil];
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    [ISTmuxInterface sendKeys:[self.commandField stringValue]];
    [self.commandField setStringValue:@""];
    [self.window close];
}

- (void)insertCommandNewline:(id)sender {
    NSLog(@"do something");
    [self controlTextDidEndEditing:nil];
    [ISTmuxInterface sendKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"AlternateCommand"]];
}

- (BOOL)isCommandEnterEvent:(NSEvent *)event {
    NSUInteger flags = (event.modifierFlags & NSDeviceIndependentModifierFlagsMask);
    BOOL isCommand = (flags & NSCommandKeyMask) == NSCommandKeyMask;
    BOOL isEnter = (event.keyCode == 0x24); // VK_RETURN
    return (isCommand && isEnter);
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    if ((commandSelector == @selector(noop:)) && [self isCommandEnterEvent:[NSApp currentEvent]]) {
        [self insertCommandNewline:self];
        return YES;
    }
    return NO;
}

@end
