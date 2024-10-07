import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _showText() {
    setState(() {
      _displayText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number, // Set to accept only numbers
              decoration: InputDecoration(
                labelText: 'Enter number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
                height: 20), // Space between the TextField and button
            ElevatedButton(
              onPressed: _showText,
              child: const Text('Show Number'),
            ),
            const SizedBox(
                height: 20), // Space between button and displayed text
            Text(
              _displayText,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
