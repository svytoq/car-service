package carservicecrm.services;

import carservicecrm.models.Administrator;
import carservicecrm.repositories.AdministratorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdministratorService {

    private final AdministratorRepository administratorRepository;

    public boolean saveAdmin(Administrator administrator) {
        try{
            administratorRepository.save(administrator);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public List<Administrator> list() {
        return administratorRepository.findAllAdmins();
    }
}
