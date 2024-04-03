package carservicecrm.models;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "sto")
public class Sto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true, updatable = false)
    private String name;
    private String phone;

    @ManyToMany(mappedBy = "stoes")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Employee> employees = new HashSet<>();


    public void addEmployee(Employee employee) {
        employees.add(employee);
        employee.getStoes().add(this);
    }

    public void removeEmployee(Employee employee) {
        employees.remove(employee);
        employee.getStoes().remove(this);
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
