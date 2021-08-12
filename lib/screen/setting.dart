import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
                      child: Text('Settings'),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}
