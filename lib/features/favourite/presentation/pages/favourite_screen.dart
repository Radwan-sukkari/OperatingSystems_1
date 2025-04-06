import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/favourite/presentation/manager/favourite/favourite_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/quiz/presentation/pages/quiz_screen.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/about_subject_container.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/osi_card.dart';
import 'package:operating_systems/resources/resources.dart';

class FavouriteScreen extends StatefulWidget {
  final String subjectType;
  static const String name = 'favourite_screen';
  static const String path = '/favourite_screen';

  const FavouriteScreen({super.key, required this.subjectType});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavouriteBloc>()..add(GetFavouriteEvent()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          appBar: AppAppBar(
            title: 'المفضلة',
            isFavourite: true,
            isBack: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: height(25),
              right: width(2),
              left: width(2),
            ),
            child: BlocBuilder<FavouriteBloc, FavouriteState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<FavouriteBloc>().add(GetFavouriteEvent());
                  },
                  child: TabBarView(
                    children: [
                      // Multi Choice tab (answer != 2)
                      _buildFilteredFavoritesList(context, false),

                      // True/False tab (answer == 2)
                      _buildFilteredFavoritesList(context, true),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilteredFavoritesList(BuildContext context, bool isTrueFalse) {
    return BlocSelector<FavouriteBloc, FavouriteState,
        BlocStateData<List<Question>>>(
      selector: (state) => state.getFavouriteState,
      builder: (context, state) {
        return BlocStateDataBuilder(
          data: state,
          onSuccess: (allQuestions) {
            // First filter by question type (true/false vs multi-choice)
            var filteredQuestions = allQuestions?.where((question) {
              return isTrueFalse
                  ? question.answers.length == 2
                  : question.answers.length != 2;
            }).toList();

            // Additional filtering based on subjectType and chapter numbers
            if (widget.subjectType == "1" || widget.subjectType == "2") {
              filteredQuestions = filteredQuestions?.where((question) {
                final chapter = question.chapterEn;

                if (widget.subjectType == "1") {
                  return !_matchesChapters(chapter, ["12", "13", "15"]);
                } else if (widget.subjectType == "2") {
                  return _matchesChapters(chapter, ["12", "13", "15"]);
                }

                return false;
              }).toList();
            }

            if (filteredQuestions?.isEmpty ?? true) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.boy15,
                      height: height(300),
                      width: width(250),
                    ),
                    Text(
                      "المفضلة فارغة",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22,
                          ),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  if (filteredQuestions?.isNotEmpty ?? false)
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width(12)),
                      child: AboutSubjectContainer(
                        title1: " اختبار لاسئلة المفضلة",
                        title2: '  ',
                        function: () {
                          context.pushNamed(
                            QuizScreen.name,
                            extra: filteredQuestions,
                            queryParameters: {
                              "chapterEnglish": "quiz",
                              "chapterArabic": "كويز التعاريق",
                            },
                          );
                        },
                      ),
                    ),
                  SizedBox(height: height(16)),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: height(30)),
                    itemCount: filteredQuestions!.length,
                    itemBuilder: (context, index) {
                      final question = filteredQuestions![index];
                      return Padding(
                        padding: EdgeInsets.only(top: height(30)),
                        child: OsiCard(
                          question: question,
                          index: index,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  bool _matchesChapters(String chapter, List<String> allowedChapters) {
    for (final allowedChapter in allowedChapters) {
      if (chapter.contains(allowedChapter)) {
        return true;
      }
    }
    return false;
  }
}
