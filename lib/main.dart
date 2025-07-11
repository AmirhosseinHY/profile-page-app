import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primaryColor: Colors.pink.shade400,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            //bodyMedium: TextStyle(fontSize: 15),
            bodySmall: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(200, 255, 255, 255),
            ),
            titleLarge: TextStyle(fontWeight: FontWeight.w900),
            labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _Skills { photoshop, adobeXD, illustrator, afterEffect, lightroom }

class _MyHomePageState extends State<MyHomePage> {
  _Skills? _skill;

  void updateSkill(_Skills skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum Vitae'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
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
                        'Brice Séraphin',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text('Product & Print Designer'),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            size: 14,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Paris, France',
                            style: Theme.of(context).textTheme.labelSmall,
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
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
            child: Row(
              children: [
                Text(
                  'Skills',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                ),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down, size: 12),
              ],
            ),
          ),
          SizedBox(height: 12),
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
        ],
      ),
    );
  }
}

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
                color: Color(0x0dffffff),
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
            Text(title),
          ],
        ),
      ),
    );
  }
}
