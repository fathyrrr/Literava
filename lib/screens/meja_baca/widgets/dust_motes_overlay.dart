import 'dart:math';
import 'package:flutter/material.dart';

class DustMotesOverlay extends StatefulWidget {
  final bool isLampOn;

  const DustMotesOverlay({super.key, required this.isLampOn});

  @override
  State<DustMotesOverlay> createState() => _DustMotesOverlayState();
}

class _DustMotesOverlayState extends State<DustMotesOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Mote> _motes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    final rand = Random(42);
    _motes = List.generate(22, (i) {
      return _Mote(
        x: rand.nextDouble(),
        y: rand.nextDouble(),
        radius: 1.0 + rand.nextDouble() * 2.0,
        speed: 0.6 + rand.nextDouble() * 0.9,
        baseAlpha: 0.2 + rand.nextDouble() * 0.45,
        driftOffset: rand.nextDouble() * 2 * pi,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: widget.isLampOn ? 1.0 : 0.0,
      child: IgnorePointer(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: Size.infinite,
              painter: _DustMotesPainter(
                progress: _controller.value,
                motes: _motes,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Mote {
  final double x;
  final double y;
  final double radius;
  final double speed;
  final double baseAlpha;
  final double driftOffset;

  const _Mote({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.baseAlpha,
    required this.driftOffset,
  });
}

class _DustMotesPainter extends CustomPainter {
  final double progress;
  final List<_Mote> motes;

  _DustMotesPainter({required this.progress, required this.motes});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    for (final mote in motes) {
      // Float upward gently
      final double currentY = (mote.y - progress * mote.speed) % 1.0;
      // Drift gently left and right
      final double drift = sin(progress * 2 * pi * mote.speed + mote.driftOffset) * 0.035;
      final double currentX = (mote.x + drift).clamp(0.02, 0.98);

      final double px = currentX * size.width;
      final double py = currentY * size.height;

      // Soft amber glow
      final paint = Paint()
        ..color = const Color(0xFFFDE68A).withValues(alpha: mote.baseAlpha)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.2);

      canvas.drawCircle(Offset(px, py), mote.radius, paint);

      // Core brighter dot
      final corePaint = Paint()
        ..color = const Color(0xFFFFFBEB).withValues(alpha: (mote.baseAlpha * 1.3).clamp(0.0, 1.0));
      canvas.drawCircle(Offset(px, py), mote.radius * 0.5, corePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _DustMotesPainter oldDelegate) => true;
}
