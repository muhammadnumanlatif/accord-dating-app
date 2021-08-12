import '../utils.dart';
import '../models.dart';
import '../screens.dart';
import '../widgets.dart';

class FullPhoto extends StatefulWidget {

  final List<String>? imageUrlList;
  final int? initIndex;

  FullPhoto({Key? key, required this.imageUrlList,this.initIndex}) : super(key: key);
  @override
  State createState() => new _FullPhoto();
}

class _FullPhoto extends State<FullPhoto> {
  PageController? _pageController;
  List<String> imageListStrings = [];
  int? currentIndex;

  @override
  void initState() {

    for(String imageUrl in widget.imageUrlList!){
      if(imageUrl != ""){
        imageListStrings.add(imageUrl);
      }
    }

    _pageController = PageController(initialPage: widget.initIndex!);

    setState(() {
      currentIndex = widget.initIndex;
    });
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    PhotoViewGallery.builder(
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(imageListStrings[index]),
                          initialScale: PhotoViewComputedScale.contained,
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 1.5,
                        );
                      },
                      itemCount: imageListStrings.length,
                      loadingBuilder: (context, event) => Center(
                        child: Container(
                          width: 10.w,
                          height: 5.h,
                          child: CircularProgressIndicator(
                             value: event == null
                                 ? 0
                                 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                          ),
                        ),
                      ),
                      backgroundDecoration: BoxDecoration(
                        color: Colors.deepOrange,
                      ),
                      onPageChanged: onPageChanged,
                      pageController: _pageController,
                    ),
                    Container(
                      padding:  EdgeInsets.all(10.sp),
                      child: Text(
                        "${currentIndex! + 1} / ${imageListStrings.length}",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                )
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DatingMain()));
            },
          ),
        ],
      ),
    );
  }

}
