//
//  Person.m
//  ProvationsApp
//
//  Created by Ben Flannery on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name, title, bio;

#pragma mark NSCoding

#define kNameKey       @"Name"
#define kTitleKey      @"Title"
#define kBioKey        @"Bio"

- (id) init {
    self = [super init];
    if (self)
        self = [self initWithName:nil andTitle:nil andBio:nil];
    return self;    
}

- (id) initWithName:(NSString *)name andTitle:(NSString *)title andBio:(NSString *)bio {
    self = [super init];
    if (self) {
        self.name = name;
        self.title = title;
        self.bio = bio;
    }
    else {
        return nil;
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *name = [decoder decodeObjectForKey:kNameKey];
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSString *bio = [decoder decodeObjectForKey:kBioKey];
    
    return [self initWithName:name andTitle:title andBio:bio];
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:name forKey:kNameKey];
    [encoder encodeObject:title forKey:kTitleKey];
    [encoder encodeObject:bio forKey:kBioKey];
}

@end
