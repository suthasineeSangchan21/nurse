import 'dart:typed_data';
import '../../api/base_repository.dart';
import '../../helper/getImg.dart';
import '../../model/patienResponse.dart';
import '../../model/profileUserResponse.dart';
import 'package:rxdart/rxdart.dart';

import '../../povider/login_repository.dart';
import '../../povider/register_repository.dart';

class PatientBloc {
  final RegisterRepository _registerRepository =
      RegisterRepository(BaseRepository.instance);
  final LoginRepository _loginRepository =
      LoginRepository(BaseRepository.instance);
  final BehaviorSubject<ProfileUserResponse> _profilePathSubject =
      BehaviorSubject<ProfileUserResponse>();
  BehaviorSubject<ProfileUserResponse> get profilePathSubject =>
      _profilePathSubject;
  final BehaviorSubject<List<PatientResponse>> _getDataPathSubject =
      BehaviorSubject<List<PatientResponse>>();
  BehaviorSubject<List<PatientResponse>> get getDataPathSubject =>
      _getDataPathSubject;

  getprofileUser() async {
    var response = await _loginRepository.getprofileUser();
    response.when(
        success: (ProfileUserResponse data) {
          fetchUserList(data.id.toString());
          //  _profilePathSubject.sink.add(data);
        },
        failure: (message) {},
        error: (error) {});
  }

  List<BehaviorSubject<Uint8List>> imgProfile = [];

  fetchUserList(id) async {
    var response = await _registerRepository.fetchPatienList();
    response.when(
        success: (List<PatientResponse> data) {
          List<PatientResponse> dataUser = [];
          data.forEach((element) {
            if (element.userId.toString() == id) {
              dataUser.add(element);
              BehaviorSubject<Uint8List> _getImgPathSubject =
                  BehaviorSubject<Uint8List>();
              imgProfile.add(_getImgPathSubject);
            }
          });
          int i = 0;
          data.forEach((element) {
            if (element.userId.toString() == id) {
              callImg(element.id.toString(), imgProfile[i]);
              i++;
            }
          });

          _getDataPathSubject.sink.add(dataUser);
        },
        failure: (message) {},
        error: (error) {});
  }

  String convertData(String positionID) {
    if (positionID == '1') {
      return "หัวหน้าพยาบาล";
    } else if (positionID == '2') {
      return "พยาบาล";
    } else {
      return "หัวหน้าพยาบาล";
    }
  }
}
