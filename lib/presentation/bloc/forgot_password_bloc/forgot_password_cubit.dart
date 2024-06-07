import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:washing_track/app/constants.dart';
import '../../../data/network/dio_helper.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  launchURL() async {
    const url = 'password/forget';
    if (await canLaunchUrl(Uri.parse("${Constants.baseUrl}$url"))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  forgotPassword() async {
    DioHelper.getData(
            endPoint: "${Constants.forgotPasswordEndPoint}/${Constants.token}")
        .then((value) {})
        .catchError((error) {});
  }
}
