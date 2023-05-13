class AppConstants {
  static const String APP_NAME = 'Mishwar';
  static const int APP_VERSION = 1;

  static const String BASE_URL = 'http://165.227.116.15/mishwar';

  ///static const String BASE_URL = 'http://mishwar.thiqatech.com';

  static const String CATEGORY_URI = '/api/v1/restaurants/get-categories';
  static const String StoreCATEGORY_URI =
      '/api/v1/restaurants/get-store-categories?zone_id=2';
  static const String Resturnat_CATEGORY_URI =
      '/api/v1/restaurants/get-restaurant-categories?zone_id=2';
  static const String allstores =
      '/api/v1/restaurants/type?typeid=0&offset=1&limit=10';

  static const String BANNER_URI = '/api/v1/banners';
  static const String RESTAURANT_PRODUCT_URI =
      '/api/v1/products/latest?restaurant_id='; //!/
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String SEARCH_PRODUCT_URI = '/api/v1/products/details/';
  static const String SUB_CATEGORY_URI = '/api/v1/categories/childes/';
  static const String CATEGORY_PRODUCT_URI = '/api/v1/restaurants/categories';
  static const String CONFIG_URI = '/api/v1/config';
  static const String TRACK_URI = '/api/v1/customer/order/track?order_id=';
  static const String MESSAGE_URI = '/api/v1/customer/message/get';
  static const String SEND_MESSAGE_URI = '/api/v1/customer/message/send';
  static const String FORGET_PASSWORD_URI = '/api/v1/auth/forgot-password';
  static const String VERIFY_TOKEN_URI = '/api/v1/auth/verify-token';
  static const String RESET_PASSWORD_URI = '/api/v1/auth/reset-password';
  static const String VERIFY_PHONE_URI = '/api/v1/auth/verify-phone';
  static const String CHECK_EMAIL_URI = '/api/v1/auth/check-email';
  static const String VERIFY_EMAIL_URI = '/api/v1/auth/verify-email';
  static const String REGISTER_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';
  static const String ADDRESS_LIST_URI = '/api/v1/customer/address/list';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';
  static const String REMOVE_ADDRESS_URI =
      '/api/v1/customer/address/delete?address_id=';
  static const String ADD_ADDRESS_URI = '/api/v1/customer/address/add';
  static const String UPDATE_ADDRESS_URI = '/api/v1/customer/address/update/';
  static const String SET_MENU_URI = '/api/v1/products/set-menu';
  static const String CUSTOMER_INFO_URI = '/api/v1/customer/info';
  static const String COUPON_URI = '/api/v1/coupon/list';
  static const String COUPON_APPLY_URI = '/api/v1/coupon/apply?code=';
  static const String ORDER_LIST_URI = '/api/v1/customer/order/list';
  static const String RecentORDER_LIST_URI =
      '/api/v1/customer/order/recent_list';

  ///order recent list////
  static const String ORDER_CANCEL_URI = '/api/v1/customer/order/cancel';
  static const String COD_SWITCH_URL = '/api/v1/customer/order/payment-method';
  static const String ORDER_DETAILS_URI =
      '/api/v1/customer/order/details?order_id=';
  static const String WISH_LIST_GET_URI = '/api/v1/customer/wish-list';
  static const String ADD_WISH_LIST_URI = '/api/v1/customer/wish-list/add?';
  static const String REMOVE_WISH_LIST_URI =
      '/api/v1/customer/wish-list/remove?';
  static const String NOTIFICATION_URI = '/api/v1/customer/notifications';
  //static const String UPDATE_PROFILE_URI = '/api/v1/test-update-profile';

  static const String UPDATE_PROFILE_URI = '/api/v1/customer/update-profile';
  static const String SEARCH_URI = '/api/v1/';
  static const String REVIEW_URI = '/api/v1/products/reviews/submit';
  static const String PRODUCT_DETAILS_URI = '/api/v1/products/details/';
  static const String LAST_LOCATION_URI =
      '/api/v1/delivery-man/last-location?order_id=';
  static const String DELIVER_MAN_REVIEW_URI =
      '/api/v1/delivery-man/reviews/submit';

  static const String RESTAURANT_URI = '/api/v1/restaurants/get-restaurants';

  static const String POPULAR_RESTAURANT_URI = '/api/v1/restaurants/popular';
  static const String LATEST_RESTAURANT_URI = '/api/v1/restaurants/latest';

  static const String RESTAURANT_DETAILS_URI =
      '/api/v1/restaurants/details/'; //!/  resturant  detail  api/

  static const String BASIC_CAMPAIGN_URI = '/api/v1/campaigns/basic';
  static const String ITEM_CAMPAIGN_URI = '/api/v1/campaigns/item';
  static const String BASIC_CAMPAIGN_DETAILS_URI =
      '/api/v1/campaigns/basic-campaign-details?basic_campaign_id=';
  static const String INTEREST_URI = '/api/v1/customer/update-interest';
  static const String SUGGESTED_FOOD_URI = '/api/v1/customer/suggested-foods';
  static const String RESTAURANT_REVIEW_URI = '/api/v1/restaurants/reviews';
  static const String DISTANCE_MATRIX_URI = '/api/v1/config/distance-api';
  static const String SEARCH_LOCATION_URI =
      '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETAILS_URI = '/api/v1/config/place-api-details';
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String paymentsucess =
      'http://165.227.116.15/mishwar/api/v1/payment/verify_payment';
  static const String resturantimage =
      'http://165.227.116.15/mishwar/storage/app/public/restaurant/';
  static const String typeresturant =
      'http://165.227.116.15/mishwar/api/v1/restaurants/type';
//static const String typeresturant='http://mishwar.thiqatech.com/api/v1/restaurants/type';

  static const String basecampaignurl =
      'http://165.227.116.15/mishwar/storage/app/public/campaign/';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'multivendor_token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_ADDRESS = 'user_address';
  static const String USER_NUMBER = 'user_number';
  static const String USER_COUNTRY_CODE = 'user_country_code';
  static const String NOTIFICATION = 'notification';
  static const String SEARCH_HISTORY = 'search_history';
  static const String INTRO = 'intro';
  static const String NOTIFICATION_COUNT = 'notification_count';
  static const String TOPIC = 'all_zone_customer';
  static const String ZONE_ID = 'zoneId';

  // image folder or image type :
  static const String CATEGORY_IMG = 'category';
  static const String PRODUCT_IMG = 'product';
  static const String BANNER_IMG = 'banner';
}
