class PenduConstants {
  static final baseUrl = "https://www.pendu.increments.info";

  static final loginUrl = "/api/v1/dropper/login";
  static final refreshTokenUrl = "/api/v1/dropper/refresh";
  static final dropperProfileUrl = "/api/v1/dropper/profile";
  static final dropperProfileLevelUrl = "/api/v1/dropper/profile?level";
  static final submitTaskUrl = "/api/v1/dropper/tasks/4/submit-offer";
  static final registerUrl = "/api/v1/dropper/register";
  static final logOutUrl = "/api/v1/dropper/logout";

  // static final verifyPhoneUrl = "/api/v1/auth/verify-phone";
  // static final sendMailUrl = "/api/v1/auth/password/email";
  // static final verifyMailOtpUrl = "/api/v1/auth/password/confirm";
  // static final changePasswordUrl = "/api/v1/auth/password/reset";
  static final allBlogPostUrl = "/api/v1/posts/";
  static final productCategoryUrl = "/api/v1/product-categories";
  static final vehicalDataUrl = "/api/v1/vehicles";
  static final couponDataUrl = "/api/v1/coupons";
  static final serviceCategoryUrl = "/api/v1/service-categories";

  static final contentType = 'Content-Type';
  static final contentTypeValue = 'application/json';
  static final acceptType = 'Accept';
  static final acceptTypeValue = 'application/json';
  static final accessToken = 'access_token';

  //sharedPrefs
  static final spDroper = 'current_user';
  static final spToken = 'user_token';
}
