package com.Tyrism.blog.models;

import org.hibernate.validator.constraints.Length;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity // This tells Hibernate to make a table out of this class
public class Message {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Пожалуйста введите текст")
    @Length(max=2048, message = "Текст не должен превышать 2048 символа")
    private String text;
    @NotBlank(message = "Пожалуйста введите тег")
    @Length(max=255, message = "Тэг не должен превышать 255 символа")
    private String tag;
    private String hotel;
    private String season;

    public String getHotel() {return hotel;}
    public void setHotel(String hotel) {this.hotel = hotel;}

    public String getSeason() {return season;}
    public void setSeason(String season) {this.season = season;}

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    private String filename;

    public String getFilename() {return filename;}

    public void setFilename(String filename) {this.filename = filename;}

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Message(){

    }

    public Message(String text, String tag, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
    }

    public String getAuthorName(){
        return author != null ? author.getUsername() : "<none>";
    }
}
