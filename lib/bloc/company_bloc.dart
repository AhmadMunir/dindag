import 'package:bloc/bloc.dart';
import 'package:dindag/models/models.dart';
import 'package:dindag/services/company_service.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitial()) {
    on<CompanyEvent>((event, emit) async {
      final _service = await CompanyService(http.Client()).getAll();

      emit(_service.status!
          ? CompanyLoaded(_service.data!)
          : CompanyError(_service.message!));
    });
  }
}
