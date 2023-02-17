import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:screenshot/screenshot.dart';
import '../../../model/ShowerResponse.dart';
import '../../../model/drugUserResponse.dart';
import '../../../model/patienResponse.dart';
import 'package:http/http.dart' as http;

import '../../../model/timelineResponse.dart';
import '../../helper/getImg.dart';
import '../../theme/color.dart';
import 'package:share_plus/share_plus.dart';

import '../api/base_repository.dart';
import '../component/dialog/loadDialog.dart';
import '../component/dialog/popup.dart';
import '../component/imageCircleView.dart';
import '../helper/DateHelper.dart';
import '../helper/Image_picker_helper.dart';
import '../model.dart';
import '../model/BloodResponse.dart';
import '../model/personalResponse.dart';
import '../model/sickListResponse.dart';
import '../model/sickResponse.dart';
import '../povider/register_repository.dart';
import 'RegisterHistoryBloc.dart';
import 'TimeLineBloc.dart';

class RegisterHistoryBloc {
  final RegisterRepository _registerRepository =
      RegisterRepository(BaseRepository.instance);
  List<dropdownData> dataDisease = [];
  List<dropdownData> dataDrug = [];
  List<dropdownData> userDisease = [];
  List<historyMedicine> userMedicine = [];
  List<bool> checkBoxData = [false, false, false, false];
  List<String> checkBoxDataName = ["เดิน", "Wheelchair", "Stretcher", "อื่นๆ"];
  List<bool> questionData = [false, false, false, false];
  var profileImageFile = <Uint8List>[];
  TextEditingController historyController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController referController = TextEditingController();
  TextEditingController painController = TextEditingController();
  TextEditingController painLevelController = TextEditingController();
  final BehaviorSubject<SickResponse> _sendDataPathSubject =
      BehaviorSubject<SickResponse>();
  BehaviorSubject<SickResponse> get sendDataPathSubject => _sendDataPathSubject;

  final BehaviorSubject<PatientResponse> _getDataPathSubject =
      BehaviorSubject<PatientResponse>();
  BehaviorSubject<PatientResponse> get getDataPathSubject =>
      _getDataPathSubject;
  final BehaviorSubject<Uint8List> _getImgPathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get getImgPathSubject => _getImgPathSubject;

  final BehaviorSubject<Uint8List> _imageProfilePathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get imageProfilePathSubject =>
      _imageProfilePathSubject;
  final BehaviorSubject<Uint8List> _imageProfile2PathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get imageProfile2PathSubject =>
      _imageProfile2PathSubject;

  final BehaviorSubject<PersonalResponse> _getPersonalDataPathSubject =
      BehaviorSubject<PersonalResponse>();
  BehaviorSubject<PersonalResponse> get getPersonalDataPathSubject =>
      _getPersonalDataPathSubject;

  final BehaviorSubject<List<SickListResponse>> _sickListDataPathSubject =
      BehaviorSubject<List<SickListResponse>>();
  BehaviorSubject<List<SickListResponse>> get sickListDataPathSubject =>
      _sickListDataPathSubject;

  addUserMedicine() {
    var value = historyMedicine();
    userMedicine.add(value);
  }

