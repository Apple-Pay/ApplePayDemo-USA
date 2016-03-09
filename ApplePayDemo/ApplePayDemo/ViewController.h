//
//  ViewController.h
//  ApplePayDemo
//
//  Created by ios on 16/3/3.
//  Copyright © 2016年 iOS.Samboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>

@interface ViewController : UIViewController
<PKPaymentAuthorizationViewControllerDelegate>

- (IBAction)checkOut:(id)sender;


@end

