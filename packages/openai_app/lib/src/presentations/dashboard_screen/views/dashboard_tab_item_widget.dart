import 'package:flutter/material.dart';

// import '../../../core/design_system/resources/icon_constants.dart';
import '../../../domain/entities/dashboard/dashboard_bottom_navigation_bar_item.dart';
import '../../chat/views/chat_screen.dart';
import '../../image_generate/views/image_generate_screen.dart';
import '../../manage_key/index.dart';
import '../../text_generate/views/text_generate_screen.dart';

class DashboardTabItemWidget {
  final DashboardBottomNavigationBarItem item;
  final IconData icon;
  final String text;

  const DashboardTabItemWidget({
    required this.item,
    required this.icon,
    required this.text,
  });
}

extension DashboardBottomNavigationBarKeyBuilderExt
    on DashboardBottomNavigationBarItem {
  Widget build(BuildContext _) {
    switch (this) {
      case DashboardBottomNavigationBarItem.conversations:
        return const ChatScreen();
      case DashboardBottomNavigationBarItem.imageGenerate:
        return const ImageGenerateScreen();
      case DashboardBottomNavigationBarItem.textGenerate:
        return const TextGenerateScreen();
      case DashboardBottomNavigationBarItem.manageKey:
        return const ManageScreen();
    }
  }
}

extension DashboardBottomNavigationBarKeyRouteExt
    on DashboardBottomNavigationBarItem {
  String get routeName {
    switch (this) {
      case DashboardBottomNavigationBarItem.conversations:
        return ChatScreen.routeName;
      case DashboardBottomNavigationBarItem.imageGenerate:
        return ImageGenerateScreen.routeName;
      case DashboardBottomNavigationBarItem.textGenerate:
        return TextGenerateScreen.routeName;
      case DashboardBottomNavigationBarItem.manageKey:
        return ManageScreen.routeName;
    }
  }
}

extension DashboardBottomNavigationBarKeyExt
    on DashboardBottomNavigationBarItem {
  String text(BuildContext _) {
    switch (this) {
      case DashboardBottomNavigationBarItem.imageGenerate:
        return 'Image Generate';
      case DashboardBottomNavigationBarItem.textGenerate:
        return 'Text Generate';
      case DashboardBottomNavigationBarItem.conversations:
        return 'Conversations';
      case DashboardBottomNavigationBarItem.manageKey:
        return 'Manage Key';
    }
  }

  IconData get icon {
    switch (this) {
      case DashboardBottomNavigationBarItem.imageGenerate:
        return Icons.image;
      case DashboardBottomNavigationBarItem.textGenerate:
        return Icons.text_snippet_outlined;
      case DashboardBottomNavigationBarItem.conversations:
        return Icons.chat_bubble_outline;
      case DashboardBottomNavigationBarItem.manageKey:
        return Icons.vpn_key;
    }
  }
}
