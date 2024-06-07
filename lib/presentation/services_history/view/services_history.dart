import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/services_history/services_history_cubit.dart';
import '../../common_widgets/servies_history_items.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';

class ServicesHistoryView extends StatefulWidget {
  const ServicesHistoryView({super.key});

  @override
  State<ServicesHistoryView> createState() => _ServicesHistoryViewState();
}

class _ServicesHistoryViewState extends State<ServicesHistoryView> {
  @override
  void initState() {
    super.initState();
     context.read<ServicesHistoryCubit>().fToast.init(context);
  }
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.primary,
                    statusBarIconBrightness: Brightness.light),
                expandedHeight: h * .2,
                floating: false,
                pinned: true,
                elevation: 0,
                foregroundColor: ColorManager.white,
                backgroundColor: ColorManager.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    AppStrings.servicesHistory.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s20.sp),
                  ),
                ),
              ),
              BlocConsumer<ServicesHistoryCubit, ServicesHistoryState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var service =
                      context.read<ServicesHistoryCubit>().servicesHistoryModel;
                  if (state is LoadingServicesHistoryState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: BuildServicesHistoryItemLoading());
                        },
                        childCount: 5,
                      ),
                    );
                  }
                  if (service?.serviceHistories?.length == 0) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h * .25,
                                    ),
                                    Text(
                                      AppStrings.noServicesHistory.tr(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black,
                                          fontSize: FontSize.s25.sp),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        childCount: 1,
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: ColorManager.error,
                            child: Icon(
                              Icons.delete,
                              size: AppSize.s50.sp,
                              color: ColorManager.white,
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BuildServicesHistoryItem(
                                serviceName:
                                    "${service?.serviceHistories![index].serviceName}",
                                price:
                                    "${service?.serviceHistories![index].paymentAmount}",
                                status:
                                    "${service?.serviceHistories![index].status}",
                              )),
                        );
                      },
                      childCount: service?.serviceHistories?.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
