package carservicecrm.repositories;

import carservicecrm.models.Car;
import carservicecrm.models.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review,Long> {

    @Query("SELECT r FROM Review r")
    List<Review> findAllReviews();

    @Query("SELECT q FROM Review q WHERE q.id = :id")
    Review findReviewById(Long id);

    @Modifying
    @Transactional
    @Query("DELETE FROM Review q WHERE q.id = :reviewId")
    void deleteReviewById(Long reviewId);
}
