package carservicecrm.services;

import carservicecrm.models.Car;
import carservicecrm.repositories.CarRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CarService {
    private final CarRepository carRepository;

    public List<Car> list() {
        return carRepository.findAllCars();
    }

    public boolean saveCar(Car car) {
        try{
            carRepository.save(car);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public Car getCar(Long carid){
        return carRepository.findCarById(carid);
    }
}
