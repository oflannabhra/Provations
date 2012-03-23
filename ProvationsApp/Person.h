//
//  Person.h
//  ProvationsApp
//
//  Created by Ben Flannery on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *bio;

- (id) initWithName:(NSString *)name andTitle:(NSString *)title andBio:(NSString *)bio;

- (id) initWithCoder:(NSCoder *)decoder;

- (void) encodeWithCoder:(NSCoder *)encoder;

@end
