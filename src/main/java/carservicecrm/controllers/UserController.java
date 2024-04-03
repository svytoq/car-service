package carservicecrm.controllers;

import carservicecrm.models.*;
import carservicecrm.services.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ReviewService reviewService;
    private final OfferService offerService;
    private final QuestionService questionService;
    private final CarService carService;
    private final StoService stoService;
    private final PurchaseService purchaseService;
    private final WorkerRequestService workerRequestService;


    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("offers", offerService.listOffers(""));
        return "profile";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с почтой: " + user.getEmail() + " уже существует.");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));

        //Добавить purchases

        return "user-info";
    }

    @PostMapping("/delete/user/{id}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteProduct(@PathVariable Long id, Principal principal) {
        for (Review review : userService.getUserById(id).getReviews()) {
            for (Offer offer : offerService.listOffers("")) {
                offerService.removeReviewFromOffer(offer.getId(), review);
            }
        }
        for (Purchase purchase : userService.getUserById(id).getPurchases()) {
            for (Offer offer : offerService.listOffers("")) {
                offerService.removePurchaseFromOffer(offer.getId(), purchase);
            }
        }
        userService.deleteUser(id);
        userService.deleteUser(id);

        return "redirect:/admin";
    }

    @GetMapping("/user/reviews")
    public String adminusers(Model model, Principal principal) {
        model.addAttribute("reviews", reviewService.list());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "reviews";
    }

    @PostMapping("/user/add/review")
    public String addReview(@RequestParam("email") String email, @RequestParam String reviewText, @RequestParam Integer rating, @RequestParam MultiValueMap<String, String> form) {
        Review review = new Review();
        User user = userService.getUserByEmail(email);
        review.setUser(user);
        review.setReviewText(reviewText);
        review.setRating(rating);
        for (String key : form.keySet()) {
            if (!(Objects.equals(key, "reviewText") || Objects.equals(key, "rating") || Objects.equals(key, "email") || Objects.equals(key, "_csrf"))) {
                Offer offer1 = offerService.getOfferByName(key);
                offerService.addReviewToOffer(offer1.getId(), review);
                reviewService.saveReview(review);
            }
        }
        return "redirect:/user/reviews";
    }


    @PostMapping("/user/add/question")
    public String saveQuestion(@RequestParam("email") String email, @RequestParam String questionText) {
        Question question = new Question();
        question.setUser(userService.getUserByEmail(email));
        question.setQuestionText(questionText);
        questionService.save(question);
        return "redirect:/profile";
    }

    @GetMapping("/user/my/cars")
    public String usercars(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("cars", userService.getUserCars(user.getId()));
        model.addAttribute("user", user);
        return "user-cars";
    }

    @GetMapping("/user/my/purchases")
    public String userpurchases(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("purchases", userService.getUserPurchases(user.getId()));
        model.addAttribute("user", user);
        return "user-purchases";
    }

    @PostMapping("/user/add/car")
    public String saveCar(@RequestParam("email") String email, @RequestParam String brand, @RequestParam String model, @RequestParam String creation_date) throws ParseException {
        Car car = new Car();
        car.setBrand(brand);
        car.setModel(model);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(creation_date);
        car.setCreation_date(date);
        User user = userService.getUserByEmail(email);
        userService.addCarToUser(user.getId(), car);
        carService.saveCar(car);
        return "redirect:/user/my/cars";
    }

    @PostMapping("/user/delete/car/{id}")
    public String deleteCar(@RequestParam("email") String email, @PathVariable Long id) {
        userService.removeCarFromUser(userService.getUserByEmail(email).getId(), carService.getCar(id));
        return "redirect:/user/my/cars";
    }

    @GetMapping("/user/create/purchase/form")
    public String userCreatePurchaseFrom(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("cars", userService.getUserCars(user.getId()));
        model.addAttribute("offers", offerService.listOffers(""));
        model.addAttribute("stos", stoService.list());
        model.addAttribute("user", user);
        return "purchase-form";
    }

    @PostMapping("/user/create/purchase")
    public String userCreatePurchaseFrom(@RequestParam("email") String email,@RequestParam MultiValueMap<String, String> form, @RequestParam String sto, @RequestParam Long car) {
        Purchase purchase = new Purchase();
        purchase.setUser(userService.getUserByEmail(email));
        Car car1 = carService.getCar(car);
        purchase.setCar(car1);
        purchase.setStoName(sto);
        for (String key : form.keySet()) {
            if (!(Objects.equals(key, "car") || Objects.equals(key, "sto") || Objects.equals(key, "email") || Objects.equals(key, "_csrf"))) {
                Offer offer1 = offerService.getOfferByName(key);
                offerService.addPurchaseToOffer(offer1.getId(), purchase);
                purchaseService.savePurchase(purchase);
            }
        }
        return "redirect:/";
    }

}