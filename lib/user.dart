class UserModel {
  final int id;
  final String name;
  final double weight;

  UserModel(this.id, this.name, this.weight);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "weight": weight};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['id'], json['name'], json['weight']);
  }
}
