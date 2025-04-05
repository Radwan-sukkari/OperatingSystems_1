import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:operating_systems/core/errors/failuer.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/important_question_model.dart';
import 'package:operating_systems/features/operating_system_1/study/domain/repositories/study_repo.dart';
@lazySingleton
class ImportantQuestionUseCase {
  final StudyRepo studyRepo;

  ImportantQuestionUseCase({required this.studyRepo});

  Future<Either<Failure, ImportantQuestionModel>> call() =>
      studyRepo.importantQuestions();
}
