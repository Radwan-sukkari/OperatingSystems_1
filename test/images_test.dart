import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:operating_systems/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.boy).existsSync(), isTrue);
    expect(File(Images.boyQuiz).existsSync(), isTrue);
  });
}
