import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/choose_subject.dart';
import 'package:operating_systems/core/app/nav_bar.dart';
import 'package:operating_systems/core/app/nav_bar2.dart';
import 'package:operating_systems/core/app/splash_screen.dart';
import 'package:operating_systems/features/favourite/presentation/pages/favourite_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/identification_quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/osi_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/random_quiz.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/translate_the_question_to_arabic_screen.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/true_false_chapter_grid.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/algorithms_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/comparisons_model.dart';
import 'package:operating_systems/features/operating_system_1/study/data/model/system_1_definitions_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/algorithms_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_app.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/about_the_subject.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/resources_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/settings_screen/settings_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/choose_algorithm_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definitions_grid_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/definitions/definitions_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/important_question/important_question_sreen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/important_question/show_full_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/choose_comparisons_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/osi_question_study/osi_question_study_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/pages/study_section/study_section_study_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/osi2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/second_home_page_screen.dart';
import 'package:operating_systems/features/operating_system_2/quiz/presentation/pages/true_false2_chapter_grid_screen.dart';
import 'package:operating_systems/features/operating_system_2/study/presentation/pages/identification2_grid.dart';

final GoRouter router = GoRouter(initialLocation: SplashScreen.path, routes: [
  GoRoute(
    path: NavBar.path,
    name: NavBar.name,
    builder: (context, state) => NavBar(),
  ),
  GoRoute(
      path: IdentificationQuizScreen.path,
      name: IdentificationQuizScreen.name,
      builder: (context, state) {
        final definitions = state.extra as List<Definition>;

        return IdentificationQuizScreen(
          definitions: definitions,
        );
      }),
  GoRoute(
    path: AboutTheSubject.path,
    name: AboutTheSubject.name,
    builder: (context, state) => AboutTheSubject(),
  ),
  GoRoute(
    path: NavBar2.path,
    name: NavBar2.name,
    builder: (context, state) => NavBar2(),
  ),
  GoRoute(
      path: Identification2GridScreen.path,
      name: Identification2GridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return Identification2GridScreen(
          isStudy: isStudy,
        );
      }),
  GoRoute(
    path: SplashScreen.path,
    name: SplashScreen.name,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
      path: FavouriteScreen.path,
      name: FavouriteScreen.name,
      builder: (context, state) {
        final String subjectType = state.uri.queryParameters['subjectType']!;
        return FavouriteScreen(
          subjectType: subjectType,
        );
      }),
  GoRoute(
      path: DefinitionsScreen.path,
      name: DefinitionsScreen.name,
      builder: (context, state) {
        final definitions = state.extra as List<Definition>;
        final index = int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;

        return DefinitionsScreen(
          definitions: definitions, index: index,
        );
      }),
  GoRoute(
    path: ChooseSubjectScreen.path,
    name: ChooseSubjectScreen.name,
    builder: (context, state) => ChooseSubjectScreen(),
  ),
  GoRoute(
      path: DefinitionsGridScreen.path,
      name: DefinitionsGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return DefinitionsGridScreen(
          isStudy: isStudy,
        );
      }),
  GoRoute(
    path: SecondHomePageScreen.path,
    name: SecondHomePageScreen.name,
    builder: (context, state) => SecondHomePageScreen(),
  ),
  GoRoute(
    path: AboutTheApp.path,
    name: AboutTheApp.name,
    builder: (context, state) => AboutTheApp(),
  ),
  GoRoute(
      path: SettingsScreen.path,
      name: SettingsScreen.name,
      builder: (context, state) {
        final String subjectType = state.uri.queryParameters['subjectType']!;

        return SettingsScreen(
          subjectType: subjectType,
        );
      }),
  GoRoute(
    path: ChooseAlgorithmsScreen.path,
    name: ChooseAlgorithmsScreen.name,
    builder: (context, state) => ChooseAlgorithmsScreen(),
  ),
  GoRoute(
    path: ShowFullScreen.path,
    name: ShowFullScreen.name,
    builder: (context, state) {
      final String question = state.uri.queryParameters['question']!;
      final String imagePath = state.uri.queryParameters['imagePath']!;

      return  ShowFullScreen(question: question, imagePath: imagePath,);
    }
  ),
  GoRoute(
    path: ImportantQuestionScreen.path,
    name: ImportantQuestionScreen.name,
    builder: (context, state) => ImportantQuestionScreen(),
  ),
  GoRoute(
      path: ComparisonsScreen.path,
      name: ComparisonsScreen.name,
      builder: (context, state) {
        final Comparisons = state.extra as List<Comparison>;
        final String title = state.uri.queryParameters['title']!;

        return ComparisonsScreen(
          comparisons: Comparisons, title: title,
        );
      }),
  GoRoute(
    path: ChooseComparisonsScreen.path,
    name: ChooseComparisonsScreen.name,
    builder: (context, state) => ChooseComparisonsScreen(),
  ),
  GoRoute(
    path: ResourcesScreen.path,
    name: ResourcesScreen.name,
    builder: (context, state) => ResourcesScreen(),
  ),
  GoRoute(
      path: RandomQuiz.path,
      name: RandomQuiz.name,
      builder: (context, state) {
        final String isOperatingSystem1 =
            state.uri.queryParameters['isOperatingSystem1']!;

        return RandomQuiz(
          isOperatingSystem1: isOperatingSystem1,
        );
      }),
  GoRoute(
      path: Osi2ChapterGridScreen.path,
      name: Osi2ChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return Osi2ChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: OsiChapterGridScreen.path,
      name: OsiChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return OsiChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: TrueFalse2ChapterGridScreen.path,
      name: TrueFalse2ChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return TrueFalse2ChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: TrueFalseChapterGridScreen.path,
      name: TrueFalseChapterGridScreen.name,
      builder: (context, state) {
        final String isStudy = state.uri.queryParameters['isStudy']!;

        return TrueFalseChapterGridScreen(isStudy: isStudy);
      }),
  GoRoute(
      path: AlgorithmsScreens.path,
      name: AlgorithmsScreens.name,
      builder: (context, state) {
        final algorithm = state.extra as Algorithm;

        return AlgorithmsScreens(algorithm: algorithm);
      }),
  GoRoute(
    path: StudySectionStudyScreen.path,
    name: StudySectionStudyScreen.name,
    builder: (context, state) => StudySectionStudyScreen(),
  ),
  GoRoute(
      path: OsiQuestionStudyScreen.path,
      name: OsiQuestionStudyScreen.name,
      builder: (context, state) {
        final questions = state.extra as List<Question>;
        final String chapterEnglish =
            state.uri.queryParameters['chapterEnglish']!;
        final String chapterArabic =
            state.uri.queryParameters['chapterArabic']!;
        return OsiQuestionStudyScreen(
          chapterArabic: chapterArabic,
          questions: questions,
          chapterEnglish: chapterEnglish,
        );
      }),
  GoRoute(
    path: TranslateQuestionTArabicScreen.path,
    name: TranslateQuestionTArabicScreen.name,
    builder: (context, state) {
      final questions = state.extra as Question;

      final String chapterArabic = state.uri.queryParameters['chapterArabic']!;

      final int questionNumberInTheChapter =
          int.parse(state.uri.queryParameters['questionNumberInTheChapter']!);

      final int questionIReceived =
          int.parse(state.uri.queryParameters['questionIReceived']!);

      return TranslateQuestionTArabicScreen(
        questions: questions,
        chapterArabic: chapterArabic,
        questionNumberInTheChapter: questionNumberInTheChapter,
        questionIReceived: questionIReceived,
      );
    },
  ),
  GoRoute(
      path: QuizScreen.path,
      name: QuizScreen.name,
      builder: (context, state) {
        final questions = state.extra as List<Question>;
        final String chapterEnglish =
            state.uri.queryParameters['chapterEnglish']!;
        final String chapterArabic =
            state.uri.queryParameters['chapterArabic']!;
        final String appBarTitle = state.uri.queryParameters['appBarTitle']!;

        return QuizScreen(
          questions: questions,
          chapterEnglish: chapterEnglish,
          chapterArabic: chapterArabic, appBarTitle: appBarTitle
        );
      }),
]);
