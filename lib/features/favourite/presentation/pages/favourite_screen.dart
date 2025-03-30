import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:operating_systems/core/app/app_app_bar.dart';
import 'package:operating_systems/core/app/size.dart';
import 'package:operating_systems/core/bloc/app_state_bloc.dart';
import 'package:operating_systems/core/bloc/bloc_state_data_builder.dart';
import 'package:operating_systems/core/injection/injection.dart';
import 'package:operating_systems/features/favourite/presentation/manager/favourite/favourite_bloc.dart';
import 'package:operating_systems/features/operating_system_1/quiz/data/model/quiz_model.dart';
import 'package:operating_systems/features/operating_system_1/study/presentation/widget/osi_card.dart';
import 'package:operating_systems/resources/resources.dart';

class FavouriteScreen extends StatelessWidget {
  static const String name = 'favourite_screen';
  static const String path = '/favourite_screen';

  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FavouriteBloc>()..add(GetFavouriteEvent()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          appBar:AppAppBar(title: 'المفضلة',isFavourite:true,isBack: true,),
          body: Padding(
            padding: EdgeInsets.only(
              top: height(25),
              right: width(2),
              left: width(2),
            ),
            child: TabBarView(
              children: [
                // Multi Choice tab (answer != 2)
                _buildFilteredFavoritesList(context, false),

                // True/False tab (answer == 2)
                _buildFilteredFavoritesList(context, true),
              ],
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
            // Filter questions based on the tab type
            final filteredQuestions = allQuestions?.where((question) {
              return isTrueFalse
                  ? question.answers.length == 2
                  : question.answers.length != 2;
            }).toList();

            if (filteredQuestions?.isEmpty ?? true) {
              return Center(
                child: Image.asset(Images.empty,height: height(300),width: width(250),),

              );
            }

            return ListView.builder(
              itemCount: filteredQuestions!.length,
              itemBuilder: (context, index) {
                final question = filteredQuestions[index];
                return Padding(
                  padding:  EdgeInsets.only(top: height(30)),
                  child: OsiCard(
                    question: question,
                    index: index,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
