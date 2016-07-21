@JS()
library AmazonMobileAds;

import 'package:js/js.dart';
import 'dart:async';

class AmazonAds {

	static const String DOCK_TOP = 'TOP';
	static const String DOCK_BOTTOM = 'BOTTOM';

	static const String ALIGN_LEFT = 'LEFT';
	static const String ALIGN_RIGHT = 'RIGHT';
	static const String ALIGN_CENTER = 'CENTER';

	static const String FIT_SCREEN_WIDTH = 'FIT_SCREEN_WIDTH';
	static const String FIT_AD_SIZE = 'FIT_AD_SIZE';

	static const String EVENT_AD_COLLAPSED = 'adCollapsed';
	static const String EVENT_AD_DISMISSED = 'adDismissed';
	static const String EVENT_AD_EXPANDED = 'adExpanded';
	static const String EVENT_AD_FAILED_TO_LOAD = 'adFailedToLoad';
	static const String EVENT_AD_LOADED = 'adLoaded';
	static const String EVENT_AD_RESIZED = 'adResized';

	static Future setApplicationKey(String key) {
		var completer = new Completer();
		AmazonMobileAds.setApplicationKey(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ApplicationKey(stringValue: key)]);
		return completer.future;
	}

	static Future registerApplication() {
		var completer = new Completer();
		AmazonMobileAds.registerApplication(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future enableLogging([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableLogging(allowInterop((var res) {
			completer.complete(res);
		}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future enableTesting([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableTesting(allowInterop((var res) {
			completer.complete(res);
		}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future enableGeoLocation([bool shouldEnable = true]) {
		var completer = new Completer();
		AmazonMobileAds.enableGeoLocation(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new ShouldEnable(booleanValue: shouldEnable)]);
		return completer.future;
	}

	static Future<Ad> createFloatingBannerAd(
		{String dock: AmazonAds.DOCK_BOTTOM, String horizontalAlign: AmazonAds.ALIGN_CENTER, String adFit: AmazonAds.FIT_SCREEN_WIDTH}) {
		var completer = new Completer();
		AmazonMobileAds.createFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [new Placement(
			dock: dock, adFit: adFit, horizontalAlign: horizontalAlign)
		]);
		return completer.future;
	}

	static Future<Ad> createInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.createInterstitialAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future<bool> loadAndShowFloatingBannerAd(Ad ad) {
		var completer = new Completer();
		AmazonMobileAds.loadAndShowFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res.booleanValue);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [ad]);
		return completer.future;
	}

	static Future<bool> loadInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.loadInterstitialAd(
			allowInterop((var res) {
				completer.complete(res.booleanValue);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future<bool> showInterstitialAd() {
		var completer = new Completer();
		AmazonMobileAds.showInterstitialAd(
			allowInterop((var res) {
				completer.complete(res.booleanValue);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future closeFloatingBannerAd(Ad ad) {
		var completer = new Completer();
		AmazonMobileAds.closeFloatingBannerAd(
			allowInterop((var res) {
				completer.complete(res);
			}),
			allowInterop((var res) {
				completer.completeError(res);
			}), [ad]);
		return completer.future;
	}

	static Future<bool> isInterstitialAdReady() {
		var completer = new Completer();
		AmazonMobileAds.isInterstitialAdReady(
			allowInterop((var ready) =>
				completer.complete(ready.booleanValue)),
			allowInterop((var res) {
				completer.completeError(res);
			}), []);
		return completer.future;
	}

	static Future<bool> areAdsEqual(Ad adOne, Ad adTwo) {
		var completer = new Completer();
		AmazonMobileAds.areAdsEqual(
			allowInterop((var isEqual) =>
				completer.complete(isEqual.booleanValue)),
			allowInterop((var res) {
				completer.completeError(res);
			}),
			[new AdPair(adOne: adOne, adTwo: adTwo)]);
		return completer.future;
	}

	static void addListener(String event, Function s) {
		AmazonMobileAds.addListener(event, allowInterop(s));
	}
}

@JS('window.AmazonMobileAds')
class AmazonMobileAds {

	static const String EVENT_AD_COLLAPSED = 'adCollapsed';
	static const String EVENT_AD_DISMISSED = 'adDismissed';
	static const String EVENT_AD_EXPANDED = 'adExpanded';
	static const String EVENT_AD_FAILED_TO_LOAD = 'adFailedToLoad';
	static const String EVENT_AD_LOADED = 'adLoaded';
	static const String EVENT_AD_RESIZED = 'adResized';

	external static void setApplicationKey(Function success, Function error, List<ApplicationKey> v);
	external static void registerApplication(Function success, Function error, List v);
	external static void enableLogging(Function success, Function error, List<ShouldEnable> v);
	external static void enableTesting(Function success, Function error, List<ShouldEnable> v);
	external static void enableGeoLocation(Function success, Function error, List<ShouldEnable> v);
	external static void createFloatingBannerAd(Function success, Function error, List<Placement> placement);
	external static void createInterstitialAd(Function success, Function error, List);
	external static void loadAndShowFloatingBannerAd(Function success, Function error, List<Ad> v);
	external static void loadInterstitialAd(Function success, Function error, List v);
	external static void showInterstitialAd(Function success, Function error, List v);
	external static void closeFloatingBannerAd(Function success, Function error, List<Ad> v);
	external static void isInterstitialAdReady(Function success, Function error, List v);
	external static void areAdsEqual(Function success, Function error, List<AdPair> v);

	external static void addListener(String event, Function handler);
}

@JS()
@anonymous
class Ad {
	external String get adType;
	external num get identifier;
}

@JS()
@anonymous
class Placement {
	external String get dock;
	external set dock(String v);

	external String get horizontalAlign;
	external set horizontalAlign(String v);

	external String get adFit;
	external set adFit(String v);

	external factory Placement({
		String dock,
		String horizontalAlign,
		String adFit
	});
}

@JS('window.AmazonMobileAds.AdFit')
class AdFit {
	static const String FIT_SCREEN_WIDTH = 'FIT_SCREEN_WIDTH';
	static const String FIT_AD_SIZE = 'FIT_AD_SIZE';
}

@JS('window.AmazonMobileAds.HorizontalAlign')
class HorizontalAlign {
	static const String LEFT = 'LEFT';
	static const String RIGHT = 'RIGHT';
	static const String CENTER = 'CENTER';
}

@JS('window.AmazonMobileAds.Dock')
class Dock {
	static const String TOP = 'TOP';
	static const String BOTTOM = 'BOTTOM';
}

@JS()
@anonymous
class ApplicationKey {
	external String get stringValue;

	external set stringValue(String v);

	external factory ApplicationKey({
		String stringValue
	});
}

@JS()
@anonymous
class ShouldEnable {
	external bool get booleanValue;
	external set booleanValue(bool v);

	external factory ShouldEnable({
		bool booleanValue
	});
}

@JS()
@anonymous
class LoadingStarted {
	external bool get booleanValue;
	external set booleanValue(bool v);

	external factory LoadingStarted({
		bool booleanValue
	});
}

@JS()
@anonymous
class AdShown {
	external bool get booleanValue;
	external set booleanValue(bool v);

	external factory AdShown({
		bool booleanValue
	});
}

@JS()
@anonymous
class IsReady {
	external bool get booleanValue;
	external set booleanValue(bool v);

	external factory IsReady({
		bool booleanValue
	});
}

@JS()
@anonymous
class IsEqual {
	external bool get booleanValue;
	external set booleanValue(bool v);

	external factory IsEqual({
		bool booleanValue
	});
}

@JS()
@anonymous
class AdPair {
	external Ad get adOne;
	external set adOne(Ad v);

	external Ad get adTwo;
	external set adTwo(Ad v);

	external factory AdPair({
		Ad adOne,
		Ad adTwo
	});
}
