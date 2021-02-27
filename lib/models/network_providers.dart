class Network {
  int id;
  String name;
  String code;

  Network(this.id, this.name);
  Network.fromMap(Map<String, dynamic> data) {
    code = data['Code'];
    name = data['Name'];
  }
}
