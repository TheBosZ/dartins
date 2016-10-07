@JS()
library network_information;

import 'package:js/js.dart';

@JS('navigator.connection')
class Connection {
	external static String get type;

	static const String ONLINE = 'online';
	static const String OFFLINE = 'offline';
}

@JS('Connection')
class ConnectionType {
	external static String get CELL;
	external static String get CELL_2G;
	external static String get CELL_3G;
	external static String get CELL_4G;
	external static String get ETHERNET;
	external static String get NONE;
	external static String get UNKNOWN;
	external static String get WIFI;
}
