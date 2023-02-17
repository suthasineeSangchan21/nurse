import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../api/api_response.dart';
import '../api/base_repository.dart';
import '../api/dio_base_helper.dart';
import '../api/network_exception.dart';
import '../helper/shared_preferences.dart';
import '../model.dart';
import '../model/ActivityResponse.dart';
import '../model/AssessmentBodyResponse.dart';
import '../model/BloodResponse.dart';
import '../model/DefaultTimeLineResponse.dart';
import '../model/DistrictResponse.dart';
import '../model/DrugSentResponse.dart';
import '../model/DutyScheduleResponse.dart';
import '../model/MedicineResponse.dart';
import '../model/EatResponse.dart';
import '../model/FlipResponse.dart';
import '../model/HealthResponse.dart';
import '../model/MainResponse.dart';
import '../model/PatientDataResponse.dart';
import '../model/PhysicResponse.dart';
import '../model/ProvinceResponse.dart';
import '../model/ShowerResponse.dart';
import '../model/SubDistrictResponse.dart';
import '../model/UploadResponse.dart';
import '../model/PhlegmResponse.dart';
import '../model/UsersListResponse.dart';
import '../model/WipeResponse.dart';
import '../model/WoundResponse.dart';
import '../model/bedResponse.dart';
import '../model/buildingResponse.dart';
import '../model/card1.dart';
import '../model/card2.dart';
import '../model/card3.dart';
import '../model/drugResponse.dart';
import '../model/drugUserResponse.dart';
import '../model/eyeAssessmentResponse.dart';
import '../model/floorResponse.dart';
import '../model/imageTimeline.dart';
import '../model/patienResponse.dart';
import '../model/personalResponse.dart';
import '../model/sickListResponse.dart';
import '../model/sickResponse.dart';
import '../model/timelineResponse.dart';
import '../model/zoneRespose.dart';
import 'package:http_parser/http_parser.dart';

import '../timeline/RegisterHistoryBloc.dart';

class RegisterRepository {
  DioBaseHelper _helper = DioBaseHelper();
  late Dio dio;

  final BaseRepository _baseRepository;
  RegisterRepository(this._baseRepository);

