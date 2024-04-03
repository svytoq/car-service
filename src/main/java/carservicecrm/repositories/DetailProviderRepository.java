package carservicecrm.repositories;

import carservicecrm.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface DetailProviderRepository extends JpaRepository<DetailProvider, Long> {

    @Query("SELECT u.details FROM DetailProvider u WHERE u.id = :providerId")
    Set<Detail> getProviderDetails(@Param("providerId") Long providerId);

    @Query("SELECT q FROM DetailProvider q")
    List<DetailProvider> findAllProviders();

    @Query("SELECT q FROM DetailProvider q WHERE q.id = :id")
    DetailProvider findProviderById(Long id);

    @Query("SELECT q FROM DetailProvider q WHERE q.name = :name")
    DetailProvider findByName(String name);

    @Modifying
    @Transactional
    @Query("DELETE FROM DetailProvider q WHERE q.id = :id")
    void deleteProviderById(Long id);

}
