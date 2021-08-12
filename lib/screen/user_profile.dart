import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';
export '/model/const_data.dart';
import '/model/user_profile_common.dart';



class UserProfile extends StatefulWidget {
  UserProfile(this.userData,this.parentClassType);

  UserData userData;
  ParentClassType parentClassType;
  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );

  @override State createState() => new _UserProfile();
}

class _UserProfile extends State<UserProfile> with userProfileCommon{

  List<Choice> choices = <Choice>[
    const Choice(title: 'Edit', icon: Icons.edit),
    const Choice(title: 'Delete', icon: Icons.delete_outline),
  ];

  void _select(Choice choice) {
    if (choice.title == 'Edit') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(
          widget.userData.name,
          widget.userData.intro,
          widget.userData.userImages.first,
      )),);
    }else {
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(

      color: Colors.deepOrange,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepOrange,
            appBar: AppBar(
              title: Text(
                widget.userData.name,
                style: Theme.of(context).textTheme.headline1,
              ),
              backgroundColor: Colors.deepOrange,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.white.withOpacity(0.8),
                size: 25.sp,//change your color here
              ),
              actions: <Widget>[
                widget.userData.name == myProfileName ?
                PopupMenuButton<Choice>(
                  onSelected: _select,
                  itemBuilder: (BuildContext context) {
                    return choices.map((Choice choice) {
                      return PopupMenuItem<Choice>(
                        value: choice,
                        child: Row(
                          children: <Widget>[
                            Icon(
                                choice.icon,
                              color: Colors.white,
                               size: 25.sp,
                            ),
                            Text(' '
                                '${choice.title}',
                            style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    }).toList();
                  },
                ) : Container(),
              ],
            ),
            body: Padding(
              padding:EdgeInsets.only(top:8.0,bottom:8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 90.h,
                            width: 85.w,
                            color: Colors.deepOrange,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.sp),
                              child:
                              CachedNetworkImage(
                                imageUrl: widget.userData.userImages.first,
                                placeholder: (context, url) => Container(
                                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                  child: Container(
                                      width: 90.w,
                                      height: 80.h,
                                      child: Center(child: new CircularProgressIndicator())),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                  size: 25.sp,
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                height: 77.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FullPhoto(
                              imageUrlList: widget.userData.userImages,
                              initIndex: 0,)
                            ,),
                          ),
                        ),
                        Positioned(
                            bottom: 4,
                            left: 4,
                            child: userInformation(widget.userData,size)
                        ),
                      ],
                    ),
                  ),
                  widget.parentClassType == ParentClassType.Lounge ? Padding(
                    padding: const EdgeInsets.fromLTRB(12.0,8,12,8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bottomIconDataList.map(bottomButtonWidget).toList(),
                    ),
                  ) : Container()
                ],
              ),
            )
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to delete your profile?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new MaterialButton(
              child: new Text("No", style: TextStyle(color: Colors.grey),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new MaterialButton(
              child: new Text("Yes",style: TextStyle(color: Colors.blue),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


