import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rating_dialog/rating_dialog.dart';

final dialog = RatingDialog(
  initialRating: 1.0,

  // your app's name?
  title: Text(
    'Rating Dialog',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25.spMin,
      fontWeight: FontWeight.bold,
    ),
  ),
  // encourage your user to leave a high rating?
  message: Text(
    'Tap a star to set your rating. Add more description here if you want.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15.spMin),
  ),
  // your app's logo?
  // image: const FlutterLogo(size: 100),
  submitButtonText: 'Submit',
  commentHint: 'Set your custom comment hint',
  onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    print('rating: ${response.rating}, comment: ${response.comment}');
  },
);

    // show the dialog
   