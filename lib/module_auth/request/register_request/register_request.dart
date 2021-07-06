
class RegisterRequest {
  String fullName;
  String email;
  String password;
  String confirmPassword;
  RegisterRequest({this.fullName, this.email,this.password,this.confirmPassword});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    password = json['email'];
    email = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fullName"] = this.fullName;
    data["email"] = this.email;
    data["password"] = this.password;
    data["confirmPassword"] = this.confirmPassword;
    return data;
  }
}
