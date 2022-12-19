class ChatModel {
  String name;
  String currentmessge;
  String time;
  String icon;
  bool isGroup;
  String status;
  bool isSelect = false;
  ChatModel({
    this.name = " ",
    this.currentmessge = " ",
    this.time = "  ",
    this.icon = "person_black_36dp.svg",
    this.isGroup = false,
    this.status = " ",
    this.isSelect = false,
  });
}
