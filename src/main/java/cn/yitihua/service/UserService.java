package cn.yitihua.service;

import cn.yitihua.entity.User;
import cn.yitihua.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;
    public User findUserByUsername(String username){
        return userRepository.findUserByUsername(username);
    }
}
