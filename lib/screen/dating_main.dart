import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';


class DatingMain extends StatefulWidget {
  @override
  _DatingMainState createState() => _DatingMainState();
}

class _DatingMainState extends State<DatingMain> with TickerProviderStateMixin{
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {setState(() {});}

  Tab _tabItem(IconData iconData, int index, Color selectedColor){
    return Tab(
        icon: FaIcon(
            iconData,
            size: 25.sp,
            color: _tabController!.index == index ? selectedColor : Theme.of(context).accentColor.withOpacity(0.9))
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color:Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor:Theme.of(context).primaryColor,
            appBar: AppBar(
              foregroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white.withOpacity(0.8),
                      labelColor: Colors.white,
                      unselectedLabelColor: Theme.of(context).accentColor.withOpacity(0.9),
                      tabs: [
                        _tabItem(FontAwesomeIcons.users,0,Colors.white.withOpacity(0.8)),
                        _tabItem(FontAwesomeIcons.handHoldingHeart,1,Colors.white.withOpacity(0.8)),
                        _tabItem(FontAwesomeIcons.solidComments,2,Colors.white.withOpacity(0.8)),
                        _tabItem(FontAwesomeIcons.cog,3,Colors.white.withOpacity(0.8)),
                      ],
                    ),
                  ],
                ),
              ),
              // backgroundColor: Theme.of(context).primaryColor
            ),
            body: TabBarView(
              physics: _tabController!.index == 0 ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Search(),
                Lounge(),
                ChatList(),
                Setting(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}