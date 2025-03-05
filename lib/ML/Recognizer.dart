import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
// import '../ML_DB/mlDatabaseHelper.dart';
import 'Recognition.dart';

class Recognizer {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;
  static const int WIDTH = 112;
  static const int HEIGHT = 112;
  // final dbHelper = DatabaseHelper();
  Map<String, Recognition> registered = Map();

  @override
  String get modelName => "assets_models/mobile_face_net.tflite";

  Recognizer({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }

    loadModel();
    initDB();
  }

  set registeredFaces(Map<String, Recognition> faces) {
    registered = faces;
  }

  Future<void> loadModel() async {
    try {
      interpreter =
          await Interpreter.fromAsset(modelName, options: _interpreterOptions);
    } catch (e) {
      print('Unable to create interpreter, Caugh Exception: ${e.toString()}');
    }
  }

  initDB() async {
    // if (preloadedData != null) {
    //   registered = preloadedData;
    // }
    // save to db
    // await
    //  .init()
    // loadRegisteredFaces();
  }

  // void loadRegisteredFaces() async {
  //   final allRows = await dbHelper.queryAllRows();

  //   for (final row in allRows) {
  //     print(row[DatabaseHelper.columnName]);
  //     String name = row[DatabaseHelper.columnName]; // replace with email
  //     List<double> embd = row[DatabaseHelper.columnEmbedding]
  //         .split(', ')
  //         .map((e) => double.parse(e))
  //         .toList()
  //         .cast<double>();
  //     Recognition recognition =
  //         Recognition(row[DatabaseHelper.columnName], Rect.zero, embd, 0);
  //     registered.putIfAbsent(name, () => recognition);
  //   }
  // }

  void registeredFaceInDb(String name, List<double> embedding) async {
    // row to insert
    // Map<String, dynamic> row = {
    //   DatabaseHelper.columnName: name,
    //   Databasehelper.columnEmbedding: embedding.join(",")
    // };

    // final id = await dbHelper.insert(row);
    // print("inserted row id: $id");

    print("======== from the registerFaceInDb===============");
    print('name: $name');
    // print(embedding);
  }

  List<dynamic> imageToArray(img.Image inputImage) {
    img.Image resizedImage =
        img.copyResize(inputImage, width: WIDTH, height: HEIGHT);
    List<double> flattenedList = resizedImage.data!
        .expand((channel) => [channel.r, channel.g, channel.b])
        .map((value) => value.toDouble())
        .toList();
    Float32List float32Array = Float32List.fromList(flattenedList);
    int channels = 3;
    int height = HEIGHT;
    int width = WIDTH;
    Float32List reshapedArray = Float32List(1 * height * width * channels);
    for (int c = 0; c < channels; c++) {
      for (int h = 0; h < height; h++) {
        for (int w = 0; w < width; w++) {
          int index = c * height * width + h * width + w;
          reshapedArray[index] =
              (float32Array[c * height * width + h * width + w] - 127.5) /
                  127.5;
        }
      }
    }
    return reshapedArray.reshape([1, 112, 112, 3]);
  }

  Recognition recognize(img.Image image, Rect location) {
    // crop face from imag resize it and convert it to float array
    var input = imageToArray(image);
    print(input.shape.toString());

    // output array
    List output = List.filled(1 * 192, 0).reshape([1, 192]);

    // performs inference
    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(input, output);
    final run = DateTime.now().millisecondsSinceEpoch - runs;
    print('Time to run inference: $run ms$output');

    // convert dynamic list to double list
    List<double> outputArray = output.first.cast<double>();

    // looks for the nearest embedding in the database and returns the pair
    Pair pair = findNearest(outputArray);
    print("============ top =======distance is 👌👌👌 ${pair.distance}");

    if (pair.distance > 1.0) {
      print("distance is 👌👌👌 ${pair.distance}");
      pair.email = "Unknown";
    }
    print(
        "distance is 👌👌👌 ${pair.distance} and email ========= ${pair.email}");

    return Recognition(pair.email, location, outputArray, pair.distance);
  }

  // looks for the nearest embedding in the database and returns the pair which contains information of registered face with which face is the neeatest
  findNearest(List<double> emb) {
    Pair pair = Pair("Unknown", -5);
    for (MapEntry<String, Recognition> item in registered.entries) {
      final String email = item.key;
      List<double> knownEmb = item.value.embeddings;
      double distance = 0;
      for (int i = 0; i < emb.length; i++) {
        double diff = emb[i] - knownEmb[i];
        distance += diff * diff;
      }

      distance = sqrt(distance);
      if (pair.distance == -5 || distance < pair.distance) {
        pair.distance = distance;
        pair.email = email;
      }
    }
    return pair;
  }

  void close() {
    interpreter.close();
  }
}

class Pair {
  String email;
  double distance;

  Pair(this.email, this.distance);
}
