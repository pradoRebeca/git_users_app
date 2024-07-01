import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_users_app/layers/domain/models/entities/screen_entity.dart';
import 'package:git_users_app/layers/presentation/views/screens/search_screen.dart';

class HomeController extends GetxController {
  final _selectedIndex = 0.obs;

  final List<ScreenEntity> _screens = [
    ScreenEntity(
        widget: const SearchScreen(), icon: Icons.search, title: 'Pesquisar'),
    ScreenEntity(
        widget: const SearchScreen(), icon: Icons.history, title: 'Histórico')
  ];

  List<ScreenEntity> get listScreens => _screens;

  ScreenEntity get currentScreenData => _screens[_selectedIndex.value];

  int get getSelectedIndex => _selectedIndex.value;

  void setSelectedIndex(index) {
    if (index >= 0 && index < _screens.length) {
      _selectedIndex.value = index;

      return;
    }

    _selectedIndex.value = 0;
  }
}
