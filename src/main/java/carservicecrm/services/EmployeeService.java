package carservicecrm.services;

import carservicecrm.models.Employee;
import carservicecrm.repositories.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    public boolean saveEmployee(Employee employee) {
        try{
            employeeRepository.save(employee);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public Employee getEmployee(Long user_id){
       return employeeRepository.findByUserId(user_id);
    }

    public Employee getEmployeeById(Long id){
        return employeeRepository.findEmployeeById(id);
    }


    public List<Employee> list() {
        return employeeRepository.findAllEmployees();
    }

}
