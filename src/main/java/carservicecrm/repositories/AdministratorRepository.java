package carservicecrm.repositories;

import carservicecrm.models.Administrator;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AdministratorRepository extends JpaRepository<Administrator,Long> {

    @Query(value = "SELECT u FROM Administrator u")
    List<Administrator> findAllAdmins();

    @Modifying
    @Transactional
    @Query("DELETE FROM Administrator q WHERE q.id = :id")
    void deleteAdminById(Long id);

    @Query("SELECT q FROM Administrator q WHERE q.id = :id")
    Administrator findAdminById(Long id);

}
