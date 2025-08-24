import 'package:flutter/material.dart';


class SplashController extends ChangeNotifier {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  
  // Getters for animations
  Animation<double> get scaleAnimation => _scaleAnimation;
  Animation<double> get fadeAnimation => _fadeAnimation;
  AnimationController get animationController => _animationController;
  
  // State management
  bool _isAnimationComplete = false;
  bool get isAnimationComplete => _isAnimationComplete;
  
  // Navigation callback
  VoidCallback? _onAnimationComplete;
  
  void initialize(TickerProvider vsync, VoidCallback onAnimationComplete) {
    _onAnimationComplete = onAnimationComplete;
    
               _animationController = AnimationController(
             duration: const Duration(milliseconds: 800), // Reduced from 1200ms
             vsync: vsync,
           );

    // Scale animation: starts small (0.3) and grows to cover screen (3.0)
    _scaleAnimation = Tween<double>(
      begin: 0.3,
      end: 3.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Fade animation: starts visible, fades out at the end
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
    ));

    // Listen to animation completion
    _animationController.addStatusListener(_onAnimationStatusChanged);
    
    // Start animation
    startAnimation();
  }
  
  void startAnimation() {
    _animationController.forward();
  }
  
  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _isAnimationComplete = true;
      notifyListeners();
      
      // Call navigation callback
      _onAnimationComplete?.call();
    }
  }
  
  @override
  void dispose() {
    _animationController.removeStatusListener(_onAnimationStatusChanged);
    _animationController.dispose();
    super.dispose();
  }
}
