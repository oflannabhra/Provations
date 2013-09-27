//
//  ContactViewControllerViewController.h
//  ProvationsApp
//
//  Created by Ben Flannery on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)openMail:(id)sender;

@end
