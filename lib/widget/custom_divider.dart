import '../utils.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
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
          title!,
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