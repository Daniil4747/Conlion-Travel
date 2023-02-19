package com.Tyrism.blog.repo;

import com.Tyrism.blog.models.Message;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Integer> {
    List<Message> findByTag(String tag);
    List<Message> findByTagAndHotelAndSeason(String tag, String hotel,String season);
    List<Message> findByTagAndSeason(String tag,String season);
    List<Message> findByTagAndHotel(String tag,String season);
    List<Message> findBySeasonAndHotel(String season,String hotel);
    List<Message> findBySeason(String season);
    List<Message> findByHotel(String hotel);
}
