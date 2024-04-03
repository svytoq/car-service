package carservicecrm.repositories;

import carservicecrm.models.Car;
import carservicecrm.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CarRepository extends JpaRepository<Car,Long> {

    @Query("SELECT c FROM Car c")
    List<Car> findAllCars();

    @Query("SELECT q FROM Car q WHERE q.id = :carid")
    Car findCarById(Long carid);

    @Modifying
    @Transactional
    @Query("DELETE FROM Car q WHERE q.id = :id")
    void deleteCarById(Long id);
}
