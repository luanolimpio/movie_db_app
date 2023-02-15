import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// * [DirecaoShimmer.ltr] direcao do shimmer da esquerda para direita
/// * [DirecaoShimmer.rtl] direcaodo shimmer  da direita para esquerda
/// * [DirecaoShimmer.ttb] direcao do shimmer da cima para baixo
/// * [DirecaoShimmer.btt] direcao do shimmer da baixo para cima
enum DirecaoShimmer { ltr, rtl, ttb, btt }

@immutable
class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.child,
    required this.gradient,
    Key? key,
    this.direcao = DirecaoShimmer.ltr,
    this.periodo = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.ativado = true,
  }) : super(key: key);

  Shimmer.fromColors({
    required this.child,
    required Color baseColor,
    required Color highlightColor,
    Key? key,
    this.periodo = const Duration(milliseconds: 1500),
    this.direcao = DirecaoShimmer.ltr,
    this.loop = 0,
    this.ativado = true,
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
  final Duration periodo;
  final DirecaoShimmer direcao;
  final Gradient gradient;
  final int loop;
  final bool ativado;

  @override
  State<Shimmer> createState() => _ShimmerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(
      EnumProperty<DirecaoShimmer>(
        'direcao',
        direcao,
        defaultValue: DirecaoShimmer.ltr,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'periodo',
        periodo,
        defaultValue: const Duration(
          milliseconds: 1500,
        ),
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'ativado',
        ativado,
        defaultValue: true,
      ),
    );
    properties.add(DiagnosticsProperty<int>('loop', loop, defaultValue: 0));
  }
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _contador = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.periodo)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _contador++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_contador < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });
    if (widget.ativado) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    if (widget.ativado) {
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
        direcao: widget.direcao,
        gradient: widget.gradient,
        percentual: _controller.value,
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
    required this.percentual,
    required this.direcao,
    required this.gradient,
    Widget? child,
  }) : super(child: child);
  final double percentual;
  final DirecaoShimmer direcao;
  final Gradient gradient;

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percentual, direcao, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percentual = percentual;
    shimmer.gradient = gradient;
    shimmer.direcao = direcao;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  _ShimmerFilter(
    this._percentual,
    this._direcao,
    this._gradient,
  );
  DirecaoShimmer _direcao;
  Gradient _gradient;
  double _percentual;

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percentual(double newValue) {
    if (newValue == _percentual) {
      return;
    }
    _percentual = newValue;
    markNeedsPaint();
  }

  set gradient(Gradient newValue) {
    if (newValue == _gradient) {
      return;
    }
    _gradient = newValue;
    markNeedsPaint();
  }

  set direcao(DirecaoShimmer newDirection) {
    if (newDirection == _direcao) {
      return;
    }
    _direcao = newDirection;
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
      if (_direcao == DirecaoShimmer.rtl) {
        dx = _offset(width, -width, _percentual);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      } else if (_direcao == DirecaoShimmer.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percentual);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else if (_direcao == DirecaoShimmer.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percentual);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percentual);
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

  double _offset(double start, double end, double percentual) {
    return start + (end - start) * percentual;
  }
}
