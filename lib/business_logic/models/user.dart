class User {
  String userID;
  String email;
  String username;
  String firstName;
  String lastName;
  String photoURL;
  DateTime birthdayDate;
  String? bio;
  int numberOfPosts;
  bool isPrivateAccount;

  User({
    required this.userID,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.photoURL,
    required this.birthdayDate,
    this.bio,
    required this.numberOfPosts,
    required this.isPrivateAccount,
  });
}
