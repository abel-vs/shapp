import 'package:flutter/material.dart';

class SliverHeader extends StatelessWidget {
  final Widget widget;
  final double height;

  const SliverHeader({Key key, this.widget, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: widget,
      pinned: true,
      toolbarHeight: height,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }
}