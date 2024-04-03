package carservicecrm.models;


import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "offer")
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true, updatable = false)
    private String name;
    private String description;
    private Integer price;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "offer")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;


    @ManyToMany(mappedBy = "offers")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Review> reviews = new HashSet<>();

    @ManyToMany(mappedBy = "offers")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Purchase> purchases = new HashSet<>();

    @ManyToMany(mappedBy = "offers")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Tool> tools = new HashSet<>();

    @ManyToMany(mappedBy = "offers")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Detail> details = new HashSet<>();

    public void addReview(Review review) {
        reviews.add(review);
        review.getOffers().add(this);
    }

    public void removeReview(Review review) {
        try{
            reviews.remove(review);
            review.getOffers().remove(this);
        }catch (Exception ignored){

        }

    }

    public void addPurchase(Purchase purchase) {
        purchases.add(purchase);
        purchase.getOffers().add(this);
    }

    public void removePurchase(Purchase purchase) {
        try{
            purchases.remove(purchase);
            purchase.getOffers().remove(this);
        }catch (Exception ignored){

        }
    }


    public void addTool(Tool tool) {
        tools.add(tool);
        tool.getOffers().add(this);
    }

    public void removeTool(Tool tool) {
        try{
            tools.remove(tool);
            tool.getOffers().remove(this);
        }catch (Exception ignored){

        }
    }

    public void addDetail(Detail detail) {
        details.add(detail);
        detail.getOffers().add(this);
    }

    public void removeDetail(Detail detail) {
        try{
            details.remove(detail);
            detail.getOffers().remove(this);
        }catch (Exception ignored){

        }
    }
    public Set<Detail> getDetails() {
        return details;
    }

    public void setDetails(Set<Detail> details) {
        this.details = details;
    }

    public Set<Tool> getTools() {
        return tools;
    }

    public void setTools(Set<Tool> tools) {
        this.tools = tools;
    }

    public Set<Purchase> getPurchases() {
        return purchases;
    }

    public void setPurchases(Set<Purchase> purchases) {
        this.purchases = purchases;
    }

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    public Long getPreviewImageId() {
        return previewImageId;
    }
    public void addImageToOffer(Image image) {
        image.setOffer(this);
        images.add(image);
    }
    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
}
