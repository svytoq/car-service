package carservicecrm.services;


import carservicecrm.models.*;
import carservicecrm.repositories.StoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
@RequiredArgsConstructor
public class StoService {
    private final StoRepository stoRepository;

    public List<Sto> list() {
        return stoRepository.findAllStoes();
    }

    public boolean saveSto(Sto sto) {
        try {
            stoRepository.save(sto);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public void deleteSto(Long id) {
        Sto sto = stoRepository.findStoById(id);
        if (sto != null) {
            stoRepository.deleteStoById(sto.getId());
            log.info("STO with id = {} was deleted", id);
        } else {
            log.error("STO with id = {} is not found", id);
        }
    }


    public void addEmployeeToSto(Long stoId, Employee employee) {
        Sto sto = stoRepository.findStoById(stoId);
        sto.addEmployee(employee);
        stoRepository.save(sto);
    }

    public void removeEmployeeFromSto(Long stoId, Employee employee) {
        Sto sto = stoRepository.findStoById(stoId);
        sto.removeEmployee(employee);
        stoRepository.save(sto);
    }

    public Set<Employee> getStoEmployees(Long stoId) {
        return stoRepository.getStoEmployees(stoId);
    }

    public Set<Worker> getStoWorkers(Long stoId) {
        Set<Employee> employees = stoRepository.getStoEmployees(stoId);
        Set<Worker> workers = new HashSet<>();
        for(Employee employee : employees) {
            if(employee.getWorker() != null) {
                workers.add(employee.getWorker());
            }
        }
        return workers;
    }

    public Sto getSto(Long stoId) {
        return stoRepository.findStoById(stoId);
    }
    public Sto getStoByName(String name) {
        return stoRepository.findByName(name);
    }


}
