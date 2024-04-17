import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// * [DirectionShimmer.ltr] direcao do shimmer da esquerda para direita
/// * [DirectionShimmer.rtl] direcaodo shimmer  da direita para esquerda
/// * [DirectionShimmer.ttb] direcao do shimmer da cima para baixo
/// * [DirectionShimmer.btt] direcao do shimmer da baixo para cima
enum DirectionShimmer { ltr, rtl, ttb, btt }

@immutable
class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.child,
    required this.gradient,
    Key? key,
    this.direction = DirectionShimmer.ltr,
    this.duration = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.active = true,
  }) : super(key: key);

  Shimmer.fromColors({
    required this.child,
    required Color baseColor,
    required Color highlightColor,
    Key? key,
    this.duration = const Duration(milliseconds: 1500),
    this.direction = DirectionShimmer.ltr,
    this.loop = 0,
    this.active = true,
  })  : gradient = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              baseColor,
              baseColor,
              highlightColor,
              baseColor,
              baseColor
            ],
            stops: const <double>[
              0.0,
              0.35,
              0.5,
              0.65,
              1.0
            ]),
        super(key: key);

  final Widget child;
  final Duration duration;
  final DirectionShimmer direction;
  final Gradient gradient;
  final int loop;
  final bool active;

  @override
  State<Shimmer> createState() => _ShimmerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(
      EnumProperty<DirectionShimmer>(
        'direcao',
        direction,
        defaultValue: DirectionShimmer.ltr,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'periodo',
        duration,
        defaultValue: const Duration(
          milliseconds: 1500,
        ),
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'ativado',
        active,
        defaultValue: true,
      ),
    );
    properties.add(DiagnosticsProperty<int>('loop', loop, defaultValue: 0));
  }
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _counter++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_counter < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });
    if (widget.active) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    if (widget.active) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) => _Shimmer(
        direction: widget.direction,
        gradient: widget.gradient,
        percentage: _controller.value,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Shimmer extends SingleChildRenderObjectWidget {
  const _Shimmer({
    required this.percentage,
    required this.direction,
    required this.gradient,
    Widget? child,
  }) : super(child: child);
  final double percentage;
  final DirectionShimmer direction;
  final Gradient gradient;

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percentage, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percentage = percentage;
    shimmer.gradient = gradient;
    shimmer.direction = direction;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  _ShimmerFilter(
    this._percentage,
    this._direction,
    this._gradient,
  );

  DirectionShimmer _direction;
  Gradient _gradient;
  double _percentage;

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percentage(double newValue) {
    if (newValue == _percentage) {
      return;
    }
    _percentage = newValue;
    markNeedsPaint();
  }

  set gradient(Gradient newValue) {
    if (newValue == _gradient) {
      return;
    }
    _gradient = newValue;
    markNeedsPaint();
  }

  set direction(DirectionShimmer newDirection) {
    if (newDirection == _direction) {
      return;
    }
    _direction = newDirection;
    markNeedsLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);

      final double width = child!.size.width;
      final double height = child!.size.height;
      Rect rect;
      double dx, dy;
      if (_direction == DirectionShimmer.rtl) {
        dx = _offset(width, -width, _percentage);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      } else if (_direction == DirectionShimmer.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percentage);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else if (_direction == DirectionShimmer.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percentage);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percentage);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      }
      layer ??= ShaderMaskLayer();
      layer!
        ..shader = _gradient.createShader(rect)
        ..maskRect = offset & size
        ..blendMode = BlendMode.srcIn;
      context.pushLayer(layer!, super.paint, offset);
    } else {
      layer = null;
    }
  }

  double _offset(double start, double end, double percentage) {
    return start + (end - start) * percentage;
  }
}
