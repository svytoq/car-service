package carservicecrm.services;

import carservicecrm.models.Car;
import carservicecrm.models.Question;
import carservicecrm.models.Review;
import carservicecrm.repositories.ReviewRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;


    public List<Review> list() {
        return reviewRepository.findAllReviews();
    }

    public boolean saveReview(Review review) {
        try{
            reviewRepository.save(review);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public Review getReview(Long id){
        return reviewRepository.findReviewById(id);
    }

    public void deleteReview(Long id) {
        Review review = reviewRepository.findReviewById(id);
        if (review != null) {
            reviewRepository.deleteReviewById(review.getId());
            log.info("Review with id = {} was deleted", id);
        } else {
            log.info("Review with id = {} is not found", id);
        }
    }

}
