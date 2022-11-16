abstract class User {
  login(String username, String password) {
    ///
    ///
  }
  logout();
}

class MemeberUser extends User {
  @override
  logout() {}

  @override
  login(String username, String password) {
    super.login(username, password);
  }
}

void main() {
  final user1 = MemeberUser();
  user1.login("username", "password");
}
