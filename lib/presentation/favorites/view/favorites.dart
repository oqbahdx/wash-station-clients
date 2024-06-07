import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';

import '../../common_widgets/list_tile.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: h * .2,
              floating: false,
              pinned: true,
              foregroundColor: ColorManager.white,
              backgroundColor: ColorManager.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  AppStrings.favorites.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s30),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BuildListTile(
                    h: h * .1,
                    w: w * .2,
                    h1: h * .1,
                  );
                },
                childCount: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
