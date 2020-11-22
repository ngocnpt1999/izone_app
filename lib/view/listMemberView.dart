import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izone_app/controller/stateController.dart';
import 'package:izone_app/view/memberDetailView.dart';
import 'package:transparent_image/transparent_image.dart';

class ListMemberView extends StatelessWidget {
  ListMemberView();

  final ListMemberController _stateController = ListMemberController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Obx(() {
            if (_stateController.listMember.length == 0) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  _stateController.listMember.length,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(MemberDetailView(
                          _stateController.listMember[index].imagesUri));
                    },
                    child: Card(
                      elevation: 2.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: _stateController.listMember[index].avatar,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              _stateController.listMember[index].nickName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
