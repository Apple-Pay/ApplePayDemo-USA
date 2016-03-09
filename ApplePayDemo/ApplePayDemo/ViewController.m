//
//  ViewController.m
//  ApplePayDemo
//
//  Created by ios on 16/3/3.
//  Copyright © 2016年 iOS.Samboo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion

{
    NSLog(@"Payment 被授权: %@", payment);
    
    BOOL asyncSuccessful = FALSE;
    
    if(asyncSuccessful) {
        completion(PKPaymentAuthorizationStatusSuccess);
        NSLog(@"Payment 支付成功!");
    } else {
        completion(PKPaymentAuthorizationStatusFailure);
        NSLog(@"Payment 支付失败");
    }
    
}

-(void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller
{
    NSLog(@"支付完成!");
    [controller dismissViewControllerAnimated:true completion:nil];
    
}
- (IBAction)checkOut:(id)sender
{
    if ([PKPaymentAuthorizationViewController canMakePayments]){
        NSLog(@"恭喜您支付成功!");
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        
        PKPaymentSummaryItem *widgit1 = [PKPaymentSummaryItem summaryItemWithLabel:@"Samboo 1"
            amount:[NSDecimalNumber decimalNumberWithString:@"98.99"]];
        PKPaymentSummaryItem *widgit2 = [PKPaymentSummaryItem
            summaryItemWithLabel:@"Samboo 2"
            amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]];
        
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem
            summaryItemWithLabel:@"Samboo "
            amount:[NSDecimalNumber decimalNumberWithString:@"99.99"]];
        
        request.paymentSummaryItems = @[widgit1, widgit2, total];
        request.countryCode = @"US";
        request.currencyCode = @"USD";
        request.supportedNetworks = @[PKPaymentNetworkAmex,PKPaymentNetworkMasterCard,PKPaymentNetworkVisa];
        request.merchantIdentifier = @"merchant.com.demo.crittercismdemo";
        request.merchantCapabilities = PKMerchantCapabilityEMV;
        PKPaymentAuthorizationViewController *paymentpane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        paymentpane.delegate = self;
        [self presentViewController:paymentpane animated:TRUE
                           completion:nil];
    }else {
        NSLog(@"这台设备不能支付!");
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
