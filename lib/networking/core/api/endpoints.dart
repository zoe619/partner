class Endpoints {
  /// AUTH-USER
  static final String login = "restaurant_login";
  static final String register = "create_account";
  static final String getUser = "user";
  static final String changePassword = "change_password";

  /// RESTAURANTS
  static final String getDashboardDetails = "get_restaurant_mobile_dashboard";
  static final String getPaymentHistory = "get_restaurant_payment_history";

  static final String getCustomerList = "get_my_customers";
  static final String updateResData = "update_restaurant";
  static final String updateResImage = "upload_restaurant_image";
  static final String getResData = "get_my_restaurant";
  static final String getResOrders = "get_restaurant_orders";
  static final String getReservationsList = "get_restaurant_reservations";
  static final String getRestaurantOperatingStatus = "get_restaurant_operating_status";
  static final String setRestaurantOpeningHour = "create_operating_hour";
  static final String updateRestaurantOpeningHour = "update_operating_hour";
  static final String deleteRestaurantOpeningHour = "delete_operating_hour";
  static final String getRestaurantDetails = "get_my_restaurant";

  ///MENU
  static final String getCategoryId = "active_menu_categories";
  static final String getMenuList = "get_my_restaurant_menus";
  static final String deleteMenuItem = "remove_menu";
  static final String addUpdateMenuItem = "add_menu";
  static final String menuVisibility = "change_menu_visibility";

  /// MISC
  static final String getCountryList = "get_countries";
  static final String createPost = "add_new_post";
  static final String addNewPost = "add_new_post";
  static final String deletePost = "delete_post";

  /// DEVICE
  static final String addDeviceFCMToken = "add_device";
  static final String removeDeviceFCMToken = "remove_device";

  /// OFFLINE
  static final String createOfflineOrders = "offline_ordering";
  static final String payOfflineOrder = "pay_offline_order";

  /// ORDERS
  static final String acceptOrder = "accept_order";
  static final String rejectOrder = "reject_order";
}
