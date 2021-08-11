import '../../utils.dart';

class SignUpIntrests extends StatefulWidget {
  @override
  _SignUpIntrestsState createState() => _SignUpIntrestsState();
}

class _SignUpIntrestsState extends State<SignUpIntrests> {
  bool get wantKeepAlive => true;

  List<String> _selectedIndexList = [];

  List<String> _options = [
    'Sports',
    'Music',
    'Travel',
    'Party',
    'Dancing',
    'Language',
    'Movie',
    'Economy',
    'Netflix',
    'Game',
    'Sleep',
    'Shop'
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected:
            _selectedIndexList.contains(_options[i]), //_selectedIndex == i,
        label: Text(
          _options[i],
          style: Theme.of(context).textTheme.bodyText1,
        ),
        avatar: _selectedIndexList.contains(_options[i])
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
        elevation: 5.sp,
        pressElevation: 8.sp,
        shadowColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        selectedColor: Theme.of(context).accentColor.withOpacity(0.9),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              // _selectedIndex = i;
              if (!_selectedIndexList.contains(_options[i])) {
                _selectedIndexList.add(_options[i]);
              }
            } else {
              if (_selectedIndexList.contains(_options[i])) {
                _selectedIndexList.remove(_options[i]);
              }
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w), child: choiceChip));
    }

    return Wrap(
      spacing: 5.sp,
      runSpacing: 3.sp,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Introduce Yourself',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
              child: Container(
                  width: 90.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).accentColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                      child: Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type about you',
                        ),
                        keyboardType: TextInputType.text,
                        maxLines: null,
                      ),
                    ),
                  ))),
            ),
            Text(
              'Choice your Interest',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              child: _buildChips(),
            ),
          ],
        ),
      ),
    );
  }
}
