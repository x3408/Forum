package Dao;

import Bean.User;

public interface UserDao {
    User findByPassword(String username, String password);

    void addUser(User user);

    void follow(String uid, String follow_id);

    User findUserById(String showUserId);

    User findUserByUsername(String username);

    Integer findFansCount(String uid);
}
