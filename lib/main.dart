import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic/changenotifier.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
           title: 'Flutter Demo Codelab',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ));
  }
}









// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;
//     IconData? icon;
//     if (appState.favorites.contains(pair)) {
//       icon = Icons.favorite;
//     } else {
//       icon = Icons.favorite_border;
//     }

//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //Text('a Random awesome idea: '),
//           BigCard(pair: pair),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () {
//                   appState.togglefavorite();
//                 },
//                 icon: Icon(icon),
//                 label: Text('Like'),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     appState.getNext();
//                     print('button pressed');
//                   },
//                   child: Text('Next')),
//             ],
//           )
//         ],
//       ),
//     ));
//   }
// }
// class animatedCard extends StatelessWidget{
//   const animatedCard({
//     super.key,
//     required this.wordpair
//   });

// }

