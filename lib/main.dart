import 'package:flutter/material.dart';

void main() {
  runApp(const MindSpeakApp());
}

class MindSpeakApp extends StatelessWidget {
  const MindSpeakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindSpeak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: MindSpeakColors.brightBlue,
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class MindSpeakColors {
  static const navy = Color(0xFF09294F);
  static const brightBlue = Color(0xFF209FE1);
  static const softBlue = Color(0xFFF3F7FF);
  static const paleBlue = Color(0xFFE9F0FF);
  static const mutedText = Color(0xFF455779);
  static const divider = Color(0xFFD8E0ED);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MindSpeakColors.softBlue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF8FAFF), Color(0xFFF0F5FF)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 13),
                    const _ClinicalBadge(),
                    const Spacer(flex: 3),
                    const _EmblemCard(),
                    const SizedBox(height: 51),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'MindSpeak',
                            style: TextStyle(
                              color: MindSpeakColors.navy,
                              fontSize: 27,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.8,
                            ),
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: MindSpeakColors.brightBlue,
                              fontSize: 31,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Turning Brain Signals Into Words',
                      style: TextStyle(
                        color: MindSpeakColors.mutedText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    const SizedBox(height: 19),
                    const _EegWave(),
                    const Spacer(flex: 3),
                    _ConnectionPanel(animation: _controller),
                    const SizedBox(height: 31),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ClinicalBadge extends StatelessWidget {
  const _ClinicalBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, color: MindSpeakColors.brightBlue, size: 5),
          SizedBox(width: 6),
          Text(
            'CLINICAL GRADE NEURAL AI',
            style: TextStyle(
              color: MindSpeakColors.mutedText,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmblemCard extends StatelessWidget {
  const _EmblemCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 116,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x24061B3C),
            blurRadius: 22,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: const Center(child: _BrainMark()),
    );
  }
}

class _BrainMark extends StatelessWidget {
  const _BrainMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 57,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (final offset in const [
            Offset(-13, -5),
            Offset(-6, -13),
            Offset(6, -13),
            Offset(13, -5),
            Offset(-14, 7),
            Offset(0, 10),
            Offset(14, 7),
          ])
            Transform.translate(
              offset: offset,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: MindSpeakColors.paleBlue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MindSpeakColors.brightBlue.withValues(alpha: 0.7),
                    width: 1.3,
                  ),
                ),
              ),
            ),
          const Icon(
            Icons.graphic_eq_rounded,
            color: MindSpeakColors.navy,
            size: 23,
          ),
        ],
      ),
    );
  }
}

class _EegWave extends StatelessWidget {
  const _EegWave();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 25,
      child: CustomPaint(painter: _EegWavePainter()),
    );
  }
}

class _EegWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0875B9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final path = Path()
      ..moveTo(0, 14)
      ..lineTo(46, 14)
      ..lineTo(53, 10)
      ..lineTo(59, 14)
      ..lineTo(67, 4)
      ..lineTo(75, 23)
      ..lineTo(83, 3)
      ..lineTo(91, 18)
      ..lineTo(98, 13)
      ..lineTo(106, 14)
      ..lineTo(size.width, 14);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ConnectionPanel extends StatelessWidget {
  const _ConnectionPanel({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.circle, color: Color(0xFFDDEBFA), size: 13),
            SizedBox(width: 5),
            Text(
              'Neural Interface Ready',
              style: TextStyle(
                color: MindSpeakColors.navy,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              '100%',
              style: TextStyle(
                color: Color(0xFF006EB4),
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 4,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) => LinearProgressIndicator(
                value: animation.value,
                backgroundColor: MindSpeakColors.divider,
                valueColor: const AlwaysStoppedAnimation(
                  MindSpeakColors.brightBlue,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 17),
        const Divider(height: 1, color: MindSpeakColors.divider),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield_outlined, color: Color(0xFF0875B9), size: 14),
            SizedBox(width: 6),
            Text(
              'Non-Invasive BCI Speech Synthesis',
              style: TextStyle(
                color: MindSpeakColors.navy,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
