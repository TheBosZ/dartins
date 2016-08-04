# Changelog

## 0.1.0

- BREAKING CHANGE: The AdMob Pro plugin forces a 2% donation, as a result, I'm deprecating the API. It's now called "AdMobPro". Please see the file for additional changes.
- NEW: Added support for my forked version of another AdMob plugin. See the Readme for details on the plugin.
- Includes more "Dart like" library. See src/admob.dart for details.

## 0.0.8+4
 
- Added "quote" field for Share dialog. Requires version 1.7.2 of the plugin.

## 0.0.8+3

- Added missing share options for Facebook iOS

## 0.0.8+2

- Facebook SDK on iOS returns a different structure than Android

## 0.0.8+1

- Added Facebook library that hides plugin API.
- Moved Amazon helper library to same file to make things simpler.

## 0.0.8

- Added support for the Facebook plugin

## 0.0.7

- Added support for the Statusbar plugin

## 0.0.6+1

- Return types for non-void methods. Unwraps all "booleanValue" results to straight booleans.

## 0.0.6

- Added event support for Amazon Ads

## 0.0.5

- Added missing Device properties

## 0.0.4

- Added partial support for Amazon Ads plugin (no support for events yet)

## 0.0.3

- Add support for the In-app Browser plugin

## 0.0.2

- Added support for Google Analytics and Splashscreen plugins.
- Updated documentation with more examples

## 0.0.1

- Initial version
- Support for AdMob, Device and Store
