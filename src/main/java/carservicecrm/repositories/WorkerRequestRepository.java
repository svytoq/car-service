package carservicecrm.repositories;

import carservicecrm.models.Question;
import carservicecrm.models.WorkerRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface WorkerRequestRepository extends JpaRepository<WorkerRequest,Long> {

    @Query("SELECT q FROM WorkerRequest q")
    List<WorkerRequest> findAllRequests();

    @Modifying
    @Transactional
    @Query("DELETE FROM WorkerRequest q WHERE q.id = :questionId")
    void deleteRequestById(Long questionId);

    @Query("SELECT q FROM WorkerRequest q WHERE q.id = :requestText")
    WorkerRequest findRequestById(Long requestText);

    @Query("SELECT q FROM WorkerRequest q WHERE q.requestText = :requestText")
    WorkerRequest findByRequestText(String requestText);
}
