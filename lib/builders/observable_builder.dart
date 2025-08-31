import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/contracts/observable.dart';

class ObservableBuilder extends StatefulWidget {
  final Observable observable;
  final Widget Function(BuildContext context) builder;

  const ObservableBuilder({super.key, required this.observable, required this.builder});

  @override
  State<ObservableBuilder> createState() => _ObservableBuilderState();
}

class _ObservableBuilderState extends State<ObservableBuilder> {

  @override
  void initState() {
    widget.observable.addListener(rebuild);
    super.initState();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.observable.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
