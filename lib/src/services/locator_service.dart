import 'package:eternary/src/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

void locatorNavigateTo(String navigationRoute) {
  locator<NavigationService>().navigateTo(navigationRoute);
}

void locatorGoBack() {
  locator<NavigationService>().goBack();
}

GlobalKey<NavigatorState> locatorGetNavigatorKey() {
  return locator<NavigationService>().getNavigatorKey();
}
