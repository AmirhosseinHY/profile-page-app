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

class MyHomePage extends StatelessWidget {
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
                Text('Skills', style: TextStyle(fontWeight: FontWeight.w900)),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down, size: 12),
              ],
            ),
          ),
          Center(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x0dffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 110,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('Photoshop'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x0dffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 110,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('Photoshop'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x0dffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 110,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('Photoshop'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x0dffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 110,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('Photoshop'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x0dffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 110,
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('Photoshop'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
