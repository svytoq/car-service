package carservicecrm.repositories;

import carservicecrm.models.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question,Long> {

    @Query("SELECT q FROM Question q")
    List<Question> findAllQuestions();

    @Modifying
    @Transactional
    @Query("DELETE FROM Question q WHERE q.id = :questionId")
    void deleteQuestionById(Long questionId);

    @Query("SELECT q FROM Question q WHERE q.id = :questionId")
    Question findQuestionById(Long questionId);

    @Query("SELECT q FROM Question q WHERE q.questionText = :questionText")
    Question findByQuestionText(String questionText);

}
