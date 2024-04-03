package carservicecrm.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER,
    ROLE_OPERATOR,
    ROLE_WORKER,
    ROLE_EMPLOYEE,
    ROLE_MANUFACTURER,
    ROLE_ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
