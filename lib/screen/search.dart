import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';
import '/model/const_data.dart';
import '/model/user_profile_common.dart';
import '/model/user_data.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with userProfileCommon,WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );
  bool? _isLike;
  int _currentIndex = 0;
  double _xPosition = 0.0;
  PageController? _pageController;
  CardController controller = CardController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return dummyUserDataListInSearch.length == _currentIndex ? Stack(

      children: [
      svg,
        Center(child: Text('No users!')),
      ],
    ) :
    Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height*0.88,
            width: MediaQuery.of(context).size.width*1.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: SwipeCard(
              orientation: AmassOrientation.LEFT,
              totalNum: dummyUserDataListInSearch.length,
              stackNum: 3,
              swipeEdge: 4.0,
              maxWidth: 90.w,
              maxHeight: 85.h,
              minWidth: 84.w,
              minHeight:70.h,
              cardController: cardController,
              cardBuilder: (context,index){
                return Stack(
                  children: <Widget>[
                    PageView(
                      controller: _pageController = PageController(initialPage: 0),
                      children: _userProfile(size, index),
                      scrollDirection: Axis.vertical,
                    ),
                    Positioned(
                      top:54,
                      right:36,
                      child: _isLike != null && !_isLike! && index == _currentIndex?
                      _likeOrDislikeIconOnPhoto(FontAwesomeIcons.ban,Colors.redAccent) : Container(),
                    ),
                    Positioned(
                      top:50,
                      left:40,
                      child: _isLike != null && _isLike! && index == _currentIndex?
                      _likeOrDislikeIconOnPhoto(FontAwesomeIcons.kissWinkHeart,Colors.green): Container(),
                    )
                  ],
                );
              },

              swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                if (align.x < 0) {
                  //Card is LEFT swiping
                  if(align.x < -3){
                    _isLike = false;
                  }
                  if(-(align.x * 0.1) > 1){
                    _xPosition = 1;
                  }else{
                    _xPosition = -(align.x * 0.1);
                  }
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                  if(align.x > 3){
                    _isLike = true;
                  }
                  if((align.x * 0.1) > 1){
                    _xPosition = 1;
                  }else{
                    _xPosition = (align.x * 0.1);
                  }
                }else{
                  _xPosition = 0;
                }
              },
              swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                print('orientation is $orientation and index is $index');
                if(orientation == CardSwipeOrientation.LEFT || orientation == CardSwipeOrientation.RIGHT){
                  setState(() {
                    _currentIndex = index+1;
                  });
                  _pageController!.jumpToPage(0);
                }
                _isLike = null;

              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0,8,12,8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bottomIconDataList.map(bottomButtonWidget).toList(),
          ),
        )
      ],
    );
  }

Widget _likeOrDislikeIconOnPhoto(IconData icon, Color iconColor){
  return AnimatedOpacity(
    opacity: _xPosition,
    duration: Duration(milliseconds: 500),
    child: Stack(
      children: <Widget>[
        Positioned(
            left: 1.0,
            top: 2.0,
            child: FaIcon(
              icon,
              color: Colors.black54,
              size: 76,
            )
        ),
        FaIcon(
          icon,
          color: iconColor,
          size: 76,
        )
      ],
    ),
  );
}

List<Widget> _userProfile(Size size, int index,){
  List<Widget> _returnWidgetList = [];
  for(int i=0 ; i < dummyUserDataListInSearch[index].userImages.length ; i++){
    Widget _userWidget = Stack(
      children: [
        GestureDetector(
          child: Container(
            height: size.height,
            width: size.width-14,
            color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child:
              CachedNetworkImage(
                imageUrl: dummyUserDataListInSearch[index].userImages[i],
                placeholder: (context, url) => Container(
                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.77,
                      child: Center(child: new CircularProgressIndicator())),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.77,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FullPhoto(imageUrlList: dummyUserDataListInSearch[index].userImages,initIndex: i,)));
          },
        ),
        Positioned(
            bottom: 4,
            left: 4,
            child: userInformation(dummyUserDataListInSearch[index],size)
        ),

        // Positioned(
        //   right: 12,
        //   top:30,
        //   child:PageView(
        //     controller: _pageController,
        //     children: dummyUserDataListInSearch[index].userImages.toList(),
        //   ),
        //
        //   // ScrollingPageIndicator(
        //   //     dotColor: Colors.white,
        //   //     dotSelectedColor: Colors.deepPurple,
        //   //     dotSize: 6,
        //   //     dotSelectedSize: 10,
        //   //     dotSpacing: 16,
        //   //     controller: _pageController,
        //   //     itemCount: dummyUserDataListInSearch[index].userImages.length,
        //   //     orientation: Axis.vertical
        //   // ),
        // ),
      ],
    );
    _returnWidgetList.add(_userWidget);
  }
  return _returnWidgetList;
  }
  // void goToPage(int index) => navigationKey.currentState.goToPage(index);

}
