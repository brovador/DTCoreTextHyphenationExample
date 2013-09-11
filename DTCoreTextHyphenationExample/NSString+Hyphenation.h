//
//  NSString+Hyphenation.h
//  DTCoreTextHyphenationExample
//
//  Created by Jesús on 11/09/13.
//  Copyright (c) 2013 Jesús. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hyphenation)

- (NSString*)hyphenatedStringWithLocale:(NSLocale*)locale;

@end
