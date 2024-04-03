package carservicecrm.services;

import carservicecrm.models.WorkerRequest;
import carservicecrm.repositories.WorkerRequestRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class WorkerRequestService {
    private final WorkerRequestRepository workerRequestRepository;

    public boolean save(WorkerRequest req) {
        try {
            workerRequestRepository.save(req);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<WorkerRequest> list() {
        return workerRequestRepository.findAllRequests();
    }

    public void deleteRequest(Long id) {
        WorkerRequest request = workerRequestRepository.findRequestById(id);
        if (request != null) {
            workerRequestRepository.deleteRequestById(request.getId());
            log.info("Request with id = {} was deleted", id);
        } else {
            log.error("Request with id = {} is not found", id);
        }
    }
}
