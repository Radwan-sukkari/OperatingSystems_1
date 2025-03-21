import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:operating_systems/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.boy6).existsSync(), isTrue);
    expect(File(Images.boy).existsSync(), isTrue);
    expect(File(Images.boy10).existsSync(), isTrue);
    expect(File(Images.boy11).existsSync(), isTrue);
    expect(File(Images.boy12).existsSync(), isTrue);
    expect(File(Images.boy13).existsSync(), isTrue);
    expect(File(Images.boy14).existsSync(), isTrue);
    expect(File(Images.boy2).existsSync(), isTrue);
    expect(File(Images.boy4).existsSync(), isTrue);
    expect(File(Images.boy5).existsSync(), isTrue);
    expect(File(Images.boy7).existsSync(), isTrue);
    expect(File(Images.boy8).existsSync(), isTrue);
    expect(File(Images.boy9).existsSync(), isTrue);
    expect(File(Images.boyQuiz).existsSync(), isTrue);
    expect(File(Images.branding).existsSync(), isTrue);
    expect(File(Images.branding2).existsSync(), isTrue);
    expect(File(Images.branding3).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logo3).existsSync(), isTrue);
    expect(File(Images.splashScreen).existsSync(), isTrue);
  });
}
