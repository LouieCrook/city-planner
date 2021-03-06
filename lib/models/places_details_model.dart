// To parse this JSON data, do
//
//     final placeDetails = placeDetailsFromJson(jsonString);

import 'dart:convert';

PlaceDetails placeDetailsFromJson(String str) => PlaceDetails.fromJson(json.decode(str));

class PlaceDetails {
  PlaceDetails({
    required this.htmlAttributions,
    required this.result,
    required this.status,
  });

  final List<dynamic> htmlAttributions;
  final DetailsResult result;
  final String status;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
    htmlAttributions: List<dynamic>.from(json["html_attributions"].map((x) => x)),
    result: DetailsResult.fromJson(json["result"]),
    status: json["status"],
  );

}

class DetailsResult {
  DetailsResult({
    required this.formattedPhoneNumber,
    required this.reviews,
    required this.website,
  });

  final String formattedPhoneNumber;
  final List<Review> reviews;
  final String website;

  factory DetailsResult.fromJson(Map<String, dynamic> json) => DetailsResult(
    formattedPhoneNumber: json["formatted_phone_number"],
    // todo - work out why i'm getting error: Null check operator used on a null value here...
    reviews: List<Review>.from(json["reviews"].map!((x) => Review.fromJson(x))),
    website: json["website"],
  );
}

class Review {
  Review({
    required this.authorName,
    required this.authorUrl,
    required this.language,
    required this.profilePhotoUrl,
    required this.rating,
    required this.relativeTimeDescription,
    required this.text,
    required this.time,
  });

  final String authorName;
  final String authorUrl;
  final String language;
  final String profilePhotoUrl;
  final int rating;
  final String relativeTimeDescription;
  final String text;
  final int time;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    authorName: json["author_name"],
    authorUrl: json["author_url"],
    language: json["language"],
    profilePhotoUrl: json["profile_photo_url"],
    rating: json["rating"],
    relativeTimeDescription: json["relative_time_description"],
    text: json["text"],
    time: json["time"],
  );
}
