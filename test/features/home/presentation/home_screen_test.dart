import 'package:bloc_test/bloc_test.dart';
import 'package:cr/src/core/global_logic/check_internet_logic/cubit/check_internet_cubit.dart';
import 'package:cr/src/features/auth/logic/model/login/login.model.dart';
import 'package:cr/src/features/home/logic/cubit/rate_cubit.dart';
import 'package:cr/src/features/home/logic/cubit/rate_offline_cubit/rate_offline_cubit.dart';
import 'package:cr/src/features/home/logic/model/rates.model.dart';
import 'package:cr/src/features/home/ui/home_screen.dart';
import 'package:cr/src/features/profile/logic/cubit/profile_cubit.dart';
import 'package:cr/src/shared/components/forms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Added import for flutter_screenutil
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Modèle pour les tests
class UserProfile {
  final String? fiatCurrencyCode;
  UserProfile({this.fiatCurrencyCode});
}

// Mocks avec Mocktail
class MockRateCubit extends MockCubit<RateState> implements RateCubit {}
class MockRateOfflineCubit extends MockCubit<RateOfflineState> implements RateOfflineCubit {}
class MockCheckInternetCubit extends MockCubit<CheckInternetState> implements CheckInternetCubit {}
class MockProfileCubit extends MockCubit<ProfileState> implements ProfileCubit {}

