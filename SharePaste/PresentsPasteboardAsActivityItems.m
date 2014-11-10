//
//  PresentsPasteboardAsActivityItems.m
//  SharePaste
//
//  Created by Justin Searls on 11/9/14.
//  Copyright (c) 2014 Justin Searls. All rights reserved.
//

#import "PresentsPasteboardAsActivityItems.h"

@interface PresentsPasteboardAsActivityItems ()

- (UIPasteboard*) pasteboard;

@end

@implementation PresentsPasteboardAsActivityItems

- (BOOL) isEmpty {
  return self.pasteboard.numberOfItems == 0;
}

- (BOOL) hasItems {
  return !self.isEmpty;
}

- (BOOL) isImage {
  return [[self.items firstObject] isKindOfClass: [UIImage class]];
}

- (UIImage*) asImage {
  return [self.items firstObject];
}

- (NSString*) asString {
  return self.pasteboard.string;
}

- (NSArray*) items {
  NSArray *types = self.pasteboard.pasteboardTypes;
  NSMutableArray *items = [[NSMutableArray alloc] init];
  [types enumerateObjectsUsingBlock:^(NSString* type, NSUInteger idx, BOOL *stop) {
    id value = [self.pasteboard valueForPasteboardType:type];
    if (value) {
      [items addObject:value];
    }
  }];
  return items;
}

//private

- (UIPasteboard*) pasteboard {
  return [UIPasteboard generalPasteboard];
}

@end
