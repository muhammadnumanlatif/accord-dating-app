import '../../utils.dart';

enum GenderEnum { man, woman }

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GenderEnum _userGender = GenderEnum.man;
  String _birthdayString = 'Select Your birthday';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  'Type Your Information',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              //*name
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                  labelText: 'Type your Name',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  hintText: 'Name is required',
                  hintStyle: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              //*divider
              customDivider(),
              //*gender
              Row(
                children: [
                  Icon(
                    Icons.wc,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                  _genderRadioWithText(GenderEnum.man),
                  SizedBox(
                    width: 5.w,
                  ),
                  _genderRadioWithText(GenderEnum.woman),
                ],
              ),
              //*divider
              customDivider(),
              //*DOB
              Row(
                children: [
                  Icon(
                    Icons.cake,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  //*button
                  MaterialButton(
                    onPressed: () => _selectBirthday(),
                    child: Text(
                      _birthdayString,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp)),
                    padding: EdgeInsets.all(5.sp),
                    minWidth: 75.w,
                    splashColor: Colors.white,
                  ),
                ],
              ),
              //*divider
              customDivider(),
            ],
          ),
        ),
      ),
    );
  }

  //*divider method
  Column customDivider() {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        Divider(
          color: Colors.white,
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  //*gender widget
  Widget _genderRadioWithText(GenderEnum value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _userGender,
          onChanged: (value) => _updateGenderState,
          activeColor: Colors.white.withOpacity(0.8),
        ),
        GestureDetector(
          onTap: () => _updateGenderState(value),
          child: Text(
            value == GenderEnum.man ? 'Man' : 'Woman',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }

  //*gender method
  void _updateGenderState(GenderEnum value) {
    setState(() {
      _userGender = value;
    });
  }

  //*birthday method
  Future<void> _selectBirthday() async{

  }
}
