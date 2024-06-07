import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/presentation/bloc/booking_active_bloc/booking_active_cubit.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';

import 'package:washing_track/presentation/resources/routes_manager.dart';

import '../../common_widgets/booking_active_items.dart';
import '../../resources/color_manager.dart';

class BookingActiveView extends StatelessWidget {
  const BookingActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: RefreshIndicator(
        onRefresh: (){
          return context.read<BookingActiveCubit>().getActiveRequests();
        },
        child: BlocConsumer<BookingActiveCubit, BookingActiveState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = context.read<BookingActiveCubit>();
            if (state is LoadingActiveRequests) {
              return const Center(
                child: Column(children: [
                  BuildBookingItemsLoading(),
                  BuildBookingItemsLoading(),
                  BuildBookingItemsLoading(),
                  BuildBookingItemsLoading(),
                  BuildBookingItemsLoading(),
                  BuildBookingItemsLoading()
                ],)
              );
            }
            if (cubit.pendingRequestsModel?.pendingRequests?.length == 0) {
              return Center(
                child: Text(AppStrings.noActiveRequests.tr()),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    BuildBookingItems(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.bookingDetailsRoute);
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
