// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart'
    show
        DragDownDetails,
        DragEndDetails,
        DragStartDetails,
        DragUpdateDetails,
        ForcePressGestureRecognizer,
        GestureDragCancelCallback,
        GestureDragDownCallback,
        GestureDragEndCallback,
        GestureDragStartCallback,
        GestureDragUpdateCallback,
        GestureForcePressEndCallback,
        GestureForcePressPeakCallback,
        GestureForcePressStartCallback,
        GestureForcePressUpdateCallback,
        GestureLongPressCallback,
        GestureLongPressUpCallback,
        GestureRecognizer,
        GestureTapCallback,
        GestureTapCancelCallback,
        GestureTapDownCallback,
        GestureTapUpCallback,
        HorizontalDragGestureRecognizer,
        LongPressGestureRecognizer,
        PanGestureRecognizer,
        PointerDeviceKind,
        TapDownDetails,
        TapGestureRecognizer,
        TapUpDetails,
        VerticalDragGestureRecognizer;
import 'package:flutter/rendering.dart';

import 'package:flutter/src/widgets/basic.dart' show Listener;
import 'package:flutter/src/widgets/framework.dart'
    show
        StatelessWidget,
        StatefulWidget,
        State,
        Widget,
        Element,
        BuildContext,
        SingleChildRenderObjectWidget;
import './scale.dart';
import './multitap.dart';
import './double_details.dart';
export 'package:flutter/gestures.dart'
    show
        DragDownDetails,
        DragStartDetails,
        DragUpdateDetails,
        DragEndDetails,
        GestureTapDownCallback,
        GestureTapUpCallback,
        GestureTapCallback,
        GestureTapCancelCallback,
        GestureLongPressCallback,
        GestureDragDownCallback,
        GestureDragStartCallback,
        GestureDragUpdateCallback,
        GestureDragEndCallback,
        GestureDragCancelCallback,
        // GestureScaleStartCallback,
        // GestureScaleUpdateCallback,
        // GestureScaleEndCallback,
        GestureForcePressStartCallback,
        GestureForcePressPeakCallback,
        GestureForcePressEndCallback,
        GestureForcePressUpdateCallback,
        // ScaleStartDetails,
        // ScaleUpdateDetails,
        // ScaleEndDetails,
        TapDownDetails,
        TapUpDetails,
        Velocity;
export './scale.dart'
    show
        GestureScaleStartCallback,
        GestureScaleUpdateCallback,
        GestureScaleEndCallback,
        ScaleStartDetails,
        ScaleUpdateDetails,
        ScaleEndDetails;
export './double_details.dart' show DoubleDetails;
// Examples can assume:
// bool _lights;
// void setState(VoidCallback fn) { }
// String _last;

/// Factory for creating gesture recognizers.
///
/// `T` is the type of gesture recognizer this class manages.
///
/// Used by [RawGestureDetector.gestures].
@optionalTypeArgs
abstract class GestureRecognizerFactory<T extends GestureRecognizer> {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const GestureRecognizerFactory();

  /// Must return an instance of T.
  T constructor();

  /// Must configure the given instance (which will have been created by
  /// `constructor`).
  ///
  /// This normally means setting the callbacks.
  void initializer(T instance);

  bool _debugAssertTypeMatches(Type type) {
    assert(type == T,
        'GestureRecognizerFactory of type $T was used where type $type was specified.');
    return true;
  }
}

/// Signature for closures that implement [GestureRecognizerFactory.constructor].
typedef GestureRecognizerFactoryConstructor<T extends GestureRecognizer> = T
    Function();

/// Signature for closures that implement [GestureRecognizerFactory.initializer].
typedef GestureRecognizerFactoryInitializer<T extends GestureRecognizer> = void
    Function(T instance);

/// Factory for creating gesture recognizers that delegates to callbacks.
///
/// Used by [RawGestureDetector.gestures].
class GestureRecognizerFactoryWithHandlers<T extends GestureRecognizer>
    extends GestureRecognizerFactory<T> {
  /// Creates a gesture recognizer factory with the given callbacks.
  ///
  /// The arguments must not be null.
  const GestureRecognizerFactoryWithHandlers(
      this._constructor, this._initializer);

  final GestureRecognizerFactoryConstructor<T> _constructor;

  final GestureRecognizerFactoryInitializer<T> _initializer;

  @override
  T constructor() => _constructor();

  @override
  void initializer(T instance) => _initializer(instance);
}

