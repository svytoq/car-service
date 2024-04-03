package carservicecrm.models;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "detailprovider")
public class DetailProvider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true, updatable = false)
    private String name;
    private String contact;

    @ManyToMany(mappedBy = "providers")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Detail> details = new HashSet<>();


    public void addDetail(Detail detail) {
        details.add(detail);
        detail.getProviders().add(this);
    }

    public void removeDetail(Detail detail) {
        details.remove(detail);
        detail.getProviders().remove(this);
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Set<Detail> getDetails() {
        return details;
    }

    public void setDetails(Set<Detail> details) {
        this.details = details;
    }
}
