import 'package:dio/dio.dart';

import '../api/api_response.dart';
import '../api/base_repository.dart';
import '../api/dio_base_helper.dart';
import '../api/network_exception.dart';
import '../model/MainResponse.dart';
import '../model/profileUserResponse.dart';

class LoginRepository {
  DioBaseHelper _helper = DioBaseHelper();
  late Dio dio;

  final BaseRepository _baseRepository;
  LoginRepository(this._baseRepository);

  Future<ApiResponse<LoginResponse>> postLogin(
      {required String username, required String password}) async {
    try {
      dio = await _helper.dioNoHeader();
      var data = {
        "username": username,
        "password": password,
      };
      print(data);
      Response response = await dio.post(_baseRepository.signInAPI, data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data.toString());
        return ApiResponse.success(data: LoginResponse.fromJson(response.data));
      } else {
        return ApiResponse.failure(message: response.statusMessage.toString());
      }
    } catch (error) {
      print(error);
      DioError? e;
      e = error as DioError?;
      print(e!.toString());
      // var data = MainResponse.fromJson(e!.response!.data);
      return ApiResponse.failure(message: "");
    }
  }

  Future<ApiResponse<MainResponse>> signUP(String email, String firstName,
      String lastName, String phone, String positionID) async {
    try {
      dio = await _helper.dioNoHeader();
      var data = {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'position_id': positionID,
      };
      // print(data);
      Response response = await dio.post(_baseRepository.signUpAPI, data: data);
      return response.statusCode == 201
          ? ApiResponse.success(data: MainResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (e) {
      DioError? ee;
      ee = e as DioError?;
      //  print(ee!.response!.data!.toString());
      // var data = MainResponse.fromJson(ee!.response!.data);
      return ApiResponse.failure(message: "ลงทะเบียนไม่สำเร็จ");
    }
  }

  Future<ApiResponse<List<String>>> getPositions() async {
    try {
      dio = await _helper.dioNoHeader();
      // List<String> data = [];
      // var encodedString = jsonEncode(response.data);
      // List<dynamic> tagsJson = jsonDecode(encodedString);
      // tagsJson.forEach((element) {
      //   data.add(BloodResponse.fromJson(element));
      // });
      Response response = await dio.get(_baseRepository.signUpAPI);
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(data: response.data)
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

  Future<ApiResponse<MainResponse>> postForgetPassword(email) async {
    try {
      dio = await _helper.dioNoHeader();
      var data = {
        "email": email,
      };
      Response response =
          await dio.post(_baseRepository.forgotpassword, data: data);
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

  Future<ApiResponse<ProfileUserResponse>> getprofileUser() async {
    try {
      dio = await _helper.dioWithHeader();
      Response response = await dio.get(_baseRepository.profileUser);
      print(response.data.toString());
      return response.statusCode == 201 || response.statusCode == 200
          ? ApiResponse.success(
              data: ProfileUserResponse.fromJson(response.data))
          : ApiResponse.failure(message: response.statusMessage.toString());
    } catch (error) {
      return ApiResponse.failure(message: error.toString());
    }
  }
}
