package carservicecrm.repositories;

import carservicecrm.models.Employee;
import carservicecrm.models.Sto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface StoRepository extends JpaRepository<Sto, Long> {

    @Query(value = "SELECT u FROM Sto u")
    List<Sto> findAllStoes();

    @Query("SELECT u.employees FROM Sto u WHERE u.id = :stoId")
    Set<Employee> getStoEmployees(@Param("stoId") Long stoId);

    @Query("SELECT q FROM Sto q WHERE q.id = :id")
    Sto findStoById(Long id);

    @Query("SELECT q FROM Sto q WHERE q.name = :name")
    Sto findByName(String name);

    @Modifying
    @Transactional
    @Query("DELETE FROM Sto q WHERE q.id = :id")
    void deleteStoById(Long id);
}
