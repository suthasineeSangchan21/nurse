class BaseRepository {
  BaseRepository._privateConstructor();
  static final BaseRepository instance = BaseRepository._privateConstructor();

  //Dev
  String baseApiUrl = "https://cvc-api.agsofts.com/api/";

  String bloodType = "blood-type";
  String provinces = "provinces";
  String districts = "districts/getByProvince";
  String subDistricts = "sub-districts/getByDistrict";
  String relations = "relations";

  String postPatientsData = "patients";

  String uploadIdcard = "patients/upload/idcard";
  String uploadHousecard = "patients/upload/house-register";
  String uploadContact = "patients/upload/contact";
  String uploadLiving = "patients/upload/living";

  String uploadProfile = "users/profile/upload";
  String uploadPatientsProfile = "patients/upload/profile";

  String postGoldcard = "patients/goldcard";
  String postSocial = "patients/social";
  String postGove = "patients/gove";

  String postPersonalData = "patients/personal";
  String congenital = "congenital-disease";
  String drugGroup = "drug-group";

  String sick = "patients/sick";
  String getUser = "patients";

  String profile = "users/profile/get";
  String drugUser = "patients/drug";

  String postDrug = "patients/drug";

  //login
  String signInAPI = 'auth/signin';
  String signUpAPI = 'users/signup';
  String signInPositionsAPI = 'positions/';
  String forgotpassword = "users/forgotpassword";
  String profileUser = "users/profile/detail/";

//assessment
  String assessmentEye = "assessment/eye";
  String assessmentEyeOne = "assessment/eye/one";

  String assessmentKnee = "assessment/knee";
  String assessmentKneeOne = "assessment/knee/one";

  String assessmentMouth = "assessment/mouth";
  String assessmentMouthOne = "assessment/mouth/one";

  String assessmentNutrition = "assessment/nutrition";
  String assessmentNutritionOne = "assessment/nutrition/one";

  String assessmentStressed = "assessment/stressed";
  String assessmentStressedOne = "assessment/stressed/one";

  String assessmentDepression = "assessment/depression";
  String assessmentDepressionOne = "assessment/depression/one";

  String assessmentAdl = "assessment/adl";
  String assessmentAdlOne = "assessment/adl/one";

  String assessmentBody = "assessment/body";
  String assessmentBodyOne = "assessment/body/one";

  //Timeline
  String shower = "activity/shower";
  String physical = "activity/physical";
  String flip = "activity/flip";
  String wound = "activity/wound";
  String health = "activity/health";
  String phlegm = "activity/phlegm";
  String drug = "activity/drug";
  String wipe = "activity/wipe";
  String wipeImage = "activity/wipe/upload";
  String eat = "activity/eat";
  String eatImage = "activity/eat/upload";
  String activity = "activity/activity";
  String uploadActivity = "activity/activity/upload";
  String testActivity = "activity/activity/test";
  String defaultTimeline = "activity/timeline/default/1";
  String timeline = "activity/timeline";
  String selectTimeline = "activity/timeline/date/2022-12-19";
  String getwipeImage = "activity/wipe/images";
  String getFoodImage = "activity/eat/images";
  String getActivityImage = "activity/activity/images";
  String delFoodImage = "activity/eat/image";
  String delWipeImage = "activity/wipe/image";
  String delActivityImage = "activity/wipe/image";


  //bed
  String building = "building";
  String floor = "floor";
  String zone = "zone";
  String bed = "bed";
  String addImageZone = "zone/upload";
  String ImageZone = "zone/image";
  String dutyUser = "duty-schedule/";
  String dutyBed = "duty-schedule/bed/";
  String listUser = "users";

  //history
  String showerHistory = "history/shower";
  String physicalHistory = "history/physical";
  String flipHistory = "history/flip";
  String woundHistory = "history/wound";
  String healthHistory = "history/health";
  String phlegmHistory = "history/phlegm";
  String drugHistory = "history/drug";
  String eatHistory = "history/eat";
  String activityHistory = "history/activity";
  String wipeHistory = "history/wipe";
}
