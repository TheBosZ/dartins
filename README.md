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
* [AdMob (Pro Version)](https://github.com/floatinghotpot/cordova-admob-pro)
    * createBanner(BannerOptions options);
    * hideBanner();
    * showBanner(int position);
    * showBannerAtXY(int x, int y);
    * removeBanner();
    * prepareInterstitial(InterstitialOptions options);
    * showInterstitial();
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

## Amazon Ads Specific Notes

Amazon doesn't make it easy to integrate Cordova with their ad platform but here's some notes.

With this package, there is a "AmazonAds" class that has a developer-friendly interface to the plugin. You should see if that meets your needs before going directly to the methods in "amazon_mobile_ads.dart".

To install the plugin, you'll have to download it from Amazon and install it manually. It's not in npm (so you can't do ```cordova plugin add <>```)

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


