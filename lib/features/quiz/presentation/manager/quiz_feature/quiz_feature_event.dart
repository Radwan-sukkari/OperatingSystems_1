part of 'quiz_feature_bloc.dart';

abstract class QuizFeatureEvent {}

class OsiQuizEvent extends QuizFeatureEvent {}

class TrueFalseQuizEvent extends QuizFeatureEvent {}
class RandomQuizEvent extends QuizFeatureEvent{}
