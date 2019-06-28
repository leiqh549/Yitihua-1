package cn.yitihua.repository;

import cn.yitihua.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserRepository extends JpaRepository<User,Long> {
    @Query(" from User s where s.name =?1")
     User findUserByUsername(String username);
}

