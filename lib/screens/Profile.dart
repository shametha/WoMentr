import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../AppTheme.dart';
import '../SizeConfig.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _passwordVisible = false;
  late ThemeData themeData;

  Widget build(BuildContext context) {
    MySize().init(context);

    themeData = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          children: <Widget>[
            ClipPath(
                clipper: _MyCustomClipper(context),
                child: Container(
                  alignment: Alignment.center,
                  color: themeData.colorScheme.background,
                )),
            ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.primaryVariant,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: MySize.size16!),
                            width: MySize.getScaledSizeHeight(140),
                            height: MySize.getScaledSizeHeight(140),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "./assets/images/redpanda.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            bottom: MySize.size12,
                            right: MySize.size8,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: themeData.scaffoldBackgroundColor,
                                    width: 2,
                                    style: BorderStyle.solid),
                                color: themeData.colorScheme.onPrimary,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(MySize.size6!),
                                child: Icon(
                                  MdiIcons.pencil,
                                  size: MySize.size20,
                                  color: themeData.colorScheme.primaryVariant,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text("Shifu",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline4,
                              fontWeight: 600,
                              color: Colors.black,
                              letterSpacing: 0)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MySize.size16!,
                      left: MySize.size24!,
                      right: MySize.size24!),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.primaryVariant,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                color: Colors.black,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.onPrimary,
                            prefixIcon: Icon(
                              MdiIcons.accountOutline,
                              color: themeData.colorScheme.primaryVariant,
                            ),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          controller:
                              TextEditingController(text: "Your Nick name"),
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.primaryVariant,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.primaryVariant,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.onPrimary,
                            prefixIcon: Icon(
                              MdiIcons.phoneOutline,
                              color: themeData.colorScheme.primaryVariant,
                            ),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.sentences,
                          controller: TextEditingController(
                            text: "Your Mobile Number",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.primaryVariant,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Change Password",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.primaryVariant,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.onPrimary,
                            prefixIcon: Icon(
                              MdiIcons.lockOutline,
                              color: themeData.colorScheme.primaryVariant,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? MdiIcons.eyeOutline
                                    : MdiIcons.eyeOffOutline,
                                color: themeData.colorScheme.primaryVariant,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            contentPadding: EdgeInsets.all(0),
                          ),
                          textCapitalization: TextCapitalization.sentences,
                          obscureText: _passwordVisible,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(20),
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    Spacing.xy(16, 0))),
                            onPressed: () {},
                            child: Text("UPDATE",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.button,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary,
                                    letterSpacing: 0.3))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )));
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
