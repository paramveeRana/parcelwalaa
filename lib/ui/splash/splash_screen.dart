import 'package:flutter/material.dart';
import 'package:parcelwalaa/framework/controller/splash_controller.dart';
import 'package:parcelwalaa/ui/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late SplashController _splashController;

  @override
  void initState() {
    super.initState();
    _splashController = SplashController();
    // Optimize by reducing animation duration
    _splashController.initialize(this, _navigateToHome);
    
    // Add a timeout as fallback
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        debugPrint('SplashScreen: Timeout reached, forcing navigation');
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    debugPrint('SplashScreen: Navigating to home');
    if (mounted) {
      try {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MainScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 200),
          ),
        );
      } catch (e) {
        debugPrint('SplashScreen: Navigation error: $e');
        // Fallback: try direct navigation
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _splashController.animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _splashController.fadeAnimation,
              child: Transform.scale(
                scale: _splashController.scaleAnimation.value,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700), // Yellow background
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFD700).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/parcelwalaa_logo.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('SplashScreen: Image error: $error');
                        return Container(
                          width: 160,
                          height: 160,
                          color: Colors.white,
                          child: const Icon(
                            Icons.delivery_dining,
                            size: 80,
                            color: Color(0xFFFFD700),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
