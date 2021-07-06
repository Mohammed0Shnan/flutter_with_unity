import 'package:flutter/material.dart';

class AppNameAppBar {
  static final TextEditingController _searchController =
      TextEditingController();

  static AppBar getAppNameAppBar(
      GlobalKey<ScaffoldState> drawerKey, Function() onSearchRequested) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
        ),
        onPressed: () {
          drawerKey.currentState.openDrawer();
        },
      ),
      title: Text(
        'app name',
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            onSearchRequested();
          },
        )
      ],
    );
  }

  static AppBar getBackEnabledAppBar({Function() onReport, bool reported}) {
    return AppBar(
      title: Text(
        'app name',
      ),
      centerTitle: true,
      actions: [
        onReport != null
            ? IconButton(
                onPressed: () {
                  onReport();
                },
                icon: Icon(
                  reported == true ? Icons.flag : Icons.flag_outlined,
                ),
              )
            : Container()
      ],
    );
  }

  static AppBar getSearchAppBar({
    BuildContext context,
    String activeQuery,
    Function(String) onSearchRequested,
    bool watcherEnabled,
  }) {
    return AppBar(
      leading: IconButton(
        color: Theme.of(context).brightness != Brightness.light
            ? Colors.black
            : Colors.white,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          onSearchRequested(null);
        },
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black87
          : Colors.white,
      title: TextFormField(
        controller: _searchController,
        onSaved: (searchQuery) {
          if (watcherEnabled) {
            onSearchRequested(searchQuery);
          }
        },
        onChanged: (searchQuery) {
          if (watcherEnabled) {
            onSearchRequested(searchQuery);
          }
        },
        style: TextStyle(
            color: Theme.of(context).brightness != Brightness.light
                ? Colors.black
                : Colors.white),
        decoration: InputDecoration(
          hintText: 'Search', // S.of(context).search,
          labelText: 'Search', // S.of(context).search,
          hintStyle: TextStyle(
            color: Theme.of(context).brightness != Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).brightness != Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          fillColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
          ),
          onPressed: () {
            onSearchRequested(_searchController.text.trim());
          },
        )
      ],
    );
  }
}
