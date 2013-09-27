//
//  UIImage+UIImage_iPad.m
//  ProvationsApp
//
//  Created by Ben Flannery on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImage+iPad.h"

@implementation UIImage (UIImage_iPad)

+ (UIImage *) imageNamedSmart:(NSString *)name
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        return [UIImage imageNamed:[NSString stringWithFormat:@"%@@2x.png", name]];
    return [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", name]];
            }

@end
