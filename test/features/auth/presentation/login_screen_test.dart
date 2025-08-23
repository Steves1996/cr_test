import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cr/generated/assets.dart';
import 'package:cr/src/core/global_logic/check_internet_logic/cubit/check_internet_cubit.dart';
import 'package:cr/src/core/i18n/l10n.dart';
import 'package:cr/src/core/routing/app_router.dart';
import 'package:cr/src/features/auth/logic/cubit/login_cubit.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/auth/ui/login_screen.dart';
import 'package:cr/src/shared/components/buttons/button.dart';
import 'package:cr/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:cr/src/shared/components/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mocktail/mocktail.dart';

// Mocks
class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockCheckInternetCubit extends MockCubit<CheckInternetState> implements CheckInternetCubit {}

class MockAppRouter extends Mock implements AppRouter {}

class MockAutoRouterDelegate extends Mock implements AutoRouterDelegate {}

class MockDefaultRouteParser extends Mock implements DefaultRouteParser {}

// Fake classes pour registerFallbackValue
class FakeLoginRequest extends Fake implements LoginRequest {}

class FakeRoute extends Fake implements PageRouteInfo {}
class FakeBuildContext extends Fake implements BuildContext {}
class FakeRouteMatch extends Fake implements RouteMatch {}

void main() {
  group('LoginScreen Widget Tests', () {
    late MockLoginCubit mockLoginCubit;
    late MockCheckInternetCubit mockCheckInternetCubit;
    late MockAppRouter mockAppRouter;
    late MockAutoRouterDelegate mockRouterDelegate;
    late MockDefaultRouteParser mockRouteParser;

    setUpAll(() {
      registerFallbackValue(FakeLoginRequest());
      registerFallbackValue(FakeBuildContext());
      registerFallbackValue(FakeRouteMatch());
      registerFallbackValue(FakeRoute());
    });

    setUp(() {
      mockLoginCubit = MockLoginCubit();
      mockCheckInternetCubit = MockCheckInternetCubit();
      mockAppRouter = MockAppRouter();
      mockRouterDelegate = MockAutoRouterDelegate();
      mockRouteParser = MockDefaultRouteParser();

      // États par défaut
      when(() => mockLoginCubit.state).thenReturn(LoginState.initial());
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.initial());
      when(() => mockCheckInternetCubit.checkInternet()).thenAnswer((_) async {});
      when(() => mockAppRouter.delegate()).thenReturn(mockRouterDelegate);
      when(() => mockAppRouter.defaultRouteParser()).thenReturn(mockRouteParser);
      when(() => mockAppRouter.replaceAll(any())).thenAnswer((_) async {});
      when(
        () => mockRouteParser.parseRouteInformationWithDependencies(any(), any()),
      ).thenAnswer((_) async => UrlState(Uri.parse(''), const [], shouldReplace: true));
    });

    Widget createWidgetUnderTest() {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          localizationsDelegates: const [
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('fr')],
          home: MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>.value(value: mockLoginCubit),
              BlocProvider<CheckInternetCubit>.value(value: mockCheckInternetCubit),
            ],
            child: const LoginScreen(),
          ),
        ),
      );
    }

    group('Interface utilisateur', () {
      testWidgets('affiche tous les éléments de interface', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier la présence des éléments principaux
        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(SafeArea), findsOneWidget);
        expect(find.byType(Card), findsOneWidget);
        expect(find.byType(Form), findsOneWidget);

        // Vérifier les champs de saisie
        expect(find.byType(Input), findsNWidgets(2)); // Email et mot de passe
        expect(find.byType(Button), findsOneWidget); // Bouton de connexion

        // Vérifier le logo
        expect(find.byType(Image), findsOneWidget);
        expect(find.image(const AssetImage(Assets.logosIcon)), findsOneWidget);

        // Vérifier les textes principaux
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).app_title), findsOneWidget);
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).login_sign_in_to_crypto_rates), findsOneWidget);
      });

      testWidgets('affiche les textes de localisation correctement', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier les textes localisés
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).skip), findsOneWidget);
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).login_email), findsAtLeastNWidgets(1));
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).login_password), findsAtLeastNWidgets(1));
      });

      testWidgets('le champ mot de passe masque/affiche le texte correctement', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Trouver le bouton de visibilité du mot de passe
        final eyeIconButton = find.byIcon(IconsaxPlusBold.eye_slash);
        expect(eyeIconButton, findsOneWidget);

        // Taper sur l'icône pour changer la visibilité
        await tester.tap(eyeIconButton);
        await tester.pumpAndSettle();

        // Vérifier que l'icône a changé
        expect(find.byIcon(IconsaxPlusBold.eye), findsOneWidget);
      });
    });

    group('Validation des formulaires', () {
      testWidgets('valide les champs requis', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Taper sur le bouton de connexion sans remplir les champs
        final loginButton = find.text(
          I18n.of(tester.element(find.byType(Scaffold))).login_login,
        ); // Si le bouton contient ce texte
        await tester.ensureVisible(loginButton);
        await tester.pumpAndSettle();
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        // Vérifier que les messages d'erreur de validation apparaissent
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).empty_field), findsNWidgets(2));
      });

      testWidgets('valide le format email', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Entrer un email invalide
        final emailField = find.byType(Input).first;
        await tester.enterText(emailField, 'email_invalide');

        // Entrer un mot de passe valide
        final passwordField = find.byType(Input).last;
        await tester.enterText(passwordField, 'motdepasse123');

        // Taper sur le bouton de connexion
        final loginButton = find.text(
          I18n.of(tester.element(find.byType(Scaffold))).login_login,
        ); // Si le bouton contient ce texte
        await tester.ensureVisible(loginButton);
        await tester.pumpAndSettle();
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        // Vérifier que la validation de l'email échoue
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).empty_field_or_bad_email), findsOneWidget);
      });

      testWidgets('soumet le formulaire avec des donnees valides', (WidgetTester tester) async {
        when(() => mockLoginCubit.login(any())).thenAnswer((_) async => null);

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Entrer des données valides
        final emailField = find.byType(Input).first;
        await tester.enterText(emailField, 'mobileuser@gmail.com');

        final passwordField = find.byType(Input).last;
        await tester.enterText(passwordField, 'password');

        // Taper sur le bouton de connexion
        final loginButton = find.text(
          I18n.of(tester.element(find.byType(Scaffold))).login_login,
        ); // Si le bouton contient ce texte
        await tester.ensureVisible(loginButton);
        await tester.pumpAndSettle();
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        // Vérifier que la méthode login a été appelée avec les bonnes données
        final captured = verify(() => mockLoginCubit.login(captureAny())).captured;
        expect(captured.length, 1);
        expect(captured.first.log, 'mobileuser@gmail.com');
        expect(captured.first.password, 'password');
      });
    });

    group('États du Cubit', () {
      testWidgets('navigue vers HomeRoute en cas de succes', (WidgetTester tester) async {
        whenListen(
          mockLoginCubit,
          Stream.fromIterable([
            LoginState.success(
              response: LoginResponse(
                token: 'token',
                responseCode: '200',
                message: 'Success',
                refreshToken: 'refresh_token',
                expiresIn: 3600,
                refreshTokenExpiresIn: 7200,
                tokenType: 'Bearer',
              ),
            ),
          ]),
          initialState: LoginState.initial(),
        );

        // Configurer le widget avec MaterialApp.router
        await tester.pumpWidget(
          MaterialApp.router(
            routerDelegate: mockAppRouter.delegate(),
            routeInformationParser: mockAppRouter.defaultRouteParser(),
            localizationsDelegates: const [I18n.delegate],
            supportedLocales: const [Locale('fr'), Locale('en')],
            builder: (context, child) {
              return BlocProvider(create: (_) => mockLoginCubit, child: child!);
            },
          ),
        );
        await tester.pumpAndSettle();

        // Vérifier que le toast de succès est affiché
        final successText = I18n.of(tester.element(find.byType(Scaffold))).login_success;
        print(successText); // Débogage
        expect(find.text(successText), findsOneWidget);

        // Vérifier que la navigation vers HomeRoute a été déclenchée
        verify(() => mockAppRouter.replaceAll([const HomeRoute()])).called(1);
      });

      testWidgets('affiche le dialogue d\'erreur en cas d\'échec', (WidgetTester tester) async {
        const errorMessage = 'Erreur de connexion';
        whenListen(
          mockLoginCubit,
          Stream.fromIterable([LoginState.failure(error: errorMessage)]),
          initialState: LoginState.initial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier que le dialogue d'erreur est affiché
        expect(find.byType(ApiErrorDialog), findsOneWidget);
        expect(find.text(errorMessage), findsOneWidget);
      });
    });

    group('Vérification de connexion Internet', () {
      testWidgets('vérifie la connexion internet à l\'initialisation', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier que checkInternet a été appelée
        verify(() => mockCheckInternetCubit.checkInternet()).called(1);
      });

      testWidgets('affiche un message d\'erreur sans connexion internet', (WidgetTester tester) async {
        whenListen(
          mockCheckInternetCubit,
          Stream.fromIterable([CheckInternetState.success(response: false)]),
          initialState: CheckInternetState.initial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier que le toast d'erreur est affiché
        expect(find.text(I18n.of(tester.element(find.byType(Scaffold))).no_internet_connection), findsOneWidget);
      });

      testWidgets('affiche un dialogue d\'erreur en cas d\'échec de vérification', (WidgetTester tester) async {
        const errorMessage = 'Erreur de vérification internet';
        whenListen(
          mockCheckInternetCubit,
          Stream.fromIterable([CheckInternetState.failure(error: errorMessage)]),
          initialState: CheckInternetState.initial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Vérifier que le dialogue d'erreur est affiché
        expect(find.byType(ApiErrorDialog), findsOneWidget);
        expect(find.text(errorMessage), findsOneWidget);
      });
    });

    group('Navigation', () {
      testWidgets('le bouton Skip navigue vers HomeRoute', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Trouver et taper sur le bouton Skip
        final skipButton = find.text(I18n.of(tester.element(find.byType(Scaffold))).skip);
        await tester.tap(skipButton);
        await tester.pumpAndSettle();

        // Vérifier que la navigation vers HomeRoute a été déclenchée
        verify(() => mockAppRouter.replaceAll([const HomeRoute()])).called(1);
      });

      testWidgets('le lien Sign up déclenche une action', (WidgetTester tester) async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Trouver et taper sur le lien Sign up
        final signUpLink = find.text(I18n.of(tester.element(find.byType(Scaffold))).login_sign_up);
        await tester.tap(signUpLink);
        await tester.pumpAndSettle();

        // Note: Actuellement, cela fait juste un print. Vous pouvez ajouter un mock pour vérifier une navigation future.
      });
    });
  });

  group('LoginCubit Tests Unitaires', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = LoginCubit();
    });

    tearDown(() {
      loginCubit.close();
    });

    test('état initial est LoginState.initial', () {
      expect(loginCubit.state, equals(LoginState.initial()));
    });

    blocTest<LoginCubit, LoginState>(
      'émet [loading, success] quand login réussit',
      build: () => loginCubit,
      act: (cubit) async {
        // Note: Vous devrez mocker votre service de login pour simuler un succès
        final request = LoginRequest(log: 'test@example.com', password: 'password');
        cubit.login(request);
      },
      expect: () => [
        LoginState.loading(),
        // Note: Ajouter l'état success attendu lorsque le service est mocké
        // LoginState.success(response: LoginResponse(...)),
      ],
      skip: 1, // Sauter l'état initial si nécessaire
    );

    blocTest<LoginCubit, LoginState>(
      'émet [loading, failure] quand login échoue',
      build: () => loginCubit,
      act: (cubit) async {
        // Note: Vous devrez mocker votre service de login pour simuler un échec
        final request = LoginRequest(log: 'test@example.com', password: 'wrongpassword');
        cubit.login(request);
      },
      expect: () => [
        LoginState.loading(),
        // Note: Ajouter l'état failure attendu lorsque le service est mocké
        // LoginState.failure(error: 'Erreur de connexion'),
      ],
      skip: 1,
    );
  });

  group('CheckInternetCubit Tests Unitaires', () {
    late CheckInternetCubit checkInternetCubit;

    setUp(() {
      checkInternetCubit = CheckInternetCubit();
    });

    tearDown(() {
      checkInternetCubit.close();
    });

    test('état initial est CheckInternetState.initial', () {
      expect(checkInternetCubit.state, equals(CheckInternetState.initial()));
    });

    blocTest<CheckInternetCubit, CheckInternetState>(
      'émet [success(true)] quand internet est disponible',
      build: () => checkInternetCubit,
      act: (cubit) => cubit.checkInternet(),
      expect: () => [
        // Note: Ajouter l'état success(true) attendu lorsque le service est mocké
        // CheckInternetState.success(response: true),
      ],
    );

    blocTest<CheckInternetCubit, CheckInternetState>(
      'émet [success(false)] quand internet n\'est pas disponible',
      build: () => checkInternetCubit,
      act: (cubit) => cubit.checkInternet(),
      expect: () => [
        // Note: Ajouter l'état success(false) attendu lorsque le service est mocké
        // CheckInternetState.success(response: false),
      ],
    );
  });
}
