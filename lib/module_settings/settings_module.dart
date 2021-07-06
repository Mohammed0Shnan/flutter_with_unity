
import 'package:flutter/cupertino.dart';
import 'package:tut/abstracts/module/my_module.dart';
import 'package:tut/module_settings/setting_routes.dart';
import 'package:tut/module_settings/ui/settings_page/settings_page.dart';

class SettingsModule extends MyModule {
  final SettingsScreen _settingsScreen;

  SettingsModule(this._settingsScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SettingRoutes.ROUTE_SETTINGS: (context) => _settingsScreen,
    };
  }
}
