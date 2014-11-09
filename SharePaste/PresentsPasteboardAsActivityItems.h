//
//  PresentsPasteboardAsActivityItems.h
//  SharePaste
//
//  Created by Justin Searls on 11/9/14.
//  Copyright (c) 2014 Justin Searls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PresentsPasteboardAsActivityItems : NSObject

- (BOOL) isEmpty;
- (BOOL) hasItems;

- (BOOL) isImage;

- (UIImage*) asImage;
- (NSString*) asString;

- (NSArray*) items;

@end