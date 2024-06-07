import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import '../../common_widgets/chat_items.dart';
import '../../common_widgets/notification_items.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              leading: Container(),
              actions: [],
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primary,
                  statusBarIconBrightness: Brightness.light),
              expandedHeight: h * .2,
              floating: false,
              pinned: true,
              elevation: 0,
              foregroundColor: ColorManager.primary,
              backgroundColor: ColorManager.primary,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  AppStrings.chats.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s20.sp),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BuildChatList( onTap: (){
                    Navigator.pushNamed(context, Routes.chatRoute);
                  },);
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
