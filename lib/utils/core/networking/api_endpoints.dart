/// this class is used for api endpoints for api calls
class ApiEndpoints {
  static const baseUrl = "http://13.200.156.40/api/v1";
  static const googleMapsApiKey = "AIzaSyATPaB756WeXWwJVUUHy_lJ-bO2bV1CJUY";
  static const googleMapsApi = "https://www.google.com/maps/search/?api=1&query=";

  ///log_in
  static const login = "$baseUrl/User/Login";
  static const updateUserProfile = "$baseUrl/User/UpdateUserProfile";
  static const refreshToken = "$baseUrl/User/RefreshToken";
  static const logOut = "$baseUrl/User/Logout";
  static const deleteAccount = "$baseUrl/User/DeleteAccount";

  ///file_Upload
  static const fileUpload = "$baseUrl/FileUpload";

  ///user_address
  static const userAddress = "$baseUrl/UserAddress";
  static const getUserAddress = "$baseUrl/UserAddress";
  ///put address also same

  ///user_document
  static const userDocument = "$baseUrl/UserDocument";
  static const getUserDocument = "$baseUrl/UserDocument";

  ///profile_tab
  static const getUserDetail = "$baseUrl/User/GetUserDetail";

  ///dashboard

  ///seller
  static const getCategory = "$baseUrl/Category";
  static const materialRequest = "$baseUrl/Request";

  ///[this ['getRequest'] url use 2 time 1): Get particular request details using request id and 2): get login user alll request using userID  ]
  static const getRequest = "$baseUrl/Request/";
  static const getAllRequest = "$baseUrl/Request";
  static const cancelRequest = "$baseUrl/Request/CancelRequest/";
  static const getRequestStatusHistory = "$baseUrl/Request/GetRequestStatusHistory";
  static const putAcceptRejectBid = "$baseUrl/Request/AcceptRejectBid";
  static const getRequestBidData = "$baseUrl/RequestBid/";
  static const getSellerDashboardDetails = "$baseUrl/Request/GetSellerDashboardDetails";

  ///RequestBid
  static const cancelRequestBid = "$baseUrl/RequestBid/CancelRequestBid";

  ///Buyer
  static const applyBidRequest = "$baseUrl/RequestBid";
  static const getBuyerDashboardDetails = "$baseUrl/RequestBid/GetBuyerDashboardDetails";
  static const getAllRequestBid = "$baseUrl/RequestBid";





}
