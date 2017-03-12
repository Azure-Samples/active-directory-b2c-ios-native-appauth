//
//  ViewController.m
//  active-directory-ios-native-appauth
//
//  Created by Saeed Akhter and Gerardo Saca on 3/1/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "ViewController.h"
#import "AppAuth.h"
#import "AppDelegate.h"

// Update the following for your AAD B2C tenant
static NSString *const kTenantName = @"fabrikamb2c.onmicrosoft.com";
static NSString *const kSignupOrSigninPolicy = @"b2c_1_susi";
static NSString *const kEditProfilePolicy = @"b2c_1_edit";
static NSString *const kClientId = @"90c0fe63-bcf2-44d5-8fb7-b8bbc0b29dc6";
static NSString *const kRedirectUri = @"com.onmicrosoft.fabrikamb2c.exampleapp://oauth/redirect";

// DO NOT CHANGE - This is the format of OIDC Token and Authorization enpoints for AAD B2C
static NSString *const kEndpoint = @"https://login.microsoftonline.com/te/%1$@/%2$@/oauth2/v2.0/%3$@";

@interface ViewController ()
@property (nonatomic, strong, nullable) OIDAuthState *authState;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *editProfileButton;

@end

@implementation ViewController
- (IBAction)didSignIn:(id)sender {
    
    NSLog(@"Signing in");
    
    NSURL *authorizationEndpoint = [NSURL URLWithString:[NSString stringWithFormat:kEndpoint, kTenantName, kSignupOrSigninPolicy, @"authorize"]];
    NSURL *tokenEndpoint = [NSURL URLWithString:[NSString stringWithFormat:kEndpoint, kTenantName, kSignupOrSigninPolicy, @"token"]];
    
    NSLog(@"Authorize endpoint: %@", authorizationEndpoint);
    NSLog(@"Token endpoint: %@", tokenEndpoint);
    
    OIDServiceConfiguration *configuration = [[OIDServiceConfiguration alloc] initWithAuthorizationEndpoint:authorizationEndpoint tokenEndpoint:tokenEndpoint];
    
    OIDAuthorizationRequest *request = [[OIDAuthorizationRequest alloc] initWithConfiguration:configuration clientId:kClientId scopes:@[OIDScopeOpenID, OIDScopeProfile] redirectURL:[NSURL URLWithString:kRedirectUri] responseType:OIDResponseTypeCode additionalParameters:nil];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.currentAuthorizationFlow = [OIDAuthState authStateByPresentingAuthorizationRequest:request presentingViewController:self callback:^(OIDAuthState *_Nullable authState, NSError *_Nullable error) {
        
        if (authState) {
            NSLog(@"Got authorization tokens. Access token: %@", authState.lastTokenResponse.accessToken);
            _signInButton.enabled = NO;
            _editProfileButton.enabled = YES;
            [self setAuthState:authState];
        } else {
            NSLog(@"Authorization error: %@", [error localizedDescription]);
            [self setAuthState:nil];
        }
    }];
}

- (IBAction)didEditProfile:(id)sender {
    
    NSLog(@"Editing Profile");
    
    NSURL *authorizationEndpoint = [NSURL URLWithString:[NSString stringWithFormat:kEndpoint, kTenantName, kEditProfilePolicy, @"authorize"]];
    NSURL *tokenEndpoint = [NSURL URLWithString:[NSString stringWithFormat:kEndpoint, kTenantName, kEditProfilePolicy, @"token"]];
    
    NSLog(@"Authorize endpoint: %@", authorizationEndpoint);
    NSLog(@"Token endpoint: %@", tokenEndpoint);
    
    OIDServiceConfiguration *configuration = [[OIDServiceConfiguration alloc] initWithAuthorizationEndpoint:authorizationEndpoint tokenEndpoint:tokenEndpoint];
    
    OIDAuthorizationRequest *request = [[OIDAuthorizationRequest alloc] initWithConfiguration:configuration clientId:kClientId scopes:@[OIDScopeOpenID, OIDScopeProfile] redirectURL:[NSURL URLWithString:kRedirectUri] responseType:OIDResponseTypeCode additionalParameters:nil];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.currentAuthorizationFlow = [OIDAuthState authStateByPresentingAuthorizationRequest:request presentingViewController:self callback:^(OIDAuthState *_Nullable authState, NSError *_Nullable error) {
        
        if (authState) {
            NSLog(@"Got authorization tokens. Access token: %@", authState.lastTokenResponse.accessToken);
            [self setAuthState:authState];
        } else {
            NSLog(@"Authorization error: %@", [error localizedDescription]);
            [self setAuthState:nil];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _editProfileButton.enabled = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
