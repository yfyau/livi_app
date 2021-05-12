import 'package:livi_app/pages/PhoneRecordListPage.dart';
import 'package:livi_app/pages/PhoneValidationPage.dart';
import 'package:livi_app/pages/SplashPage.dart';

const PATH_SPLASH = '/splash';
const PATH_PHONE_VALIDATION = '/phoneValidation';
const PATH_PHONE_RECORD_LIST = '/phoneRecordList';


final appRoutes = {
  '/': (context) => SplashPage(),
  PATH_SPLASH: (context) => SplashPage(),
  PATH_PHONE_VALIDATION: (context) => PhoneValidationPage(),
  PATH_PHONE_RECORD_LIST: (context) => PhoneRecordListPage(),
};
