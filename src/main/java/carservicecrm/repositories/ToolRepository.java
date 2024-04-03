package carservicecrm.repositories;

import carservicecrm.models.Detail;
import carservicecrm.models.Purchase;
import carservicecrm.models.Tool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ToolRepository extends JpaRepository<Tool,Long> {
    @Query("SELECT r FROM Tool r")
    List<Tool> findAllTools();

    @Transactional
    @Query(value = "SELECT * FROM get_zero_tools()", nativeQuery = true)
    List<Tool> get_zero_tools();

    @Transactional
    @Query(value = "SELECT * FROM get_available_tools()", nativeQuery = true)
    List<Tool> get_available_tools();

    @Query("SELECT q FROM Tool q WHERE q.id = :id")
    Tool findToolById(Long id);

    @Query("SELECT q FROM Tool q WHERE q.name = :name")
    Tool findToolByName(String name);

    @Modifying
    @Transactional
    @Query("DELETE FROM Tool q WHERE q.id = :toolId")
    void deleteToolById(Long toolId);

    @Transactional
    @Query(value = "SELECT fill_tool_count(:id,:num)", nativeQuery = true)
    void fillToolCount(@Param("id") Long id, @Param("num") Integer num);

    @Transactional
    @Query(value = "SELECT fill_tool_count_by_name(:name,:num)", nativeQuery = true)
    void fillToolCountByName(@Param("name") String name,@Param("num") Integer num);

}
