import 'package:flutter/material.dart';

import '../../colors/ds_colors.dart';
import 'ds_alert_type_enum.dart';

class DSAlertOverlay {
  static void show({
    required BuildContext context,
    required DSAlertTypeEnum type,
    String? title,
    String? description,
  }) {
    _OverlayView.createView(
      context,
      type: type,
      title: title,
      description: description,
    );
  }
}

class _OverlayView {
  factory _OverlayView() {
    return _singleton;
  }

  _OverlayView._internal();

  static final _OverlayView _singleton = _OverlayView._internal();

  static late OverlayState _overlayState;
  static late OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(
    BuildContext context, {
    required DSAlertTypeEnum type,
    String? title,
    String? description,
  }) {
    _overlayState = Navigator.of(context).overlay!;

    if (!_isVisible) {
      _isVisible = true;

      _overlayEntry = OverlayEntry(
        builder: (context) {
          return _EdgeOverlay(
            type: type,
            title: title,
            description: description,
          );
        },
      );

      _overlayState.insert(_overlayEntry);
    }
  }

  static void dismiss() {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry.remove();
  }
}

class _EdgeOverlay extends StatefulWidget {
  const _EdgeOverlay({
    required this.type,
    this.title,
    this.description,
  });

  final DSAlertTypeEnum type;
  final String? title;
  final String? description;

  @override
  State<_EdgeOverlay> createState() => _EdgeOverlayState();
}

class _EdgeOverlayState extends State<_EdgeOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Offset> _positionTween;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _positionTween = Tween<Offset>(
      begin: const Offset(0.0, -34.0),
      end: Offset.zero,
    );

    _positionAnimation = _positionTween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();

    listenToAnimation();
  }

  Future<void> listenToAnimation() async {
    await _controller.forward();
    await Future<void>.delayed(const Duration(seconds: 3));
    if (mounted) {
      _controller.reverse().whenComplete(_OverlayView.dismiss);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _OverlayView.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16.0,
      right: 16.0,
      top: 34.0,
      child: SlideTransition(
        position: _positionAnimation,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: _getBackgroundColor(widget.type),
            borderRadius: BorderRadius.circular(
              4.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800.withOpacity(0.08),
                offset: const Offset(0, 6),
                blurRadius: 16,
              ),
            ],
          ),
          child: _AlertWidget(
            type: widget.type,
            title: widget.title,
            description: widget.description,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(DSAlertTypeEnum type) {
    switch (type) {
      case DSAlertTypeEnum.success:
        return DSColors.success;
      case DSAlertTypeEnum.error:
        return DSColors.error;
      case DSAlertTypeEnum.attention:
        return DSColors.attention;
      default:
        return DSColors.attention;
    }
  }
}

class _AlertWidget extends StatelessWidget {
  const _AlertWidget({
    required this.type,
    this.title,
    this.description,
  });

  final DSAlertTypeEnum type;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 4.0,
              decoration: BoxDecoration(
                color: _getVerticalDividerColor(type),
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Icon(
              _getIcon(type),
              color: _getTitleColor(type),
              size: 32,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _getTitleColor(type),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (description != null)
                    Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTitleColor(DSAlertTypeEnum type) {
    switch (type) {
      case DSAlertTypeEnum.success:
        return DSColors.success.shade800;
      case DSAlertTypeEnum.error:
        return DSColors.error.shade800;
      case DSAlertTypeEnum.attention:
        return DSColors.attention.shade800;
      default:
        return DSColors.attention.shade800;
    }
  }

  Color _getVerticalDividerColor(DSAlertTypeEnum type) {
    switch (type) {
      case DSAlertTypeEnum.success:
        return DSColors.success;
      case DSAlertTypeEnum.error:
        return DSColors.error;
      case DSAlertTypeEnum.attention:
        return DSColors.attention;
      default:
        return DSColors.attention;
    }
  }

  IconData _getIcon(DSAlertTypeEnum type) {
    switch (type) {
      case DSAlertTypeEnum.success:
        return Icons.check_circle_outline_rounded;
      case DSAlertTypeEnum.error:
        return Icons.error_outline_rounded;
      case DSAlertTypeEnum.attention:
        return Icons.info_outline_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }
}
