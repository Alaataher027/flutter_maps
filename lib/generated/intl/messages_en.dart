// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "almost_done": MessageLookupByLibrary.simpleMessage(
      "You\'re almost done to get started, let\'s do it...",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "enter_number_warn": MessageLookupByLibrary.simpleMessage(
      "Please Enter Your Phone Number!",
    ),
    "log_out": MessageLookupByLibrary.simpleMessage("LogOut"),
    "login_disc": MessageLookupByLibrary.simpleMessage(
      "Please enter your phone number to verify your account.",
    ),
    "login_title": MessageLookupByLibrary.simpleMessage(
      "What is your phone number?",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "too_short_num_warn": MessageLookupByLibrary.simpleMessage(
      "Too short for a phone number!",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "verify_your_phone": MessageLookupByLibrary.simpleMessage(
      "Verify your phone number",
    ),
  };
}
