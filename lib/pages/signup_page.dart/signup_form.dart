import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:terhal/controllers/theme_controller.dart';
import 'package:terhal/form/controls/data.dart';
import 'package:terhal/form/controls/date.dart';
import 'package:terhal/form/controls/password.dart';
import 'package:terhal/form/controls/select.dart';
import 'package:terhal/pages/signin_page/signin_page.dart';
// import 'package:terhal/controllers/firebase_auth_controller.dart';
import 'package:terhal/widgets/button.dart';
// import 'package:terhal/widgets/loading.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.appLocalizations,
  });

  final GlobalKey<FormBuilderState> formKey;
  final AppLocalizations? appLocalizations;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // final FirebaseAuthController authController = Get.find();
  // final ThemeController themeController = Get.find();

  int currentStep = 0;
  double height = 470;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: widget.formKey,
          child: SizedBox(
            height: height,
            width: Get.width,
            child: Stepper(
              elevation: 0,
              currentStep: currentStep,
              type: StepperType.horizontal,
              controlsBuilder: (context, details) {
                return const Text("");
              },
              steps: [
                _step1(context),
                _step2(context),
                _step3(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Step _step3(BuildContext context) {
    return Step(
      state: currentStep == 2
          ? StepState.editing
          : currentStep > 2
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 2,
      title: Text(widget.appLocalizations!.step(3)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Select(
            options: const ["Aden", "Haja"],
            name: "password",
            label: widget.appLocalizations!.travelCompanion,
            prefixIcon: const Icon(Icons.travel_explore),
          ),
          const SizedBox(
            height: 20,
          ),
          Select(
            options: [
              widget.appLocalizations!.heart,
              widget.appLocalizations!.asthma,
              widget.appLocalizations!.noCondition
            ],
            name: "password",
            label: "Travel Companion",
            prefixIcon: const Icon(Icons.health_and_safety),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              title: Text(
                widget.appLocalizations!.needStroller,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Button(
            width: Get.width,
            text: widget.appLocalizations!.createNewAccount,
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Button(
              width: 100,
              text: widget.appLocalizations!.back,
              onPressed: () => _stepChanges(false),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context),
        ],
      ),
    );
  }

  Step _step2(BuildContext context) {
    return Step(
      state: currentStep == 1
          ? StepState.editing
          : currentStep > 1
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 1,
      title: Text(widget.appLocalizations!.step(2)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Password(
            name: "password",
            label: widget.appLocalizations!.password,
            prefixIcon: const Icon(Icons.lock),
          ),
          const SizedBox(
            height: 20,
          ),
          Password(
            name: "password",
            label: widget.appLocalizations!.confirmPassword,
            prefixIcon: const Icon(Icons.lock),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Date(
                name: "date",
                label: widget.appLocalizations!.dateOfBirth,
                prefixIcon: const Icon(Icons.calendar_today),
                width: Get.width / 2.35,
              ),
              const SizedBox(
                width: 10,
              ),
              Select(
                name: "gender",
                label: widget.appLocalizations!.gender,
                options: [
                  widget.appLocalizations!.male,
                  widget.appLocalizations!.female
                ],
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                width: 100,
                text: widget.appLocalizations!.back,
                onPressed: () => _stepChanges(false),
              ),
              Button(
                width: 100,
                text: widget.appLocalizations!.next,
                onPressed: () => _stepChanges(true),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context)
        ],
      ),
    );
  }

  void _stepChanges(bool isInc) {
    setState(() {
      isInc ? currentStep++ : currentStep--;
    });
  }

  Step _step1(BuildContext context) {
    return Step(
      state: currentStep == 0
          ? StepState.editing
          : currentStep > 0
              ? StepState.complete
              : StepState.indexed,
      isActive: currentStep == 0,
      title: Text(widget.appLocalizations!.step(3)),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Data(
                name: "firstName",
                label: widget.appLocalizations!.firstName,
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
              ),
              const SizedBox(
                width: 10,
              ),
              Data(
                name: "lastName",
                label: widget.appLocalizations!.lastName,
                prefixIcon: const Icon(Icons.person),
                width: Get.width / 2.35,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Data(
            name: "userName",
            label: widget.appLocalizations!.username,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(
            height: 20,
          ),
          Data(
            name: "email",
            label: widget.appLocalizations!.email,
            prefixIcon: const Icon(Icons.person),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Button(
              width: 100,
              text: widget.appLocalizations!.next,
              onPressed: () => _stepChanges(true),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildSignInBtn(context)
        ],
      ),
    );
  }

  // void _handleSignIn() async {
  //   if (widget.formKey.currentState!.saveAndValidate()) {
  // await authController.signInWithEmailAndPassword(
  //   widget.formKey.currentState!.value['email'],
  //   widget.formKey.currentState!.value['password'],
  // );
  //   }
  // }

  Row _buildSignInBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.appLocalizations!.alreadyHaveAccount),
        SizedBox(width: Get.width * 0.01),
        GestureDetector(
          onTap: () => Get.toNamed(SignInPage.id),
          child: Text(
            widget.appLocalizations!.login,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
