package cn.yitihua.repository;

import cn.yitihua.entity.Declare;
import cn.yitihua.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Date;
import java.util.List;

public interface DeclareRepository extends CrudRepository<Declare,Long>,PagingAndSortingRepository<Declare,Long>{
    /*
    *Jpa中根据实体类保存的方法
    <S extends T> List<S> save(Iterable<S> entities);
    */

    /*
    *单个保存以刷新
    <S extends T> S saveAndFlush(S entity);
    */

    /*
    *模糊查询
    * */
//    @Query(value = "select t from Declare t where t.content like %?1% OR  t.id like %?1% OR t.created_time like %?1% OR t.creator_id like %?1% OR t.title like %?1%")
//    List<Declare> findDeclareByInputLike(String input);
    List<Declare> findDeclareByTitleContaining(String title);
}
