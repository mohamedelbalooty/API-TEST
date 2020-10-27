class LoginModel {
  String state;
  String msg;
  Data data;

  LoginModel({this.state, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String apiToken;
  Client client;

  Data({this.apiToken, this.client});

  Data.fromJson(Map<String, dynamic> json) {
    apiToken = json['api_token'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_token'] = this.apiToken;
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    return data;
  }
}

class Client {
  int id;
  String username;
  String phone;
  int activity;
  String date;

  Client({this.id, this.username, this.phone, this.activity, this.date});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
    activity = json['activity'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['activity'] = this.activity;
    data['date'] = this.date;
    return data;
  }
}
