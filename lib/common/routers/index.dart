library routers;

import 'package:flutter_template/pages/application/view.dart';
import 'package:flutter_template/pages/sign_in/index.dart';
import 'package:flutter_template/pages/sign_up/view.dart';

export 'names.dart';
export 'pages.dart';

var staticRoutes = {
  '/sign-in': (ctx) => SignInPage(),
  '/sign-up': (ctx) => SignUpPage(),
  '/app': (ctx) => const ApplicationPage()
};
