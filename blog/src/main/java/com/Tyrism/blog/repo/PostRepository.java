package com.Tyrism.blog.repo;

import com.Tyrism.blog.models.Post;
import org.springframework.data.repository.CrudRepository;

public interface PostRepository extends CrudRepository<Post,Long> {

}
