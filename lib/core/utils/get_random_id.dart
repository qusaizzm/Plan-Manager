import 'dart:math';

int generateRandomId() {
  // Get current time in milliseconds
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  // Generate a random number
  final random = Random().nextInt(1000); // Change range as needed

  // Combine both to create a unique ID
  return timestamp + random;
}
