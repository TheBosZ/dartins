# Dartins

Cordova pugin definitions for use in Dart projects.

Generally speaking, any interactions with plugins should happen **after** the "deviceReady" event has fired. See example for a simple implementation.

## Supported plugins
* [Device](https://github.com/apache/cordova-plugin-device)
 * Platform (property)
 * UUID (property)
* [AdMob (Pro Version)](https://github.com/floatinghotpot/cordova-admob-pro)
 * createBanner(BannerOptions options);
 * hideBanner();
 * showBanner(int position);
 * showBannerAtXY(int x, int y);
 * removeBanner();
 * prepareInterstitial(InterstitialOptions options);
 * showInterstitial(); 
* [In-app Purchase](https://github.com/j3k0/cordova-plugin-purchase)
 * In progress. Can create products and refresh the store but nothing works with "when()"

## Usage

A simple usage example:
```dart
import 'dart:html';
import 'package:dartins/dartins.dart';

main() {
	document.on['deviceready'].listen((_){
	    var currentPlatform = Device.platform;
	    print('Currently using a ${currentPlatform} device');
	    AdMob.createBanner(new BannerOptions(
			adId: 'cx-xxx',
			position: AdMobPosition.BOTTOM_CENTER.index,
			isTesting: Device.UUID == '123123',
			overlap: true
		));
	});
}
```


