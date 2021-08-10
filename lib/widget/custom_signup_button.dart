
import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';

class CustomSignUpButton extends StatelessWidget {
  CustomSignUpButton({Key? key, required this.signUpData}) : super(key: key);
  final SignUpData signUpData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.sp),
      child: Column(
        children: [
          //*Email
          RawMaterialButton(
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(
                    context, SignUpMain.screenId, (route) => false),
            child: Icon(
              signUpData.icon,
              color: signUpData.buttonColor,
            ),
            shape: CircleBorder(),
            elevation: 2,
            fillColor: Colors.white,
            padding: EdgeInsets.all(5.sp),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.sp),
            child: Text(
              signUpData.iconDataType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}