import 'package:whoo/utils.dart';

class MessageModel {
  UserModel sender;
  String msg;
  MessageModel({this.sender, this.msg});
}
class UserModel {
  int ID;
  String name;
  UserModel({this.ID, this.name});
}