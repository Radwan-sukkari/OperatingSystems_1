import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:operating_systems/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.boy).existsSync(), isTrue);
    expect(File(Images.boy2).existsSync(), isTrue);
    expect(File(Images.boy3).existsSync(), isTrue);
    expect(File(Images.boy4).existsSync(), isTrue);
    expect(File(Images.boyQuiz).existsSync(), isTrue);
  });
}
