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
  double _currentPageViewIndex = 0;
  Color _nextColor = Color(0xffEE5522);
  String _nextButtonString = 'Next';

  void changeNextButtonTextAndColor(int page) {
    // _currentPageViewIndex = page.toDouble();
    switch (page) {
      case 2:_nextButtonString = 'Join Now!'; _nextColor = Theme.of(context).accentColor.withOpacity(0.9); break;
      default: _nextButtonString = 'Next';_nextColor = Theme.of(context).primaryColor; break;
    }
  }

  void cancelButtonEvent(context) => _currentPageViewIndex > 0 ? _pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn) :Navigator.pop(context);

  void _moveToNextPage() => _pageController.animateToPage(_pageController.page!.toInt() + 1,duration: Duration(milliseconds: 200),curve: Curves.easeIn);

  void nextButtonEvent(context) {
    switch (_pageController.page!.toInt()) {
      case 0: case 1: _moveToNextPage();break;
      case 2: {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DatingMain()));
      }break;
    }
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPageViewIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  Widget _pageViewIndicator(int location) {
    return Expanded(
      child: Divider(
        height: 1.h,
        thickness: 5.sp,
        color: location - 1 <= _currentPageViewIndex &&
                _currentPageViewIndex < location
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
                    onPageChanged: (int page) => setState(() => changeNextButtonTextAndColor(page)),
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
                        onPressed: ()=> cancelButtonEvent(context),
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
                        onPressed: ()=> nextButtonEvent(context),
                        child: Text(
                          _nextButtonString,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        color: _nextColor,
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
