import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  ThemeMode themeMode = ThemeMode.dark;
  Locale locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(locale.languageCode)
          : MyAppThemeConfig.light().getTheme(locale.languageCode),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
        selectedLanguage: (Language selectedLanguageByUser) {
          setState(() {
            locale = selectedLanguageByUser == Language.en
                ? Locale('en')
                : Locale('fa');
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = 'Yekan';
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
    : primaryTextColor = Colors.white,
      secondaryTextColor = Colors.white70,
      surfaceColor = Color(0x0dffffff),
      backgroundColor = Color.fromARGB(255, 30, 30, 30),
      appBarColor = Colors.black,
      brightness = Brightness.dark;

  MyAppThemeConfig.light()
    : primaryTextColor = Colors.black,
      secondaryTextColor = Colors.grey.shade900,
      surfaceColor = Color(0x0d000000),
      backgroundColor = Colors.white,
      appBarColor = Color.fromARGB(255, 235, 235, 235),
      brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
      dividerColor: surfaceColor,
      primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryColor),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: appBarColor),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      textTheme: languageCode == 'en' ? enPrimaryTextTheme : faPrimaryTextTheme,
    );
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
      bodySmall: TextStyle(fontSize: 13, color: secondaryTextColor),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900,
        color: primaryTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
    ),
  );

  TextTheme get faPrimaryTextTheme => TextTheme(
    bodyMedium: TextStyle(
      fontSize: 15,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
    bodySmall: TextStyle(
      //height: 1.5,
      fontSize: 13,
      color: secondaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
    titleLarge: TextStyle(
      //fontSize: 20,
      fontWeight: FontWeight.w900,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
      fontFamily: faPrimaryFontFamily,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;
  final Function(Language language) selectedLanguage;

  const MyHomePage({
    super.key,
    required this.toggleThemeMode,
    required this.selectedLanguage,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _Skills? _skill;
  Language _language = Language.en;

  void updateSkill(_Skills skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  void updateLanguage(Language language) {
    widget.selectedLanguage(language);
    setState(() {
      _language = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.profileTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: widget.toggleThemeMode,
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.name,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          localization.job,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 14,
                              color: Theme.of(
                                context,
                              ).textTheme.bodySmall!.color,
                            ),
                            SizedBox(width: 4),
                            Text(
                              localization.location,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
              child: Text(
                localization.summary,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.selectedLanguage),
                  CupertinoSlidingSegmentedControl<Language>(
                    groupValue: _language,
                    thumbColor: Theme.of(context).primaryColor,
                    children: {
                      Language.en: Text(localization.enLanguage),
                      Language.fa: Text(localization.faLanguage),
                    },
                    onValueChanged: (value) {
                      if (value != null) updateLanguage(value);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
              child: Row(
                children: [
                  Text(
                    localization.skills,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                  SizedBox(width: 4),
                  Icon(CupertinoIcons.chevron_down, size: 12),
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    title: 'Photoshop',
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    isActive: _skill == _Skills.photoshop,
                    onTap: () {
                      updateSkill(_Skills.photoshop);
                    },
                  ),
                  Skill(
                    title: 'Adobe XD',
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    isActive: _skill == _Skills.adobeXD,
                    onTap: () {
                      updateSkill(_Skills.adobeXD);
                    },
                  ),
                  Skill(
                    title: 'Illustrator',
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange,
                    isActive: _skill == _Skills.illustrator,
                    onTap: () {
                      updateSkill(_Skills.illustrator);
                    },
                  ),
                  Skill(
                    title: 'After Effect',
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.blue.shade800,
                    isActive: _skill == _Skills.afterEffect,
                    onTap: () {
                      updateSkill(_Skills.afterEffect);
                    },
                  ),
                  Skill(
                    title: 'Lightroom',
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blue,
                    isActive: _skill == _Skills.lightroom,
                    onTap: () {
                      updateSkill(_Skills.lightroom);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.personalInformation,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.email,
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.password,
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(localization.save),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _Skills { photoshop, adobeXD, illustrator, afterEffect, lightroom }

enum Language { en, fa }

class Skill extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skill({
    super.key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        width: 110,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: shadowColor, blurRadius: 20),
                      ],
                    )
                  : null,
              child: Image.asset(imagePath, width: 40, height: 40),
            ),
            SizedBox(height: 8),
            Text(title, style: GoogleFonts.lato()),
          ],
        ),
      ),
    );
  }
}
