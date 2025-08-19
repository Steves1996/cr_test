import 'package:cr/src/core/theme/dimens.dart';
import 'package:cr/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.icons,
    required this.activePageIndex,
    this.onItemTap,
  });

  final ValueChanged<int>? onItemTap;
  final List<IconData> icons;
  final int activePageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: icons.mapIndexed((index, icon) {
            return _BottomNavBarItem(
              icon: icon,
              isActive: index == activePageIndex,
              onTap: () => onItemTap?.call(index),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bnbTheme = BottomNavigationBarTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? bnbTheme.selectedItemColor : context.colorScheme.surfaceContainer,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Dimens.fullRadius),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.bottomNavBarItemPadding),
            child: Icon(
              icon,
              size: Dimens.bottomNavBarIconSize,
              color: isActive ? bnbTheme.selectedIconTheme!.color : context.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}