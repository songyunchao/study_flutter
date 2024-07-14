class Owner{
  String? name;
  String?face;
  int?fans;

  Owner({this.name,this.face,this.fans});

//   将map 转换成对象
  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    face = json['face'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['face'] = face;
    data['fans'] = fans;
    return data;
  }
}