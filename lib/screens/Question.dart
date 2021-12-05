import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:womentr/AppTheme.dart';
import 'package:womentr/SizeConfig.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';

class QuestionForm extends StatefulWidget {
  final String categoryInput;
  const QuestionForm({Key? key, this.categoryInput: "She Helps"})
      : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final myController = TextEditingController();
  late ThemeData themeData;
  File? _image;
  bool _loading = false;
  List<dynamic>? _output;
  final _picker = ImagePicker();

  pickImage() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/images/model_unquant.tflite',
      labels: 'assets/images/labels.txt',
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
            clipper: _MyCustomClipper(context),
            child: Container(
              alignment: Alignment.center,
              color: themeData.colorScheme.background,
            )),
        Positioned(
          left: MySize.size30,
          right: MySize.size30,
          top: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MySize.size16!, bottom: MySize.size16!),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        child: Text(
                          "Question Here!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight: 600),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MySize.size16!,
                            right: MySize.size16!,
                            top: MySize.size8!),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              child: TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: "Headline",
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500),
                                  prefixIcon: Icon(MdiIcons.chatQuestion),
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              child: TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: "Description",
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500),
                                  prefixIcon: Icon(MdiIcons.noteText),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            _image == null
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: MySize.size24!),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size24!)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData.colorScheme.primary
                                              .withAlpha(28),
                                          blurRadius: 3,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                        onPressed: pickGalleryImage,
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                Spacing.xy(16, 0))),
                                        // onPressed: pickImage,
                                        child: Text("Upload images",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.button,
                                                fontWeight: 600,
                                                color: themeData
                                                    .colorScheme.onPrimary))))
                                : Container(
                                    child: Image.file(_image!),
                                    height: 250.0, // Fixed height for image
                                  ),
                            SizedBox(height: 20.0),
                            _output != null
                                ? Text('${_output![0]['label']}')
                                : Container(),
                            Container(
                                margin: EdgeInsets.only(top: MySize.size24!),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size24!)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(28),
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            Spacing.xy(16, 0))),
                                    onPressed: () async {
                                      // await createUser("9856471230","honey","adcsfr");
                                    },
                                    
                                    child: Text("Submit",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.button,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary)))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MySize.size24!,
          left: MySize.size12!,
          child: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           child: Column(
//             children: [
//               TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: ElevatedButton(
//               onPressed: () async {
//                 await insertQuestion("9876543210","Shifu","ABC","DEF");
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//               TextField(
//                 controller: myController,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }