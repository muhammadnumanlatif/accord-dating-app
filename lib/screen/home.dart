import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';

import '/model/user_data.dart';

class Home extends StatefulWidget {
  static String screenId = 'home';

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );

  final SwiperController _swiperController = SwiperController();
  Timer? _timer;

  @override
  void initState() {
    if (mounted) {
      _startTimer();
    }
    super.initState();
  }

  void _startTimer() {
    _timer = new Timer.periodic(const Duration(milliseconds: 3400), (timer) {
      _swiperController.next();
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            //svg image
            svg,
            //*body
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1.5.h,
                  ),
                  //Placeholder
                  //*Custom Divider
                  CustomDivider(title: 'Accord - Meet your Destiny'),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Expanded(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () =>
                              Navigator.pushNamedAndRemoveUntil(
                                  context, SignUpMain.screenId, (
                                  route) => false),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: 77.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme
                                            .of(context)
                                            .accentColor
                                            .withOpacity(0.8),
                                        offset: Offset(2, 2),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1.5.sp,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.sp),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25.sp),
                                    child: CachedNetworkImage(
                                      imageUrl: userData[index].userImageUrl,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Theme
                                                      .of(context)
                                                      .accentColor
                                                      .withOpacity(0.2),
                                                  BlendMode.lighten),
                                            ),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) =>
                                          Container(
                                            transform: Matrix4
                                                .translationValues(
                                                0.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  0.77,
                                              child: Center(
                                                child: CircularProgressIndicator(
                                                  valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Theme
                                                        .of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      width: double.infinity,
                                      height: 77.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 25.sp,
                                bottom: 25.sp,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        //*name
                                        Text(
                                          userData[index].userName,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(shadows: [
                                            Shadow(
                                              color: Colors.grey,
                                              blurRadius: 1.0,
                                              offset: Offset(0.6, 0.6),
                                            ),
                                          ]),
                                        ),
                                        //*age
                                        Text(
                                          ', ' +
                                              userData[index]
                                                  .userAge
                                                  .toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    //*about
                                    Text(
                                      userData[index].userIntro,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(shadows: [
                                        Shadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          offset: Offset(0.6, 0.6),
                                        ),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    //*intrest
                                    Wrap(
                                      children: userData[index]
                                          .userIntrestingList
                                          .map((intrest) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 2.sp),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4.sp, 3.sp, 4.sp, 3.sp),
                                              child: Text(
                                                intrest,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: userData.length,
                      itemWidth: 90.w,
                      itemHeight: 85.h,
                      layout: SwiperLayout.STACK,
                      controller: _swiperController,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  CustomDivider(title: 'Join Now'),
                  //login Buttons block
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: signupDataList.map((e) {
                      return CustomSignUpButton(
                        signUpData: e,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}