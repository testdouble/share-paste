//
//  ViewController.h
//  SharePaste
//
//  Created by Justin Searls on 11/9/14.
//  Copyright (c) 2014 Justin Searls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentsPasteboardAsActivityItems.h"

@interface ViewController : UIViewController

- (IBAction)share:(id)sender;

@property (strong, nonatomic) PresentsPasteboardAsActivityItems *pasteboard;

@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIImageView *pastebufferImage;
@property (strong, nonatomic) IBOutlet UILabel *pastebufferLabel;

@end

