import 'package:botbridge_green/View/ExistedPatientView.dart';
import 'package:botbridge_green/View/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'View/SearchReferralView.dart';
import 'ViewModel/AppointmentListVM.dart';
import 'ViewModel/BookedServiceVM.dart';
import 'ViewModel/CollectedSamplesVM.dart';
import 'ViewModel/ExistPatientVM.dart';
import 'ViewModel/HistoryVM.dart';
import 'ViewModel/NewRequestVM.dart';
import 'ViewModel/PatientDetailsVM.dart';
import 'ViewModel/ReferalDataVM.dart';
import 'ViewModel/SampleWiseServiceVM.dart';
import 'ViewModel/ServiceDetailsVM.dart';
import 'ViewModel/SignInVM.dart';



Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  print(FlutterError.onError);
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<SignInVM>(create: (_) => SignInVM()),
            ChangeNotifierProvider<AppointmentListVM>(create: (_) => AppointmentListVM()),
            ChangeNotifierProvider<NewRequestVM>(create: (_) => NewRequestVM()),
            ChangeNotifierProvider<CollectedSampleVM>(create: (_) => CollectedSampleVM()),
            ChangeNotifierProvider<HistoryVM>(create: (_) => HistoryVM()),
            ChangeNotifierProvider<PatientDetailsVM>(create: (_) => PatientDetailsVM()),
            ChangeNotifierProvider<ReferalDataVM>(create: (_) => ReferalDataVM()),
            ChangeNotifierProvider<ServiceDetailsVM>(create: (_) => ServiceDetailsVM()),
            ChangeNotifierProvider<BookedServiceVM>(create: (_) => BookedServiceVM()),
            ChangeNotifierProvider<SampleWiseServiceDataVM>(create: (_) => SampleWiseServiceDataVM()),
            ChangeNotifierProvider<ExistingPatientVM>(create: (_) => ExistingPatientVM()),
      //       ChangeNotifierProvider(
      // create: (context) => TestNamesProvider(),)
          ],
          child:  MyApp()
      ));
}




class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bot Bridge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSans',
      
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [routeObserver],
      routes: {
        // When navigating to the "homeScreen" route, build the HomeScreen widget.
        'ExistedPatient': (context) => const ExistedPatientView(),
        'SearchClientReferral': (context) =>  const SearchReferralView(type: '', searchType: 'physician',),
        'SearchDoctorReferral': (context) =>  const SearchReferralView(type: 'DOCTOR', searchType: 'physician',),

        // When navigating to the "secondScreen" route, build the SecondScreen widget.
      },
      home: const SplashView(),
    );
  }
}

