# Dartins

[Cordova](https://cordova.apache.org/)/[PhoneGap](http://phonegap.com/) plugin definitions for use in Dart projects.

Generally speaking, any interactions with plugins should happen **after** the "deviceReady" event has fired. See [example](#usage) for a simple implementation.

## Supported plugins
* [Device](https://github.com/apache/cordova-plugin-device) (these are all properties)
    * cordova
    * model
    * platform
    * uuid
    * version
    * manufacturer
    * isVirtual
    * serial
* [Splashscreen](https://github.com/apache/cordova-plugin-splashscreen)
    * show();
    * hide();
* AdMob Pro - **Note!** This plugin takes 2% of your revenue if you don't buy a license. For this reason, I'm deprecating support for it
    * Please see the next section on a replacement
* [AdMob - forked from AppFeel](https://github.com/TheBosZ/admob-google-cordova)
    * Forked to remove 2% revenue stealing
    * Will be kept up to date as necessary
    * To install, simply run: `cordova plugin add https://github.com/TheBosZ/admob-google-cordova.git --save`
* [In-app Purchase](https://github.com/j3k0/cordova-plugin-purchase)
    * ProductEvent when(String v);
    * refresh();
    * order(String v);
    * ready(Function v);
    * register(StoreProduct product);
* [Google Analytics](https://github.com/danwilson/google-analytics-plugin)
    * startTrackerWithId(String v);
    * trackView(String v);
    * trackEvent(String category, String action, [String label, num v]);
    * trackException(String description, bool fatal);
    * trackTiming(String category, num intervalInMilliseconds, String v, String label);
    * addTransaction(String id, String affiliation, num revenue, num tax, num shipping, String currencyCode);
    * addTransactionItem(String id, String name, String sku, String category, num price, num quantity, String currencyCode);
    * addCustomDimension(String key, String value, [Function success, Function error]);
    * setUserId(String id);
    * debugMode();
    * enableUncaughtExceptionReporting(bool enable,  [Function success, Function error]);
* [In-app Browser](https://github.com/apache/cordova-plugin-inappbrowser)
    * InappBrowser open(String url, String target, [String options]);
    * addEventListener(String eventname, Function cb);
    * removeEventListener(String eventname, Function cb);
    * close();
    * show();
    * executeScript(InjectDetails details, Function cb);
    * insertCSS(InjectDetails details, Function cb);
* [Amazon Mobile Ads](https://developer.amazon.com/public/apis/earn/mobile-ads/cordova/implementing-mobile-ads-with-the-mobile-ads-plugin-for-cordova)
    * See additional [notes below](#amazon-ads-specific-notes)
    * All ad methods are supported.
    * Events are supported
* [Statusbar](https://github.com/apache/cordova-plugin-statusbar)
    * All methods and properties supported
* [Facebook](https://github.com/jeduan/cordova-plugin-facebook4)
    * All methods supported
    * [Facebook's official plugin](https://github.com/Wizcorp/phonegap-facebook-plugin) has been abandoned, this plugin is an active, up-to-date fork.
    * To support every option, please use at least version 1.7.2
* [App Settings](https://github.com/mkliu/cordova-plugin-appsettings)
    * Fully supported
    * AppSettingsHelper class to provide ease-of-use
* [Network Information](https://github.com/apache/cordova-plugin-network-information)
	* Fully supported
	* Connection types are available on ConnectionTypes
	* Event names are constants in the connection class
* [Microsoft CodePush](https://github.com/Microsoft/cordova-plugin-code-push)
	* Basic functionality supported
* [iOS AVAudioSession](https://github.com/TheBosZ/cordova-plugin-avaudiosession)
	* Fully supported

## Amazon Ads Specific Notes

Amazon doesn't make it easy to integrate Cordova with their ad platform but here's some notes.

With this package, there is a "AmazonAds" class that has a developer-friendly interface to the plugin. You should see if that meets your needs before going directly to the methods in "amazon_mobile_ads.dart".

To install the plugin, you'll have to download it from Amazon and install it manually. It's not in npm (so you can't do ```cordova plugin add <>```)

## Installation

Edit your `pubspec.yaml` file:

```yaml
dependencies:
  dartins: ^0.1.1
```

Then run `pub get`

## Dependencies

The only dependencies outside of Dart are the plugins themselves. You only need to install the plugins you wish to use.

For example, if you want to use the Admob and Device plugins, but no others, simply run:

```bash
cordova plugin add https://github.com/TheBosZ/admob-google-cordova.git --save
cordova plugin add cordova-plugin-device --save
```

## Compilation

To build for Cordova/PhoneGap, the steps are as follows:

1. Run `pub build`
2. Copy the contents of the `build` folder into the `www` folder in your Cordova project
3. Run `cordova run android` (substitute the Cordova command for what your desired setup).

If you're using PhoneGap Build, you don't need any extra setup to be able to use this package. Just do steps 1 and 2 and then submit your build (make sure you set up the plugins correctly!).

## Usage

A simple usage example:
```dart
import 'dart:html';
import 'package:dartins/dartins.dart';

main() {
    document.on['deviceready'].listen((_){

        //Device Example
        var currentPlatform = Device.platform;
        print('Currently using a ${currentPlatform} device');

        //Splashscreen Example
        Splashscreen.hide();

        //AdMob example
        AdMob.createBanner(new BannerOptions(
            adId: 'cx-xxx',
            position: AdMobPosition.BOTTOM_CENTER.index,
            isTesting: Device.UUID == '123123',
            overlap: true
        ));

        //Store example
        Store.register(new StoreProduct(id: 'product1', type: StoreProduct.NON_CONSUMABLE));
        Store.when('product1').approved(allowInterop((var product){
            print('Successfully bought product1');
            product.finish();
        }));
        Store.when('product1').owned(allowInterop((var product){
            print('Owns product1');
        }));

        //Analytics example
        GoogleAnalytics.startTrackerWithId('xxx-xxx');
        GoogleAnalytics.trackView('mainMenu');
        GoogleAnalytics.trackEvent('AppState', 'started');

        //In-app browser example
        InappBrowser iab = InappBrowser.open('http://google.com', InappBrowser.TARGET_BLANK);
        iab.show();
        iab.close();
    });
}
```


