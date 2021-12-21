#### widget_tree_depth_counter
# Widget Tree Depth Counter
[![Pub Package](https://img.shields.io/pub/v/widget_tree_depth_counter.svg?style=flat-square)](https://pub.dartlang.org/packages/widget_tree_depth_counter)
[![likes](https://badges.bar/widget_tree_depth_counter/likes)](https://pub.dev/packages/widget_tree_depth_counter/score)
[![popularity](https://badges.bar/widget_tree_depth_counter/popularity)](https://pub.dev/packages/widget_tree_depth_counter/score)
[![pub points](https://badges.bar/widget_tree_depth_counter/pub%20points)](https://pub.dev/packages/widget_tree_depth_counter/score)

[![Package Issue](https://img.shields.io/github/issues/rickypid/widget_tree_depth_counter)](https://github.com/rickypid/widget_tree_depth_counter/issues)
![Package License](https://img.shields.io/github/license/rickypid/widget_tree_depth_counter)

`WidgetTreeDepthCounter` is a simple widget to count the amount of nested widget tree, useful in the dynamic construction of the interface when it is important to know the depth of widget.

| ![Image](https://github.com/rickypid/widget_tree_depth_counter/blob/master/doc/.media/example.jpg?raw=true) |
| :------------: |
| **WidgetTreeDepthCounter** |

## Features

* count of the depth of the widget with respect to the tree **(all uses of WidgetTreeDepthCounter in the current tree are counted, the other types of widgets are not counted)**

This widget can be used conveniently in such cases:

- Dynamically manage the colors of widgets based on their position in the tree
- in an app that manages chapter numbers it is very easy to renumber them in case a chapter is removed.
- ...

  Many other cases where it is very difficult to manage a widget through fixed parameters to be managed based on the construction of the tree.

&nbsp;

## Usage

Make sure to check out the [examples on GitHub](https://github.com/rickypid/widget_tree_depth_counter/tree/master/example).

| ![Image](https://github.com/rickypid/widget_tree_depth_counter/blob/master/doc/.media/widget_tree_example.jpg?raw=true) |
| :------------: |
| **Example of operation in a widget tree** |

### Installation

#### From `pubspec.yaml`

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  widget_tree_depth_counter: <last-release>
```

and 

```bash
flutter pub get
```

#### From cli

run following command:

```bash
flutter pub add widget_tree_depth_counter
```

### Basic setup

*Complete example [available here](https://github.com/rickypid/widget_tree_depth_counter/blob/master/example/lib/main.dart).*

```dart
ParentWidget(
  child: WidgetTreeDepthCounter(
    builder: (context, counter) => //counter=0
      Container(
        color: Theme.of(context)
          .primaryColor
          .withOpacity(counter * 0.05 + 0.05),
          child: WidgetTreeDepthCounter(
            builder: (context, counter) =>//counter=1
                Container(
                    color: Theme.of(context)
                    .primaryColor
                        .withOpacity(counter * 0.05 + 0.05),
                ),
          ),
      ),
  ),
),
```

### WidgetTreeDepthCounter Properties

* `builder`: Function called at layout time to construct the widget tree, return `Widget`.
* `count`: With this parameter it's possible define or overwrite the current depth count value.

&nbsp;

### Use current `counter` value during build `WidgetTreeDepthCounter`

`WidgetTreeDepthCounter` uses [Provider](https://pub.dev/packages/provider) library to count the depth, but if it is necessary to access the current value to perform a sum (for example), it is possible to retrieve the count value through the `Provider 'functions:

```dart

WidgetTreeDepthCounter(
			count: context.read<DepthCounter>().value + 2,
            builder: (context, counter) =>
                Text(counter.toString()),
          )

```

**Obviously to access the value via `context.read<DepthCounter>()` it is necessary that at least one `WidgetTreeDepthCounter` is present in the tree and `provider` package is required.**

&nbsp;

