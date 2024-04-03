package carservicecrm.services;

import carservicecrm.models.Employee;
import carservicecrm.models.Manufacturer;
import carservicecrm.models.User;
import carservicecrm.repositories.ManufacturerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ManufacturerService {
    private final ManufacturerRepository manufacturerRepository;

    public boolean saveManufacturer(Manufacturer manufacturer) {
        try{
            manufacturerRepository.save(manufacturer);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public List<Manufacturer> list() {
        return manufacturerRepository.findAllManufacturers();
    }
}
