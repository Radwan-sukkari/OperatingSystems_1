import 'package:flutter/material.dart';
import '../../../../../core/bloc/app_state_bloc.dart';

class BlocStateDataBuilder<T> extends StatelessWidget {
  const BlocStateDataBuilder(
      {super.key,
      required this.data,
      this.onLoading,
      this.onFailed,
      this.onInit,
      required this.onSuccess});

  final BlocStateData<T> data;
  final Widget? onLoading;
  final Widget? onFailed;
  final Widget? onInit;
  final Widget Function(T? data) onSuccess;

  @override
  Widget build(BuildContext context) {
    if (data.isLoading) {
      return onLoading ??
          Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surfaceTint));
    }
    if (data.isFailed) {
      return onFailed ?? const Center(child: Text('fail'));
    }
    if (data.isInit) {
      return onInit ?? const SizedBox.shrink();
    }
    return onSuccess(data.data);
  }
}