/// A widget that detects gestures.
///
/// Attempts to recognize gestures that correspond to its non-null callbacks.
///
/// If this widget has a child, it defers to that child for its sizing behavior.
/// If it does not have a child, it grows to fit the parent instead.
///
/// By default a GestureDetector with an invisible child ignores touches;
/// this behavior can be controlled with [behavior].
///
/// GestureDetector also listens for accessibility events and maps
/// them to the callbacks. To ignore accessibility events, set
/// [excludeFromSemantics] to true.
///
/// See <http://flutter.io/gestures/> for additional information.
///
/// Material design applications typically react to touches with ink splash
/// effects. The [InkWell] class implements this effect and can be used in place
/// of a [GestureDetector] for handling taps.
///
/// {@tool sample}
///
/// This example makes a rectangle react to being tapped by setting the
/// `_lights` field:
///
/// ```dart
/// GestureDetector(
///   onTap: () {
///     setState(() { _lights = true; });
///   },
///   child: Container(
///     color: Colors.yellow,
///     child: Text('TURN LIGHTS ON'),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// ## Debugging
///
/// To see how large the hit test box of a [GestureDetector] is for debugging
/// purposes, set [debugPaintPointersEnabled] to true.
class GestureDetector extends StatelessWidget {
  /// Creates a widget that detects gestures.
  ///
  /// Pan and scale callbacks cannot be used simultaneously because scale is a
  /// superset of pan. Simply use the scale callbacks instead.
  ///
  /// Horizontal and vertical drag callbacks cannot be used simultaneously
  /// because a combination of a horizontal and vertical drag is a pan. Simply
  /// use the pan callbacks instead.
  ///
  /// By default, gesture detectors contribute semantic information to the tree
  /// that is used by assistive technology.
  GestureDetector(
      {super.key,
      this.child,
      this.onTapDown,
      this.onTapUp,
      this.onTap,
      this.onTapCancel,
      this.onDoubleTap,
      this.onLongPress,
      this.onLongPressUp,
      this.onVerticalDragDown,
      this.onVerticalDragStart,
      this.onVerticalDragUpdate,
      this.onVerticalDragEnd,
      this.onVerticalDragCancel,
      this.onHorizontalDragDown,
      this.onHorizontalDragStart,
      this.onHorizontalDragUpdate,
      this.onHorizontalDragEnd,
      this.onHorizontalDragCancel,
      this.onForcePressStart,
      this.onForcePressPeak,
      this.onForcePressUpdate,
      this.onForcePressEnd,
      this.onPanDown,
      this.onPanStart,
      this.onPanUpdate,
      this.onPanEnd,
      this.onPanCancel,
      this.onScaleStart,
      this.onScaleUpdate,
      this.onScaleEnd,
      this.behavior,
      this.excludeFromSemantics = false})
      : assert(() {
          final bool haveVerticalDrag = onVerticalDragStart != null ||
              onVerticalDragUpdate != null ||
              onVerticalDragEnd != null;
          final bool haveHorizontalDrag = onHorizontalDragStart != null ||
              onHorizontalDragUpdate != null ||
              onHorizontalDragEnd != null;
          final bool havePan =
              onPanStart != null || onPanUpdate != null || onPanEnd != null;
          final bool haveScale = onScaleStart != null ||
              onScaleUpdate != null ||
              onScaleEnd != null;
          if (havePan || haveScale) {
            if (havePan && haveScale) {
              throw FlutterError('Incorrect GestureDetector arguments.\n'
                  'Having both a pan gesture recognizer and a scale gesture recognizer is redundant; scale is a superset of pan. Just use the scale gesture recognizer.');
            }
            final String recognizer = havePan ? 'pan' : 'scale';
            if (haveVerticalDrag && haveHorizontalDrag) {
              throw FlutterError('Incorrect GestureDetector arguments.\n'
                  'Simultaneously having a vertical drag gesture recognizer, a horizontal drag gesture recognizer, and a $recognizer gesture recognizer '
                  'will result in the $recognizer gesture recognizer being ignored, since the other two will catch all drags.');
            }
          }
          return true;
        }());

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// A pointer that might cause a tap has contacted the screen at a particular
  /// location.
  ///
  /// This is called after a short timeout, even if the winning gesture has not
  /// yet been selected. If the tap gesture wins, [onTapUp] will be called,
  /// otherwise [onTapCancel] will be called.
  final GestureTapDownCallback? onTapDown;

