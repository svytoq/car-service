package carservicecrm.repositories;

import carservicecrm.models.Offer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {

    @Query("SELECT c FROM Offer c WHERE c.name = :name")
    Offer findByName(String name);

    @Query("SELECT c FROM Offer c WHERE c.name = :name")
    List<Offer> findAllByName(String name);

    @Query("SELECT c FROM Offer c")
    List<Offer> findAllOffers();

    @Query("SELECT q FROM Offer q WHERE q.id = :id")
    Offer findOfferById(Long id);

    @Modifying
    @Transactional
    @Query("DELETE FROM Offer q WHERE q.id = :id")
    void deleteOfferById(Long id);

}
