class ApiEndpoints {
  /// This is network base url for the application
  static const String baseUrl = "https://experience-backend-l7ni.onrender.com";

  /// These are the api endpoints for the application
  static const String register = "$baseUrl/yatrivo/api/v1/auth/register";
  static const String login = "$baseUrl/yatrivo/api/v1/auth/login";
  static const String profile = "$baseUrl/yatrivo/api/v1/auth/users/";
  static const String logout = "$baseUrl/yatrivo/api/v1/auth/logout";
}
