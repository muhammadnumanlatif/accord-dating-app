import '../utils.dart';


class ChatList extends StatefulWidget {


  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final Widget svg = SvgPicture.asset(
    'images/accord.svg',
    fit: BoxFit.cover,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            svg,
            Container(
              child: Center(
                child: Text('ChatList'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
