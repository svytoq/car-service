package carservicecrm.services;

import carservicecrm.models.Car;
import carservicecrm.models.Employee;
import carservicecrm.models.Purchase;
import carservicecrm.models.User;
import carservicecrm.models.enums.Role;
import carservicecrm.repositories.CarRepository;
import carservicecrm.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final CarRepository carRepository;

    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail) != null) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public List<User> listClients() {
        List<User> users = userRepository.findAll();
        List<User> clients = new ArrayList<>();
        for (User user : users
        ) {
            if(user.getRoles().contains(Role.ROLE_USER)){
                clients.add(user);
            }
        }
        return clients;
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    public User getUserById(Long id) {
        return userRepository.findUserById(id);
    }

    public void deleteUser(Long id) {
        User user = userRepository.findById(id)
                .orElse(null);
        if (user != null) {
            userRepository.deleteById(user.getId());
            log.info("User with id = {} was deleted", id);
        } else {
            log.error("User with id = {} is not found", id);
        }
    }

    public List<User> activeUsers(){
        return userRepository.findAllActiveUsers();
    }

    public void addCarToUser(Long userId, Car car) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.addCar(car);

        userRepository.save(user);
    }

    public void removeCarFromUser(Long userId, Car car) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        user.removeCar(car);
        userRepository.save(user);
        carRepository.delete(car);

    }

    public Set<Car> getUserCars(Long userId) {
        return userRepository.getUserCars(userId);
    }

    public Set<Purchase> getUserPurchases(Long userId) {
        return userRepository.getUserPurchases(userId);
    }


}
