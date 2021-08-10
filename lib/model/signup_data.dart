import '../utils.dart';

//Signup data model

class SignUpData {
  final IconData icon;
  final String iconDataType;
  final Color buttonColor;

  SignUpData({
    required this.icon,
    required this.iconDataType,
    required this.buttonColor,
  });
}

//*List for SignUpData
List<SignUpData> signupDataList = [
  SignUpData(
    icon: FontAwesomeIcons.solidEnvelope,
    iconDataType: 'Email',
    buttonColor: Color(0xffEE5522),
  ),
  SignUpData(
      icon: FontAwesomeIcons.facebookF,
      iconDataType: 'Facebook',
      buttonColor: Colors.blue),
  SignUpData(
      icon: FontAwesomeIcons.google,
      iconDataType: 'Google',
      buttonColor: Colors.red),
  SignUpData(
      icon: FontAwesomeIcons.apple,
      iconDataType: 'Apple',
      buttonColor: Colors.black),
];