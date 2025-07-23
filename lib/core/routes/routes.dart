abstract class Routes {
  Routes._();

  static const SPLASH = Paths.SPLASH;

  static const ONBOARDING = "onboarding";
  static const LOGIN = "login";
  static const SIGNUP = "signup";

  static const HOME = "home";
  static const PRODUCTS = "products";
  static const WALLET = "wallet";
  static const PROFILE = "profile";

  static const HISTORY = "history";
}

abstract class Paths {
  Paths._();
  // main Routes
  static const SPLASH = '/';

  static const ONBOARDING = '/${Routes.ONBOARDING}';
  static const LOGIN = '/${Routes.LOGIN}';
  static const SIGNUP = '/${Routes.SIGNUP}';

  static const HOME = "/${Routes.HOME}";
  static const PRODUCTS = "/${Routes.PRODUCTS}";
  static const WALLET = "/${Routes.WALLET}";
  static const PROFILE = "/${Routes.PROFILE}";

  static const HISTORY = "/${Routes.HISTORY}";
}
