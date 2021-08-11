import 'package:accord/screen/home.dart';

import 'utils.dart';
import 'screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Accord App',
          theme: ThemeData(
            primaryColor: Color(0xffEE5522), // Second `const` is
            accentColor: Color(0xffFFBB33), // optional in assignments.\
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
              subtitle1: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              bodyText1: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
            checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.sp),
              ),
            ),
              unselectedWidgetColor: Colors.white.withOpacity(0.8),
              disabledColor: Colors.white.withOpacity(0.4),
          ),
          initialRoute: Home.screenId,
          routes: {
            Home.screenId:(context)=>Home(),
            SignUpMain.screenId:(context)=>SignUpMain(),
          },
        );
      },
    );
  }
}

