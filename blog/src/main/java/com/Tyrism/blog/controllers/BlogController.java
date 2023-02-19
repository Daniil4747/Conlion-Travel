package com.Tyrism.blog.controllers;

import com.Tyrism.blog.models.Post;
import com.Tyrism.blog.repo.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Map;
import java.util.Optional;

@Controller
public class BlogController {

    @Autowired
    private PostRepository postRepository;

    @GetMapping("/blog")
    public String blogMain(Map<String,Object> model){
        Iterable<Post> posts = postRepository.findAll();
        model.put("posts",posts);
        return "blog";
    }

    @GetMapping("/blog/{id}")
    public String blogDetails(@PathVariable(value = "id") long post_id, Model model){
        if(!postRepository.existsById(post_id)){
            return "redirect:/blog";
        }
        Optional<Post>post = postRepository.findById(post_id);
        ArrayList<Post> res = new ArrayList<>();
        post.ifPresent(res::add);
        model.addAttribute("post",res);
        return "blog-details";
    }

    @GetMapping("/blog/{id}/edit")
    public String blogEdit(@PathVariable(value = "id") long post_id, Model model){
        if(!postRepository.existsById(post_id)){
            return "redirect:/blog";
        }
        Optional<Post>post = postRepository.findById(post_id);
        ArrayList<Post> res = new ArrayList<>();
        post.ifPresent(res::add);
        model.addAttribute("post",res);
        return "blog-edit";
    }

    @PostMapping ("/blog/{id}/edit")
    public String blogPostUpdate(@PathVariable(value = "id") long post_id,@RequestParam String title, @RequestParam String anons, @RequestParam String full_text, Model model){
        Post post = postRepository.findById(post_id).orElseThrow();
        post.setTitle(title);
        post.setAnons(anons);
        post.setFull_text(full_text);
        postRepository.save(post);
        return "redirect:/blog";
    }

    @PostMapping ("/blog/{id}/remove")
    public String blogPostUpdate(@PathVariable(value = "id") long post_id, Model model){
        Post post = postRepository.findById(post_id).orElseThrow();
        postRepository.delete(post);
        return "redirect:/blog";
    }
}
