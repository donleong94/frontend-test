import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_posts_state.dart';

class AllPostsCubit extends Cubit<AllPostsState> {
  AllPostsCubit() : super(AllPostsState());
}
