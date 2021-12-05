import 'package:womentr/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:womentr/screens/SpecificQuestion.dart';
import '../../AppTheme.dart';

class CategoryQuestion extends StatefulWidget {
  final String categoryInput;
  const CategoryQuestion({Key? key, required this.categoryInput})
      : super(key: key);
  @override
  _CategoryQuestionState createState() => _CategoryQuestionState();
}

class _CategoryQuestionState extends State<CategoryQuestion> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    customAppTheme = CustomAppTheme.lightCustomAppTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              body: Stack(children: [
            ClipPath(
                clipper: _MyCustomClipper(context),
                child: Container(
                  alignment: Alignment.center,
                  color: themeData.colorScheme.background.withOpacity(0.5),
                )),
            ListView(
              padding: EdgeInsets.all(24),
              children: <Widget>[
                Container(
                  child: Text(
                    "Hey Shifu,",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600,
                        xMuted: true),
                  ),
                ),
                Container(
                  child: Text(
                    widget.categoryInput,
                    style: AppTheme.getTextStyle(themeData.textTheme.headline4,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600),
                  ),
                ),
                _singleNews(
                  author: "Panda",
                  date: "Aug 15, 2021",
                  headline: "I feel discriminated in my Tech Club.",
                ),
                _singleNews(
                  author: "Pooja",
                  date: "Aug 15, 2021",
                  headline: "Stalker on Instagram is blackMailing me!",
                ),
                _singleNews(
                  author: "Jennifer",
                  date: "Nov 6, 2021",
                  headline: "My parents aren't allowing me to choose my career",
                ),
                _singleNews(
                  author: "Puppy",
                  date: "Mar 12, 2021",
                  headline: "I am denied the right to education.",
                ),
                _singleNews(
                  author: "Honey",
                  date: "Apr 31, 2021",
                  headline: "My teacher is harassing me!",
                ),
                _singleNews(
                  author: "Monica",
                  date: "Aug 15, 2021",
                  headline: "I strongly doubt my instagram is hacked.",
                ),
              ],
            ),
          ])),
        ));
  }

  _singleNews({
    required String headline,
    required String author,
    required String date,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpecificQuestionScreen(
                    headline: headline, author: author, date: date)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            boxShadow: [
              BoxShadow(
                color: customAppTheme.shadowColor,
                spreadRadius: 2,
                blurRadius: MySize.size10!,
                offset: Offset(0, MySize.size8!),
              ),
            ]),
        margin: Spacing.top(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    author,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        date,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.primaryVariant,
                            fontSize: 11,
                            xMuted: true),
                      )),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.primaryVariant
                                .withAlpha(100),
                            shape: BoxShape.rectangle),
                        width: 4,
                        height: 4,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
