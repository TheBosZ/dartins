@JS()
library code_push;

import 'package:js/js.dart';
import 'dart:async';

@JS('CodePush')
class CodePushApi {
	external static void notifyApplicationReady(Function success, Function error);
	external static void restartApplication();
	external static void reportStatus(); //This is undocumented so I'm not sure if we need it
	external static void getCurrentPackage(Function success, Function error);
	external static void getPendingPackage(Function success, Function error);
	external static void checkForUpdate(Function success, Function error, [String deploymentKey = null]);
	external static void sync([Function callback, options, Function progress]);
	external static void syncInternal([Function callback, options, Function progress]);
	external static dynamic getDefaultSyncOptions();
	external static dynamic getDefaultUpdateDialogOptions();
}

class CodePush {
	static Future getCurrentPackage() {
		Completer c = new Completer();
		CodePushApi.getCurrentPackage(allowInterop((result) {
			c.complete(result);
		}), allowInterop((error) {
			c.completeError(error);
		}));

		return c.future;
	}
}
