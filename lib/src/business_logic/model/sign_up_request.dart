class SignUpRequest {
  String? fullName;
  String? email;
  String? address;
  String? mobile;
  String? password;
  String? token;

  SignUpRequest({this.fullName, this.email, this.address, this.mobile, this.password, this.token});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fullName'] = fullName;
    data['email'] = email;
    data['address'] = address;
    data['mobile'] = mobile;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
