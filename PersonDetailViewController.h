//
//  PersonDetailViewController.h
//  ProvationsApp
//
//  Created by Ben Flannery on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonDetailViewController : UIViewController

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) UIWebView *contentView;

@end
