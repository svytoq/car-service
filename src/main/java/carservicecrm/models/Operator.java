package carservicecrm.models;

import jakarta.persistence.*;
import java.time.LocalTime;

@Entity
@Table(name = "callcenterworker")
public class Operator {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalTime workingTimeStart;
    private LocalTime workingTimeEnd;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private Employee employee;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalTime getWorkingTimeStart() {
        return workingTimeStart;
    }

    public void setWorkingTimeStart(LocalTime workingTimeStart) {
        this.workingTimeStart = workingTimeStart;
    }

    public LocalTime getWorkingTimeEnd() {
        return workingTimeEnd;
    }

    public void setWorkingTimeEnd(LocalTime workingTimeEnd) {
        this.workingTimeEnd = workingTimeEnd;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
