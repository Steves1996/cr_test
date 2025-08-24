import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/profile/ui/profile_screen.dart';
import 'package:cr/src/features/profile/logic/cubit/profile_cubit.dart';
import 'package:cr/src/core/global_logic/cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ==== MOCKS ====
class MockProfileCubit extends Mock implements ProfileCubit {}

class MockLogoutCubit extends Mock implements LogoutCubit {}

class FakeProfileState extends Fake implements ProfileState {}

class FakeLogoutState extends Fake implements LogoutState {}

void main() {
  late MockProfileCubit mockProfileCubit;
  late MockLogoutCubit mockLogoutCubit;

  setUpAll(() {
    registerFallbackValue(FakeProfileState());
    registerFallbackValue(FakeLogoutState());
  });

  setUp(() {
    mockProfileCubit = MockProfileCubit();
    mockLogoutCubit = MockLogoutCubit();
  });

  final appRouter = AppRouter();

  Widget makeTestable(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
        BlocProvider<LogoutCubit>.value(value: mockLogoutCubit),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }

  testWidgets('affiche CircularProgressIndicator par defaut', (tester) async {
    await tester.runAsync(() async {
      // arrange
      when(() => mockProfileCubit.state).thenReturn(ProfileState.initial());
      whenListen(
        mockProfileCubit,
        Stream.fromIterable([ProfileState.initial()]),
        initialState: ProfileState.initial(),
      );

      when(() => mockLogoutCubit.state).thenReturn(LogoutState.initial());
      whenListen(mockLogoutCubit, const Stream<LogoutState>.empty());

      // act
      await tester.pumpWidget(makeTestable(const ProfileScreen()));
      await tester.pump();

      // assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  },);

  testWidgets('affiche infos utilisateur quand success', (tester) async {
    // arrange
    final user = LoginData(
      userId: 1,
      username: '',
      phoneNumber: '',
      phoneId: '',
      referalCode: '',
      firstName: '',
      lastName: '',
      gender: '',
      emailAddress: '',
      preferredLanguage: '',
      accountStatus: '',
      accountIsVerified: true,
      emailVerified: true,
      phoneVerified: true,
      kycLevelNumber: 2,
      kycLevelName: '',
      countryCode: '',
      countryNameEn: '',
      countryNameFr: '',
      shortCountryCode: '',
      countryId: 1,
      customerType: '',
      roles: [],
      permissions: [],
      wallets: [],
    );

    when(() => mockProfileCubit.state).thenReturn(ProfileState.success(response: user));
    whenListen(mockProfileCubit, Stream.value(ProfileState.success(response: user)));

    when(() => mockLogoutCubit.state).thenReturn( LogoutState.initial());
    whenListen(mockLogoutCubit, const Stream<LogoutState>.empty());

    // act
    await tester.pumpWidget(makeTestable(const ProfileScreen()));
    await tester.pumpAndSettle();

    // assert
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john@doe.com'), findsOneWidget);
    expect(find.textContaining('CryptoRates v1.0.0'), findsOneWidget);
  });

  testWidgets('affiche bouton Try Again si failure et logOut=true', (tester) async {
    // arrange
    when(() => mockProfileCubit.state).thenReturn( ProfileState.failure(error: 'erreur'));
    whenListen(mockProfileCubit, Stream.value( ProfileState.failure(error: 'erreur')));

    when(() => mockLogoutCubit.state).thenReturn( LogoutState.initial());
    whenListen(mockLogoutCubit, const Stream<LogoutState>.empty());

    // act
    await tester.pumpWidget(makeTestable(const ProfileScreen()));
    await tester.pumpAndSettle();

    // assert
    expect(find.textContaining('try_again', findRichText: true), findsWidgets); // dépend de I18n
  });
}
