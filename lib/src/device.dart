@JS()
library device;

import 'package:js/js.dart';

@JS('device')
class Device {
	external static String get platform;

	external static String get uuid;
}
