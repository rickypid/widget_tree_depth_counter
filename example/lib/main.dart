import 'package:flutter/material.dart';
import 'package:widget_tree_depth_counter/widget_tree_depth_counter.dart';
import 'package:widget_tree_depth_counter_example/helper/colored_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetTreeDepthCounter Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget tree depth counter'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ColorExample(),
        ),
      ),
    );
  }
}

class ColorExample extends StatelessWidget {
  const ColorExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth * .9,
        height: constraints.maxHeight * .9,
        child: WidgetTreeDepthCounter(
          builder: (context, counter) => ColoredContainer(
            counter: counter,
            color: Theme.of(context)
                .primaryColor
                .withOpacity(counter * 0.05 + 0.05),
            child: WidgetTreeDepthCounter(
              builder: (context, counter) => ColoredContainer(
                counter: counter,
                color: Theme.of(context)
                    .primaryColor
                    .withOpacity(counter * 0.05 + 0.05),
                child: WidgetTreeDepthCounter(
                  builder: (context, counter) => ColoredContainer(
                    counter: counter,
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(counter * 0.05 + 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: WidgetTreeDepthCounter(
                            builder: (context, counter) => ColoredContainer(
                              counter: counter,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(counter * 0.05 + 0.05),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: WidgetTreeDepthCounter(
                            builder: (context, counter) => ColoredContainer(
                              counter: counter,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(counter * 0.05 + 0.05),
                              child: WidgetTreeDepthCounter(
                                builder: (context, counter) => ColoredContainer(
                                  counter: counter,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(counter * 0.05 + 0.05),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: WidgetTreeDepthCounter(
                                          builder: (context, counter) =>
                                              ColoredContainer(
                                            counter: counter,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(
                                                    counter * 0.05 + 0.05),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: WidgetTreeDepthCounter(
                                                    builder:
                                                        (context, counter) =>
                                                            ColoredContainer(
                                                      counter: counter,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(
                                                              counter * 0.05 +
                                                                  0.05),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: WidgetTreeDepthCounter(
                                                    builder:
                                                        (context, counter) =>
                                                            ColoredContainer(
                                                      counter: counter,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(
                                                              counter * 0.05 +
                                                                  0.05),
                                                      child:
                                                          WidgetTreeDepthCounter(
                                                        builder: (context,
                                                                counter) =>
                                                            ColoredContainer(
                                                          counter: counter,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor
                                                              .withOpacity(
                                                                  counter *
                                                                          0.05 +
                                                                      0.05),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: WidgetTreeDepthCounter(
                                          builder: (context, counter) =>
                                              ColoredContainer(
                                            counter: counter,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(
                                                    counter * 0.05 + 0.05),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: WidgetTreeDepthCounter(
                                                    builder:
                                                        (context, counter) =>
                                                            ColoredContainer(
                                                      counter: counter,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(
                                                              counter * 0.05 +
                                                                  0.05),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: WidgetTreeDepthCounter(
                                                    builder:
                                                        (context, counter) =>
                                                            ColoredContainer(
                                                      counter: counter,
                                                      color: Theme.of(context)
                                                          .primaryColor
                                                          .withOpacity(
                                                              counter * 0.05 +
                                                                  0.05),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