  Future<ApiResponse<List<BloodResponse>>> fetchBlood() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.bloodType);
      List<BloodResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(BloodResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<ProvinceResponse>>> fetchProvince() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.provinces);
      List<ProvinceResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(ProvinceResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<DistrictResponse>>> fetchDistrict(id) async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.districts + "/$id");
      List<DistrictResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(DistrictResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<SubDistrictResponse>>> fetchSubDistrict(id) async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.subDistricts + "/$id");
      List<SubDistrictResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(SubDistrictResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<BloodResponse>>> fetchRelation() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.relations);
      List<BloodResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(BloodResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<PatientData>> sendPatientData(patientData patient) async {
    var data = {
      "ddate": patient.ddate,
      "hn": patient.hn,
      "title": patient.title,
      "firstName": patient.firstName,
      "lastName": patient.lastName,
      "nickName": patient.nickName,
      "gender": patient.gender,
      "idCard": patient.idCard,
      "birthDate": patient.birthDate,
      "age": patient.age,
      "bloodType": patient.bloodType,
      "address": patient.address,
      "sub_district_id": patient.sub_district_id,
      "district_id": patient.district_id,
      "province_id": patient.province_id,
      "zip": patient.zip,
      "country_id": "66",
      "phone": patient.phone,
      "email": patient.email,
      "rel1FirstName": patient.rel1FirstName,
      "rel1LastName": patient.rel1LastName,
      "rel1_id": patient.rel1_id,
      "rel1Phone": patient.rel1Phone,
      "rel1Main": patient.rel1Main,
      "rel2FirstName": patient.rel2FirstName,
      "rel2LastName": patient.rel2LastName,
      "rel2_id": patient.rel2_id,
      "rel2Phone": patient.rel2Phone,
      "rel2Main": patient.rel2Main,
      "rel3FirstName": patient.rel3FirstName,
      "rel3LastName": patient.rel3LastName,
      "rel3_id": patient.rel3_id,
      "rel3Phone": patient.rel3Phone,
      "rel3Main": patient.rel3Main,
      "rel4FirstName": patient.rel4FirstName,
      "rel4LastName": patient.rel4LastName,
      "rel4_id": patient.rel4_id,
      "rel4Phone": patient.rel4Phone,
      "welfare": patient.welfare,
      "hospital1": patient.hospital1,
      "doctor1": patient.doctor1,
      "hospital2": patient.hospital2,
      "doctor2": patient.doctor2
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.postPatientsData, data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return ApiResponse.success(data: PatientData.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
      ;
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<PatientData>> updatePatientData(
      patientData patient) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "ddate": patient.ddate,
      "hn": patient.hn,
      "title": patient.title,
      "firstName": patient.firstName,
      "lastName": patient.lastName,
      "nickName": patient.nickName,
      "gender": patient.gender,
      "idCard": patient.idCard,
      "birthDate": patient.birthDate,
      "age": patient.age,
      "bloodType": patient.bloodType,
      "address": patient.address,
      "sub_district_id": patient.sub_district_id,
      "district_id": patient.district_id,
      "province_id": patient.province_id,
      "zip": patient.zip,
      "country_id": "66",
      "phone": patient.phone,
      "email": patient.email,
      "rel1FirstName": patient.rel1FirstName,
      "rel1LastName": patient.rel1LastName,
      "rel1_id": patient.rel1_id,
      "rel1Phone": patient.rel1Phone,
      "rel1Main": patient.rel1Main,
      "rel2FirstName": patient.rel2FirstName,
      "rel2LastName": patient.rel2LastName,
      "rel2_id": patient.rel2_id,
      "rel2Phone": patient.rel2Phone,
      "rel2Main": patient.rel2Main,
      "rel3FirstName": patient.rel3FirstName,
      "rel3LastName": patient.rel3LastName,
      "rel3_id": patient.rel3_id,
      "rel3Phone": patient.rel3Phone,
      "rel3Main": patient.rel3Main,
      "rel4FirstName": patient.rel4FirstName,
      "rel4LastName": patient.rel4LastName,
      "rel4_id": patient.rel4_id,
      "rel4Phone": patient.rel4Phone,
      "welfare": patient.welfare,
      "hospital1": patient.hospital1,
      "doctor1": patient.doctor1,
      "hospital2": patient.hospital2,
      "doctor2": patient.doctor2
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio
          .put(_baseRepository.postPatientsData + "/" + id, data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return ApiResponse.success(data: PatientData.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      return ApiResponse.failure(message: " ");
    }
  }

  Future<ApiResponse<MainResponse>> uploadIdcard(Uint8List file) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "Idcard.pdf", contentType: MediaType('Idcard', 'pdf'));
      var data = FormData.fromMap({"file": fileData});
      Response response =
          await dio.post(_baseRepository.uploadIdcard + "/" + id, data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> uploadHousecard(Uint8List file) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "house_register.pdf",
          contentType: MediaType('house_register', 'pdf'));
      var data = FormData.fromMap({"file": fileData});
      Response response = await dio
          .post(_baseRepository.uploadHousecard + "/" + id, data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> uploadContact(Uint8List file) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "contact.pdf", contentType: MediaType('contact', 'pdf'));
      var data = FormData.fromMap({"file": fileData});
      Response response =
          await dio.post(_baseRepository.uploadContact + "/" + id, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> uploadLiving(Uint8List file) async {
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "living.pdf", contentType: MediaType('living', 'pdf'));
      var data = FormData.fromMap({"file": fileData});
      Response response =
          await dio.post(_baseRepository.uploadLiving + "/15", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<UploadResponse>> uploadProfile(Uint8List file) async {
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "profile.jpg", contentType: MediaType('profile', 'jpg'));
      var data = FormData.fromMap({"file": fileData});
      Response response =
          await dio.post(_baseRepository.uploadProfile, data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: UploadResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<UploadResponse>> uploadProfilePatien(
      Uint8List file) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "profile.jpg", contentType: MediaType('profile', 'jpg'));
      var data = FormData.fromMap({"file": fileData});
      Response response = await dio
          .post(_baseRepository.uploadPatientsProfile + "/" + id, data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: UploadResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> postGoldcard(
      Card1Data cardData, userid) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var data = {
        "patientId": int.parse(id),
        "cardNumber": cardData.cardId.text,
        "data1": cardData.healthCoverage.text,
        "data2": cardData.familyService.text,
        "data3": cardData.regularService.text,
        "startDate": cardData.date.text,
        "expDate": cardData.dateExpire.text
      };
      print(id);
      Response response =
          await dio.post(_baseRepository.postGoldcard, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> postSocial(
      Card2Data cardData, int userid) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var data = {
        "patientId": int.parse(id),
        "socialNumber": cardData.cardId.text,
        "hospital1": cardData.hospital1.text,
        "hospital2": cardData.hospital2.text,
        "hospital3": cardData.hospital3.text
      };
      print(data);
      Response response =
          await dio.post(_baseRepository.postSocial, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> postGovel(
      Card3Data cardData, userid) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      var data = {
        "patientId": int.parse(id),
        "goveNumber": cardData.medicalWelfare.text,
        "org": cardData.agency.text,
        "hospital1": cardData.hospital1.text,
        "hospital2": cardData.hospital2.text
      };
      Response response = await dio.post(_baseRepository.postGove, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<PersonalResponse>> postPersonalData(
      ProfileData profileData, bool isUpdate) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    print(id);
    var data = {
      "patientId": int.parse(id),
      "status": profileData.status,
      "spouseName": profileData.spouseName,
      "isChild": profileData.isChild,
      "child": profileData.child,
      "education": profileData.education,
      "schoolName": profileData.schoolName,
      "yearEdu": profileData.yearEdu,
      "company": profileData.company,
      "position": profileData.position,
      "startWork": profileData.startWork,
      "endWork": profileData.endWork,
      "hobby": profileData.hobby,
      "exerciseDay": profileData.exerciseDay,
      "eatVeg": profileData.eatVeg,
      "dringWater": profileData.dringWater,
      "isSmoke": profileData.isSmoke,
      "isDrink": profileData.isDrink,
      "religion": profileData.religion,
      "society": profileData.society,
      "todo": profileData.todo
    };
    print(data.toString());
    try {
      dio = await _helper.dioWithHeader();
      Response response;
      if (isUpdate) {
        print("isUpdate");
        response = await dio.put(_baseRepository.postPersonalData + "/$id",
            data: data);
      } else {
        print("postPersonalData");
        response = await dio.post(_baseRepository.postPersonalData, data: data);
      }
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PersonalResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: " ");
    }
  }

  Future<ApiResponse<PersonalResponse>> getPersonalData() async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.postPersonalData + "/$id");
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode.toString());
        print(response.data);
        return ApiResponse.success(
            data: PersonalResponse.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<BloodResponse>>> fetchDisease() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.congenital);
      List<BloodResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(BloodResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<BloodResponse>>> fetchDrugGroup() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio.get(_baseRepository.drugGroup);
      List<BloodResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(BloodResponse.fromJson(element));
      });
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<SickResponse>> postSick(SickData profileData) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "sick": profileData.sick,
      "referForm": profileData.referForm,
      "howToMove": profileData.howToMove,
      "howToMoveOther": profileData.howToMoveOther,
      "Ventilator": profileData.Ventilator,
      "pressureSores": profileData.pressureSores,
      "neckPiercing": profileData.neckPiercing,
      "phlegm": profileData.phlegm
    };
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.sick, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: SickResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<SickListResponse>>> getSick({userid}) async {
    String id = "";
    if (userid != null) {
      id = userid.toString();
    } else {
      await getPatientId().then((value) => {id = value});
    }
    print("getSick");
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.sick + "/" + id);
      List<SickListResponse> data = [];
      print("getSick:" + response.data.toString());
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(SickListResponse.fromJson(element));
        print("getSick:" + element.toString());
      });
      print(data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print("getSickerror");
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<PatientResponse>> fetchPatien() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.getUser + "/$id");
      print(response.statusCode);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PatientResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<PatientResponse>> fetchPatienId(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.getUser + "/$id");
      print(response.statusCode);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PatientResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<PatientResponse>>> fetchPatienList() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.getUser);
      // print(_baseRepository.getUser);
      List<PatientResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        // print(element.toString());
        data.add(PatientResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<PatientResponse>> fetchProfileImage() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.profile);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PatientResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<DrugUserResponse>>> fetchUserDrug(
      {userid = ""}) async {
    String id = "";
    if (userid != "") {
      id = userid.toString();
    } else {
      await getPatientId().then((value) => {id = value});
    }
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.drugUser + "/$id");
      print(_baseRepository.drugUser + "/$id");
      List<DrugUserResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(DrugUserResponse.fromJson(element));
        print(element);
      });
      print(data);
      return ApiResponse.success(data: data);
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<DrugResponse>> postDrug(drugGroup, drugName, howto,
      howtoTime, drugTime, amount, amountUnit, amountTake, id) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "drugGroup": drugGroup,
      "drugName": drugName,
      "howto": howto,
      "howtoTime": howtoTime,
      "drugTime": drugTime,
      "amount": amount,
      "amountUnit": amountUnit,
      "amountTake": amountTake
    };
    try {
      Response response;
      dio = await _helper.dioWithHeader();
      if (id == "") {
        response = await dio.post(_baseRepository.postDrug, data: data);
      } else {
        response = await dio.post(_baseRepository.postDrug, data: data);
      }
      print(response);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: DrugResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmentEye(
      List<EyeAssessmentData> eyeAssessmentData, result, index) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step == "ใช่" ? true : false,
      "Step1LeftOrRight": eyeAssessmentData[1].StepLeftOrRight.toString(),
      "step2": eyeAssessmentData[2].step == "ใช่" ? true : false,
      "Step2LeftOrRight": eyeAssessmentData[2].StepLeftOrRight.toString(),
      "step3": eyeAssessmentData[3].step == "ใช่" ? true : false,
      "Step3LeftOrRight": eyeAssessmentData[3].StepLeftOrRight.toString(),
      "step4": eyeAssessmentData[4].step == "ใช่" ? true : false,
      "Step4LeftOrRight": eyeAssessmentData[4].StepLeftOrRight.toString(),
      "step5": eyeAssessmentData[5].step == "ใช่" ? true : false,
      "Step5LeftOrRight": eyeAssessmentData[5].StepLeftOrRight.toString(),
      "Result": result,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response;
      print(_baseRepository.assessmentEye + "/$id");
      if (index == "" || index == null) {
        print("post");
        response = await dio.post(_baseRepository.assessmentEye, data: data);
      } else {
        print("put");
        response = await dio.put(_baseRepository.assessmentEye + "/$index",
            data: data);
      }

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.statusCode.toString());
        return ApiResponse.success(
            data: AssessmentResponse.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentEye() async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.assessmentEye + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentKnee() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentKnee + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmentKnee(
      List<EyeAssessmentData> eyeAssessmentData, result) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step == "ใช่" ? true : false,
      "step2": eyeAssessmentData[2].step == "ใช่" ? true : false,
      "step3": eyeAssessmentData[3].step == "ใช่" ? true : false,
      "step4": eyeAssessmentData[4].step == "ใช่" ? true : false,
      "step5": eyeAssessmentData[5].step == "ใช่" ? true : false,
      "result": result
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentKnee, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmentMouth(
      List<EyeAssessmentData> eyeAssessmentData, result, point) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step == "มี" ? true : false,
      "step1_1": eyeAssessmentData[1].step == "มี" ? true : false,
      "step1_2": eyeAssessmentData[2].step == "มี" ? true : false,
      "step1_3": eyeAssessmentData[3].step == "ใช่" ? true : false,
      "step2": eyeAssessmentData[4].step == "มี" ? true : false,
      "step3": eyeAssessmentData[5].step == "มี" ? true : false,
      "step4": eyeAssessmentData[6].step == "สะอาด" ? true : false,
      "result": result,
      "point": point
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentMouth, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmenttNutrition(
      List<EyeAssessmentData> eyeAssessmentData, result, point) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step == "ใช่" ? true : false,
      "step2": eyeAssessmentData[2].step == "ใช่" ? true : false,
      "step3": eyeAssessmentData[3].step == "ใช่" ? true : false,
      "step4": eyeAssessmentData[4].step,
      "step5_1": eyeAssessmentData[5].step,
      "step5_2": eyeAssessmentData[6].step,
      "step5_3": eyeAssessmentData[7].step,
      "step6": eyeAssessmentData[8].step == "ใช่" ? true : false,
      "step7": eyeAssessmentData[9].step,
      "step8": eyeAssessmentData[10].step,
      "step9": eyeAssessmentData[11].step,
      "step10": eyeAssessmentData[12].step,
      "step11": eyeAssessmentData[13].step,
      "step12": eyeAssessmentData[14].step == "ใช่" ? true : false,
      "result": result,
      "point": point,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentNutrition, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmenttStressed(
      List<EyeAssessmentData> eyeAssessmentData, result) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step,
      "step2": eyeAssessmentData[2].step,
      "step3": eyeAssessmentData[3].step,
      "step4": eyeAssessmentData[4].step,
      "step5": eyeAssessmentData[5].step,
      "result": result
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentStressed, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmenttDepression(
      List<EyeAssessmentData> eyeAssessmentData, result, point) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step == "มี" ? true : false,
      "step2": eyeAssessmentData[2].step == "มี" ? true : false,
      "result": result,
      "point": point
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentDepression, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<AssessmentResponse>> sendAssessmenttAdl(
      List<EyeAssessmentData> eyeAssessmentData, result, point) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "step1": eyeAssessmentData[1].step,
      "step2": eyeAssessmentData[2].step,
      "step3": eyeAssessmentData[3].step,
      "step4": eyeAssessmentData[4].step,
      "step5": eyeAssessmentData[5].step,
      "step6": eyeAssessmentData[6].step,
      "step7": eyeAssessmentData[7].step,
      "step8": eyeAssessmentData[8].step,
      "step9": eyeAssessmentData[9].step,
      "step10": eyeAssessmentData[10].step,
      "Step1Option": eyeAssessmentData[1].StepOption,
      "Step4Option": eyeAssessmentData[4].StepOption,
      "Step5Option": eyeAssessmentData[5].StepOption,
      "Step8Option": eyeAssessmentData[8].StepOption,
      "result": result,
      "point": point
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentAdl, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: AssessmentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentMouth() async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentMouth + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentAdl() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.assessmentAdl + "/$id");
      print(_baseRepository.assessmentAdl + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      print(data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentNutrition() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentNutrition + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>>
      getAssessmentDepression() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentDepression + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<AssessmentResponse>>> getAssessmentStressed() async {
    String id = "";
    await getPatientId().then((value) => {id = value});

    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentStressed + "/$id");
      List<AssessmentResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(AssessmentResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<AssessmentBodyResponse>> updateAssessmenttBody(
      BodyAssessmentData bodyAssessmentData, index) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "patientId": int.parse(id),
      "weight": bodyAssessmentData.weight,
      "height": bodyAssessmentData.height,
      "temp": bodyAssessmentData.temp,
      "pulse1": bodyAssessmentData.pulse1,
      "pulse2": "0",
      "bloodPressure1": bodyAssessmentData.bloodPressure1,
      "bloodPressure2": bodyAssessmentData.bloodPressure2,
      "co2": bodyAssessmentData.co2,
      "body1": bodyAssessmentData.body1,
      "body1_option": bodyAssessmentData.body1_option,
      "body2": bodyAssessmentData.body2,
      "body2_option": bodyAssessmentData.body2_option,
      "body3": bodyAssessmentData.body3,
      "body3_option": bodyAssessmentData.body3_option,
      "body4": bodyAssessmentData.body4,
      "body4_option": bodyAssessmentData.body4_option,
      "body5": bodyAssessmentData.body5,
      "body5_option": bodyAssessmentData.body5_option,
      "body6": bodyAssessmentData.body6,
      "body6_option": bodyAssessmentData.body6_option,
      "body7": bodyAssessmentData.body7,
      "body7_option": bodyAssessmentData.body7_option,
      "body8": bodyAssessmentData.body8,
      "body8_option": bodyAssessmentData.body8_option,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      print(_baseRepository.assessmentBody + "/$index");
      Response response =
          await dio.put(_baseRepository.assessmentBody + "/$index", data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data);
        return ApiResponse.success(
            data: AssessmentBodyResponse.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<AssessmentBodyResponse>> sendAssessmenttBody(
      BodyAssessmentData bodyAssessmentData) async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    var data = {
      "id": int.parse(id),
      "patientId": int.parse(id),
      "weight": bodyAssessmentData.weight,
      "height": bodyAssessmentData.height,
      "temp": bodyAssessmentData.temp,
      "pulse1": bodyAssessmentData.pulse1,
      "pulse2": "0",
      "bloodPressure1": bodyAssessmentData.bloodPressure1,
      "bloodPressure2": bodyAssessmentData.bloodPressure2,
      "co2": bodyAssessmentData.co2,
      "body1": bodyAssessmentData.body1,
      "body1_option": bodyAssessmentData.body1_option,
      "body2": bodyAssessmentData.body2,
      "body2_option": bodyAssessmentData.body2_option,
      "body3": bodyAssessmentData.body3,
      "body3_option": bodyAssessmentData.body3_option,
      "body4": bodyAssessmentData.body4,
      "body4_option": bodyAssessmentData.body4_option,
      "body5": bodyAssessmentData.body5,
      "body5_option": bodyAssessmentData.body5_option,
      "body6": bodyAssessmentData.body6,
      "body6_option": bodyAssessmentData.body6_option,
      "body7": bodyAssessmentData.body7,
      "body7_option": bodyAssessmentData.body7_option,
      "body8": bodyAssessmentData.body8,
      "body8_option": bodyAssessmentData.body8_option,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.assessmentBody, data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data);
        return ApiResponse.success(
            data: AssessmentBodyResponse.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<AssessmentBodyResponse>>> getAssessmentBody() async {
    String id = "";
    await getPatientId().then((value) => {id = value});
    print("getPatientId:" + id);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.assessmentBody + "/$id");
      List<AssessmentBodyResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(AssessmentBodyResponse.fromJson(element));
      });
      print(response.data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<ShowerResponse>> sendShower(
      graphShowerData showerData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": showerData.ddate,
      "howToShower": showerData.howToShower,
      "howToTeeth": showerData.howToTeeth,
      "bodyOdor": showerData.bodyOdor,
      "skin": showerData.skin,
      "tooth": showerData.tooth,
      "gum": showerData.gum,
      "detail": showerData.detail,
      "timeStart": showerData.timeStart,
      "timeEnd": showerData.timeEnd,
      "sumTime": showerData.sumTime,
      "estimate": showerData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.shower, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ShowerResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ShowerResponse>> putShower(
      graphShowerData showerData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": showerData.ddate,
      "howToShower": showerData.howToShower,
      "howToTeeth": showerData.howToTeeth,
      "bodyOdor": showerData.bodyOdor,
      "skin": showerData.skin,
      "tooth": showerData.tooth,
      "gum": showerData.gum,
      "detail": showerData.detail,
      "timeStart": showerData.timeStart,
      "timeEnd": showerData.timeEnd,
      "sumTime": showerData.sumTime,
      "estimate": showerData.estimate
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.shower + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ShowerResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<ShowerResponse>>> getShowerList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.showerHistory + "/$id");
      List<ShowerResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(ShowerResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<PhysicResponse>>> getPhysicalList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.physicalHistory + "/$id");
      List<PhysicResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(PhysicResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<PhysicResponse>> putPhysical(
      graphTherapyData therapyData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": therapyData.ddate,
      "armLeft": therapyData.armLeft,
      "armRight": therapyData.armRight,
      "legLeft": therapyData.legLeft,
      "legRight": therapyData.legRight,
      "neck": therapyData.neck,
      "back": therapyData.back,
      "detail": therapyData.detail,
      "timeStart": therapyData.timeStart,
      "timeEnd": therapyData.timeEnd,
      "sumTime": therapyData.sumTime,
      "estimate": therapyData.estimate,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.physical + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PhysicResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<PhysicResponse>> sendPhysical(
      graphTherapyData therapyData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": therapyData.ddate,
      "armLeft": therapyData.armLeft,
      "armRight": therapyData.armRight,
      "legLeft": therapyData.legLeft,
      "legRight": therapyData.legRight,
      "neck": therapyData.neck,
      "back": therapyData.back,
      "detail": therapyData.detail,
      "timeStart": therapyData.timeStart,
      "timeEnd": therapyData.timeEnd,
      "sumTime": therapyData.sumTime,
      "estimate": therapyData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.physical, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PhysicResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<FlipResponse>> putFlip(
      graphFlipData flipData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": flipData.ddate,
      "armLeft": "-",
      "armRight": "-",
      "legLeft": "-",
      "legRight": "-",
      "neck": "-",
      "back": "-",
      "detail": flipData.detail,
      "timeStart": flipData.timeStart,
      "timeEnd": flipData.timeEnd,
      "sumTime": flipData.sumTime,
      "estimate": flipData.estimate,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.flip + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: FlipResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<FlipResponse>> sendFlip(
      graphFlipData flipData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": flipData.ddate,
      "armLeft": "-",
      "armRight": "-",
      "legLeft": "-",
      "legRight": "-",
      "neck": "-",
      "back": "-",
      "detail": flipData.detail,
      "timeStart": flipData.timeStart,
      "timeEnd": flipData.timeEnd,
      "sumTime": flipData.sumTime,
      "estimate": flipData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.flip, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: FlipResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<FlipResponse>>> getFlipList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.flipHistory + "/$id");
      List<FlipResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(FlipResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<WoundResponse>>> getWoundList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.woundHistory + "/$id");
      List<WoundResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(WoundResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<HealthResponse>>> getHealthList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.healthHistory + "/$id");
      List<HealthResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(HealthResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<PhlegmResponse>>> getPhlegmList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.phlegmHistory + "/$id");
      List<PhlegmResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(PhlegmResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<WipeRwsponse>>> getWipeList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.wipeHistory + "/$id");
      List<WipeRwsponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(WipeRwsponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<MedicineResponse>>> getDrugList(id) async {
    print("getDrugList" + "/$id");
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.drugHistory + "/$id");
      List<MedicineResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(MedicineResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<EatResponse>>> getEatList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.eatHistory + "/$id");
      List<EatResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(EatResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> uploadEat(Uint8List file, id) async {
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "image.png", contentType: MediaType('image', '.png'));
      var data = FormData.fromMap({"file": fileData});
      Response response = await dio
          .post(_baseRepository.eatImage + "/" + id.toString(), data: data);
      print(_baseRepository.eatImage + "/" + id);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> uploadActivity(Uint8List file, id) async {
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "image.png", contentType: MediaType('image', '.png'));
      var data = FormData.fromMap({"file": fileData});
      Response response = await dio.post(
          _baseRepository.uploadActivity + "/" + id.toString(),
          data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<List<ActivityResponse>>> getActivityList(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.activityHistory + "/$id");
      List<ActivityResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(ActivityResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<WoundResponse>> putWound(
      graphWoundData woundData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": woundData.ddate,
      "area": woundData.area,
      "woundType": woundData.woundType,
      "woundSize": woundData.woundSize,
      "detail": woundData.detail,
      "timeStart": woundData.timeStart,
      "timeEnd": woundData.timeEnd,
      "sumTime": woundData.sumTime,
      "estimate": woundData.estimate
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.wound + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: WoundResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<WipeRwsponse>> sendWipe(
      graphWipeData wipeData, id, timelineId) async {
    bool haveWound = false;
    if (wipeData.wound == "มี") {
      haveWound = true;
    }

    var data = {
      "patientId": int.parse(id),
      "ddate": wipeData.ddate,
      "haveWound": haveWound,
      "detail": wipeData.detail,
      "timeStart": wipeData.timeStart,
      "timeEnd": wipeData.timeEnd,
      "sumTime": wipeData.sumTime,
      "estimate": wipeData.estimate,
      "woundArea": wipeData.woundArea,
      "woundType": wipeData.woundType,
      "woundSize": wipeData.woundSize,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.wipe, data: data);
      print(response.data.toString());

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: WipeRwsponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<ImageTimeline>>> getWipeImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.getwipeImage + "/$id");
      print(_baseRepository.wipeImage + "/$id");
      List<ImageTimeline> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(ImageTimeline.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<ImageTimeline>>> getFoodImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.getFoodImage + "/$id");
      print(_baseRepository.getFoodImage + "/$id");
      List<ImageTimeline> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(ImageTimeline.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print("getFoodImage:failure");
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ImageTimeline>> deleteFoodImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.delete(_baseRepository.delFoodImage + "/$id");
      print("del" + _baseRepository.delFoodImage + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ImageTimeline.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ImageTimeline>> deleteWipeImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.delete(_baseRepository.delWipeImage + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ImageTimeline.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ImageTimeline>> deleteActivityImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.delete(_baseRepository.delActivityImage + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ImageTimeline.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<ImageTimeline>>> getActiviryImage(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.get(_baseRepository.getActivityImage + "/$id");
      List<ImageTimeline> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(ImageTimeline.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<PhlegmResponse>> sendWipeImage(Uint8List file, id) async {
    var fileData = MultipartFile.fromBytes(file,
        filename: "image.png", contentType: MediaType('image', '.png'));
    var data = FormData.fromMap({"file": fileData});
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.post(_baseRepository.wipeImage + "/$id", data: data);
      print(_baseRepository.wipeImage + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PhlegmResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<WipeRwsponse>> putWipe(
      graphWipeData wipeData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": wipeData.ddate,
      "wound": wipeData.wound,
      "detail": wipeData.detail,
      "timeStart": wipeData.timeStart,
      "timeEnd": wipeData.timeEnd,
      "sumTime": wipeData.sumTime,
      "estimate": wipeData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.wipe + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: WipeRwsponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<WoundResponse>> sendWound(
      graphWoundData woundData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": woundData.ddate,
      "area": woundData.area,
      "woundType": woundData.woundType,
      "woundSize": woundData.woundSize,
      "detail": woundData.detail,
      "timeStart": woundData.timeStart,
      "timeEnd": woundData.timeEnd,
      "sumTime": woundData.sumTime,
      "estimate": woundData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.wound, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: WoundResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<HealthResponse>> putHealth(
      graphHealthData healthData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": healthData.ddate,
      "weight": healthData.weight.toString(),
      "hight": healthData.hight.toString(),
      "temp": healthData.temp.toString(),
      "pulse1": healthData.pulse1.toString(),
      "pulse2": "0",
      "breathe1": healthData.breathe1.toString(),
      "breathe2": "0",
      "bloodPressure1": healthData.bloodPressure1.toString(),
      "bloodPressure2": healthData.bloodPressure2.toString(),
      "co2": healthData.co2.toString(),
      "detail": healthData.detail,
      "timeStart": healthData.timeStart,
      "timeEnd": healthData.timeEnd,
      "sumTime": healthData.sumTime,
      "estimate": healthData.estimate
    };
    print(data);
    print("put" + _baseRepository.health + "/$id");
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.health + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: HealthResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error.toString());
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<HealthResponse>> sendHealth(
      graphHealthData healthData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": healthData.ddate,
      "weight": healthData.weight.toString(),
      "hight": healthData.hight.toString(),
      "temp": healthData.temp.toString(),
      "pulse1": healthData.pulse1.toString(),
      "pulse2": "0",
      "breathe1": healthData.breathe1.toString(),
      "breathe2": "0",
      "bloodPressure1": healthData.bloodPressure1.toString(),
      "bloodPressure2": healthData.bloodPressure2.toString(),
      "co2": healthData.co2.toString(),
      "detail": healthData.detail,
      "timeStart": healthData.timeStart,
      "timeEnd": healthData.timeEnd,
      "sumTime": healthData.sumTime,
      "estimate": healthData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.health, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: HealthResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<PhlegmResponse>> putPhlegm(
      graphAspirateData aspirateData, id, userId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": aspirateData.ddate,
      "howTo": aspirateData.howTo,
      "detail": aspirateData.detail,
      "timeStart": aspirateData.timeStart,
      "timeEnd": aspirateData.timeEnd,
      "sumTime": aspirateData.sumTime,
      "estimate": aspirateData.estimate
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.phlegm + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PhlegmResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<PhlegmResponse>> sendPhlegm(
      graphAspirateData aspirateData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": aspirateData.ddate,
      "howTo": aspirateData.howTo,
      "detail": aspirateData.detail,
      "timeStart": aspirateData.timeStart,
      "timeEnd": aspirateData.timeEnd,
      "sumTime": aspirateData.sumTime,
      "estimate": aspirateData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.phlegm, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: PhlegmResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<DrugSentResponse>> putDrug(
      graphDrugData drugData, id, userId) async {
    print("putDrug");
    var data = {
      "patientId": userId,
      "ddate": drugData.ddate,
      "drugName": drugData.drugName,
      "howTo": drugData.howTo,
      "drugType": drugData.drugType,
      "causeOfUse": drugData.causeOfUse,
      "detail": drugData.howTo,
      "timeStart": drugData.timeStart,
      "timeEnd": drugData.timeEnd,
      "sumTime": drugData.sumTime,
      "estimate": drugData.estimate,
    };

    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.drug + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: DrugSentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<DrugSentResponse>> sendDrug(
      graphDrugData drugData, id, userId, timelineId) async {
    var data = {
      "patientId": int.parse(userId.toString()),
      "ddate": drugData.ddate,
      "drugName": drugData.drugName,
      "howTo": drugData.howTo,
      "drugType": drugData.drugType,
      "causeOfUse": drugData.causeOfUse,
      "detail": drugData.howTo,
      "timeStart": drugData.timeStart,
      "timeEnd": drugData.timeEnd,
      "sumTime": drugData.sumTime,
      "estimate": drugData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    print("drug post0");
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.drug, data: data);
      print("drug post");
      print(response.data.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: DrugSentResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error.toString());
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<EatResponse>> sendEat(
      graphEatData eatData, id, timelineId) async {
    bool taste;
    if (eatData.taste == "ดี") {
      taste = true;
    } else {
      taste = false;
    }
    print("userId:" + id.toString());
    var data = {
      "patientId": int.parse(id.toString()),
      "ddate": eatData.ddate,
      "meal": eatData.meal,
      "foodType": eatData.foodType,
      "howToEat": eatData.howToEat,
      "taste": taste,
      "canEat": eatData.canEat,
      "detail": eatData.detail,
      "timeStart": eatData.timeStart,
      "timeEnd": eatData.timeEnd,
      "sumTime": eatData.sumTime,
      "estimate": eatData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.eat, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: EatResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<EatResponse>> putEat(
      graphEatData eatData, id, userId) async {
    bool taste;
    if (eatData.taste == "ดี") {
      taste = true;
    } else {
      taste = false;
    }
    var data = {
      "patientId": int.parse(userId),
      "ddate": eatData.ddate,
      "meal": eatData.meal,
      "foodType": eatData.foodType,
      "howToEat": eatData.howToEat,
      "taste": taste,
      "canEat": eatData.canEat,
      "detail": eatData.detail,
      "timeStart": eatData.timeStart,
      "timeEnd": eatData.timeEnd,
      "sumTime": eatData.sumTime,
      "estimate": eatData.estimate
    };
    print(data);
    print("put" + _baseRepository.eat + "/$id");
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.eat + "/$id", data: data);
      print("put" + response.statusCode.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: EatResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print("put" + error.toString());
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ActivityResponse>> putActivity(
      graphActivityData activityData, id, userId) async {
    var data = {
      "patientId": int.parse(userId),
      "ddate": activityData.ddate,
      "activity": activityData.activity,
      "part": activityData.part,
      "happy": activityData.happy,
      "social": activityData.social,
      "detail": activityData.detail,
      "timeStart": activityData.timeStart,
      "timeEnd": activityData.timeEnd,
      "sumTime": activityData.sumTime,
      "estimate": activityData.estimate
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.activity + "/$id", data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ActivityResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<ActivityResponse>> sendActivity(
      graphActivityData activityData, id, timelineId) async {
    var data = {
      "patientId": int.parse(id),
      "ddate": activityData.ddate,
      "activity": activityData.activity,
      "part": activityData.part,
      "happy": activityData.happy,
      "social": activityData.social,
      "detail": activityData.detail,
      "timeStart": activityData.timeStart,
      "timeEnd": activityData.timeEnd,
      "sumTime": activityData.sumTime,
      "estimate": activityData.estimate,
      "timelineId": int.parse(timelineId.toString()),
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      print("post:activity");
      Response response = await dio.post(_baseRepository.activity, data: data);
      print("activity:" + response.data.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: ActivityResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print("error:activity");
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<DefaultTimeLineResponse>> getDefaultTimeline() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.defaultTimeline);
      print(response.data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: DefaultTimeLineResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<TimelineResponse>>> getSelectTimeline() async {
    try {
      dio = await _helper.dioWithHeader();

      Response response = await dio.get(_baseRepository.selectTimeline);
      print(response.data);
      List<TimelineResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(TimelineResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<TimelineResponse>> postTimeline(
      timelineApiData dataTimeline, String id) async {
    try {
      dio = await _helper.dioWithHeader();
      var data = {
        "patientId": int.parse(id),
        "ddate": dataTimeline.ddate,
        "activity1_id": dataTimeline.activity1_id,
        "activity1": dataTimeline.activity1,
        "activity1Time": dataTimeline.activity1Time,
        "activity2_id": dataTimeline.activity2_id,
        "activity2": dataTimeline.activity2,
        "activity2Time": dataTimeline.activity2Time,
        "activity3_id": dataTimeline.activity3_id,
        "activity3": dataTimeline.activity3,
        "activity3Time": dataTimeline.activity3Time,
        "activity4_id": dataTimeline.activity4_id,
        "activity4": dataTimeline.activity4,
        "activity4Time": dataTimeline.activity4Time,
        "activity5_id": dataTimeline.activity5_id,
        "activity5": dataTimeline.activity5,
        "activity5Time": dataTimeline.activity5Time,
        "activity6_id": dataTimeline.activity6_id,
        "activity6": dataTimeline.activity6,
        "activity6Time": dataTimeline.activity6Time,
        "activity7_id": dataTimeline.activity7_id,
        "activity7": dataTimeline.activity7,
        "activity7Time": dataTimeline.activity7Time,
        "activity8_id": dataTimeline.activity8_id,
        "activity8": dataTimeline.activity8,
        "activity8Time": dataTimeline.activity8Time,
        "activity9_id": dataTimeline.activity9_id,
        "activity9": dataTimeline.activity9,
        "activity9Time": dataTimeline.activity9Time,
        "activity10_id": dataTimeline.activity10_id,
        "activity10": dataTimeline.activity10,
        "activity10Time": dataTimeline.activity10Time,
        "activity11_id": dataTimeline.activity11_id,
        "activity11": dataTimeline.activity11,
        "activity11Time": dataTimeline.activity11Time
      };
      Response response = await dio.post(_baseRepository.timeline, data: data);
      print(response.data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: TimelineResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<TimelineResponse>> putTimeline(
      timelineApiData dataTimeline, String id) async {
    try {
      dio = await _helper.dioWithHeader();
      var data = {
        "patientId": int.parse(id),
        "ddate": dataTimeline.ddate,
        "activity1_id": dataTimeline.activity1_id,
        "activity1": dataTimeline.activity1,
        "activity1Time": dataTimeline.activity1Time,
        "activity2_id": dataTimeline.activity2_id,
        "activity2": dataTimeline.activity2,
        "activity2Time": dataTimeline.activity2Time,
        "activity3_id": dataTimeline.activity3_id,
        "activity3": dataTimeline.activity3,
        "activity3Time": dataTimeline.activity3Time,
        "activity4_id": dataTimeline.activity4_id,
        "activity4": dataTimeline.activity4,
        "activity4Time": dataTimeline.activity4Time,
        "activity5_id": dataTimeline.activity5_id,
        "activity5": dataTimeline.activity5,
        "activity5Time": dataTimeline.activity5Time,
        "activity6_id": dataTimeline.activity6_id,
        "activity6": dataTimeline.activity6,
        "activity6Time": dataTimeline.activity6Time,
        "activity7_id": dataTimeline.activity7_id,
        "activity7": dataTimeline.activity7,
        "activity7Time": dataTimeline.activity7Time,
        "activity8_id": dataTimeline.activity8_id,
        "activity8": dataTimeline.activity8,
        "activity8Time": dataTimeline.activity8Time,
        "activity9_id": dataTimeline.activity9_id,
        "activity9": dataTimeline.activity9,
        "activity9Time": dataTimeline.activity9Time,
        "activity10_id": dataTimeline.activity10_id,
        "activity10": dataTimeline.activity10,
        "activity10Time": dataTimeline.activity10Time,
        "activity11_id": dataTimeline.activity11_id,
        "activity11": dataTimeline.activity11,
        "activity11Time": dataTimeline.activity11Time
      };
      Response response =
          await dio.put(_baseRepository.timeline + "/$id", data: data);
      print(response.data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: TimelineResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<DefaultTimeLineResponse>>> getTimeline(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.timeline + "/$id");
      print(_baseRepository.timeline + "/$id");
      List<DefaultTimeLineResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element);
        data.add(DefaultTimeLineResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<floorResponse>>> getFloor() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.floor);
      List<floorResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        // print(element);
        data.add(floorResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      // DioError? e;
      // e = error as DioError?;
      // print(e!.response!.data!.toString());
      // var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> postFloor(id, name) async {
    var data = {
      "buildingId": int.parse(id.toString()),
      "name": name,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.floor, data: data);
      print(_baseRepository.floor);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> postZone(id, name, file) async {
    // var fileData = MultipartFile.fromBytes(file,
    //     filename: "image.png", contentType: MediaType('image', '.png'));
    var data = {"floorId": id, "name": name, "fileName": file};
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.zone, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> postBed(
      zoneId,
      name,
      icon,
      status,
      patientId,
      rotation,
      positionX,
      positionY,
      userId,
      opt_cabinet,
      opt_clotheset,
      opt_tv) async {
    print("postBed");
    if (name == "") {
      name = "-";
    }
    var data = {
      "zoneId": zoneId,
      "name": name,
      "icon": icon.toString(),
      "status": status.toString(),
      "patientId": 0,
      "rotation": rotation.toString(),
      "positionX": positionX.toString(),
      "positionY": positionY.toString(),
      "userId": 0,
      "opt_cabinet": opt_cabinet,
      "opt_clotheset": opt_clotheset,
      "opt_tv": opt_tv,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.bed, data: data);

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> editBed(
      zoneId,
      name,
      icon,
      status,
      patientId,
      rotation,
      positionX,
      positionY,
      userId,
      id,
      opt_cabinet,
      opt_clotheset,
      opt_tv) async {
    print("editBed:" + id);
    if (name == "") {
      name = "-";
    }
    if (patientId == "") {
      patientId = "0";
    }
    if (zoneId == "") {
      zoneId = "0";
    }
    if (userId == "") {
      userId = "0";
    }
    var data = {
      "zoneId": int.parse(zoneId.toString()),
      "name": name,
      "icon": icon.toString(),
      "status": status.toString(),
      "patientId": int.parse(patientId.toString()),
      "rotation": rotation.toString(),
      "positionX": positionX.toString(),
      "positionY": positionY.toString(),
      "userId": int.parse(userId.toString()),
      "opt_cabinet": opt_cabinet,
      "opt_clotheset": opt_clotheset,
      "opt_tv": opt_tv,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.put(_baseRepository.bed + "/$id", data: data);
      print("put:" + _baseRepository.bed + "/$id");

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> deleteBed(id) async {
    print("deleteBed:" + id.toString());
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.delete(_baseRepository.bed + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<bedResponse>>> getBed() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.bed);
      List<bedResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        //   print(element.toString());
        data.add(bedResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<zoneResponse>>> getZone() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.zone);
      List<zoneResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        print(element.toString());
        data.add(zoneResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<List<BuildingResponse>>> getBuilding() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.building);
      List<BuildingResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(BuildingResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> postBuilding(name) async {
    var data = {
      "name": name,
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.building, data: data);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.response!.data!.toString());
      var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: data.message.toString());
    }
  }

  Future<ApiResponse<MainResponse>> deleteBuilding(id) async {
    try {
      print("delete");
      dio = await _helper.dioWithHeader();
      Response response = await dio.delete(_baseRepository.building + "/$id");
      print(id);
      print(response.statusCode.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> deleteFloor(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.delete(_baseRepository.floor + "/$id");
      print(id);
      print(response.statusCode.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> deleteZone(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.delete(_baseRepository.zone + "/$id");
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<UploadResponse>> uploadImageZone(
      Uint8List file, id) async {
    try {
      dio = await _helper.dioWithHeader();
      var fileData = MultipartFile.fromBytes(file,
          filename: "image.jpg", contentType: MediaType('zone', 'jpg'));
      var data = FormData.fromMap({"file": fileData});
      print(_baseRepository.addImageZone + "/" + id);
      Response response =
          await dio.post(_baseRepository.addImageZone + "/" + id, data: data);
      print(_baseRepository.addImageZone + "/" + id);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: UploadResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print(error);
      return ApiResponse.error(error: NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResponse<MainResponse>> postBedUser(DutyUser dataBed) async {
    var data = {
      "bedId": dataBed.bedId,
      "userId": dataBed.userId,
      "monday": dataBed.monday,
      "tuesday": dataBed.thursday,
      "wednesday": dataBed.wednesday,
      "thursday": dataBed.thursday,
      "friday": dataBed.friday,
      "saturday": dataBed.saturday,
      "sunday": dataBed.sunday,
      "mondayTimeStart": dataBed.mondayTimeStart,
      "tuesdayTimeStart": dataBed.thursdayTimeStart,
      "wednesdayTimeStart": dataBed.wednesdayTimeStart,
      "thursdayTimeStart": dataBed.thursdayTimeStart,
      "fridayTimeStart": dataBed.fridayTimeStart,
      "saturdayTimeStart": dataBed.saturdayTimeStart,
      "sundayTimeStart": dataBed.saturdayTimeStart,
      "mondayTimeStop": dataBed.mondayTimeStop,
      "tuesdayTimeStop": dataBed.tuesdayTimeStop,
      "wednesdayTimeStop": dataBed.wednesdayTimeStop,
      "thursdayTimeStop": dataBed.thursdayTimeStop,
      "fridayTimeStop": dataBed.fridayTimeStop,
      "saturdayTimeStop": dataBed.saturdayTimeStop,
      "sundayTimeStop": dataBed.saturdayTimeStop
    };
    print(data);
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.post(_baseRepository.dutyUser, data: data);
      print(response.statusCode.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<DutyScheduleResponse>>> getDutyUser() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.dutyUser);
      List<DutyScheduleResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(DutyScheduleResponse.fromJson(element));
      });

      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> deleteDutyUser(id) async {
    try {
      dio = await _helper.dioWithHeader();
      Response response =
          await dio.delete(_baseRepository.dutyUser + id.toString());
      print(_baseRepository.dutyUser + id.toString());
      print(response.statusCode.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: response.data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<UserListResponse>>> getListUser() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.listUser);
      List<UserListResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(UserListResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<List<DutyScheduleResponse>>> getDutyUserBed(id) async {
    print("getDutyUserBed");
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.dutyBed + "$id");
      List<DutyScheduleResponse> data = [];
      var encodedString = jsonEncode(response.data);
      List<dynamic> tagsJson = jsonDecode(encodedString);
      tagsJson.forEach((element) {
        data.add(DutyScheduleResponse.fromJson(element));
      });
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: data)
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      print("getDutyUserBed:" + error.toString());
      return ApiResponse.failure(message: "");
    }
  }
}
