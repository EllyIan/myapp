import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AIInsightsScreen extends StatefulWidget {
  @override
  _AIInsightsScreenState createState() => _AIInsightsScreenState();
}

class _AIInsightsScreenState extends State<AIInsightsScreen> {
  final AIService _aiService = AIService();
  String _productivityTip = '';
  String _burnoutPrediction = '';

  @override
  void initState() {
    super.initState();
    _loadInsights();
  }

  void _loadInsights() async {
    final productivityTip = await _aiService.getProductivityTip();
    // Example user metrics (work hours, tasks completed, stress level, sleep hours)
    final userMetrics = [8.5, 10.0, 6.0, 7.0];
    final burnoutPrediction = await _aiService.getBurnoutPrediction(userMetrics);
    setState(() {
      _productivityTip = productivityTip;
      _burnoutPrediction = burnoutPrediction;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ... (rest of the build method remains the same)
  }
}