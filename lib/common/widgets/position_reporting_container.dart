import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef PositionCallback = void Function(Offset position, Size size);

class PositionReportingContainer extends SingleChildRenderObjectWidget {
  const PositionReportingContainer({
    super.key,
    required Widget child,
    required this.onPositionReported,
  }) : super(child: child);

  final PositionCallback onPositionReported;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return PositionReportingRenderObject(onPositionReported);
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant PositionReportingRenderObject renderObject) {
    renderObject.onPositionReported = onPositionReported;
  }
}

class PositionReportingRenderObject extends RenderProxyBox {
  PositionReportingRenderObject(this.onPositionReported);

  PositionCallback onPositionReported;

  @override
  void performLayout() {
    super.performLayout();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box = this;
      final Offset position = box.localToGlobal(Offset.zero);
      onPositionReported(position, box.size);
    });
  }
}
