//
//  ViewController.m
//  DTCoreTextHyphenationExample
//
//  Created by Jesús on 11/09/13.
//  Copyright (c) 2013 Jesús. All rights reserved.
//

#import <DTCoreText.h>

#import "ViewController.h"
#import "NSString+Hyphenation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *htmlStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sample" ofType:@"txt"] encoding:NSUTF8StringEncoding error:NULL];
    htmlStr = [htmlStr hyphenatedStringWithLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en"]];
    NSData *htmlData = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *options = @{
                              DTDefaultTextAlignment : @(NSTextAlignmentJustified),
                              DTDefaultFontSize : @(18)
                              };
    
    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:htmlData options:options documentAttributes:NULL];
    DTAttributedTextView *textView = [[DTAttributedTextView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(20, 20, 20, 20))];
    [textView setAttributedString:[stringBuilder generatedAttributedString]];
    [textView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:textView];
}

@end
