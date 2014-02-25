//
//  ISMenubarWindowController.h
//  Bossman
//
//  Created by Ian Smith on 2/24/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ISMenubarWindowController : NSWindowController <NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *commandField;
@property (strong) IBOutlet NSProgressIndicator *processIndicator;

- (IBAction)toggleCommandWindow:(id)sender;
- (IBAction)runCommand:(id)sender;

@end
