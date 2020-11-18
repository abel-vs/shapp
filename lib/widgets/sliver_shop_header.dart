import 'package:shapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class SliverShopHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final Shop shop;

  SliverShopHeader({
    @required this.expandedHeight,
    @required this.shop,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return Container(
      height: expandedHeight * 3 / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: buildAppBar(context, percent),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: buildInfoCard(percent, context),
          ),
        ],
      ),
    );
  }

  Opacity buildInfoCard(double percent, BuildContext context) {
    return Opacity(
      opacity: percent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30 * percent),
        child: Card(
          elevation: 20.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                shop.name.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
              ),
              buildInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Row buildInfo(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    AppLocalizations.of(context).translate(shop.type),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Icon(Icons.location_on, size: 18, color: Theme.of(context).primaryColor),
                Text(
                  shop.street + " " + shop.houseNumber.toString() + ", " + shop.city,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            );
  }

  AppBar buildAppBar(BuildContext context, double percent) {
    return AppBar(
      iconTheme: IconThemeData(color: percent == 0 ? Colors.black : Colors.white),
      actionsIconTheme: IconThemeData(color: percent == 0 ? Theme.of(context).primaryColor : Colors.white),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})],
      flexibleSpace: Opacity(
        opacity: hideTitleWhenExpanded ? percent : 0.0,
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(shop.image),
            fit: BoxFit.cover,
          ),
        )),
      ),
      title: Opacity(opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0, child: Text(shop.name)),
    );
  }

  @override
  double get maxExtent => expandedHeight * 3 / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
