import 'package:botbridge_green/Model/Status.dart';
import 'package:flutter/material.dart';
import '../../Model/ApiInterface.dart';
import '../Model/ApiResponse.dart';
import '../Model/Response/AppoitmentAndRequestData.dart';


class AppointmentListVM extends ChangeNotifier{

  final _myRepo = ApiInterface();

  ApiResponse<AppointmentAndRequestData> listCart = ApiResponse.loading();

  ApiResponse<AppointmentAndRequestData> get getAppointmentAndRequest=> listCart;

  setAppointmentData(ApiResponse<AppointmentAndRequestData> response) {
    print("Response :: $response");
 if (response.status == Status.Completed) {
    print("Data :: ${response.data?.lstPatientResponse}");
  }    listCart = response;
    notifyListeners();
  }

  Future<void> fetchAppointmentDetails(Map<String,dynamic> params) async {
    setAppointmentData( ApiResponse.loading());
    _myRepo.getAppointmentAndRequest(params)
        .then((value) {
      return 
      setAppointmentData( ApiResponse.completed(value));
    })
        .onError((error, stackTrace) {
      return setAppointmentData(ApiResponse.error(error.toString()));
    });
  }

}
