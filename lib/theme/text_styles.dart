import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Returns the style for a page title based on the [deviceScreenType] passed in.
TextStyle titleTextStyle({
  @required DeviceScreenType deviceScreenType,
  double height,
}) {
  double titleSize = deviceScreenType == DeviceScreenType.mobile ? 32 : 54;
  return TextStyle(
    fontSize: titleSize,
    fontWeight: FontWeight.w600,
    fontFamily: 'PalanquinDark',
    height: height != null ? height : 1.2,
  );
}

/// Return the style for description text on a page based on the [deviceScreenType] passed in.
TextStyle descriptionTextStyle({
  @required DeviceScreenType deviceScreenType,
  double height,
}) {
  double descriptionSize =
      deviceScreenType == DeviceScreenType.mobile ? 16 : 18;

  return TextStyle(
    fontSize: descriptionSize,
    fontFamily: 'Overpass',
    height: height != null ? height : 1.0,
  );
}

/// Return the style for small description text on a page based on the [deviceScreenType] passed in.
TextStyle smallDescriptionTextStyle({
  @required DeviceScreenType deviceScreenType,
  double height,
}) {
  double descriptionSize =
      deviceScreenType == DeviceScreenType.mobile ? 14 : 16;

  return TextStyle(
    fontSize: descriptionSize,
    fontFamily: 'Overpass',
    height: height != null ? height : 1.0,
  );
}
