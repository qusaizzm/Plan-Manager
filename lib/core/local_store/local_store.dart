// /// Loads a Digital Input Entity model from SharedPreferences based on the given key.
// Future<DigitalInputEntity?> loadDigitalInput() async {
//   var generateData = AppEntities.preferencesKeys.generateDataInput;
//   SharedPreferences? prefs = await SharedPreferences.getInstance();
//   final json = prefs.getString(generateData);
//   if (json == null) {
//     return null;
//   } else {
//     final result = DigitalInputEntity.fromJson(jsonDecode(json));
//     return result;
//   }
// }

// /// Stores the given model object with the specified key in SharedPreferences.
// void storeModel({required String key, required dynamic model}) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   // encode / convert object into json string
//   String json = jsonEncode(model);
//   // save the data into sharedPreferences using key-value pairs
//   debugPrint("DataResult storeModel local: $json");
//   await prefs.setString(key, json);
// }

// void saveHand({required FingerModel? result, required String prefKey}) async {
//   LocalPreferences.local.storeModel(
//       key: prefKey,
//       model: FingerModel(
//         errorCode: result?.errorCode,
//         message: result?.message,
//         FP_B64: "",
//         WSQ_B64: "",
//         score: "0",
//         FingerPrint: "",
//         FP1_B64: result?.FP1_B64 ?? "",
//         WSQ1_B64: result?.WSQ1_B64 ?? "",
//         score1: result?.score1 ?? "0",
//         FP2_B64: result?.FP2_B64 ?? "",
//         WSQ2_B64: result?.WSQ2_B64 ?? "",
//         score2: result?.score2 ?? "0",
//         FP3_B64: result?.FP3_B64 ?? "",
//         WSQ3_B64: result?.WSQ3_B64 ?? "",
//         score3: result?.score3 ?? "0",
//         FP4_B64: result?.FP4_B64 ?? "",
//         WSQ4_B64: result?.WSQ4_B64 ?? "",
//         score4: result?.score4 ?? "0",
//         FingerPrint1: result?.FingerPrint1 ?? "",
//         FingerPrint2: result?.FingerPrint2 ?? "",
//         FingerPrint3: result?.FingerPrint3 ?? "",
//         FingerPrint4: result?.FingerPrint4 ?? "",
//       ).toMap());
// }
