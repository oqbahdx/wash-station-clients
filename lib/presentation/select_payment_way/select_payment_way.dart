import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:washing_track/presentation/google_pay/view/google_pay.dart';

import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import '../common_widgets/select_payment_way_items.dart';
import '../master_card/view/master_card.dart';

class SelectPaymentWay extends StatelessWidget {
  const SelectPaymentWay({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorManager.white
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: h * .02,
              ),
              SelectPaymentCard(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const MasterCardView();
                      });
                },
                text: AppStrings.masterCard.tr(),
              ),
              SizedBox(
                height: h * .1,
              ),
              SelectPaymentCard(
                text: AppStrings.mada.tr(),
              ),
              SizedBox(
                height: h * .1,
              ),
              Platform.isAndroid
                  ? SelectPaymentCard(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return GooglePayView();
                            });
                      },
                      text: AppStrings.googlePay.tr(),
                    )
                  : SelectPaymentCard(
                      text: AppStrings.applePay.tr(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
