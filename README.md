---
languages:
- objc
page_type: sample
description: "This sample demonstrates how to use Azure AD B2C using a 3rd party library called AppAuth."
products:
- azure
- azure-active-directory
urlFragment: integrate-azure-ad-b2c-ios-objc
---

# Integrate Azure AD B2C into an Objective-C iOS application

This sample demonstrates how to use Azure AD B2C using a 3rd party library called AppAuth. It has only been tested for compatibility in basic scenarios with Azure AD B2C. Issues and feature requests related to AppAuth should be directed to the library's open-source project.

This sample is a quickstart to help you get started with Azure AD B2C on iOS using a 3rd party library called AppAuth. The sample is already configured to use a demo environment and can be run simply by downloading the code and building the app on your machine. Follow the instructions below if you would like to use your own Azure AD B2C configuration.

This sample was created by following the README instructions from the [iOS AppAuth project on GitHub](https://github.com/openid/AppAuth-iOS). For more details on how the sample and the library work, please reference the AppAuth README on GitHub.

## Steps to Run

To use Azure AD B2C, you'll first need to create an Azure AD B2C tenant, register your application, and create some sign in and sign up experiences.

* To create an Azure AD B2C tenant, checkout [these steps](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-get-started).

* To register your app, checkout [these steps](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-app-registration).  Make sure the "Native Client" switch is turned to "Yes".  You will need to supply a Redirect URL with a custom scheme in order for your iOS application to capture the callback.  To avoid a collision with another application, we recommend using a reverse DNS notation of your B2C tenant name followed by your application name as the custom scheme.  The example Redirect URI in this sample is: `com.onmicrosoft.fabrikamb2c.exampleapp://oauth/redirect` where fabrikamb2c should be replaced with your tenant name, and exampleapp should be replaced with the name of your application.

* Define your [custom sign in and sign up experience](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-reference-policies).  In Azure AD B2C, you define the experience your end users will encounter by creating policies.  For this sample, you'll want to create a single combined Sign In/Sign up policy.

* Clone the code: ```git clone https://github.com/Azure-Samples/active-directory-ios-native-appauth-b2c.git```

### Setting up the iOS App

1. In Finder, double click on active-directory-ios-native-appauth-b2c.xcworkspace.  This will open the project in XCode.

    **The app is already preconfigured to a demo Azure B2C tenant. At this point, you should be able to build and run the app. Follow the instructions below to configure the app with your own tenant information.**

2. Open `ViewController.m`, replace the following fields:

    * `kTenantName`: This is the name of your Azure AD B2C tenant
    * `kClientId`: This is your Application ID, which can be found in the Azure Portal (under Application settings).
    * `kRedirectUri`: This is your redirect URI, which can be found in the Azure Portal (under Application settings).
    * `kSignupOrSigninPolicy`: This is the name of your Sign Up or Sign In policy.
    * `kEditProfilePolicy`: This is the name of your Edit Profile policy.

3. Open Info.pList.  Expand 'URL types' -> 'Item 0' -> 'URL Schemes' -> 'Item 0'.  Update the scheme 'com.onmicrosoft.fabrikamb2c.exampleapp' to match the scheme of the kRedirectUri value updated in ViewController.m.

4. Go ahead and try the app.  You'll be able to see your custom experience, sign up for an account, and sign in to an existing account. Upon completing the login process, you should see the types of tokens acquired.


## Next Steps

Customize your user experience further by supporting more identity providers.  Checkout the docs belows to learn how to add additional providers:

[Microsoft](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-msa-app)

[Facebook](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-fb-app)

[Google](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-goog-app)

[Amazon](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-amzn-app)

[LinkedIn](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-li-app)


## Questions & Issues

Please file any questions or problems with the sample as a github issue.  You can also post on Stackoverflow with the tag `azure-ad-b2c`.

This sample was built and tested with the iOS 10.2 Simulator on XCode 8.2.1.  

## Acknowledgements

This sample was created using instructions from the [iOS AppAuth project on GitHub](https://github.com/openid/AppAuth-iOS).

## Contributing

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
