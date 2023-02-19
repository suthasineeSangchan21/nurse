import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/patienResponse.dart';
import '../../model/profileUserResponse.dart';
import '../../theme/color.dart';
import '../component/imageCircleView.dart';
import '../component/textThreeLineView.dart';
import '../timeline/TimeLineScreen.dart';
import 'PatientBloc.dart';

class PatientPage extends StatefulWidget {
  PatientPage();
  @override
  State<PatientPage> createState() => _HomePageState();
}

class _HomePageState extends State<PatientPage> {
  var patientBloc = PatientBloc();

  bool isCheck = false;
  @override
  void initState() {
    patientBloc.getprofileUser();
    super.initState();
  }

  final BehaviorSubject<Uint8List> _getDataPathSubject =
      BehaviorSubject<Uint8List>();
  BehaviorSubject<Uint8List> get getDataPathSubject => _getDataPathSubject;
  late Uint8List img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.colorBgLight,
        body: Stack(children: [
          Image.asset(
            'assets/images/bg_home.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SafeArea(
                  child: Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: _SearchView())))
        ]));
  }

  Widget _SearchView() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _searchview(),
                // ignore: prefer_const_constructors
                // SizedBox(
                //   width: 10,
                // ),
                // buttonIconView(
                //   border: 6,
                //   color: AppColor.colorPrimaryLight,
                //   icon: Icons.filter_list_outlined,
                //   text: 'ตัวกรอง',
                // )
              ]),
          Container(
              height: MediaQuery.of(context).size.height * 0.75,
              margin: const EdgeInsets.only(top: 10),
              child: StreamBuilder<List<PatientResponse>>(
                  stream: patientBloc.getDataPathSubject.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _listPatienView(snapshot.data!);
                    } else {
                      return Container();
                    }
                  })),
        ],
      ),
    );
  }

  Widget _listPatienView(List<PatientResponse> data) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return searchController.text == "" ||
                  data[index]
                      .firstName
                      .toString()
                      .contains(searchController.text) ||
                  data[index]
                      .lastName
                      .toString()
                      .contains(searchController.text)
              ? _cardPatienView(data[index], patientBloc.imgProfile[index])
              : Container();
        });
  }

  TextEditingController searchController = TextEditingController();
  Widget _searchview() {
    return Container(
        height: 35,
        width: MediaQuery.of(context).size.width * 0.87,
        // ignore: prefer_const_constructors
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            elevation: 2.0,
            shadowColor: Colors.white,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  labelText: "ค้นหา",
                  hintText: "ค้นหา",
                  labelStyle:
                      TextStyle(fontSize: 14.0, color: AppColor.colorGrayLight),
                  hintStyle:
                      TextStyle(fontSize: 14.0, color: AppColor.colorGrayLight),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.colorGrayLight,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            )));
  }

  Widget _cardPatienView(PatientResponse data, getImgPathSubject) {
    return Container(
        margin: EdgeInsets.only(right: 5),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColor.colorGrayBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                height: 70,
                child: Stack(
                  children: [
                    InkWell(
                        onTap: (() {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return TimeLineScreen(data.id.toString());
                              },
                            ),
                            (_) => false,
                          );
                        }),
                        child: Row(children: [
                          _imageCircleView(
                              45, data.nickName!, false, getImgPathSubject),
                          textThreeLineView(
                            fontSize: 10,
                            isLeft: true,
                            txt1: data.hn.toString(),
                            txt2: data.title.toString() +
                                " " +
                                data.firstName.toString() +
                                "  " +
                                data.lastName.toString(),
                            txt3: data.gender.toString() +
                                " " +
                                data.age.toString() +
                                " ปี" +
                                " | " +
                                "โรคประจำตัว ",
                          )
                        ])),
                  ],
                ))));
  }

  Widget _imageCircleView(
      double size, String txt, bool status, getImgPathSubject) {
    return StreamBuilder<Uint8List>(
        stream: getImgPathSubject.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.only(top: 10, left: 5, bottom: 5, right: 5),
                child: imageCircleView(
                    size: 50,
                    fontsize: MediaQuery.of(context).size.width * 0.01,
                    status: false,
                    text: "",
                    subtitle: '',
                    image: snapshot.data));
          } else {
            return Padding(
                padding: EdgeInsets.only(top: 10, left: 5, bottom: 5, right: 5),
                child: imageCircleView(
                    size: 50,
                    fontsize: MediaQuery.of(context).size.width * 0.01,
                    status: false,
                    text: "",
                    subtitle: '',
                    image: snapshot.data));
          }
        });
  }
}
