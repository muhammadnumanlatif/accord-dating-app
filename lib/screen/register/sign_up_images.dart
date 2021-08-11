
import '../../utils.dart';

class SignUpImages extends StatefulWidget {
  const SignUpImages({Key? key}) : super(key: key);

  @override
  _SignUpImagesState createState() => _SignUpImagesState();
}

class _SignUpImagesState extends State<SignUpImages> {
  bool get wantKeepAlive => true;
  int _imagePosition = 0;
  List<File> _imageList = List<File>.generate(4,(file) => File(''));
  Widget _addImageButton(int position,double size){
    return Padding(
      padding: EdgeInsets.all(25.sp),
      child: GestureDetector(
        onTap: () {
          _imagePosition = position;
          _getImageAndCrop();
        },
        child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              image: (_imageList[position].path != '') ?
              DecorationImage(
                image: FileImage(_imageList[position]),
                fit: BoxFit.fill,
              ) : null,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: (_imageList[position].path != '')
                ? Container() :Icon(
              Icons.add_photo_alternate,
                size: 65.sp,
              color: Theme.of(context).primaryColor,
            )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(5.sp),
              child: Text(
                'Select your photos',
                  style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:2.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _addImageButton(0,75.sp),
                    _addImageButton(1,75.sp),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _addImageButton(2,75.sp),
                _addImageButton(3,75.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageAndCrop() async {
    final  _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      print('file path is ${pickedFile.path}');
      final XFile? imageFileFromGallery = XFile(pickedFile.path);
      if (imageFileFromGallery != null) {
        XFile? croppedFile = (await _cropImageFile(imageFileFromGallery)) as XFile?;
        if (croppedFile != null) {
          setState(() =>_imageList[_imagePosition]= croppedFile as File);
        }
      }
    }else{
      print('file path is null');
    }
  }

  Future<File?> _cropImageFile(XFile? image) async {
    return await ImageCropper.cropImage(
        sourcePath: image!.path,
        aspectRatioPresets: Platform.isAndroid
        ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
        ]
        : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Theme.of(context).primaryColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
  }
}
