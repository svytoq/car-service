package carservicecrm.repositories;

import carservicecrm.models.Manufacturer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ManufacturerRepository extends JpaRepository<Manufacturer,Long> {

    @Query(value = "SELECT u FROM Manufacturer u")
    List<Manufacturer> findAllManufacturers();

    @Query("SELECT q FROM Manufacturer q WHERE q.id = :id")
    Manufacturer findManufacturerById(Long id);
}
