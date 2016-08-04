@JS()
library AdMobPro;

import 'package:js/js.dart';

@JS('AdMob')
class AdMobPro {
	external static getAdSettings([Function success, Function error]);

	external static setOptions(AdMobProOptions options, [Function success, Function error]);

	external static createBanner(BannerOptions options, [Function success = null, Function error = null]);

	external static removeBanner([Function success = null, Function error = null]);

	external static hideBanner([Function success = null, Function error = null]);

	external static showBanner(int position, [Function success = null, Function error = null]);

	external static showBannerAtXY(int x, int y, [Function success = null, Function error = null]);

	external static prepareInterstitial(InterstitialOptions options, [Function success = null, Function error = null]);

	external static showInterstitial([Function success = null, Function error = null]);

	external static isInterstitialReady([Function success = null, Function error = null]);

	external static prepareRewardVideoAd([Function success = null, Function error = null]);

	external static showRewardVideoAd([Function success = null, Function error = null]);

}


@JS()
@anonymous
class AdMobProOptions {
	external String get adSize;
	external set adSize(String v);

	external int get width;
	external set width(int v);

	external int get height;
	external set height(int v);

	external int get position;
	external set position(int v);

	external int get x;
	external set x(int v);

	external int get y;
	external set y(int v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get autoShow;
	external set autoShow(bool v);

	external factory AdMobProOptions({
		String adSize,
		int width,
		int height,
		int position,
		int x,
		int y,
		bool isTesting,
		bool autoShow
	});
}

@JS()
@anonymous
class InterstitialOptions {

	external String get adId;
	external set adId(String v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get autoShow;
	external set autoShow(bool v);

	external Function get success;
	external set success(Function v);

	external Function get error;
	external set error(Function v);

	external factory InterstitialOptions({
		String adId,
		bool autoShow: false,
		bool isTesting: false
	});

}

@JS()
@anonymous
class BannerOptions {

	external String get adId;
	external set adId(String v);

	external int get position;
	external set position(int v);

	external bool get autoShow;
	external set autoShow(bool v);

	external bool get isTesting;
	external set isTesting(bool v);

	external bool get overlap;
	external set overlap(bool v);

	external bool get offsetTopBar;
	external set offsetTopBar(bool v);

	external String get bgColor;
	external set bgColor(String v);

	external Function get success;
	external set success(Function v);

	external Function get error;
	external set error(Function v);

	external factory BannerOptions({
		String adId,
		int position,
		bool autoShow: true,
		bool isTesting: false,
		bool overlap: false,
		bool offsetTopBar: false,
		String bgColor: 'black'
	});

}

enum AdMobPosition {
	NO_CHANGE,
	TOP_LEFT,
	TOP_CENTER,
	TOP_RIGHT,
	LEFT,
	CENTER,
	RIGHT,
	BOTTOM_LEFT,
	BOTTOM_CENTER,
	BOTTOM_RIGHT,
	POS_XY
}
