class item_model {
  String? id;

  item_model({
    id,
  });

  item_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}
