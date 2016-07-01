@JS()
library device;

import 'package:js/js.dart';

@JS('device')
class Device {
	external static String get platform;

	external static String get uuid;

	external static String get cordova;

	external static String get model;

	external static String get version;

	external static String get manufacturer;

	external static bool get isVirtual;

	external static String get serial;
}
