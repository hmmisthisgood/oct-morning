abstract class User {
  login(String username, String password);
}

class MemeberUser extends User {
  @override
  login(String username, String password) {
    print(username);
  }
}

void main() {
  final user1 = MemeberUser();
  user1.login("username", "password");
}
