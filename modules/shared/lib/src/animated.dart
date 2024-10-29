import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Animated {
  static ValueAnimation value(double value) {
    return ValueAnimation(value);
  }

  static Sequence sequence(List<Ani> values, [OnAnimatedUpdate? onUpdate]) {
    return Sequence(values, onUpdate: onUpdate);
  }

  static Parallel parallel(List<Ani> values,
      {OnAnimatedUpdate? onUpdate, bool stopTogether = true}) {
    return Parallel(
      values,
      onUpdate: onUpdate,
      stopTogether: stopTogether,
    );
  }

  static DelayAnimation delay(Duration duration) {
    return DelayAnimation(duration);
  }

  static SpringAnimation spring(
    ValueAnimation value, {
    required double toValue,
    OnAnimatedUpdate? onUpdate,
    bool overshootClamping = false,
    double? bounciness,
    double? speed,
    double tension = 0,
    double friction = 0,
  }) {
    return SpringAnimation(
      value,
      toValue: toValue,
      onUpdate: onUpdate,
      overshootClamping: overshootClamping,
      bounciness: bounciness,
      speed: speed,
      tension: tension,
      friction: friction,
    );
  }
}

class Parallel extends Ani {
  final List<Ani> _values;
  final OnAnimatedUpdate? onUpdate;
  final bool stopTogether;
  bool _lock = false;

  Parallel(this._values, {this.onUpdate, this.stopTogether = true}) : super();

  @override
  Parallel start() {
    _lock = true;
    super.start();
    for (var ani in _values) {
      ani.removeListener(_onElementUpdate);
      ani.addListener(_onElementUpdate);
      ani.start();
    }
    _lock = false;
    return this;
  }

  @override
  Parallel stop() {
    super.stop();
    for (var ani in _values) {
      ani.removeListener(_onElementUpdate);
      ani.stop();
    }
    return this;
  }

  _onElementUpdate() {
    if (_lock) return;
    int complete = 0;
    for (var ani in _values) {
      if (ani.value == true) complete++;
    }
    if (stopTogether == false && complete == _values.length) {
      stop();
      value = true;
      if (onUpdate != null) onUpdate!(true);
    } else if (stopTogether == true && complete > 0) {
      stop();
      value = true;
      if (onUpdate != null) onUpdate!(true);
    } else {
      if (onUpdate != null) onUpdate!(false);
    }
    notifyListeners();
  }
}

class Sequence extends Ani {
  final List<Ani> _values;
  final OnAnimatedUpdate? onUpdate;
  int _index = -1;
  Ani? _ani;

  Sequence(this._values, {this.onUpdate});

  @override
  Sequence start() {
    super.start();
    _index = -1;
    for (var ani in _values) {
      ani.removeListener(_onElementUpdate);
    }
    _next();
    return this;
  }

  @override
  Sequence stop() {
    super.stop();
    for (var ani in _values) {
      ani.removeListener(_onElementUpdate);
      ani.stop();
    }
    return this;
  }

  _next() {
    _index++;
    if (_index >= _values.length) {
      for (var ani in _values) {
        ani.removeListener(_onElementUpdate);
      }
      _ani = null;
      value = true;
      onUpdate?.call(true);
      return;
    }
    _ani = _values.elementAt(_index);
    _ani?.addListener(_onElementUpdate);
    _ani?.start();
  }

  _onElementUpdate() {
    if (_ani?.value == true) {
      _next();
    } else {
      onUpdate?.call(false);
    }
    notifyListeners();
  }
}

class SpringConfig {
  final double tension;
  final double friction;

  SpringConfig(this.tension, this.friction);

  static double _tensionFromOrigamiValue(double oValue) {
    return (oValue - 30.0) * 3.62 + 194.0;
  }

  static double _frictionFromOrigamiValue(double oValue) {
    return (oValue - 8.0) * 3 + 25.0;
  }

  static double _normalize(double value, double startValue, double endValue) {
    return (value - startValue) / (endValue - startValue);
  }

  static double _projectNormal(double n, double start, double end) {
    return start + (n * (end - start));
  }

  static double _linearInterpolation(double t, double start, double end) {
    return t * end + (1 - t) * start;
  }

