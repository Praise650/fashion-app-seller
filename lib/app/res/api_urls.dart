class ApiUrls {
  static const String baseUrl = 'https://quickconnectng.com/api/app';
  static const String stagingBaseUrl = 'https://testing.quickconnectng.com/api/app';
  static const String developmentBaseUrl = 'http://192.168.53.237:8000/api/vendor';

  static const String login = '/login';
  static const String register = '/register';
  static const String resendOtp = '/resend-otp';
  static const String verifyOtp = '/verify-otp';
  static const String updatePassword = '/user/update-password';

  static const String forgetPassword = '/request-reset-password';
  static const String resetPassword = '/reset-password';

  static const String verifyBVN = '/user/verify-bvn';
}