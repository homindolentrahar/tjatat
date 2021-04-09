import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum BarType { success, error, warning, info }

class Constant {
  static const userCollection = "users";
  static const notesCollection = "notes";
  static const todosCollection = "todos";

  static const networkError = "Network Error";
  static const serverError = "Something wrong with the server";
  static const networkUnavailable = "Network connection unavailable";
  static const failedToSendEmail = "Failed to send email";
  static const errorSendingEmail =
      "There is something error when sending email";

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

class AuthConstant {
  static const authenticationFailed = "Authentication Failed";
  static const registrationFailed = "Registration Failed";

  static const invalidUsernameAndPassword = "Invalid email and password";
  static const cancelledByUser = "User cancel login with Google";
  static const emailHasAlreadyUsed = "Email has already used";
  static const usernameHasAlreadyTaken = "Username has already taken";
  static const userIsNotSignedIn = "User is not signed in";
}
