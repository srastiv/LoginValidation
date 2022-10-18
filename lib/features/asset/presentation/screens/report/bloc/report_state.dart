part of 'report_bloc.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportValidState extends ReportState {}

class ReportErrorState extends ReportState {
  final String errorMessage;
  ReportErrorState({required this.errorMessage});
}
