import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_misfit/controllers/user_controllers.dart';

import 'package:flutter_task_misfit/models/user_model.dart';
import 'package:flutter_task_misfit/view/each_user_details.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AllUserPage extends StatefulWidget {
  @override
  _AllUserPageState createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {

  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
        ),
        body: Obx((){
          if(userController.isLoading.value){
            return new Center(
                child: CircularProgressIndicator()
            );
          }
          else{
            return Container(
              width: screenSize.width,
              height: screenSize.height,
              child: new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: userController.userList[0].blogs.length,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EachUserDetailsPage(
                                  userController.userList[0].blogs[index].author.name,
                                  userController.userList[0].blogs[index].author.avatar,
                                  userController.userList[0].blogs[index].author.profession,
                                  userController.userList[0].blogs[index].title,
                                  userController.userList[0].blogs[index].description,
                                  userController.userList[0].blogs[index].id.toString(),
                                  userController.userList[0].blogs[index].categories,
                                )));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          width: 150,
                          height: 150,
                          alignment: Alignment.topLeft,
                          child: Card(
                            child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl:userController.userList[0].blogs[index].coverPhoto,
                                placeholder: (context, url) =>
                                    Container(
                                        width:
                                        14,
                                        height:
                                        10,
                                        child: Center(
                                            child: new CircularProgressIndicator()
                                        )
                                    ),
                                errorWidget: (context, url, error) => new Icon(Icons.error)
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            );
          }
        }),
      ),
    );
  }
}