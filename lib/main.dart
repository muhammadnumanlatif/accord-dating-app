import 'utils.dart';

void main() {
  runApp(MyApp());
}

//*Signup data model
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

//*Userdata list
class UserData {
  final String userName;
  final int userAge;
  final String userIntro;
  final String userImageUrl;
  final List<String> userIntrestingList;

  UserData({
    required this.userImageUrl,
    required this.userName,
    required this.userAge,
    required this.userIntro,
    required this.userIntrestingList,
  });
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
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
              size: 25.sp,
            ),
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );

  // final SwiperController _swiperController = SwiperController();
  //*List for UserData
  List<UserData> _userData = [
    UserData(
        userName: 'Mona',
        userAge: 42,
        userIntro: 'I am honest person',
        userImageUrl:
            'https://cdn-0.generatormix.com/images/thumbs/random-instagrammers.jpg',
        userIntrestingList: ['Horse Riding', 'Travel']),
    UserData(
        userName: 'Rob',
        userAge: 25,
        userIntro: 'I am stylish boy',
        userImageUrl:
            'https://cdn-0.generatormix.com/images/thumbs/random-comedians.jpg',
        userIntrestingList: ['Travel', 'Sports']),
    UserData(
        userName: 'Ana',
        userAge: 33,
        userIntro: 'I am athletic lady',
        userImageUrl:
            'https://cdn-0.generatormix.com/images/thumbs/random-volleyball-players.jpg',
        userIntrestingList: ['Running', 'High Jump']),
    UserData(
        userName: 'Mike',
        userAge: 35,
        userIntro: 'I am music creator',
        userImageUrl:
            'https://cdn-0.generatormix.com/images/thumbs/random-musicians.jpg',
        userIntrestingList: ['Guitar', 'Jazz']),
    UserData(
        userName: 'Smith',
        userAge: 28,
        userIntro: 'I am the Rock Star',
        userImageUrl:
            'https://cdn-0.generatormix.com/images/thumbs/random-pop-singers.jpg',
        userIntrestingList: ['Jazz', 'Rock']),
  ];
  //*List for SignUpData
  List<SignUpData> _signupDataList = [
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                  _customDivider(context, 'Accord - Meet your Destiny'),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Expanded(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 77.h,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).accentColor,
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
                                    imageUrl: _userData[index].userImageUrl,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,

                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Theme.of(context).accentColor.withOpacity(0.2),
                                                  BlendMode.lighten),),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) => Container(
                                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height*0.77,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context).primaryColor,
                                                  ),
                                              ),
                                          ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                                        _userData[index].userName,
                                        style: Theme.of(context)
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
                                            _userData[index].userAge.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                  //*about
                                  Text(
                                    _userData[index].userIntro,
                                    style: Theme.of(context)
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
                                    children: _userData[index]
                                        .userIntrestingList
                                        .map((intrest) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 2.sp),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                4.sp, 3.sp, 4.sp, 3.sp),
                                            child: Text(
                                              intrest,
                                              style: Theme.of(context)
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
                        );
                      },
                      itemCount: _userData.length,
                      itemWidth: 90.w,
                      itemHeight: 85.h,
                      layout: SwiperLayout.STACK,
                      controller: _swiperController,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  _customDivider(context, 'Join Now'),
                  //login Buttons block
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _signupDataList.map(_customSignUpButton).toList(),
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

  Padding _customSignUpButton(SignUpData signUpData) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.sp),
      child: Column(
        children: [
          //*Email
          RawMaterialButton(
            onPressed: () {},
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

  Row _customDivider(BuildContext context, String title) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.sp,
            color: Colors.white,
            indent: 12.sp,
            endIndent: 15.sp,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Expanded(
          child: Divider(
            thickness: 1.sp,
            color: Colors.white,
            indent: 15.sp,
            endIndent: 12.sp,
          ),
        ),
      ],
    );
  }
}
