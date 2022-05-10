import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../data.dart';

part 'one_state.dart';

class OneCubit extends Cubit<OneState> {
  OneCubit() : super(OneInitial());

  final Client client = Client();

  void fetch() async {
    emit(OneLoading());
    try {
      final res = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (res.statusCode == 200) {
        final data = postFromJson(res.body);
        emit(OneSuccess(data));
      } else {
        emit(OneError());
      }
    } catch (e) {
      emit(OneError());
    }
  }
}
