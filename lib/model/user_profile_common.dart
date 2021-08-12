import '../utils.dart';
import 'const_data.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';


mixin userProfileCommon {

  CardController cardController = CardController();

  Widget userInformation(UserData userData,Size size) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 0.5.h),
                child: Text(
                  userData.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 36,
                      shadows: [ Shadow(blurRadius: 1.0,color: Colors.amberAccent,offset: Offset(0.6,0.6))]
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:8.w),
                child: Text(
                  userData.information,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      shadows: [ Shadow(blurRadius: 1.0,color: Colors.amberAccent,offset: Offset(0.6,0.6))]
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 1.5.h,right: 12.w),
            child: Container(
              width: size.width- 20,
              child: Text(
                userData.intro,
                softWrap: true,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    shadows: [ Shadow(blurRadius: 1.0,color: Colors.amberAccent,offset: Offset(0.6,0.6))]
                ),
              ),
            ),
          ),
          Wrap(children: userData.interesting.map(interestingWidget).toList(),),
        ],
      ),
    );
  }

  Widget interestingWidget(String interesting){
    return Padding(
      padding: EdgeInsets.only(right:2.w,bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrange,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.w,0.5.h,2.w,0.5.h),
          child: Text(interesting,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  Widget bottomButtonWidget(BottomButtonData data){
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:2.h),
        child: new RawMaterialButton(
          onPressed: () {
            if(data.iconData == FontAwesomeIcons.times){
              cardController.swipeLeft();
            }else if(data.iconData == FontAwesomeIcons.solidHeart){
              cardController.swipeRight();
            }else if(data.iconData == FontAwesomeIcons.solidStar){
              // cardController.triggerUp();
            }
          },
          child: FaIcon(
            data.iconData,
            color: data.iconColor,
            size: (data.iconData == FontAwesomeIcons.times || data.iconData == FontAwesomeIcons.solidHeart) ? 32.0 : 20,
          ),
          shape: new CircleBorder(),
          elevation: 1.0,
          fillColor: Colors.orange,
          padding: EdgeInsets.all(5.sp),
        ),
      ),
    );
  }
}