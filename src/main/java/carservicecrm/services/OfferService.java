package carservicecrm.services;


import carservicecrm.models.*;
import carservicecrm.repositories.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OfferService {

    private final OfferRepository offerRepository;
    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final PurchaseRepository purchaseRepository;
    private final ToolRepository toolRepository;
    private final DetailRepository detailRepository;

    public List<Offer> listOffers(String name) {
        if (name != null && !name.equals("")) return offerRepository.findAllByName(name);
        return offerRepository.findAll();
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public Offer getOfferById(Long id) {
        return offerRepository.findById(id).orElse(null);
    }
    public Offer getOfferByName(String name) {
        return offerRepository.findByName(name);
    }


    public void saveProduct(Principal principal, Offer offer, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            offer.addImageToOffer(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            offer.addImageToOffer(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            offer.addImageToOffer(image3);
        }
        log.info("Saving new Offer. Name: {}", offer.getName());
        Offer offerFromDb = offerRepository.save(offer);
        offerFromDb.setPreviewImageId(offerFromDb.getImages().get(0).getId());
        offerRepository.save(offer);
    }


    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteOffer(Long id) {
        Offer product = offerRepository.findById(id)
                .orElse(null);
        if (product != null) {
            offerRepository.delete(product);
            log.info("Offer with id = {} was deleted", id);
        } else {
            log.error("Offer with id = {} is not found", id);
        }
    }


    public void addReviewToOffer(Long userId, Review review) {
        Offer offer = offerRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Offer not found"));

        offer.addReview(review);
        offerRepository.save(offer);
    }

    public void removeReviewFromOffer(Long userId, Review review) {
        try{
            Offer offer = offerRepository.findById(userId)
                    .orElseThrow(() -> new RuntimeException("Offer not found"));

            offer.removeReview(review);
            offerRepository.save(offer);
            reviewRepository.deleteReviewById(review.getId());
        }catch (Exception ignored){

        }
    }

    public void addPurchaseToOffer(Long userId, Purchase purchase) {
        Offer offer = offerRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Offer not found"));

        offer.addPurchase(purchase);
        offerRepository.save(offer);
    }

    public void removePurchaseFromOffer(Long userId, Purchase purchase) {
        try{
            Offer offer = offerRepository.findById(userId)
                    .orElseThrow(() -> new RuntimeException("Offer not found"));

            offer.removePurchase(purchase);
            offerRepository.save(offer);
            purchaseRepository.deletePurchaseById(purchase.getId());
        }catch (Exception ignored){

        }
    }

    public void addToolToOffer(Long userId, Tool tool) {
        Offer offer = offerRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Offer not found"));

        offer.addTool(tool);
        offerRepository.save(offer);
    }

    public void removeToolFromOffer(Long userId, Tool tool) {
        try{
            Offer offer = offerRepository.findById(userId)
                    .orElseThrow(() -> new RuntimeException("Offer not found"));
            offer.removeTool(tool);
            offerRepository.save(offer);
            toolRepository.deleteToolById(tool.getId());
        }catch (Exception ignored){

        }
    }
    public void addDetailToOffer(Long userId, Detail detail) {
        Offer offer = offerRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("Offer not found"));
        offer.addDetail(detail);
        offerRepository.save(offer);
    }

    public void removeDetailFromOffer(Long userId, Detail detail) {
        try{
            Offer offer = offerRepository.findById(userId)
                    .orElseThrow(() -> new RuntimeException("Offer not found"));
            offer.removeDetail(detail);
            offerRepository.save(offer);
            detailRepository.deleteDetailById(detail.getId());
        }catch (Exception ignored){

        }
    }

}