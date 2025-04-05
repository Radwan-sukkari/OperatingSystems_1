import 'package:dartz/dartz.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/important_question_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';

abstract class StudyRepo {
  Future<Either<Failure, AlgorithmsModel>> algorithms();
  Future<Either<Failure, ComparisonsModel>> comparisons();
  Future<Either<Failure, SystemDefinitionsModel>> definitions();
  Future<Either<Failure, ImportantQuestionModel>> importantQuestions();



}
