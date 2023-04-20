import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

const items = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(PhosphorIcons.houseSimple),
    activeIcon: Icon(PhosphorIcons.houseSimpleBold),
  ),
  BottomNavigationBarItem(
    label: 'My Events',
    icon: Icon(PhosphorIcons.ticket),
    activeIcon: Icon(PhosphorIcons.ticketBold),
  ),
  BottomNavigationBarItem(
    label: 'Chat',
    icon: Icon(PhosphorIcons.chatTeardrop),
    activeIcon: Icon(PhosphorIcons.chatTeardropBold),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(PhosphorIcons.user),
    activeIcon: Icon(PhosphorIcons.userBold),
  ),
];

class AppBottomNavigationBar extends ViewModelWidget<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    return BottomNavigationBar(
      currentIndex: viewModel.currentIndex,
      onTap: viewModel.handleNavigation,
      items: items,
    );
  }
}
