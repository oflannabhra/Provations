//
//  PersonDetailViewController.m
//  ProvationsApp
//
//  Created by Ben Flannery on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "Person.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController

@synthesize person, contentView;

- (id)init{
    self = [super init];
    if (self) {

                
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.contentView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //Get the image file path
    NSString *imageName = [[[[self.person.name lowercaseString] componentsSeparatedByString:@" "] objectAtIndex:0] stringByAppendingString:@"@2x.png"];
    
    NSLog(imageName);
    
    
    
    NSString* htmlContentString = [NSString stringWithFormat:
                                   @"<html>"
                                   "<body>"
                                   "<h1>%@</h1>"
                                   "<h3>%@</h3>"
                                   "<p><img src='%@' align='left' width='120'> %@</p>"
                                   "</body></html>", [self.person name], [self.person title], imageName, [self.person bio]];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [contentView loadHTMLString:htmlContentString baseURL:baseURL];

    [self.view addSubview:self.contentView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
