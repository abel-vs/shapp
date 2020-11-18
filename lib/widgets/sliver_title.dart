import 'package:flutter/material.dart';

class SliverTitle extends StatelessWidget {
  final String title;

  const SliverTitle({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}