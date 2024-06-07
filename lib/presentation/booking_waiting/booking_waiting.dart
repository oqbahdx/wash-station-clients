import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/presentation/bloc/booking_waiting_bloc/booking_waiting_cubit.dart';

import '../common_widgets/booking_active_items.dart';
import '../resources/Strings_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';


class BookingWaitingView extends StatelessWidget {
  const BookingWaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: RefreshIndicator(
        onRefresh: (){
          return context.read<BookingWaitingCubit>().getWaitingRequests();
        },
        child: BlocConsumer<BookingWaitingCubit, BookingWaitingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = context.read<BookingWaitingCubit>();
            if (state is LoadingBookingRequestsState) {
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
                child: Text(AppStrings.noPendingRequests.tr()),
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
