package com.Tyrism.blog.controllers;

import com.Tyrism.blog.models.Message;
import com.Tyrism.blog.models.Post;
import com.Tyrism.blog.models.User;
import com.Tyrism.blog.repo.MessageRepository;
import com.Tyrism.blog.repo.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;


@Controller
public class MainController {

    @Autowired
    private MessageRepository messageRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private PostRepository postRepository;

    @GetMapping("/")
    public String home(Map<String,Object> model){
        Iterable<Post> posts = postRepository.findAll();
        model.put("posts",posts);
        return "greeting";
    }

    @GetMapping("/greeting/add")
    public String home(Model model){
        return "greeting-add";
    }

    @PostMapping ("/greeting/add")
    public String blogPostAdd(@RequestParam String title, @RequestParam String anons, @RequestParam String full_text, Model model){
        Post post = new Post(title,anons,full_text);
        postRepository.save(post);
        return "redirect:/";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,String filter1,String filter2, Model model) {
        Iterable<Message> messages = messageRepository.findAll();
        Iterable<Post> posts = postRepository.findAll();

        if(filter != null && !filter.isEmpty() && filter1 != null && !filter1.isEmpty()&& filter2 != null && !filter2.isEmpty()){
            messages = messageRepository.findByTagAndHotelAndSeason(filter,filter2,filter1);

        }else if (filter != null && !filter.isEmpty() && filter1 != null && !filter1.isEmpty()){
            messages = messageRepository.findByTagAndSeason(filter,filter1);

        }else if (filter != null && !filter.isEmpty() && filter2 != null && !filter2.isEmpty()) {
            messages = messageRepository.findByTagAndHotel(filter, filter2);

        }else if (filter1 != null && !filter1.isEmpty() && filter2 != null && !filter2.isEmpty()) {
            messages = messageRepository.findBySeasonAndHotel(filter1, filter2);

        }else if(filter2 != null && !filter2.isEmpty()){
            messages = messageRepository.findByHotel(filter2);

        } else if(filter != null && !filter.isEmpty()){
            messages = messageRepository.findByTag(filter);

        }else if(filter1 != null && !filter1.isEmpty()){
            messages = messageRepository.findBySeason(filter1);

        }else {
            messages = messageRepository.findAll();
        }

        model.addAttribute("posts",posts);
        model.addAttribute("messages", messages);
        model.addAttribute("filter",filter);
        model.addAttribute("filter1",filter1);
        model.addAttribute("filter2",filter2);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFilename));

                message.setFilename(resultFilename);
            }

            model.addAttribute("message", null);

            messageRepository.save(message);
        }

        Iterable<Message> messages = messageRepository.findAll();

        model.addAttribute("messages", messages);

        return "main";
    }

}