  fetchDisease() async {
    var response = await _registerRepository.fetchDisease();
    response.when(success: (List<BloodResponse> data) {
      print(data.toString());
      dataDisease.clear();
      data.forEach((element) {
        var model = dropdownData();
        model.id = element.id.toString();
        model.name = element.name.toString();
        dataDisease.add(model);
      });
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  fetchUser() async {
    var response = await _registerRepository.fetchPatien();
    response.when(success: (PatientResponse data) {
      print(data.toString());
      _getDataPathSubject.sink.add(data);
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  getPatientData() async {
    var response = await _registerRepository.getPersonalData();
    response.when(success: (PersonalResponse data) {
      _getPersonalDataPathSubject.sink.add(data);
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  fetchDrugGroup() async {
    var response = await _registerRepository.fetchDrugGroup();
    response.when(success: (List<BloodResponse> data) {
      print(data.toString());
      dataDrug.clear();
      data.forEach((element) {
        var model = dropdownData();
        model.id = element.id.toString();
        model.name = element.name.toString();
        dataDrug.add(model);
      });
    }, failure: (message) {
      //   _bloodPathSubject.sink.addError(message);
    }, error: (error) {
      //  _bloodPathSubject.sink.addError(error);
    });
  }

  openCamera(id) async {
    var imageByte = await showCameraResize();
    if (imageByte != null) {
      //  profileImageFile.add(imageByte);
      if (id == 1) {
        _imageProfilePathSubject.sink.add(imageByte);
      } else {
        _imageProfile2PathSubject.sink.add(imageByte);
      }
    }
  }

  openImagePicker(id) async {
    var imageByteList = await showImagePicker(1);
    if (imageByteList.isNotEmpty) {
      //  profileImageFile.add(imageByteList[0]);

      if (id == 1) {
        _imageProfilePathSubject.sink.add(imageByteList[0]);
      } else {
        _imageProfile2PathSubject.sink.add(imageByteList[0]);
      }
    }
  }

  bool checkbox() {
    bool check = false;
    checkBoxData.forEach((element) {
      if (element) {
        check = element;
      }
    });
    return check;
  }

  setData(context) {
    if ((checkBoxData[3] && otherController.text == "") || !checkbox()) {
    } else {
      var sickData = SickData();
      sickData.Ventilator = questionData[0];
      sickData.pressureSores = questionData[1];
      sickData.neckPiercing = questionData[2];
      sickData.phlegm = questionData[3];
      sickData.patientId = 15;
      sickData.sick = historyController.text;
      sickData.referForm = referController.text;
      int s = 0;
      for (int i = 0; i <= checkBoxData.length - 1; i++) {
        if (checkBoxData[i]) {
          s++;
          if (s > 1) {
            sickData.howToMove = sickData.howToMove + "," + checkBoxDataName[i];
          } else {
            sickData.howToMove = checkBoxDataName[i];
          }
        }
      }
      sickData.howToMoveOther = otherController.text;
      sendPatientData(sickData, context);
    }
  }

  sendPatientData(sickData, context) async {
    loadDialog(context);
    var response = await _registerRepository.postSick(sickData);
    response.when(success: (SickResponse data) {
      Navigator.pop(context);
      _sendDataPathSubject.sink.add(data);
    }, failure: (message) {
      Navigator.pop(context);
      popup(context, message);
    }, error: (error) {
      Navigator.pop(context);
      popup(context, error.toString());
    });
  }

  getSick() async {
    var response = await _registerRepository.getSick();
    response.when(
        success: (List<SickListResponse> data) {
          historyController.text = data[data.length - 1].sick.toString();
          referController.text = data[data.length - 1].referForm.toString();
          otherController.text =
              data[data.length - 1].howToMoveOther.toString();
          questionData[0] = data[data.length - 1].ventilator!;
          questionData[1] = data[data.length - 1].pressureSores!;
          questionData[2] = data[data.length - 1].neckPiercing!;
          questionData[3] = data[data.length - 1].phlegm!;
          int i = 0;
          checkBoxDataName.forEach((element) {
            var index = data[data.length - 1]
                .howToMove!
                .toLowerCase()
                .toLowerCase()
                .indexOf(element.toLowerCase(), 0);
            if (index != -1) {
              checkBoxData[i] = true;
            }
            i++;
          });

          _sickListDataPathSubject.sink.add(data);
        },
        failure: (message) {},
        error: (error) {});
  }
}

class historyMedicine {
  String medicineGroup = '';
  String medicineGroupName = '';
  TextEditingController medicineName = TextEditingController();
}

class painDate {
  late Uint8List? profileImageFile1 = null;
  late Uint8List? profileImageFile2 = null;
  String painName = '';
  int grade = 0;
}

class SickData {
  int patientId = 0;
  String sick = '';
  String referForm = '';
  String howToMove = '';
  String howToMoveOther = '';
  bool Ventilator = false;
  bool pressureSores = false;
  bool neckPiercing = false;
  bool phlegm = false;
}