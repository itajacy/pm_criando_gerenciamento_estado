import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/state_observable.dart';

class ObservableStateBuilder<T> extends StatefulWidget {
  final StateObservable<T> stateObservable;
  final Widget Function(BuildContext context, T state, Widget? child) builder;
  final Widget? child;

  const ObservableStateBuilder({
    super.key,
    required this.stateObservable,
    required this.builder,
    this.child,
  });

  @override
  State<ObservableStateBuilder<T>> createState() =>
      _ObservableStateBuilderState<T>();
}

class _ObservableStateBuilderState<T> extends State<ObservableStateBuilder<T>> {
  @override
  void initState() {
    widget.stateObservable.addListener(callback);
    super.initState();
  }

  void callback() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.stateObservable.removeListener(callback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.stateObservable.state, widget.child);
  }
}
