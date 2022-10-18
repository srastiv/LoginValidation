import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportTextOnChangedEvent>((event, emit) {
      if (event.issue.length <10) {
        emit(ReportErrorState(errorMessage: "Please describe complete issue"));
      } else {
        emit(ReportValidState());
      }
    });

    on<SubmitReportFormEvent>((event, emit) {
      emit(ReportLoadingState());
    });
  }
}
