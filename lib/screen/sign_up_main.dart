import '../utils.dart';
import '../screens.dart';
import '../widgets.dart';

class SignUpMain extends StatefulWidget {
  static String screenId = 'register';
  @override
  _SignUpMainState createState() => _SignUpMainState();
}

class _SignUpMainState extends State<SignUpMain> {
  final PageController _pageController = PageController();
  double _currrentPageViewIndex = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currrentPageViewIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  Widget _pageViewIndicator(int location) {
    return Expanded(
      child: Divider(
        height: 1.h,
        thickness: 5.sp,
        color: location - 1 <= _currrentPageViewIndex &&
                _currrentPageViewIndex < location
            ? Colors.white.withOpacity(0.8)
            : Colors.white.withOpacity(0.4),
        indent: 1.sp,
        endIndent: 1.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset(
      'images/accord.svg',
      fit: BoxFit.cover,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            //svg image
            svg,
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  child: Row(
                    children: [
                      _pageViewIndicator(1),
                      _pageViewIndicator(2),
                      _pageViewIndicator(3),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      SignUpForm(),
                      SignUpImages(),
                      SignUpIntrests(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //*Cancel
                      MaterialButton(
                        onPressed: (){},
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp)),
                        padding: EdgeInsets.all(5.sp),
                        minWidth: 35.w,
                        splashColor: Theme.of(context).primaryColor,
                      ),
                      //*Next
                      MaterialButton(
                        onPressed: (){},
                        child: Text(
                          'Next',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp)),
                        padding: EdgeInsets.all(5.sp),
                        minWidth: 55.w,
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                ), //svg image
              ],
            ),
          ],
        ),
      ),
    );
  }
}
