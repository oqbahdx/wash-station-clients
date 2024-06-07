import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay/pay.dart';
import 'package:washing_track/presentation/payment_configuration.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

class GooglePayView extends StatefulWidget {
  const GooglePayView({super.key});

  @override
  State<GooglePayView> createState() => _GooglePayViewState();
}

class _GooglePayViewState extends State<GooglePayView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * .1),
        child: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(left:AppPadding.p12.w ,right:AppPadding.p12.w ,top:AppPadding.p12.h ),
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ColorManager.white),
                      foregroundColor:
                      MaterialStateProperty.all(ColorManager.primary)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.cancel)),
            ),
          ],
          iconTheme: IconThemeData(
            color: ColorManager.white
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GooglePayButton(
                paymentConfiguration:
                PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: const[
                  PaymentItem(
                    label: 'item 1',
                    amount: '12',
                    status: PaymentItemStatus.final_price,
                  ),
                  PaymentItem(
                    label: 'item 2',
                    amount: '10',
                    status: PaymentItemStatus.final_price,
                  ),
                  PaymentItem(
                    label: 'total',
                    amount: '22',
                    status: PaymentItemStatus.final_price,
                  )
                ],
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              // ApplePayButton(
              //   paymentConfiguration:
              //   PaymentConfiguration.fromJsonString(defaultApplePay),
              //   paymentItems: const[
              //     PaymentItem(
              //       label: 'item 1',
              //       amount: '12',
              //       status: PaymentItemStatus.final_price,
              //     ),
              //     PaymentItem(
              //       label: 'item 2',
              //       amount: '10',
              //       status: PaymentItemStatus.final_price,
              //     ),
              //     PaymentItem(
              //       label: 'total',
              //       amount: '22',
              //       status: PaymentItemStatus.final_price,
              //     )
              //   ],
              //   type: ApplePayButtonType.order,
              //   margin: const EdgeInsets.only(top: 15.0),
              //   onPaymentResult: onGooglePayResult,
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }
}
