import 'package:for_your_head/src/features/models/response.dart';

class ResultArg {
  ResultArg({
    required this.response,
    required this.score,
    required this.videoFile,
  });

  List<Response> response;
  int score;
  String videoFile;
}