  /// A pointer that will trigger a tap has stopped contacting the screen at a
  /// particular location.
  ///
  /// This triggers immediately before [onTap] in the case of the tap gesture
  /// winning. If the tap gesture did not win, [onTapCancel] is called instead.
  final GestureTapUpCallback? onTapUp;

  /// A tap has occurred.
  ///
  /// This triggers when the tap gesture wins. If the tap gesture did not win,
  /// [onTapCancel] is called instead.
  ///
  /// See also:
  ///
  ///  * [onTapUp], which is called at the same time but includes details
  ///    regarding the pointer position.
  final GestureTapCallback? onTap;

  /// The pointer that previously triggered [onTapDown] will not end up causing
  /// a tap.
  ///
  /// This is called after [onTapDown], and instead of [onTapUp] and [onTap], if
  /// the tap gesture did not win.
  final GestureTapCancelCallback? onTapCancel;

  /// The user has tapped the screen at the same location twice in quick
  /// succession.
  final GestureDoubleTapCallback? onDoubleTap;

  /// A pointer has remained in contact with the screen at the same location for
  /// a long period of time.
  final GestureLongPressCallback? onLongPress;

  /// A pointer that has triggered a long-press has stopped contacting the screen.
  final GestureLongPressUpCallback? onLongPressUp;

  /// A pointer has contacted the screen and might begin to move vertically.
  final GestureDragDownCallback? onVerticalDragDown;

  /// A pointer has contacted the screen and has begun to move vertically.
  final GestureDragStartCallback? onVerticalDragStart;

  /// A pointer that is in contact with the screen and moving vertically has
  /// moved in the vertical direction.
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// vertically is no longer in contact with the screen and was moving at a
  /// specific velocity when it stopped contacting the screen.
  final GestureDragEndCallback? onVerticalDragEnd;

  /// The pointer that previously triggered [onVerticalDragDown] did not
  /// complete.
  final GestureDragCancelCallback? onVerticalDragCancel;

  /// A pointer has contacted the screen and might begin to move horizontally.
  final GestureDragDownCallback? onHorizontalDragDown;

  /// A pointer has contacted the screen and has begun to move horizontally.
  final GestureDragStartCallback? onHorizontalDragStart;

  /// A pointer that is in contact with the screen and moving horizontally has
  /// moved in the horizontal direction.
  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// horizontally is no longer in contact with the screen and was moving at a
  /// specific velocity when it stopped contacting the screen.
  final GestureDragEndCallback? onHorizontalDragEnd;

  /// The pointer that previously triggered [onHorizontalDragDown] did not
  /// complete.
  final GestureDragCancelCallback? onHorizontalDragCancel;

  /// A pointer has contacted the screen and might begin to move.
  final GestureDragDownCallback? onPanDown;

  /// A pointer has contacted the screen and has begun to move.
  final GestureDragStartCallback? onPanStart;

  /// A pointer that is in contact with the screen and moving has moved again.
  final GestureDragUpdateCallback? onPanUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// is no longer in contact with the screen and was moving at a specific
  /// velocity when it stopped contacting the screen.
  final GestureDragEndCallback? onPanEnd;

  /// The pointer that previously triggered [onPanDown] did not complete.
  final GestureDragCancelCallback? onPanCancel;

  /// The pointers in contact with the screen have established a focal point and
  /// initial scale of 1.0.
  final GestureScaleStartCallback? onScaleStart;

  /// The pointers in contact with the screen have indicated a new focal point
  /// and/or scale.
  final GestureScaleUpdateCallback? onScaleUpdate;

  /// The pointers are no longer in contact with the screen.
  final GestureScaleEndCallback? onScaleEnd;

  /// The pointer is in contact with the screen and has pressed with sufficient
  /// force to initiate a force press. The amount of force is at least
  /// [ForcePressGestureRecognizer.startPressure].
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressStartCallback? onForcePressStart;

