import 'package:advertisement_app/screens/auth/auth_controller/auth_controller.dart';
import 'package:advertisement_app/utils/app_utils/string/validation_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import '../../../../common_components/app_elevated_button.dart';
import '../../../../constants/app_spacer_constants.dart';
import '../../../../utils/app_utils/colors/app_colors.dart';
import '../../../../utils/app_utils/string/strings.dart';
import '../../../../utils/core/helpers/global_helper.dart';

class ProfileFields extends StatefulWidget {
  const ProfileFields({super.key});

  @override
  State<ProfileFields> createState() => _ProfileFieldsState();
}

class _ProfileFieldsState extends State<ProfileFields> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSpacer.p12(),
        typeAheadLocationSearchField(
            authController: authController, context: context),
      ],
    );
  }
}

Widget typeAheadLocationSearchField(
    {required AuthController authController, required BuildContext context}) {
  return TypeAheadFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (type) {
      return authController.validateStringIfEmptyOnly(
          type!, Strings.lblYourDesiredSearchPlace);
    },
    errorBuilder: (context, val) {
      return Container();
    },
    textFieldConfiguration: TextFieldConfiguration(
        onChanged: (val) {
          if (val.isNotEmpty) {
            authController.update();
          } else {
            authController.update();
          }
        },
        maxLines: 2,
        minLines: 1,
        controller: authController.locationSearchCtr,
        autofocus: false,
        style: TextStyle(color: AppTheme.black262626Color),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
          fillColor: AppTheme.white,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
          hintText: Strings.lblSearchHere,
        )),
    suggestionsCallback: (pattern) async {
      return await authController.getSuggestion(pattern);
    },
    itemBuilder: (context, suggestion) {
      return ListTile(
          minLeadingWidth: 10,
          dense: true,
          leading: const Icon(Icons.location_pin, color: Colors.red, size: 18),
          title: Text(
            suggestion.toString(),
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ));
    },
    onSuggestionSelected: (suggestion) {
      authController.chooseSearchableLocation(
          text: suggestion.toString(), isSaveLatLng: false);
    },
    suggestionsBoxDecoration: SuggestionsBoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 8.0,
        color: Theme.of(context).cardColor),
  );
}

Widget buildSaveLocationButton({required AuthController authController}) {
  return AppElevatedButton(
    title: Strings.save,
    isLoading: authController.isProfileUpdateLoading.value,
    onPressed: () async {
      ///location_update image update
      ///location_update location
      if (authController.locationSearchCtr.text.isNotEmpty) {
        authController.chooseSearchableLocation(
            text: authController.locationSearchCtr.text, isSaveLatLng: false);
      } else {
        EasyLoading.showError(ValidationString.enterLocation);
      }
    },
  );
}
