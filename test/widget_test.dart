import 'package:experience_india/features/profile/controller/profile_controller.dart';
import 'package:experience_india/features/profile/models/profile_getall_model.dart';
import 'package:experience_india/features/profile/screens/profile_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  testWidgets('Profile screen updates email when API data arrives after initial build',
      (WidgetTester tester) async {
    final controller = Get.put(ProfileController());

    await tester.pumpWidget(
      const GetMaterialApp(
        home: ProfileScreen(),
      ),
    );

    controller.profileData.value = ProfileGetAllModel(
      firstName: 'YATRIVO',
      lastName: 'User',
      email: 'user@example.com',
    );

    await tester.pump();

    expect(find.text('user@example.com'), findsOneWidget);
    expect(find.text('travel@yatrivo.com'), findsNothing);
  });
}
