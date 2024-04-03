package carservicecrm.repositories;

import carservicecrm.models.Detail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface DetailRepository extends JpaRepository<Detail,Long> {

    @Query("SELECT q FROM Detail q WHERE q.id = :id")
    Detail findDetailById(Long id);

    @Query("SELECT q FROM Detail q WHERE q.storagestock = :stock")
    Detail findDetailByStoragestock(Integer stock);

    @Query("SELECT q FROM Detail q WHERE q.name = :name")
    Detail findByName(String name);

    @Query("SELECT q FROM Detail q WHERE q.name = :name")
    Set<Detail> findAllByName(String name);

    @Modifying
    @Transactional
    @Query("DELETE FROM Detail q WHERE q.id = :detailId")
    void deleteDetailById(Long detailId);

    @Query("SELECT q FROM Detail q WHERE q.storagestock > 0")
    List<Detail> findAllInStorage();

    @Transactional
    @Query(value = "SELECT * FROM is_stock_of_detail_greater(:id,:num)", nativeQuery = true)
    Boolean isBiggerThanNum(@Param("id") Long id,@Param("num") Integer num);

    @Transactional
    @Query(value = "SELECT * FROM is_stock_of_detail_greater_by_name(:name,:num)", nativeQuery = true)
    Boolean isBiggerThanNumByName(@Param("name") String name,@Param("num") Integer num);

    @Transactional
    @Query(value = "SELECT fill_detail_count(:id,:num)", nativeQuery = true)
    void updateStorageStock(@Param("id") Long id,@Param("num") Integer num);

    @Transactional
    @Query(value = "SELECT fill_detail_count_by_name(:name,:num)", nativeQuery = true)
    void updateStorageStockbyname(@Param("name") String name,@Param("num") Integer num);
}
