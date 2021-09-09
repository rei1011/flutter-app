import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_todo_app/card.dart';
// import 'package:flutter_todo_app/row_column_layout.dart';
// import 'package:flutter_todo_app/stack.dart';
// import 'package:flutter/rendering.dart';

import 'base_layout.dart';
import 'navigation.dart';
// import 'cart.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // home: RandomWords(),
      // home: FirstRoute(),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => const NamedFirstScreen(),
      //   '/second': (context) => const NamedSecondScreen()
      // },
      routes: {
        '/': (context) => const NamedFirstScreen(),
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArgs;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                  title: args.title, message: args.message);
            },
          );
        }
        assert(false, 'Named to implement ${settings.name}');
        return null;
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Startup Name Generator'),
        title: const Text('Campground'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.list),
          )
        ],
      ),
      // body: _buildSuggestions(),
      // body: Center(
      //   child: ShoppingList(
      //     products: [
      //       Product(name: 'Eggs'),
      //       Product(name: 'Flour'),
      //       Product(name: 'Chocolate chips'),
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          titleSection,
          buttonSection(Colors.blue),
          textSection,
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                  title: Text(pair.asPascalCase, style: _biggerFont));
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return const Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
