/// extends
/// super
/// override
/// is
/// super class or base class or parent class
/// abstract class , mixin , implements

class User {
  final int id;
  final String fullname;
  final String profilePicture;
  final String role;

  const User(
      {required this.id,
      required this.fullname,
      required this.profilePicture,
      this.role = "Member"});

  login() {
    print("$role $fullname has logged in");
  }

  createPost() {
    print(" $role: $fullname create a post");
  }

  likePost() {}
  changeName() {}
}

/// sub class or child class
/// MemberUser is inheriting from User
class MemberUser extends User {
  MemberUser(
      {required int someId,
      required String fullname,
      required String profilePicture,
      required String role})
      : super(
          id: someId,
          fullname: fullname,
          profilePicture: profilePicture,
        );

  showMyDetails() {
    print("My name is $fullname");
  }

  joinGroup() {}
}

class ModeratorUser extends User {
  ModeratorUser(
      {required int id,
      required String fullname,
      required String profilePicture,
      required String role,
      required this.level,
      required this.verification})
      : super(
            fullname: fullname,
            role: role,
            id: id,
            profilePicture: profilePicture);

  int level;
  String verification;

  deletePost() {
    print("$fullname moderator deleted a post");
  }

  @override
  login() {
    print("Moderator: $fullname has logged in with 2FA");
    super.login();
  }
}

// extends = used for inhereting

class AUser extends User {
  // AUser({
  //   required super.id,
  //   required super.fullname,
  //   required super.profilePicture,
  // });

  AUser(
      {required int id,
      required String fullname,
      required String profilePicture})
      : super(
            id: id,
            fullname: fullname,
            profilePicture: profilePicture,
            role: "Admin");

  deletePost() {}
  kickOutUserOrModerator() {}
  deleteGroup() {}

  _mfaLogin() {}

  @override
  login() {
    /// my code
    print("custom admin login");
    _mfaLogin();

    super.login();
  }
}

main() {
  final member = User(
      id: 123,
      fullname: "Ram Bdur",
      role: "Member",
      profilePicture: "https://a/a.jpg");

  member.likePost();
  member.createPost();
  member.changeName();
  // member.joinGroup();

  ModeratorUser moderatorUser = ModeratorUser(
      id: 1231,
      fullname: "Jack",
      profilePicture: "profilePicture",
      role: "Moderator",
      level: 2,
      verification: "");
  moderatorUser.login();

  bool isMemeberAUser = User is MemberUser;
  print(isMemeberAUser);

  // moderatorUser.likePost();
  // moderatorUser.createPost();
  // moderatorUser.deletePost();
  User normalUser =
      User(id: 112343, fullname: "Ram Bahadur", profilePicture: "");

  AUser aUser = AUser(id: 112343, fullname: "Ram Bahadur", profilePicture: "");
  aUser.deleteGroup();
}
