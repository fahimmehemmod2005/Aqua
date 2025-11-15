import 'package:aqua/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signupsteps_controller.dart';

class SignupstepsView extends GetView<SignupstepsController> {
  const SignupstepsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Obx(
              () => LinearProgressIndicator(
                value: controller.progress,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 4,
              ),
            ),

            // Content
            Expanded(
              child: Obx(() {
                switch (controller.currentStep.value) {
                  case 0:
                    return _buildGenderStep();
                  case 1:
                    return _buildAgeStep();
                  case 2:
                    return _buildWeightStep();
                  case 3:
                    return _buildActivityStep();
                  case 4:
                    return _buildClimateStep();
                  case 5:
                    return _buildSleepStep();
                  case 6:
                    return _buildCalculatingStep();
                  case 7:
                    return _buildResultStep();
                  default:
                    return const SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Step 1: Gender
  Widget _buildGenderStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "What's your gender?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Obx(
            () => _buildOptionButton(
              'Male',
              controller.selectedGender.value == 'Male',
              () => controller.selectGender('Male'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'Female',
              controller.selectedGender.value == 'Female',
              () => controller.selectGender('Female'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'Prefer not to say',
              controller.selectedGender.value == 'Prefer not to say',
              () => controller.selectGender('Prefer not to say'),
            ),
          ),
          const Spacer(),
          Obx(
            () => _buildNextButton(controller.selectedGender.value.isNotEmpty),
          ),
        ],
      ),
    );
  }

  // Step 2: Age
  Widget _buildAgeStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "What's your age?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Center(
            child: Column(
              children: [
                Obx(
                  () => Text(
                    controller.age.value.toString(),
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'years',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Obx(
                  () => Slider(
                    value: controller.age.value.toDouble(),
                    min: 10,
                    max: 100,
                    divisions: 90,
                    activeColor: Colors.blue,
                    onChanged: (value) => controller.updateAge(value.toInt()),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildNextButton(true),
        ],
      ),
    );
  }

  // Step 3: Weight
  Widget _buildWeightStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "What's your weight?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.weight.value.toString(),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'kg',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Obx(
                  () => Slider(
                    value: controller.weight.value.toDouble(),
                    min: 30,
                    max: 150,
                    divisions: 120,
                    activeColor: Colors.blue,
                    onChanged: (value) =>
                        controller.updateWeight(value.toInt()),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildNextButton(true),
        ],
      ),
    );
  }

  // Step 4: Activity Level
  Widget _buildActivityStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "How active are you\nduring day?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Obx(
            () => _buildOptionButton(
              'Low',
              controller.activityLevel.value == 'Low',
              () => controller.selectActivityLevel('Low'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'Moderate',
              controller.activityLevel.value == 'Moderate',
              () => controller.selectActivityLevel('Moderate'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'High',
              controller.activityLevel.value == 'High',
              () => controller.selectActivityLevel('High'),
            ),
          ),
          const Spacer(),
          Obx(
            () => _buildNextButton(controller.activityLevel.value.isNotEmpty),
          ),
        ],
      ),
    );
  }

  // Step 5: Climate
  Widget _buildClimateStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "What's the climate/\nweather like in your area?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Obx(
            () => _buildOptionButton(
              'Cold',
              controller.climate.value == 'Cold',
              () => controller.selectClimate('Cold'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'Mild',
              controller.climate.value == 'Mild',
              () => controller.selectClimate('Mild'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'Hot',
              controller.climate.value == 'Hot',
              () => controller.selectClimate('Hot'),
            ),
          ),
          const Spacer(),
          Obx(() => _buildNextButton(controller.climate.value.isNotEmpty)),
        ],
      ),
    );
  }

  // Step 6: Sleep Hours
  Widget _buildSleepStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            "How much do you\nusually sleep",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Obx(
            () => _buildOptionButton(
              'Less than 6 hours',
              controller.sleepHours.value == 'Less than 6 hours',
              () => controller.selectSleepHours('Less than 6 hours'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              '6-8 hours',
              controller.sleepHours.value == '6-8 hours',
              () => controller.selectSleepHours('6-8 hours'),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => _buildOptionButton(
              'More than 8 hours',
              controller.sleepHours.value == 'More than 8 hours',
              () => controller.selectSleepHours('More than 8 hours'),
            ),
          ),
          const Spacer(),
          Obx(() => _buildNextButton(controller.sleepHours.value.isNotEmpty)),
        ],
      ),
    );
  }

  // Step 7: Calculating
  Widget _buildCalculatingStep() {
    // Auto-navigate after calculation
    Future.delayed(const Duration(seconds: 2), () {
      controller.calculateHydration();
      controller.nextStep();
    });

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Generating personalized\nhydration plan for you...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          const Text(
            'Please wait...',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: 0.7,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              const Text(
                '70%',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Step 8: Result
  Widget _buildResultStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Based on your\nanswers, we suggest',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 16,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blue,
                    ),
                  ),
                ),
                Text(
                  '${controller.hydrationGoal.value} ml',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => controller.finishOnboarding(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Set Recommended goal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: () {
                // Allow user to customize
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Set own goal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable option button
  Widget _buildOptionButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  // Next button
  Widget _buildNextButton(bool enabled) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: CustomButton(
        text: 'Next',
        onPressed: enabled ? () => controller.nextStep() : null,
      ),
    );
  }
}
