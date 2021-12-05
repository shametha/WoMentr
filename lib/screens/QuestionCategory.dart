import 'package:womentr/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:womentr/screens/Question.dart';

// import 'package:womentr/screens/ViewQuestions.dart';
import '../../AppTheme.dart';

class QuestionCategoryScreen extends StatefulWidget {
  @override
  _QuestionCategoryScreenState createState() => _QuestionCategoryScreenState();
}

class _QuestionCategoryScreenState extends State<QuestionCategoryScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<int?> _selected;

  @override
  void initState() {
    super.initState();
    _selected = [];
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = CustomAppTheme.lightCustomAppTheme;
    MySize().init(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              body: Column(
            children: <Widget>[
              Container(
                padding: Spacing.fromLTRB(16, 16, 16, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          MdiIcons.chevronLeft,
                          color: themeData.colorScheme.primaryVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: Spacing.top(48),
                child: Text(
                  "Lets get started. Choose the theme of your question",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.primaryVariant,
                      fontWeight: 600),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size12!),
                child: Text(
                  "You can select multiple QuestionThemes",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primaryVariant,
                      muted: true,
                      fontWeight: 500),
                ),
              ),
              Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: GridView.count(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 3.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: MySize.size24!,
                    mainAxisSpacing: MySize.size24!,
                    children: <Widget>[
                      QuestionTheme(QuestionTheme: "She Helps", index: 0),
                      QuestionTheme(QuestionTheme: "Business", index: 1),
                      QuestionTheme(QuestionTheme: "MotherHood", index: 2),
                      QuestionTheme(QuestionTheme: "Confessions", index: 3),
                      QuestionTheme(QuestionTheme: "Finance", index: 4),
                      QuestionTheme(QuestionTheme: "Education", index: 5),
                      QuestionTheme(QuestionTheme: "Fitness", index: 6),
                      QuestionTheme(QuestionTheme: "Fashion", index: 7),
                      QuestionTheme(QuestionTheme: "Food", index: 8),
                      QuestionTheme(QuestionTheme: "Random", index: 9),
                      QuestionTheme(QuestionTheme: "Technology", index: 10),
                      QuestionTheme(QuestionTheme: "Music and Arts", index: 11),
                    ],
                  )),
              Container(
                margin: Spacing.fromLTRB(48, 48, 48, 0),
                width: MySize.safeWidth,
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuestionForm(categoryInput: "She Helps")));
                    },
                    child: Text(
                      _selected.isEmpty
                          ? "Select at least one QuestionTheme"
                          : "NEXT",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0.3,
                          color: _selected.isEmpty
                              ? customAppTheme.onDisabled
                              : themeData.colorScheme.onPrimary),
                    )),
              )
            ],
          )),
        ));
  }

  Widget QuestionTheme({required String QuestionTheme, int? index}) {
    return InkWell(
      onTap: () {
        if (_selected.contains(index)) {
          setState(() {
            _selected.remove(index);
          });
        } else {
          setState(() {
            _selected.add(index);
          });
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
            border: Border.all(
                color: _selected.contains(index)
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.primaryVariant,
                width: 0.8)),
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
              QuestionTheme,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  color: _selected.contains(index)
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.primaryVariant,
                  fontWeight: _selected.contains(index) ? 600 : 500),
            )),
            _selected.contains(index)
                ? Positioned(
                    right: -1,
                    top: -1,
                    child: Container(
                      padding: Spacing.all(2),
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(MySize.size8!))),
                      child: Icon(
                        MdiIcons.check,
                        color: themeData.colorScheme.onPrimary,
                        size: MySize.size16,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
