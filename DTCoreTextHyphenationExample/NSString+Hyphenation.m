//
//  NSString+Hyphenation.m
//  DTCoreTextHyphenationExample
//
//  Created by Jesús on 11/09/13.
//  Copyright (c) 2013 Jesús. All rights reserved.
//

#import "NSString+Hyphenation.h"

@implementation NSString (Hyphenation)

- (NSString*)hyphenatedStringWithLocale:(NSLocale*)locale
{
    /*
     Based on the idea on:
     http://stackoverflow.com/questions/8203767/hyphenation-library-doesnt-work-with-ios-5
     */
    
    unsigned char hyspots[self.length];
    memset(hyspots, 0, self.length);
    CFRange range = CFRangeMake(0, self.length);
    for(int i = 0; i < self.length; i++) {
        int x = CFStringGetHyphenationLocationBeforeIndex(
                                                          (CFStringRef) self, i, range,
                                                          0, (CFLocaleRef)locale, NULL);
        if(x >= 0 && x < self.length)
            hyspots[x] = 1;
    }
    
    unichar hyphenChar = (UniChar)0x00AD;
    CFMutableStringRef s = CFStringCreateMutable(kCFAllocatorDefault, self.length * 2);
    CFStringRef hyphen = CFStringCreateWithCharacters(kCFAllocatorDefault, &hyphenChar, 1);
    for(int i = 0; i < self.length; i++) {
        if(hyspots[i]) {
            CFStringAppend(s, hyphen);
        }
        unichar letter = CFStringGetCharacterAtIndex((CFStringRef)self, i);
        CFStringAppendCharacters(s, &letter, 1);
        
    }
    return (__bridge NSString*)s;
}

@end
