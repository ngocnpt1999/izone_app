import 'package:get/get.dart';
import 'package:izone_app/model/database.dart';

class ListMemberController extends GetxController {
  ListMemberController() {
    getData();
  }

  var listMember = List<Member>().obs;

  getData() async {
    listMember.addAll(await DataAccess().getListMember());
  }
}

class ListAlbumController extends GetxController {
  ListAlbumController() {
    getData();
  }

  var listAlbum = List<String>().obs;
  var mapAlbums = Map<String, List<Single>>().obs;

  getData() async {
    DataAccess()
        .getListAlbum()
        .then((value) => listAlbum.addAll(value))
        .whenComplete(() {
      listAlbum.forEach((value) async {
        mapAlbums[value] = await DataAccess().getListSingle(value);
      });
    });
  }
}