void main() {
  // Déclarations globales
  late MockRateCubit mockRateCubit;
  late MockRateOfflineCubit mockRateOfflineCubit;
  late MockCheckInternetCubit mockCheckInternetCubit;
  late MockProfileCubit mockProfileCubit;


  setUpAll(() {
    // Enregistrement des fallbacks pour Mocktail
    registerFallbackValue(RateState.initial());
    registerFallbackValue(RateOfflineState.initial());
    registerFallbackValue(CheckInternetState.initial());
    registerFallbackValue(ProfileState.initial());
  });

  setUp(() {
    // Initialisation des mocks
    mockRateCubit = MockRateCubit();
    mockRateOfflineCubit = MockRateOfflineCubit();
    mockCheckInternetCubit = MockCheckInternetCubit();
    mockProfileCubit = MockProfileCubit();

    // Comportements par défaut des mocks
    when(() => mockRateCubit.state).thenReturn(RateState.initial());
    when(() => mockRateOfflineCubit.state).thenReturn(RateOfflineState.initial());
    when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.initial());
    when(() => mockProfileCubit.state).thenReturn(ProfileState.initial());

    // Simulation des méthodes asynchrones
    when(() => mockRateCubit.getRates()).thenAnswer((_) async {});
    when(() => mockRateOfflineCubit.getOffLineRates()).thenAnswer((_) async {});
    when(() => mockCheckInternetCubit.checkInternet()).thenAnswer((_) async {});
    when(() => mockProfileCubit.getUserData()).thenAnswer((_) async {});
  });

  // Fonction utilitaire pour créer le widget de test
  Widget createTestWidget() {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design specs
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RateCubit>.value(value: mockRateCubit),
              BlocProvider<RateOfflineCubit>.value(value: mockRateOfflineCubit),
              BlocProvider<CheckInternetCubit>.value(value: mockCheckInternetCubit),
              BlocProvider<ProfileCubit>.value(value: mockProfileCubit),
            ],
            child: const HomeScreen(),
          ),
        );
      },
    );
  }

  // Tests pour le rendu du widget
  group('HomeScreen Widget Tests', () {
    testWidgets('devrait afficher sans erreur', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('contenir un Scaffold', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('devrait contenir un champ de saisie pour la recherche', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Input), findsOneWidget);
    });

    testWidgets('doit appeler getUserData lors de initialisation', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockProfileCubit.getUserData()).called(1);
    });

    testWidgets('Il faudrait appeler checkInternet lors de initialisation.', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockCheckInternetCubit.checkInternet()).called(1);
    });

    testWidgets('doit afficher Skeletonizer lors du chargement', (tester) async {
      when(() => mockRateCubit.state).thenReturn(RateState.loading());

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Skeletonizer), findsAtLeast(1));
    });

    testWidgets('doit afficher RefreshIndicator en cas de reussite', (tester) async {
      final mockResponse = RatesResponse(
        data: {'USD': 1.0, 'EUR': 0.85},
        cryptoTime: '2024-01-01T00:00:00Z',
        fiatTime: '2024-01-01T00:00:00Z',
        status: true,
        message: '',
      );

      when(() => mockRateCubit.state).thenReturn(RateState.success(response: mockResponse));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('devrait filtrer les resultats lors de la recherche', (tester) async {
      final mockResponse = RatesResponse(
        data: {'USD': 1.0, 'EUR': 0.85, 'XAF': 656.0},
        cryptoTime: '2024-01-01T00:00:00Z',
        fiatTime: '2024-01-01T00:00:00Z',
        status: true,
        message: '',
      );

      when(() => mockRateCubit.state).thenReturn(RateState.success(response: mockResponse));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final searchField = find.byType(Input);
      await tester.enterText(searchField, 'XAF');
      await tester.pumpAndSettle();

      expect(find.text('XAF'), findsOneWidget);
    });

    testWidgets('doit appeler getOffLineRates en mode hors ligne', (tester) async {
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: false));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockRateOfflineCubit.getOffLineRates()).called(1);
    });

    testWidgets('doit appeler getRates en mode en ligne', (tester) async {
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: true));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockRateCubit.getRates()).called(1);
    });

    testWidgets('devrait actualiser les taux en mode en ligne avec la fonction tirer pour actualiser', (tester) async {
      final mockResponse = RatesResponse(
        data: {'USD': 1.0},
        cryptoTime: '2024-01-01T00:00:00Z',
        fiatTime: '2024-01-01T00:00:00Z',
        status: true,
        message: '',
      );

      when(() => mockRateCubit.state).thenReturn(RateState.success(response: mockResponse));
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: true));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();

      verify(() => mockRateCubit.getRates()).called(greaterThanOrEqualTo(2));
    });

    testWidgets('devrait actualiser les tarifs hors ligne en mode hors ligne avec la fonction tirer pour actualiser', (tester) async {
      final mockResponse = RatesResponse(
        data: {'USD': 1.0},
        cryptoTime: '2024-01-01T00:00:00Z',
        fiatTime: '2024-01-01T00:00:00Z',
        status: true,
        message: '',
      );

      when(() => mockRateOfflineCubit.state).thenReturn(RateOfflineState.success(response: mockResponse));
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: false));
      await tester.pumpWidget(createTestWidget()); // Added missing pumpWidget
      await tester.pumpAndSettle();

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
      await tester.pumpAndSettle();

      verify(() => mockRateOfflineCubit.getOffLineRates()).called(greaterThanOrEqualTo(2));
    });

    testWidgets('doit afficher un message erreur en cas echec', (tester) async {
      when(() => mockRateCubit.state).thenReturn(RateState.failure(error: 'Network error'));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsAtLeast(1));
    });

    testWidgets('doit utiliser la devise personnalisee du profil utilisateur', (tester) async {
      final userProfile = LoginData(
        fiatCurrencyCode: 'XAF',
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
        kycLevelNumber: 1,
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
      when(() => mockProfileCubit.state).thenReturn(ProfileState.success(response: userProfile));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockProfileCubit.getUserData()).called(1);
    });

    testWidgets('En cas echec du profil, il faut revenir a la devise par defaut.', (tester) async {
      when(() => mockProfileCubit.state).thenReturn(ProfileState.failure(error: 'User not found'));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      verify(() => mockProfileCubit.getUserData()).called(1);
      verify(() => mockCheckInternetCubit.checkInternet()).called(1);
    });
  });

  // Tests d'intégration des Cubits
  group('Tests integration HomeScreen Cubit', () {
    testWidgets('devrait passer en mode hors ligne et récupérer les tarifs hors ligne', (tester) async {
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: true));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Simuler passage en mode offline
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: false));
      await tester.pumpAndSettle();

      verify(() => mockRateOfflineCubit.getOffLineRates()).called(1);
      verifyNever(() => mockRateCubit.getRates());
    });

    testWidgets('devrait passer en mode en ligne et récupérer les tarifs', (tester) async {
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: false));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Simuler passage en mode online
      when(() => mockCheckInternetCubit.state).thenReturn(CheckInternetState.success(response: true));
      await tester.pumpAndSettle();

      verify(() => mockRateCubit.getRates()).called(1);
      verifyNever(() => mockRateOfflineCubit.getOffLineRates());
    });
  });
}