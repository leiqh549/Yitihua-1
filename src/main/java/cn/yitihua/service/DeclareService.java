package cn.yitihua.service;


import cn.yitihua.entity.Declare;
import cn.yitihua.entity.User;
import cn.yitihua.repository.DeclareRepository;
import cn.yitihua.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;
import java.util.ArrayList;
import java.util.List;

@Service
public class DeclareService {
    @Autowired
    DeclareRepository declareRepository;

    public void saveDeclare(Declare declare){
        declareRepository.save(declare);
    }

    public List<Declare> findDeclareByPage(int page,int size){
        /*
        * 指定大小与页数
        * */
        Pageable pageObject=new PageRequest(page,size);
        List<Declare> declareListByPage =declareRepository.findAll(pageObject).getContent();
        return declareListByPage;
    }

    public void save(Declare declare){
        declareRepository.save(declare);
    }

    public List<Declare> LikeQuery(String title){
        List<Declare> likeQueryList =declareRepository.findDeclareByTitleContaining(title);
        return likeQueryList;
    }

    public Declare declareById(int id){
        Declare declareById=declareRepository.findOne(new Long(id));
        return declareById;
    }
}
