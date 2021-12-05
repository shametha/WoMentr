import 'package:womentr/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../AppTheme.dart';

class SpecificQuestionScreen extends StatefulWidget {
  final String headline, author, date;
  const SpecificQuestionScreen(
      {Key? key,
      required this.headline,
      required this.author,
      required this.date})
      : super(key: key);

  @override
  _SpecificQuestionScreenState createState() => _SpecificQuestionScreenState();
}

class _SpecificQuestionScreenState extends State<SpecificQuestionScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    customAppTheme = CustomAppTheme.lightCustomAppTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          ClipPath(
              clipper: _MyCustomClipper(context),
              child: Container(
                alignment: Alignment.center,
                color: themeData.colorScheme.background,
              )),
          Container(
            padding: Spacing.all(24),
            child: Column(
              children: <Widget>[
                Container(
                  margin: Spacing.top(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer1,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: customAppTheme.shadowColor,
                                    spreadRadius: MySize.size2,
                                    blurRadius: MySize.size8!,
                                    offset: Offset(0, MySize.size4!))
                              ]),
                          padding: Spacing.all(12),
                          child: Icon(
                            MdiIcons.chevronLeft,
                            color: themeData.colorScheme.primaryVariant,
                            size: MySize.size20,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: customAppTheme.shadowColor,
                                  spreadRadius: MySize.size2,
                                  blurRadius: MySize.size8!,
                                  offset: Offset(0, MySize.size4!))
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MySize.size8,
                ),
                Expanded(
                    child: ListView(
                  padding: Spacing.fromLTRB(0, 16, 0, 16),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: customAppTheme.bgLayer1,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size24!)),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    customAppTheme.shadowColor.withAlpha(120),
                                blurRadius: MySize.size24!,
                                spreadRadius: MySize.size4!)
                          ]),
                      child: Column(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size24!)),
                            child: Image(
                              image: AssetImage('./assets/images/redpanda.png'),
                            ),
                          ),
                          Container(
                            padding: Spacing.all(16),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    widget.headline,
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        color: themeData
                                            .colorScheme.primaryVariant,
                                        fontWeight: 600),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    margin: Spacing.top(16),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size14!)),
                                          child: Image(
                                            image: AssetImage(
                                                './assets/images/redpanda.png'),
                                            height: MySize.size28,
                                            width: MySize.size28,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MySize.size16,
                                        ),
                                        Text(
                                          widget.author,
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.primaryVariant,
                                              fontWeight: 600,
                                              xMuted: true),
                                        ),
                                        Expanded(child: Container()),
                                        Text(
                                          widget.date,
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.primaryVariant,
                                              fontWeight: 500,
                                              xMuted: true),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: customAppTheme.bgLayer1,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: customAppTheme.shadowColor,
                                          spreadRadius: MySize.size2,
                                          blurRadius: MySize.size8!,
                                          offset: Offset(0, MySize.size4!))
                                    ]),
                                padding: Spacing.all(12),
                                child: Icon(
                                  MdiIcons.chevronDoubleUp,
                                  color: themeData.colorScheme.primaryVariant,
                                  size: MySize.size20,
                                ),
                              ),
                              SizedBox(
                                height: MySize.size40,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: customAppTheme.bgLayer1,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: customAppTheme.shadowColor,
                                          spreadRadius: MySize.size2,
                                          blurRadius: MySize.size8!,
                                          offset: Offset(0, MySize.size4!))
                                    ]),
                                padding: Spacing.all(12),
                                child: Icon(
                                  MdiIcons.chevronDoubleDown,
                                  color: themeData.colorScheme.primaryVariant,
                                  size: MySize.size20,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Flexible(
                          child: Container(
                              padding: EdgeInsets.all(MySize.size20!),
                              margin: Spacing.top(24),
                              child: Text("I joined my college tech club a month ago. I am capable of doing all" +
                                  "the technical projects and experiments as I have been learning them for 5 years now." +
                                  "But inspite of all the talent I have I am denied a platform to showcase it." +
                                  "People look down at me and it makes me feel down. Sometime I start losing confidence in myself!" +
                                  "Can someone help me how I can over come this...")),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                boxShadow: [
                                  BoxShadow(
                                      color: customAppTheme.shadowColor,
                                      spreadRadius: MySize.size2,
                                      blurRadius: MySize.size8!,
                                      offset: Offset(0, MySize.size4!))
                                ]),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Try speaking to your college tutor or staffs. They might definitely help you !. Most importantly don't loose self confidence.",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Honey",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color:
                                          themeData.colorScheme.primaryVariant,
                                      fontWeight: 600),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
                Container(
                  decoration: BoxDecoration(
                      color: customAppTheme.bgLayer1,
                      boxShadow: [
                        BoxShadow(
                            color: customAppTheme.shadowColor,
                            spreadRadius: 1,
                            blurRadius: MySize.size4!,
                            offset: Offset(0, MySize.size2))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  padding: Spacing.fromLTRB(16, 4, 16, 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Write a comment"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: themeData.colorScheme.primary.withAlpha(60)),
                        padding: Spacing.all(8),
                        child: Icon(
                          MdiIcons.sendOutline,
                          color: themeData.colorScheme.primary,
                          size: MySize.size20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ])));
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
