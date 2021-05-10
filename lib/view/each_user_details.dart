import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_misfit/controllers/user_controllers.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class EachUserDetailsPage extends StatefulWidget {

  String authorName="",authorAvatar="",authorProfession="",title="",description="",id="";
  List<String>categories;
  EachUserDetailsPage(this.authorName,this.authorAvatar,this.authorProfession,this.title,this.description,this.id,this.categories);

  @override
  _EachUserDetailsPageState createState() => _EachUserDetailsPageState();
}

class _EachUserDetailsPageState extends State<EachUserDetailsPage> {

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
          title: Text(widget.authorName),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                width: screenSize.width,
                height: screenSize.height/4,
                child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.authorAvatar,
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
              SizedBox(height: 10,),
              new Text(widget.title),
              SizedBox(height: 10,),
              new Text(widget.description),
              SizedBox(height: 10,),
              new Text(widget.authorName),
              SizedBox(height: 5,),
              new Text(widget.authorProfession),
              SizedBox(height: 10,),
              new ListView.builder(
                shrinkWrap: true,
                 scrollDirection: Axis.vertical,
                  itemCount: widget.categories.length,
                  itemBuilder: (context,index){
                    return new Text(widget.categories[index]);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}