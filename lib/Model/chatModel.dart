class chatModel {
  final String name;
  final bool isGroup;
  final String desc;
  final String time;
  final String icon;
  final String status;
  bool selected = false;
  chatModel(
      {this.desc, this.icon, this.isGroup, this.name, this.time, this.status,this.selected=false});
}
