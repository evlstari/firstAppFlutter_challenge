import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/changenotifier.dart';
import '../widgets/bigcard.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    

    GlobalKey<AnimatedListState> keyy = appState.key;

   
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
      appState.favicon.insert(0, icon);
    } else {
      icon = Icons.favorite_border;
       appState.favicon.insert(0, icon);
    }
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedList(
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                reverse: true,
                key: keyy,
                initialItemCount: appState.alllist.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (_, index, animation) {
                  return SizeTransition(
                    //key: UniqueKey(),
                    sizeFactor: animation,
                    child: Container(
                      //padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(
                            appState.alllist[index].asCamelCase,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: appState.Icons.contains(appState.favicon[index]) ? Icon(appState.Icons[index], color: Colors.deepPurple,) : Icon(appState.Icons[index], color: Colors.deepPurple)
                    ),)
                  );
                },
              ),
            ),
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.togglefavorite();
                    print(appState.favorites);
                   
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.Icons.insert(0, icon);
                    appState.alllist.insert(0, pair);
                    appState.getNext();
                    
                  },
                  child: Text('Next'),
                ),
              ],
            ),
            Expanded(child: Text(''))
          ],
        ),
      ),
    );
  }
}

// appState.alllist.contains(appState.favorites[index])
