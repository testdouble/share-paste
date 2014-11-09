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
  return false;
}

- (UIImage*) asImage {
  return nil;
}

- (NSString*) asString {
  return self.pasteboard.string;
}

- (NSArray*) items {
  NSArray *types = self.pasteboard.pasteboardTypes;
  NSMutableArray *items = [[NSMutableArray alloc] init];
  [types enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [items addObject:[self.pasteboard valueForPasteboardType:types[idx]]];
  }];
  return items;
}

//private

- (UIPasteboard*) pasteboard {
  return [UIPasteboard generalPasteboard];
}

@end
