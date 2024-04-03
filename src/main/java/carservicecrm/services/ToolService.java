package carservicecrm.services;

import carservicecrm.models.Detail;
import carservicecrm.models.Tool;
import carservicecrm.models.User;
import carservicecrm.repositories.ToolRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ToolService {

    private final ToolRepository toolRepository;

    public boolean saveTool(Tool tool) {
        try{
            Tool existingTool = toolRepository.findToolByName(tool.getName());
            if (existingTool != null) {
                existingTool.setStock(tool.getStock()+existingTool.getStock());
                toolRepository.save(existingTool);
            } else {
                toolRepository.save(tool);
            }
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public void deleteTool(Long id) {
        Tool tool = toolRepository.findById(id)
                .orElse(null);
        if (tool != null) {
            toolRepository.deleteById(tool.getId());
            log.info("Tool with id = {} was deleted", id);
        } else {
            log.error("Tool with id = {} is not found", id);
        }
    }

    public Tool getToolById(Long id){
        return toolRepository.findToolById(id);
    }

    public Tool getToolByName(String name) {
        return toolRepository.findToolByName(name);
    }

    public void fill_tool_count(Long id, Integer stock){
        toolRepository.fillToolCount(id,stock);
    }

    public void fill_tool_count_by_name(String name, Integer stock){
        toolRepository.fillToolCountByName(name,stock);
    }

    public List<Tool> list() {
        return toolRepository.findAllTools();
    }

    public List<Tool> listAvailable() {
        return toolRepository.get_available_tools();
    }

    public List<Tool> listUnAvailable() {
        return toolRepository.get_zero_tools();
    }

}
