package carservicecrm.repositories;

import carservicecrm.models.Operator;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OperatorRepository extends JpaRepository<Operator,Long> {

    @Query(value = "SELECT u FROM Operator u")
    List<Operator> findAllOperators();

    @Query("SELECT q FROM Operator q WHERE q.id = :id")
    Operator findOperatorById(Long id);
}
