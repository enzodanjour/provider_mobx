import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobx/src/store/counter/counter_store.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

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
      margin: const EdgeInsets.fromLTRB(10, 200, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter component',
                ),
                const SizedBox(
                  height: 50,
                ),
                Observer(
                  builder: (_) => Text(
                    '${counterStore.counter}',
                  ),
                ),
                const SizedBox(
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
