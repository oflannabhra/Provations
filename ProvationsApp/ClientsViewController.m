//
//  SecondViewController.m
//  ProvationsApp
//
//  Created by Ben Flannery on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClientsViewController.h"
#import "UIImage+iPad.h"

@interface ClientsViewController ()

@end

@implementation ClientsViewController

@synthesize clientsScrollView;
@synthesize pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Clients", @"Clients");
        self.tabBarItem.image = [UIImage imageNamed:@"clients"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [self setupPage];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

- (void)setupPage
{
    clientsScrollView.delegate = self;
    
    [self.clientsScrollView setBackgroundColor:[UIColor blackColor]];
    [clientsScrollView setCanCancelContentTouches:NO];
    
    clientsScrollView.showsVerticalScrollIndicator = YES;
    clientsScrollView.showsHorizontalScrollIndicator = NO;
    clientsScrollView.clipsToBounds = YES;
    clientsScrollView.scrollEnabled = YES;
    clientsScrollView.pagingEnabled = YES;
    
    NSUInteger numImages = 0;
    CGFloat cx = 0;
    
    // Iterate over all images, add spacing, then add subview to ScrollView
    for (; ; numImages++) {
        NSString *imageName = [NSString stringWithFormat:@"image%d", (numImages + 1)];
        UIImage *image = [UIImage imageNamedSmart:imageName];
        if (image == nil)
            break;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGRect rect = imageView.frame;
        rect.size.height = image.size.height;
        rect.size.width = image.size.width;
        rect.origin.x = ((clientsScrollView.frame.size.width - image.size.width) /2) + cx;
        rect.origin.y = ((clientsScrollView.frame.size.height - image.size.height) / 2);
        
        imageView.frame = rect;
        
        [clientsScrollView addSubview:imageView];
        
        cx += clientsScrollView.frame.size.width;
    }
    
    self.pageControl.numberOfPages = numImages;
    [clientsScrollView setContentSize:CGSizeMake(cx, [clientsScrollView bounds].size.height)];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (pageControlIsChangingPage) {
        return;
    }
    
    // Change the page at 50%
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth +1);
    pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlIsChangingPage = NO;
}

- (IBAction)changePage:(id)sender
{
    // Change the ScrollView
    CGRect frame = clientsScrollView.frame;
    frame.origin.x = frame.size.width *pageControl.currentPage;
    frame.origin.y = 0;
    
    [clientsScrollView scrollRectToVisible:frame animated:YES];
    
    // Use this BOOL to keep from breaking pageControl
    pageControlIsChangingPage = YES;
}

- (IBAction)selectPage:(id)sender
{
    if (!pageControlIsChangingPage){
    }
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
