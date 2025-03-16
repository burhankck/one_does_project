import 'package:flutter/material.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.visualDensity,
    this.contentPadding,
    this.minLeadingWidthZero,
    this.dense,
    this.isThreeLine,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final bool? minLeadingWidthZero;
  final bool? isThreeLine;
  final bool? dense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minLeadingWidth:
            minLeadingWidthZero != null && minLeadingWidthZero! ? 0 : 40,
        minVerticalPadding: 4,
        dense: dense,
        visualDensity: visualDensity,
        onTap: onTap,
        isThreeLine: isThreeLine ?? false,
        trailing: trailing,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p8),
        leading: leading,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
          ],
        ),
        subtitle: subtitle);
  }
}
