import 'package:bar_council/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> verifyOtp(String phoneNumber) async {
  final response = await http.post(
    Uri.parse("$baseUrl/resendOtp"),
    body: {"phone": phoneNumber},
  );

  debugPrint(phoneNumber);
  
  if (response.statusCode == 200) {
    // Successful OTP resend
    print("OTP Resent Successfully");
  } else {
    // Handle error cases
    print("Error: ${response.statusCode}");
    // You might want to print the response body for more information
    print("Response Body: ${response.body}");
  }
}
