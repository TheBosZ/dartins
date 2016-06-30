@JS()
library AmazonMobileAds;

import 'package:js/js.dart';

@JS('window.AmazonMobileAds')
class AmazonMobileAds {

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
