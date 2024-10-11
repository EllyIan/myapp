import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class AIService {
  late TensorFlowLiteInterpreter _interpreter;
  final List<String> _productivityTips = [
    "Break large tasks into smaller, manageable chunks.",
    "Use the Pomodoro Technique: 25 minutes of focused work, then a 5-minute break.",
    "Prioritize your tasks using the Eisenhower Matrix.",
    "Minimize distractions by turning off notifications during focused work periods.",
    "Start your day by completing the most important or challenging task.",
  ];

  AIService() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      if (kIsWeb) {
        _interpreter = await TensorFlowLiteWebInterpreter.fromAsset('assets/productivity_model.tflite');
      } else {
        _interpreter = await TensorFlowLiteInterpreter.fromAsset('assets/productivity_model.tflite');
      }
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<String> getProductivityTip() async {
    // For simplicity, we're just returning a random tip
    // In a real app, you'd use the model to generate or select a tip
    return _productivityTips[Random().nextInt(_productivityTips.length)];
  }

  Future<String> getBurnoutPrediction(List<double> userMetrics) async {
    try {
      var inputShape = _interpreter.getInputTensor(0).shape;
      var outputShape = _interpreter.getOutputTensor(0).shape;

      var input = TensorBuffer.createFixedSize(inputShape, TfLiteType.float32);
      var output = TensorBuffer.createFixedSize(outputShape, TfLiteType.float32);

      input.loadList(userMetrics);

      _interpreter.run(input.buffer, output.buffer);

      List<double> outputList = output.getDoubleList();
      double burnoutScore = outputList[0];

      if (burnoutScore < 0.3) {
        return "Low risk of burnout. Keep up the good work!";
      } else if (burnoutScore < 0.7) {
        return "Moderate risk of burnout. Consider taking more breaks.";
      } else {
        return "High risk of burnout. Please prioritize self-care and rest.";
      }
    } catch (e) {
      print('Error running inference: $e');
      return "Unable to predict burnout risk at this time.";
    }
  }
}