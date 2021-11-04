import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobx/src/store/counter/counter_store.dart';

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late CounterStore counterStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    counterStore = Provider.of<CounterStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 200, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter component',
                ),
                SizedBox(
                  height: 50,
                ),
                Observer(
                  builder: (_) => Text(
                    '${counterStore.counter}',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FloatingActionButton.extended(
                  onPressed: counterStore.increment,
                  label: Text('Increment'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
