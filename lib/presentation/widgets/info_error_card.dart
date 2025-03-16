import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/language_change/view_model/language_cubit.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';
import 'package:turkish/turkish.dart';

abstract class BasicCard extends StatelessWidget {

   final String firstDescription;
  final String secondDescription;

  const BasicCard({
    super.key,
    required this.firstDescription,
    required this.secondDescription,
  });
}

class BasicInfoCard extends BasicCard {
  const BasicInfoCard({
    super.key,
    required super.firstDescription,
    required super.secondDescription,
  });

  @override
  Widget build(BuildContext context) {
    _BuildBasicInfoCardContent buildBasicInfoCardContent = _BuildBasicInfoCardContent();
    return _buildBasicInfoCard(buildBasicInfoCardContent: buildBasicInfoCardContent);
  }

  Card _buildBasicInfoCard({required _BuildBasicInfoCardContent buildBasicInfoCardContent}) {
    return Card(
        elevation: 0,
        borderOnForeground: true,
        child: buildBasicInfoCardContent._buildCardContent(
          firstDescription: firstDescription,
          secondDescription: secondDescription,
        ));
  }
}



class _BuildBasicInfoCardContent {
  String _normalizationLetters({required LanguageState state, required String normalizeString}) {
    if (state is! LanguageEnglish) {
      return normalizeString;
    } else {
      normalizeString = normalizeString.replaceAll('i', 'ı');
      return normalizeString;
    }
  }

  Widget _buildCardContent({
    required String firstDescription,
    required String secondDescription,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundColor: Colors.transparent,
                child: Image.asset(ImagePathManager.instance.infoErrorImage),
              ),

              SizedBox(height: AppSizeHeight.s6),
              Center(
                child: BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, state) {
                    String normalizedString = _normalizationLetters(
                      state: state,
                      normalizeString: firstDescription,
                    );
                    return Text(
                      turkish.toUpperCase(normalizedString),
                      textAlign: TextAlign.center,
                      style: getBoldBlackStyle(),
                      overflow: TextOverflow.fade,
                    );
                  },
                ),
              ),
               SizedBox(height: AppSizeHeight.s6),
              Center(
                child: Text(
                  secondDescription,
                  textAlign: TextAlign.center,
                  style: getBoldBlackStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
