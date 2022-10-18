import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportTextOnChangedEvent>((event, emit) {
      int n = 100;
      if (event.issue.length < n) {
        emit(ReportErrorState(
            errorMessage: "Please describe the issue in atleast $n letters"));
      } else {
        emit(ReportValidState());
      }
    });

    on<SubmitReportFormEvent>((event, emit) {
      emit(ReportLoadingState());
    });
  }
}
