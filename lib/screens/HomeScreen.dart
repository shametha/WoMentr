import 'package:womentr/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:womentr/screens/Profile.dart';
import 'package:womentr/screens/QuestionCategory.dart';
import 'package:womentr/screens/ViewQuestions.dart';
import '../../AppTheme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    customAppTheme = CustomAppTheme.lightCustomAppTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          child: Stack(children: <Widget>[
            Container(
              child: ClipPath(
                  clipper: _MyCustomClipper(context),
                  child: Container(
                    alignment: Alignment.center,
                    color: themeData.colorScheme.primaryVariant,
                  )),
            ),
            Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: themeData.colorScheme.primary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionCategoryScreen()));
                    },
                    label: Row(
                      children: [
                        Icon(
                          MdiIcons.plus,
                          color: themeData.colorScheme.onPrimary,
                          size: MySize.size18,
                        ),
                        Container(
                          margin: Spacing.left(4),
                          child: Text(
                            "Start Asking",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onPrimary,
                                fontWeight: 500),
                          ),
                        ),
                      ],
                    )),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.top(48),
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(0, 0, 24, 0),
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: Spacing.fromLTRB(24, 0, 0, 0),
                                    child: Text(
                                      "Hello",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          xMuted: true,
                                          color: themeData
                                              .colorScheme.primaryVariant),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.left(24),
                                    child: Text(
                                      "Shifu!",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline4,
                                          letterSpacing: -0.5,
                                          color: themeData
                                              .colorScheme.primaryVariant,
                                          fontWeight: 700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!)),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: MySize.size16!),
                                    width: MySize.getScaledSizeHeight(140),
                                    height: MySize.getScaledSizeHeight(120),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "./assets/images/redpanda.png"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        padding: Spacing.horizontal(12),
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8!)),
                            boxShadow: [
                              BoxShadow(
                                color: customAppTheme.shadowColor,
                                spreadRadius: 2,
                                blurRadius: MySize.size10!,
                                offset: Offset(0, MySize.size8!),
                              ),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.magnify,
                              color:
                                  themeData.colorScheme.primary.withAlpha(200),
                              size: MySize.size16,
                            ),
                            Expanded(
                              child: Container(
                                margin: Spacing.left(12),
                                child: TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color:
                                          themeData.colorScheme.primaryVariant,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    fillColor: customAppTheme.bgLayer1,
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color: themeData
                                            .colorScheme.primaryVariant,
                                        muted: true,
                                        fontWeight: 500),
                                    hintText: "Find Answers...",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MySize.size22!),
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        child: Text(
                          "What shall we discuss today ?!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              letterSpacing: -0.15,
                              color: themeData.colorScheme.primaryVariant,
                              fontWeight: 600,
                              muted: true),
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                child: singleHelpWidget(
                                    iconData: MdiIcons.humanGreeting,
                                    title: "She Helps"),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CategoryQuestion(
                                        categoryInput: "She helps");
                                  }));
                                }),
                            singleHelpWidget(
                                iconData: MdiIcons.laptop, title: "Business"),
                            singleHelpWidget(
                                iconData: MdiIcons.babyCarriage,
                                title: "MotherHood")
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.lockOpen,
                                title: "Confessions"),
                            singleHelpWidget(
                                iconData: MdiIcons.cashMarker,
                                title: "Finance"),
                            singleHelpWidget(
                                iconData: MdiIcons.bookEducation,
                                title: "Education"),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.meditation,
                                title: "Fitness"),
                            singleHelpWidget(
                                iconData: MdiIcons.shoeHeel, title: "Fashion"),
                            singleHelpWidget(
                                iconData: MdiIcons.food, title: "Food"),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.bagSuitcase,
                                title: "Travel"),
                            singleHelpWidget(
                                iconData: MdiIcons.faceProfileWoman,
                                title: "Teen"),
                            singleHelpWidget(
                                iconData: MdiIcons.music,
                                title: "Music and Arts")
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.hammerScrewdriver,
                                title: "Technology"),
                            singleHelpWidget(
                                iconData: MdiIcons.dog, title: "Pets"),
                            singleHelpWidget(
                                iconData: MdiIcons.heart, title: "Random")
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(MySize.size4!),
                      )
                    ],
                  ),
                )),
          ]),
        ));
  }

  Widget singleHelpWidget(
      {IconData? iconData, required String title, Color? color}) {
    return Container(
      width: (MySize.safeWidth! - MySize.getScaledSizeWidth(96)) / 3,
      padding: Spacing.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size6!,
                offset: Offset(0, MySize.size4!))
          ]),
      child: Column(
        children: [
          Icon(
            iconData,
            color: color == null ? themeData.colorScheme.primary : color,
            size: MySize.size30,
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  letterSpacing: 0,
                  color: themeData.colorScheme.primaryVariant,
                  fontWeight: 600),
            ),
          ),
        ],
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
    path.lineTo(0, size.height * 0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
