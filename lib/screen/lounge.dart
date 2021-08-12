import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';
export '/model/const_data.dart';
import '/model/user_profile_common.dart';

class Lounge extends StatefulWidget {
  const Lounge({Key? key}) : super(key: key);
  static String screenId = 'lounge';
  @override
  _LoungeState createState() => _LoungeState();
}

class _LoungeState extends State<Lounge> {

  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        svg,
        Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
            child: GridView.count(crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                childAspectRatio: 0.632,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: dummyUserDataListInLounge().map<Widget>( (data) {
                  return  GestureDetector(
                    onTap: () => Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => UserProfile(
                          data,
                        ParentClassType.Lounge,
                    ),
                    ),
                    ),
                    child: _GridDemoPhotoItem(userData:data,),
                  );
                }).toList()),
          ),
        ),
      ],
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {


    return GridTile(
      child: Card(
        elevation: 5.sp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.sp),
              child:
              CachedNetworkImage(
                imageUrl: userData.userImages.first,
                placeholder: (context, url) => Container(
                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  child: Container(
                      width: 85.w,
                      height: 10.h,
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
                errorWidget: (context, url, error) => Icon(
                    Icons.error,
                ),
                width: 85.w,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 8,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0,0,4.0,4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(userData.name,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 26,color: Colors.white,shadows: [ Shadow(blurRadius: 1.0,color: Colors.black,offset: Offset(0.6,0.6))]),),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 10.0),
                      child: Text(userData.information,
                        style: TextStyle(fontSize: 15,
                            color: Colors.white,
                            shadows: [ Shadow(blurRadius: 1.0,color: Colors.black,offset: Offset(0.6,0.6))]),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),//image,
    );
  }
}