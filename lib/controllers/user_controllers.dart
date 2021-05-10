import 'dart:convert';
import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter_task_misfit/models/user_model.dart';
import 'package:flutter_task_misfit/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController{

  var userList = List<UserModel>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await  fetchUserData();
    });
    super.onInit();
  }

  void fetchUserData() async{
    try{
      isLoading(true);
      var data = await RemoteService.fetchUserData();
      //print("Products : ${products[0]["items"]}");
      if(data != null)
      {
        userList.assign(data);
      }
    }finally{
      isLoading(false);
    }
  }

}