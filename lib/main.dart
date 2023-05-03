import 'package:flutter/material.dart';

import 'disposed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Lifecycle Example';
  void updateTitle() {
    setState(() {
      title = 'New Lifecycle Example';
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: title,
        onPressed: updateTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  //initState() is called once and only once. It must call super.initState().
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print('initState Example');
    _animationController = AnimationController(vsync: this);
  }

  //didChangeDependencies() is called immediately after initState() on the first time the widget is built.
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('didChangeDependencies Example');
    super.didChangeDependencies();
  }

  //didUpdateWidget() is called when the widget is rebuilt.
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget Example');
    if (widget.title != oldWidget.title) {
      print('Title Has Changed');
    }
    // TODO: implement didUpdateWidget
  }

  //deactivate() is called when the widget is removed from the widget tree temporarily.
  @override
  void deactivate() {
    print('deactivate Example');
    // TODO: implement deactivate
    super.deactivate();
  }

  //dispose() is called when the widget is removed from the widget tree permanently.
  @override
  void dispose() {
    print('dispose Example');
    _animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: widget.onPressed,
              child: const Text('Did Update Widget'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const DisposedPage(),
                  ),
                );
              },
              child: const Text('Dispose'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
