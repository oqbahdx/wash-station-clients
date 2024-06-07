//
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:washing_track/data/network/dio_helper.dart';
// import 'package:washing_track/domain/login_model/login_model.dart';
// import 'package:washing_track/presentation/bloc/login_bloc/login_cubit.dart';
// import 'package:washing_track/presentation/bloc/login_bloc/login_states.dart';
//
//
// class MockDioHelper extends Mock implements DioHelper{}
//
// void main() {
//   group('LoginBloc', () {
//     late LoginCubit loginBloc;
//     late MockDioHelper mockDioHelper;
//     setUp(() {
//       mockDioHelper = MockDioHelper();
//       loginBloc = LoginCubit(mockDioHelper);
//     });
//
//     tearDown(() {
//       loginBloc.close();
//     });
//
//     test('initial state is LoginInitial', () {
//       expect(loginBloc.state, LoginInitState());
//     });
//
//     blocTest<LoginCubit, LoginStates>(
//       'emits [LoginLoading, LoginSuccess] when login succeeds',
//       build: () {
//         final loginModel = LoginModel(token: 'test_token');
//         when(mockDioHelper.postData(
//             endPoint: anyNamed('endPoint'), data: anyNamed('data')))
//             .thenAnswer((_) async => Response(data: loginModel.toJson(), requestOptions: ));
//         return loginBloc;
//       },
//       act: (bloc) => bloc.add(LoginRequested(phoneNumber: '1234567890', password: 'test_password')),
//       expect: () => [
//         LoginLoadingState(),
//         LoginSuccessState(),
//       ],
//     );
//
//     blocTest<LoginCubit, LoginStates>(
//       'emits [LoginLoading, LoginError] when login fails',
//       build: () {
//         when(mockDioHelper.postData(
//             endPoint: anyNamed('endPoint'), data: anyNamed('data')))
//             .thenThrow(Exception('test_error'));
//         return loginBloc;
//       },
//       act: (bloc) => bloc.add(LoginRequested(phoneNumber: '1234567890', password: 'test_password')),
//       expect: () => [
//         LoginLoadingState(),
//         LoginErrorState('test_error'),
//       ],
//     );
//   });
// }
