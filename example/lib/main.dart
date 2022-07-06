import 'package:duration_picker2/duration_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duration Picker Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Duration Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _initTime = const Duration(seconds: 21);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
              initialTime: _initTime,
              minTime: const Duration(seconds: 15),
              maxTime: const Duration(seconds: 30),
              enableHapticFeedback: false,
              baseUnit: BaseUnit.second,
              onChange: (val) {
                setState(() {
                  _initTime = val;
                });
              },
              snapToMins: 5.0,
            ))
          ],
        ),
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) => FloatingActionButton(
                onPressed: () async {
                  var resultingDuration = await showDurationPicker(
                    context: context,
                    initialTime: const Duration(seconds: 21),
                    minTime: const Duration(seconds: 15),
                    maxTime: const Duration(seconds: 30),
                    baseUnit: BaseUnit.second,
                  );
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Chose duration: $resultingDuration')));
                },
                tooltip: 'Popup Duration Picker',
                child: const Icon(Icons.add),
              )),
    );
  }
}