  static double _quadraticOutInterpolation(double t, double start, double end) {
    return _linearInterpolation(2 * t - t * t, start, end);
  }

  static double _b3Friction1(double x) {
    return (0.0007 * pow(x, 3)) - (0.031 * pow(x, 2)) + 0.64 * x + 1.28;
  }

  static double _b3Friction2(double x) {
    return (0.000044 * pow(x, 3)) - (0.006 * pow(x, 2)) + 0.36 * x + 2.0;
  }

  static double _b3Friction3(double x) {
    return (0.00000045 * pow(x, 3)) -
        (0.000332 * pow(x, 2)) +
        0.1078 * x +
        5.84;
  }

  static double _b3Nobounce(double tension) {
    if (tension <= 18.0) {
      return _b3Friction1(tension);
    } else if (tension > 18.0 && tension <= 44.0) {
      return _b3Friction2(tension);
    } else {
      return _b3Friction3(tension);
    }
  }

  static SpringConfig fromOrigamiTensionAndFriction(
      double tension, double friction) {
    return SpringConfig(
      _tensionFromOrigamiValue(tension),
      _frictionFromOrigamiValue(friction),
    );
  }

  static SpringConfig fromBouncinessAndSpeed(double bounciness, double speed) {
    double b = _normalize(bounciness / 1.7, 0, 20);
    b = _projectNormal(b, 0, 0.8);
    double s = _normalize(speed / 1.7, 0, 20);
    double bouncyTension = _projectNormal(s, 0.5, 200);
    double bouncyFriction =
        _quadraticOutInterpolation(b, _b3Nobounce(bouncyTension), 0.01);
    return SpringConfig(
      _tensionFromOrigamiValue(bouncyTension),
      _frictionFromOrigamiValue(bouncyFriction),
    );
  }
}

class ValueAnimation {
  double _value;
  late double _origin;

  ValueAnimation(this._value) {
    _origin = _value;
  }

  double get value {
    return _value;
  }

  set value(double v) {
    _value = v;
  }

  reset() {
    value = _origin;
  }
}

typedef OnAnimatedUpdate = Function(bool complete);

abstract class Ani extends ValueNotifier<bool> {
  bool _active = false;

  Ani() : super(false);

  Ani start() {
    value = false;
    _active = true;
    return this;
  }

  stop() {
    value = true;
    _active = false;
  }
}

class DelayAnimation extends Ani {
  final Duration duration;
  Timer? _timer;

  DelayAnimation(this.duration) : super();

  @override
  Ani start() {
    super.start();
    _cancel();
    _timer = Timer(duration, _onComplete);
    return this;
  }

  @override
  stop() {
    _cancel();
    super.stop();
  }

  _cancel() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  _onComplete() {
    _timer = null;
    value = true;
  }
}

class SpringAnimation extends Ani {
  final OnAnimatedUpdate? onUpdate;
  final double toValue;
  final bool overshootClamping;
  final double restDisplacementThreshold;
  final double restSpeedThreshold;
  final double velocity;
  final double? bounciness;
  final double? speed;
  final bool isInteraction;
  final double iterations;

  double? _initialVelocity;
  double _lastVelocity = 0;
  double _startPosition = 0;
  double _lastPosition = 0;
  int _lastTime = 0;

  double tension;
  double friction;

  late SpringConfig _springConfig;

  final ValueAnimation _value;

  SpringAnimation(
    this._value, {
    this.onUpdate,
    this.overshootClamping = false,
    this.restDisplacementThreshold = 0.001,
    this.restSpeedThreshold = 0.001,
    this.velocity = 0,
    this.isInteraction = true,
    this.iterations = 1.0,
    this.bounciness,
    this.speed,
    this.tension = 0,
    this.friction = 0,
    required this.toValue,
  }) : super() {
    _initialVelocity = velocity;
    _lastVelocity = velocity;
    if (bounciness != null || speed != null) {
      assert(() {
        if (bounciness == null && friction == null) {
          // ignore: avoid_print
          print(
              'You can only define bounciness/speed or tension/friction but not both');
          return false;
        }
        return true;
      }());
      _springConfig = SpringConfig.fromBouncinessAndSpeed(
        _withDoubleDefault(bounciness, 8.0),
        _withDoubleDefault(speed, 12.0),
      );
    } else {
      _springConfig = SpringConfig.fromOrigamiTensionAndFriction(
        _withDoubleDefault(tension, 40.0),
        _withDoubleDefault(friction, 7.0),
      );
    }
    tension = _springConfig.tension;
    friction = _springConfig.friction;
  }

