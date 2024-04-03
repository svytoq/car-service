package carservicecrm.repositories;

import carservicecrm.models.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee,Long> {

    @Query(value = "SELECT u FROM Employee u")
    List<Employee> findAllEmployees();

    @Query("SELECT q FROM Employee q WHERE q.user.id = :user_id")
    Employee findByUserId(Long user_id);

    @Query("SELECT q FROM Employee q WHERE q.id = :id")
    Employee findEmployeeById(Long id);
}
