import 'package:bloc/bloc.dart';
import 'network_service.dart';
import 'network_states.dart';

class NetworkCubit extends Cubit<NetworkState>{
  final NetworkService networkService;
  NetworkCubit(this.networkService):super(NetworkStateInitial());

  Future<void> fetchData() async {
    emit(NetworkStateLoading());
    try {
      final data = await networkService.fetchData();
      emit(NetworkStateLoaded(data));
    } catch (e) {
      emit(NetworkStateError(e.toString()));
    }
  }
}