  @override
  Ani start() {
    super.start();
    _initialVelocity = velocity;
    _lastVelocity = velocity;
    _startPosition = _value.value;
    _lastPosition = _startPosition;
    _lastTime = _now();

    if (_initialVelocity != null) {
      _lastVelocity = _initialVelocity!;
    }

    _update();
    return this;
  }

  _onUpdate(double position) {
    _value.value = position;
    if (onUpdate != null) {
      onUpdate!(false);
    }
    notifyListeners();
  }

  _update() {
    double position = _lastPosition;
    double velocity = _lastVelocity;

    const MAX_STEPS = 64;
    int now = _now();
    if (now > _lastTime + MAX_STEPS) {
      now = _lastTime + MAX_STEPS;
    }

    // We are using a fixed time step and a maximum number of iterations.
    // The following post provides a lot of thoughts into how to build this
    // loop: http://gafferongames.com/game-physics/fix-your-timestep/
    const TIMESTEP_MSEC = 1;
    int numSteps = ((now - _lastTime) / TIMESTEP_MSEC).floor();

    for (int i = 0; i < numSteps; ++i) {
      // Velocity is based on seconds instead of milliseconds
      double step = TIMESTEP_MSEC / 1000;

      double aVelocity = velocity;
      double aAcceleration =
          tension * (toValue - _lastPosition) - friction * _lastVelocity;
      double tempPosition = position + aVelocity * step / 2;
      double tempVelocity = velocity + aAcceleration * step / 2;

      double bVelocity = tempVelocity;
      double bAcceleration =
          tension * (toValue - tempPosition) - friction * tempVelocity;
      tempPosition = position + bVelocity * step / 2;
      tempVelocity = velocity + bAcceleration * step / 2;

      double cVelocity = tempVelocity;
      double cAcceleration =
          tension * (toValue - tempPosition) - friction * tempVelocity;
      tempPosition = position + cVelocity * step / 2;
      tempVelocity = velocity + cAcceleration * step / 2;

      double dVelocity = tempVelocity;
      double dAcceleration =
          tension * (toValue - tempPosition) - friction * tempVelocity;
      tempPosition = position + cVelocity * step / 2;
      tempVelocity = velocity + cAcceleration * step / 2;

      double dxdt = (aVelocity + 2 * (bVelocity + cVelocity) + dVelocity) / 6;
      double dvdt = (aAcceleration +
              2 * (bAcceleration + cAcceleration) +
              dAcceleration) /
          6;

      position += dxdt * step;
      velocity += dvdt * step;
    }

    _lastTime = now;
    _lastPosition = position;
    _lastVelocity = velocity;

    _onUpdate(position);
    if (_active == false) {
      return;
    }

    // Conditions for stopping the spring animation
    var isOvershooting = false;
    if (overshootClamping && tension != 0) {
      if (_startPosition < toValue) {
        isOvershooting = position > toValue;
      } else {
        isOvershooting = position < toValue;
      }
    }
    var isVelocity = velocity.abs() <= restSpeedThreshold;
    var isDisplacement = true;
    if (tension != 0) {
      isDisplacement = (toValue - position).abs() <= restDisplacementThreshold;
    }

    if (isOvershooting || (isVelocity && isDisplacement)) {
      if (tension != 0) {
        // Ensure that we end up with a round value
        _onUpdate(toValue);
      }

      _debouncedOnEnd(finished: true);
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback(_onFrameCallback);
  }

  _onFrameCallback(Duration duration) {
    if (_active == false) return;
    _update();
  }

  _debouncedOnEnd({finished = false}) {
    if (onUpdate != null) {
      onUpdate!(true);
    }
    value = true;
  }

  double _withDoubleDefault(double? val, [double def = 0.0]) {
    if (val == null) {
      return def;
    } else {
      return val;
    }
  }

  int _now() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
