import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pm_criando_gerenciamento_estado/contracts/stream_notifier.dart';

class StreamNotifierBuilder<T> extends StatefulWidget {
  final IStreamNotifier<T> streamNotifier;
  final Widget Function(BuildContext context, T state) builder;

  StreamNotifierBuilder({
    super.key,
    required this.streamNotifier,
    required this.builder,
  });

  @override
  State<StreamNotifierBuilder<T>> createState() =>
      _StreamNotifierBuilderState<T>();
}

class _StreamNotifierBuilderState<T> extends State<StreamNotifierBuilder<T>> {
  late StreamSubscription<T>? _streamSubscription;

  @override
  void initState() {
    _streamSubscription = widget.streamNotifier.stream.listen((newValue) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.streamNotifier.state);
  }
}
