part of 'report_bloc.dart';

@immutable
abstract class ReportEvent {}
class ReportTextOnChangedEvent extends ReportEvent {
  
  final String issue;
  ReportTextOnChangedEvent({ required this.issue});
}

class SubmitReportFormEvent extends ReportEvent {
  
  final String issue;
    SubmitReportFormEvent({required this.issue});
}
