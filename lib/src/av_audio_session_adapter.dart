@JS()
library AVAudioSessionAdapter;

import 'dart:async';
import 'package:js/js.dart';

@JS('gr.eworx.AVAudioSessionAdapter')
class AVAudioSessionAdapter {

	external void getCategory(Function success);

	external void getCategoryOptions(Function success);

	external void setCategory(String category, Function success,
		Function failure);

	external void setCategoryWithOptions(String category, int options,
		Function success, Function failure);

	external void registerRouteChangedCallback(Function success,
		Function failure);
}

@JS('gr.eworx.AVAudioSessionAdapter.Categories')
class AVAudioSessionCategories {
	external static String get AMBIENT;

	external static String get SOLO_AMBIENT;

	external static String get PLAYBACK;

	external static String get RECORD;

	external static String get PLAY_AND_RECORD;

	external static String get AUDIO_PROCESSING;

	external static String get MULTI_ROUTE;
}

@JS('gr.eworx.AVAudioSessionAdapter.CategoryOptions')
class AVAudioSessionCategoryOptions {
	external static int get MIX_WITH_OTHERS;

	external static int get DUCK_OTHERS;

	external static int get ALLOW_BLUETOOTH;

	external static int get DEFAULT_TO_SPEAKER;
}

@JS('gr.eworx.AVAudioSessionAdapter.RouteChangeReason')
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

class AVAudioSessionManager {
	static AVAudioSessionAdapter _avAudioSessionAdapter;

	static void _doInit() {
		if (_avAudioSessionAdapter == null) {
			_avAudioSessionAdapter = new AVAudioSessionAdapter();
		}
	}

	static Future getCategory() {
		_doInit();
		Completer c = new Completer();
		_avAudioSessionAdapter.getCategory(allowInterop((result) {
			c.complete(result);
		}));

		return c.future;
	}

	static Future getCategoryOptions() {
		_doInit();
		Completer c = new Completer();

		_avAudioSessionAdapter.getCategoryOptions(allowInterop((result) {
			c.complete(result);
		}));
		return c.future;
	}

	static Future setCategory(String category) {
		_doInit();
		Completer c = new Completer();

		_avAudioSessionAdapter.setCategory(category, allowInterop((result) {
			c.complete(result);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future setCategoryWithOptions(String category, int options) {
		_doInit();
		Completer c = new Completer();

		_avAudioSessionAdapter.setCategoryWithOptions(
			category, options, allowInterop((result) {
			c.complete(result);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}

	static Future registerRouteChangeCallback() {
		_doInit();
		Completer c = new Completer();

		_avAudioSessionAdapter.registerRouteChangedCallback(
			allowInterop((result) {
				c.complete(result);
			}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}
}
