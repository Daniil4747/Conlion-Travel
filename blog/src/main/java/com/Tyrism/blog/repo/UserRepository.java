package com.Tyrism.blog.repo;

import com.Tyrism.blog.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User,Long>{
    User findByUsername(String username);

    User findByActivationCode(String code);
}
