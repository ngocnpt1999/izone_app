import 'package:firebase_database/firebase_database.dart';

class Member {
  int id;
  String fullName;
  String nickName;
  String birthday;
  String height;
  String weight;
  String bloodType;
  String avatar;
  List<String> imagesUri = [];
  List<String> listRole = [];

  Member(Map map) {
    this.id = map["ID"];
    this.fullName = map["FullName"];
    this.nickName = map["NickName"];
    this.birthday = map["Birthday"];
    this.height = map["Height"];
    this.weight = map["Weight"];
    this.bloodType = map["BloodType"];
    this.avatar = map["Avatar"];
    this.imagesUri = map["ImagesUri"].cast<String>();
    this.listRole = map["ListRole"].cast<String>();
  }
}

class Single {
  int id;
  String name;
  String ytbID;

  Single(Map map) {
    this.id = map["ID"];
    this.name = map["Name"];
    this.ytbID = map["YtbID"];
  }
}

class DataAccess {
  static final DataAccess _singleton = DataAccess._internal();

  factory DataAccess() {
    return _singleton;
  }

  DataAccess._internal();

  Future<List<Member>> getListMember() async {
    var db =
        await FirebaseDatabase.instance.reference().child("Members").once();
    print(db.value);
    List<Member> members = List();
    Map map = db.value;
    map.entries.forEach((element) {
      members.add(Member(element.value));
    });
    print(members.length);
    members.sort((a, b) => a.id.compareTo(b.id));
    return members;
  }

  Future<List<String>> getListAlbum() async {
    var db =
        await FirebaseDatabase.instance.reference().child("Singles").once();
    print(db.value);
    List<String> albums = List();
    Map map = db.value;
    map.entries.forEach((element) {
      albums.add(element.key);
    });
    return albums;
  }

  Future<List<Single>> getListSingle(String album) async {
    var db = await FirebaseDatabase.instance
        .reference()
        .child("Singles/" + album)
        .once();
    print(db.value);
    List<Single> singles = List();
    Map map = db.value;
    map.entries.forEach((element) {
      singles.add(Single(element.value));
    });
    singles.sort((a, b) => a.id.compareTo(b.id));
    return singles;
  }
}
