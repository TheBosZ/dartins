@JS()
library splashscreen;

import 'package:js/js.dart';

@JS('navigator.splashscreen')
class Splashscreen {
	external static show();
	external static hide();
}
