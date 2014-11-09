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

- (void)viewDidLoad {
  [super viewDidLoad];
  self.pasteboard = [[PresentsPasteboardAsActivityItems alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  if (self.pasteboard.hasItems) {
    [self.shareButton setEnabled: YES];
    if (self.pasteboard.isImage) {
      self.pastebufferLabel.hidden = YES;
      self.pastebufferImage.image = self.pasteboard.asImage;
      self.pastebufferImage.hidden = NO;
    } else {
      self.pastebufferImage.hidden = YES;
      [self.pastebufferLabel setText: self.pasteboard.asString];
      self.pastebufferLabel.hidden = NO;
    }
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
  [self presentViewController: [[UIActivityViewController alloc]
                                initWithActivityItems: self.pasteboard.items
                                applicationActivities:nil]
                     animated:YES
                   completion:nil];
}

@end