  /// The pointer is in contact with the screen and has pressed with the maximum
  /// force. The amount of force is at least
  /// [ForcePressGestureRecognizer.peakPressure].
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// A pointer is in contact with the screen, has previously passed the
  /// [ForcePressGestureRecognizer.startPressure] and is either moving on the
  /// plane of the screen, pressing the screen with varying forces or both
  /// simultaneously.
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// The pointer is no longer in contact with the screen.
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressEndCallback? onForcePressEnd;

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior? behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final Map<Type, GestureRecognizerFactory> gestures =
        <Type, GestureRecognizerFactory>{};

    if (onTapDown != null ||
        onTapUp != null ||
        onTap != null ||
        onTapCancel != null) {
      gestures[TapGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
        () => TapGestureRecognizer(debugOwner: this),
        (TapGestureRecognizer instance) {
          instance
            ..onTapDown = onTapDown
            ..onTapUp = onTapUp
            ..onTap = onTap
            ..onTapCancel = onTapCancel;
        },
      );
    }

    if (onDoubleTap != null) {
      gestures[DoubleTapGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
        () => DoubleTapGestureRecognizer(debugOwner: this),
        (DoubleTapGestureRecognizer instance) {
          instance.onDoubleTap = onDoubleTap;
        },
      );
    }

    if (onLongPress != null || onLongPressUp != null) {
      gestures[LongPressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
        () => LongPressGestureRecognizer(debugOwner: this),
        (LongPressGestureRecognizer instance) {
          instance
            ..onLongPress = onLongPress
            ..onLongPressUp = onLongPressUp;
        },
      );
    }
    if (onVerticalDragDown != null ||
        onVerticalDragStart != null ||
        onVerticalDragUpdate != null ||
        onVerticalDragEnd != null ||
        onVerticalDragCancel != null) {
      gestures[VerticalDragGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
        () => VerticalDragGestureRecognizer(debugOwner: this),
        (VerticalDragGestureRecognizer instance) {
          instance
            ..onDown = onVerticalDragDown
            ..onStart = onVerticalDragStart
            ..onUpdate = onVerticalDragUpdate
            ..onEnd = onVerticalDragEnd
            ..onCancel = onVerticalDragCancel;
        },
      );
    }

