package carservicecrm.controllers;


import carservicecrm.models.Offer;
import carservicecrm.services.OfferService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class OfferController {

    private final  OfferService offerService;

    @GetMapping("/")
    public String offers(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("offers", offerService.listOffers(title));
        model.addAttribute("user", offerService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "offers";
    }

    @GetMapping("/offer/{id}")
    public String offerInfo(@PathVariable Long id, Model model, Principal principal) {
        Offer offer = offerService.getOfferById(id);
        model.addAttribute("user", offerService.getUserByPrincipal(principal));
        model.addAttribute("offer", offer);
        model.addAttribute("images", offer.getImages());
        return "offer-info";
    }

    @GetMapping("/offer/addform")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String offeradd(Model model, Principal principal) {
        model.addAttribute("user", offerService.getUserByPrincipal(principal));
        return "add-offer";
    }

    @GetMapping("/offer/deleteform")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String offerdeleteform(@RequestParam(name = "searchWord", required = false) String title,Model model, Principal principal) {
        model.addAttribute("user", offerService.getUserByPrincipal(principal));
        model.addAttribute("offers", offerService.listOffers(title));
        return "delete-offer";
    }

    @PostMapping("/offer/create")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Offer offer, Principal principal) throws IOException {
        offerService.saveProduct(principal, offer, file1, file2, file3);
        return "redirect:/admin";
    }

    @PostMapping("/offer/delete/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteProduct(@PathVariable Long id, Principal principal) {
        offerService.deleteOffer(id);
        return "redirect:/admin";
    }
}
