part of 'company_bloc.dart';

@immutable
abstract class CompanyState {
  final List<Company> lists;

  CompanyState(this.lists);
}

class CompanyInitial extends CompanyState {
  CompanyInitial() : super([]);
}

class CompanyLoaded extends CompanyState {
  CompanyLoaded(List<Company> lists) : super(lists);
}

class CompanyError extends CompanyState {
  CompanyError(this.message) : super([]);
  final String message;
}
