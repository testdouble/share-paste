//
//  ViewController.m
//  SharePaste
//
//  Created by Justin Searls on 11/9/14.
//  Copyright (c) 2014 Justin Searls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.pasteboard = [UIPasteboard generalPasteboard];
  if (self.pasteboard.numberOfItems > 0) {
    [self.shareButton setEnabled: YES];
    [self.pastebufferLabel setText: self.pasteboard.string];
  } else {
    [self.shareButton setEnabled: NO];
    [self.pastebufferLabel setText: @"Nothing currently copied. Go copy something!"];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  self.pasteboard = nil;
}

- (IBAction)share:(id)sender {
  NSArray *types = self.pasteboard.pasteboardTypes;
  NSMutableArray *items = [[NSMutableArray alloc] init];
  [types enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [items addObject:[self.pasteboard valueForPasteboardType:types[idx]]];
  }];
  
  [self presentViewController: [[UIActivityViewController alloc]
                                initWithActivityItems: items
                                applicationActivities:nil]
                     animated:YES
                   completion:nil];
}

@end
