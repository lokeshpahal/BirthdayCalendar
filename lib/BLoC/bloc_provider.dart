
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget? child;
  final T? bloc;

  const BlocProvider({Key? key, @required this.bloc, @required this.child})
      : super(key: key);

  static T? of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType(type);
    return provider?.bloc != null ? provider?.bloc : null;
  }

  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child != null? widget.child! : Text("No widget");


  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }
}