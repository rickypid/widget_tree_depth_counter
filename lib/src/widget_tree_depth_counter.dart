import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tree_depth_counter/src/class/depth_counter.dart';

/// `WidgetTreeDepthCounter` widget to count the amount of nested widget tree, useful in the dynamic construction of the interface when it is important to know the depth of widget.
class WidgetTreeDepthCounter extends StatelessWidget {
  /// Called at layout time to construct the widget tree.
  ///
  /// The builder must not return null.
  final Widget Function(BuildContext context, int counter) builder;

  /// Used this to redefine current count value
  final int? count;

  const WidgetTreeDepthCounter({
    Key? key,
    required this.builder,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DepthCounter>(
      create: (context) {
        DepthCounter? _counter;
        if (count != null) {
          _counter = DepthCounter(count!);
        } else {
          DepthCounter? _parentCounter;
          try {
            _parentCounter = context.read<DepthCounter>();
            _counter = DepthCounter(_parentCounter.value + 1);
          } catch (e) {
            _counter = DepthCounter(0);
          }
        }
        return _counter;
      },
      builder: (context, child) =>
          builder(context, context.read<DepthCounter>().value),
    );
  }
}
