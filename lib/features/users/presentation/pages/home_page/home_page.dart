import 'package:flutter/material.dart';
import 'package:flutter_project/core/config/base_config.dart';
import 'package:flutter_project/ui/extensions/extensions.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: refactor into easy_localization
        title: Text(
          '${GetIt.I<BaseConfig>().appName} - ${context.translate(
            'label.pages.home.title',
          )}',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.translate('label.pages.home.text'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: context.translate('label.pages.home.increment'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
