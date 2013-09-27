//
//  FirstViewController.m
//  ProvationsApp
//
//  Created by Ben Flannery on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"About", @"About");
        self.tabBarItem.image = [UIImage imageNamed:@"about"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *html = @"<html><body><h2>What We Do:</h2><ul><li>Creative consulting and graphic design<li>Printing, covering the full range of web, sheet fed, digital and screen</li><li>Digital magazine publishing for websites or CD/DVDs</li><li>CD/DVD multimedia production</li><li></li><li>Writing and copy editing</li><li>Sports programs, media guides, magazines, newsletters, booklets, soft and hardbound books, sell sheets, folders, outdoor signage, advertising, logo's, business cards and stationery</li><li>Turn-key project management or single-service flexibility</li></ul><h2>Guiding Principles</h2><p> Customer Focus aligns our organization, resources and strategies to exceed customer expectations of service and product quality within our targeted markets.</p><p>Employee Involvement is essential to achieving our mission by creating an environment in which employees are empowered to contribute their best efforts, knowledge and creative ideas.</p><p>Continuous Improvementand innovation are central to our success in providing a good value tothe markets we serve and a reasonable return on investment to ourowners.</p><p>Supplier Partnerships are a foundation of our business strategy as we continuously seek value-producing and mutually beneficial relationships</p></body></html>";
    [self.webView loadHTMLString:html baseURL:nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
