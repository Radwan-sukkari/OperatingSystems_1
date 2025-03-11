part of 'quiz_feature_bloc.dart';

 class QuizFeatureState {
   final BlocStateData<QuizModel> quizState;


   const QuizFeatureState({
     this.quizState = const BlocStateData.init(),

   });

   copWith({
     BlocStateData<QuizModel>? quizState,



   }) =>
       QuizFeatureState(
         quizState: quizState ?? this.quizState,

       );
 }

