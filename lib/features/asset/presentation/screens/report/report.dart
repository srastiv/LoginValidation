import 'package:asset/features/asset/presentation/constants/colors.dart';
import 'package:asset/features/asset/presentation/constants/texts.dart';
import 'package:asset/features/asset/presentation/constants/textstyles.dart';
import 'package:asset/features/asset/presentation/screens/login/login.dart';
import 'package:asset/features/asset/presentation/screens/report/bloc/report_bloc.dart';
import 'package:asset/features/asset/presentation/screens/widgets/textfield.dart';
import 'package:asset/features/asset/presentation/screens/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Report extends StatelessWidget {
  Report({Key? key}) : super(key: key);
  TextEditingController assetController = TextEditingController();
  TextEditingController issueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kWhite,
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        kBack,
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    kReportAnIssue,
                    const SizedBox(
                      height: 28,
                    ),
                    kSelectAnAsset,
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        //  borderRadius: BorderRadius.circular(10),
                        elevation: 0,
                        icon: const Icon(
                          Icons.arrow_downward_outlined,
                          color: kBlack,
                        ),
                        hint: const Text(
                          "Select Asset",
                          style: TextStyle(color: kGrey),
                        ),
                        items: <String>['Macbook', 'Dell', 'Lenovo', 'Acer']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: kBlack),
                            ),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    kDescribeYourIssue,
                    const SizedBox(
                      height: 6,
                    ),
                    EnterDetailsTextField(
                      text: "Tell us a little more about the issue...",
                      height: 128,
                      controller: issueController,
                      onchange: (value) {
                        BlocProvider.of<ReportBloc>(context).add(
                            ReportTextOnChangedEvent(
                                issue: issueController.text));
                      },
                    ),
                    BlocBuilder<ReportBloc, ReportState>(
                      builder: (context, state) {
                        if (state is ReportErrorState) {
                          return Text(
                            state.errorMessage,
                            style: kErrorStyle,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    kRequiredField,
                    const SizedBox(
                      height: 193,
                    ),
                    SubmitButton(
                      color: (state is ReportValidState) ? kBlue : kLightBlue,
                      onpressed: (state is! ReportValidState)
                          ? null
                          : issueController.clear,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
