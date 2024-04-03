package carservicecrm.services;

import carservicecrm.models.Operator;
import carservicecrm.repositories.OperatorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OperatorService {
    private final OperatorRepository operatorRepository;

    public boolean saveOperator(Operator operator) {
        try{
            operatorRepository.save(operator);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public List<Operator> list(){
        return operatorRepository.findAllOperators();
    }


}