    if (onHorizontalDragDown != null ||
        onHorizontalDragStart != null ||
        onHorizontalDragUpdate != null ||
        onHorizontalDragEnd != null ||
        onHorizontalDragCancel != null) {
      gestures[HorizontalDragGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<HorizontalDragGestureRecognizer>(
        () => HorizontalDragGestureRecognizer(debugOwner: this),
        (HorizontalDragGestureRecognizer instance) {
          instance
            ..onDown = onHorizontalDragDown
            ..onStart = onHorizontalDragStart
            ..onUpdate = onHorizontalDragUpdate
            ..onEnd = onHorizontalDragEnd
            ..onCancel = onHorizontalDragCancel;
        },
      );
    }

    if (onPanDown != null ||
        onPanStart != null ||
        onPanUpdate != null ||
        onPanEnd != null ||
        onPanCancel != null) {
      gestures[PanGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
        () => PanGestureRecognizer(debugOwner: this),
        (PanGestureRecognizer instance) {
          instance
            ..onDown = onPanDown
            ..onStart = onPanStart
            ..onUpdate = onPanUpdate
            ..onEnd = onPanEnd
            ..onCancel = onPanCancel;
        },
      );
    }

    if (onScaleStart != null || onScaleUpdate != null || onScaleEnd != null) {
      gestures[ScaleGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<ScaleGestureRecognizer>(
        () => ScaleGestureRecognizer(debugOwner: this),
        (ScaleGestureRecognizer instance) {
          instance
            ..onStart = onScaleStart
            ..onUpdate = onScaleUpdate
            ..onEnd = onScaleEnd;
        },
      );
    }

    if (onForcePressStart != null ||
        onForcePressPeak != null ||
        onForcePressUpdate != null ||
        onForcePressEnd != null) {
      gestures[ForcePressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<ForcePressGestureRecognizer>(
        () => ForcePressGestureRecognizer(debugOwner: this),
        (ForcePressGestureRecognizer instance) {
          instance
            ..onStart = onForcePressStart
            ..onPeak = onForcePressPeak
            ..onUpdate = onForcePressUpdate
            ..onEnd = onForcePressEnd;
        },
      );
    }

    return RawGestureDetector(
      gestures: gestures,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      child: child,
    );
  }
}

/// A widget that detects gestures described by the given gesture
/// factories.
///
/// For common gestures, use a [GestureRecognizer].
/// [RawGestureDetector] is useful primarily when developing your
/// own gesture recognizers.
///
/// Configuring the gesture recognizers requires a carefully constructed map, as
/// described in [gestures] and as shown in the example below.
///
/// {@tool sample}
///
/// This example shows how to hook up a [TapGestureRecognizer]. It assumes that
/// the code is being used inside a [State] object with a `_last` field that is
/// then displayed as the child of the gesture detector.
///
/// ```dart
/// RawGestureDetector(
///   gestures: <Type, GestureRecognizerFactory>{
///     TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
///       () => TapGestureRecognizer(),
///       (TapGestureRecognizer instance) {
///         instance
///           ..onTapDown = (TapDownDetails details) { setState(() { _last = 'down'; }); }
///           ..onTapUp = (TapUpDetails details) { setState(() { _last = 'up'; }); }
///           ..onTap = () { setState(() { _last = 'tap'; }); }
///           ..onTapCancel = () { setState(() { _last = 'cancel'; }); };
///       },
///     ),
///   },
///   child: Container(width: 300.0, height: 300.0, color: Colors.yellow, child: Text(_last)),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [GestureDetector], a less flexible but much simpler widget that does the same thing.
///  * [Listener], a widget that reports raw pointer events.
///  * [GestureRecognizer], the class that you extend to create a custom gesture recognizer.
class RawGestureDetector extends StatefulWidget {
  /// Creates a widget that detects gestures.
  ///
  /// By default, gesture detectors contribute semantic information to the tree
  /// that is used by assistive technology. This can be controlled using
  /// [excludeFromSemantics].
  const RawGestureDetector(
      {super.key,
      this.child,
      this.gestures = const <Type, GestureRecognizerFactory>{},
      this.behavior,
      this.excludeFromSemantics = false});

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// The gestures that this widget will attempt to recognize.
  ///
  /// This should be a map from [GestureRecognizer] subclasses to
  /// [GestureRecognizerFactory] subclasses specialized with the same type.
  ///
  /// This value can be late-bound at layout time using
  /// [RawGestureDetectorState.replaceGestureRecognizers].
  final Map<Type, GestureRecognizerFactory> gestures;

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior? behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  @override
  RawGestureDetectorState createState() => RawGestureDetectorState();
}

/// State for a [RawGestureDetector].
class RawGestureDetectorState extends State<RawGestureDetector> {
  Map<Type, GestureRecognizer> _recognizers = const <Type, GestureRecognizer>{};

  @override
  void initState() {
    super.initState();
    _syncAll(widget.gestures);
  }

  @override
  void didUpdateWidget(RawGestureDetector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncAll(widget.gestures);
  }

  /// This method can be called after the build phase, during the
  /// layout of the nearest descendant [RenderObjectWidget] of the
  /// gesture detector, to update the list of active gesture
  /// recognizers.
  ///
  /// The typical use case is [Scrollable]s, which put their viewport
  /// in their gesture detector, and then need to know the dimensions
  /// of the viewport and the viewport's child to determine whether
  /// the gesture detector should be enabled.
  ///
  /// The argument should follow the same conventions as
  /// [RawGestureDetector.gestures]. It acts like a temporary replacement for
  /// that value until the next build.
  void replaceGestureRecognizers(Map<Type, GestureRecognizerFactory> gestures) {
    assert(() {
      if (!(context.findRenderObject()?.owner?.debugDoingLayout ?? false)) {
        throw FlutterError(
            'Unexpected call to replaceGestureRecognizers() method of RawGestureDetectorState.\n'
            'The replaceGestureRecognizers() method can only be called during the layout phase. '
            'To set the gesture recognizers at other times, trigger a new build using setState() '
            'and provide the new gesture recognizers as constructor arguments to the corresponding '
            'RawGestureDetector or GestureDetector object.');
      }
      return true;
    }());
    _syncAll(gestures);
    if (!widget.excludeFromSemantics) {
      final RenderSemanticsGestureHandler? semanticsGestureHandler =
          context.findRenderObject() as RenderSemanticsGestureHandler?;
      if (semanticsGestureHandler != null) {
        context.visitChildElements((Element element) {
          final _GestureSemantics widget = element.widget as _GestureSemantics;
          widget._updateHandlers(semanticsGestureHandler);
        });
      }
    }
  }

  /// This method can be called outside of the build phase to filter the list of
  /// available semantic actions.
  ///
  /// The actual filtering is happening in the next frame and a frame will be
  /// scheduled if non is pending.
  ///
  /// This is used by [Scrollable] to configure system accessibility tools so
  /// that they know in which direction a particular list can be scrolled.
  ///
  /// If this is never called, then the actions are not filtered. If the list of
  /// actions to filter changes, it must be called again.
  void replaceSemanticsActions(Set<SemanticsAction> actions) {
    assert(() {
      final Element element = context as Element;
      if (element.owner?.debugBuilding ?? false) {
        throw FlutterError(
            'Unexpected call to replaceSemanticsActions() method of RawGestureDetectorState.\n'
            'The replaceSemanticsActions() method can only be called outside of the build phase.');
      }
      return true;
    }());
    if (!widget.excludeFromSemantics) {
      final RenderSemanticsGestureHandler? semanticsGestureHandler =
          context.findRenderObject() as RenderSemanticsGestureHandler?;
      semanticsGestureHandler?.validActions =
          actions; // will call _markNeedsSemanticsUpdate(), if required.
    }
  }

  @override
  void dispose() {
    for (GestureRecognizer recognizer in _recognizers.values) {
      recognizer.dispose();
    }
    _recognizers.clear();
    super.dispose();
  }

  void _syncAll(Map<Type, GestureRecognizerFactory> gestures) {
    final Map<Type, GestureRecognizer> oldRecognizers = _recognizers;
    _recognizers = <Type, GestureRecognizer>{};
    for (Type type in gestures.keys) {
      assert(gestures[type] != null);
      assert(gestures[type]!._debugAssertTypeMatches(type));
      assert(!_recognizers.containsKey(type));
      _recognizers[type] =
          oldRecognizers[type] ?? gestures[type]!.constructor();
      assert(_recognizers[type].runtimeType == type,
          'GestureRecognizerFactory of type $type created a GestureRecognizer of type ${_recognizers[type].runtimeType}. The GestureRecognizerFactory must be specialized with the type of the class that it returns from its constructor method.');
      gestures[type]!.initializer(_recognizers[type]!);
    }
    for (Type type in oldRecognizers.keys) {
      if (!_recognizers.containsKey(type)) oldRecognizers[type]?.dispose();
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    for (GestureRecognizer recognizer in _recognizers.values) {
      recognizer.addPointer(event);
    }
  }

  HitTestBehavior get _defaultBehavior {
    return widget.child == null
        ? HitTestBehavior.translucent
        : HitTestBehavior.deferToChild;
  }

  void _handleSemanticsTap() {
    final TapGestureRecognizer? recognizer =
        _recognizers[TapGestureRecognizer] as TapGestureRecognizer?;
    assert(recognizer != null);
    if (recognizer != null) {
      if (recognizer.onTapDown != null) recognizer.onTapDown!(TapDownDetails());
      if (recognizer.onTapUp != null)
        recognizer.onTapUp!(TapUpDetails(kind: PointerDeviceKind.touch));
      if (recognizer.onTap != null) recognizer.onTap!();
    }
  }

  void _handleSemanticsLongPress() {
    final LongPressGestureRecognizer? recognizer =
        _recognizers[LongPressGestureRecognizer] as LongPressGestureRecognizer?;
    assert(recognizer != null);
    if (recognizer?.onLongPress != null) recognizer!.onLongPress!();
  }

  void _handleSemanticsHorizontalDragUpdate(DragUpdateDetails updateDetails) {
    {
      final HorizontalDragGestureRecognizer? recognizer =
          _recognizers[HorizontalDragGestureRecognizer]
              as HorizontalDragGestureRecognizer?;
      if (recognizer != null) {
        if (recognizer.onDown != null) recognizer.onDown!(DragDownDetails());
        if (recognizer.onStart != null) recognizer.onStart!(DragStartDetails());
        if (recognizer.onUpdate != null) recognizer.onUpdate!(updateDetails);
        if (recognizer.onEnd != null)
          recognizer.onEnd!(DragEndDetails(primaryVelocity: 0.0));
        return;
      }
    }
    {
      final PanGestureRecognizer? recognizer =
          _recognizers[PanGestureRecognizer] as PanGestureRecognizer?;
      if (recognizer != null) {
        if (recognizer.onDown != null) recognizer.onDown!(DragDownDetails());
        if (recognizer.onStart != null) recognizer.onStart!(DragStartDetails());
        if (recognizer.onUpdate != null) recognizer.onUpdate!(updateDetails);
        if (recognizer.onEnd != null) recognizer.onEnd!(DragEndDetails());
        return;
      }
    }
  }

  void _handleSemanticsVerticalDragUpdate(DragUpdateDetails updateDetails) {
    {
      final VerticalDragGestureRecognizer? recognizer =
          _recognizers[VerticalDragGestureRecognizer]
              as VerticalDragGestureRecognizer?;
      if (recognizer != null) {
        if (recognizer.onDown != null) recognizer.onDown!(DragDownDetails());
        if (recognizer.onStart != null) recognizer.onStart!(DragStartDetails());
        if (recognizer.onUpdate != null) recognizer.onUpdate!(updateDetails);
        if (recognizer.onEnd != null)
          recognizer.onEnd!(DragEndDetails(primaryVelocity: 0.0));
        return;
      }
    }
    {
      final PanGestureRecognizer? recognizer =
          _recognizers[PanGestureRecognizer] as PanGestureRecognizer?;
      if (recognizer != null) {
        if (recognizer.onDown != null) recognizer.onDown!(DragDownDetails());
        if (recognizer.onStart != null) recognizer.onStart!(DragStartDetails());
        if (recognizer.onUpdate != null) recognizer.onUpdate!(updateDetails);
        if (recognizer.onEnd != null) recognizer.onEnd!(DragEndDetails());
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = Listener(
        onPointerDown: _handlePointerDown,
        behavior: widget.behavior ?? _defaultBehavior,
        child: widget.child);
    if (!widget.excludeFromSemantics)
      result = _GestureSemantics(owner: this, child: result);
    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final List<String> gestures = _recognizers.values
        .map<String>(
            (GestureRecognizer recognizer) => recognizer.debugDescription)
        .toList();
    properties
        .add(IterableProperty<String>('gestures', gestures, ifEmpty: '<none>'));
    properties.add(IterableProperty<GestureRecognizer>(
        'recognizers', _recognizers.values,
        level: DiagnosticLevel.fine));
    properties.add(EnumProperty<HitTestBehavior>('behavior', widget.behavior,
        defaultValue: null));
  }
}

class _GestureSemantics extends SingleChildRenderObjectWidget {
  const _GestureSemantics({super.child, required this.owner});

  final RawGestureDetectorState owner;

  @override
  RenderSemanticsGestureHandler createRenderObject(BuildContext context) {
    return RenderSemanticsGestureHandler(
      onTap: _onTapHandler,
      onLongPress: _onLongPressHandler,
      onHorizontalDragUpdate: _onHorizontalDragUpdateHandler,
      onVerticalDragUpdate: _onVerticalDragUpdateHandler,
    );
  }

  void _updateHandlers(RenderSemanticsGestureHandler renderObject) {
    renderObject
      ..onTap = _onTapHandler
      ..onLongPress = _onLongPressHandler
      ..onHorizontalDragUpdate = _onHorizontalDragUpdateHandler
      ..onVerticalDragUpdate = _onVerticalDragUpdateHandler;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderSemanticsGestureHandler renderObject) {
    _updateHandlers(renderObject);
  }

  GestureTapCallback? get _onTapHandler {
    return owner._recognizers.containsKey(TapGestureRecognizer)
        ? owner._handleSemanticsTap
        : null;
  }

  GestureTapCallback? get _onLongPressHandler {
    return owner._recognizers.containsKey(LongPressGestureRecognizer)
        ? owner._handleSemanticsLongPress
        : null;
  }

  GestureDragUpdateCallback? get _onHorizontalDragUpdateHandler {
    return owner._recognizers.containsKey(HorizontalDragGestureRecognizer) ||
            owner._recognizers.containsKey(PanGestureRecognizer)
        ? owner._handleSemanticsHorizontalDragUpdate
        : null;
  }

  GestureDragUpdateCallback? get _onVerticalDragUpdateHandler {
    return owner._recognizers.containsKey(VerticalDragGestureRecognizer) ||
            owner._recognizers.containsKey(PanGestureRecognizer)
        ? owner._handleSemanticsVerticalDragUpdate
        : null;
  }
}
