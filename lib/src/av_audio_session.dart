@JS()
library AVAudioSessionAdapter;

import 'dart:async';
import 'package:js/js.dart';

@JS('AVAudioSession')
class AVAudioSessionApi {

	external static void getCategory(Function success);

	external static void getCategoryOptions(Function success);

	external static void setCategory(String category, Function success,
		Function failure);

	external static void setCategoryWithOptions(String category, int options,
		Function success, Function failure);

	external static void registerRouteChangedCallback(Function success,
		Function failure);
}

@JS('AVAudioSession.Categories')
class AVAudioSessionCategories {
	external static String get AMBIENT;

	external static String get SOLO_AMBIENT;

	external static String get PLAYBACK;

	external static String get RECORD;

	external static String get PLAY_AND_RECORD;

	external static String get AUDIO_PROCESSING;

	external static String get MULTI_ROUTE;
}

@JS('AVAudioSession.CategoryOptions')
class AVAudioSessionCategoryOptions {
	external static int get MIX_WITH_OTHERS;

	external static int get DUCK_OTHERS;

	external static int get ALLOW_BLUETOOTH;

	external static int get DEFAULT_TO_SPEAKER;
}

@JS('AVAudioSession.RouteChangeReason')
class AVAudioSessionRouteChangeReason {
	external static int get Unknown;

	external static int get NewDeviceAvailable;

	external static int get OldDeviceUnavailable;

	external static int get CategoryChange;

	external static int get Override;

	external static int get WakeFromSleep;

	external static int get NoSuitableRouteForCategory;

	external static int get RouteConfigurationChange;
}

class AVAudioSession {

	static Future getCategory() {

		Completer c = new Completer();
		AVAudioSessionApi.getCategory(allowInterop((result) {
			c.complete(result);
		}));

		return c.future;
	}

	static Future getCategoryOptions() {

		Completer c = new Completer();

		AVAudioSessionApi.getCategoryOptions(allowInterop((result) {
			c.complete(result);
		}));
		return c.future;
	}

	static Future setCategory(String category) {

		Completer c = new Completer();

		AVAudioSessionApi.setCategory(category, allowInterop((result) {
			c.complete(result);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future setCategoryWithOptions(String category, int options) {

		Completer c = new Completer();

		AVAudioSessionApi.setCategoryWithOptions(
			category, options, allowInterop((result) {
			c.complete(result);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future registerRouteChangeCallback() {
		Completer c = new Completer();

		AVAudioSessionApi.registerRouteChangedCallback(
			allowInterop((result) {
				c.complete(result);
			}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}
}
