import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String _name = "";
  int _counter = 0;
  String box = "";
  Future<void> fetchData() async {
    // var response = await http.get(Uri.parse("www.google.com"));
    // print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                child: Text("hello"),
                onTap: () {
                  print("hello");
                },
              ),
              Text(box),
              TextFormField(
                  keyboardType: TextInputType.url,
                  onSaved: (newValue) {
                    _name = newValue!;
                    box = newValue;
                    setState(() {
                      box = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a name";
                    }
                    if (!value.contains("@")) {
                      return "Please enter a valid email address";
                    }
                    if (value.contains("@example.com")) {
                      return "Please enter a different email address";
                    }

                    return null;
                  },
                  initialValue: "aditya",
                  decoration: InputDecoration(border: OutlineInputBorder())),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      print(_name);
                      _key.currentState!.save();
                      print(_name);
                    }
                  },
                  child: Text("Submit")),
            ],
          )),
    ));
  }
}
