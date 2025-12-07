package enums;

public enum UserStatus {
    ACTIVE("active"),    
    LOCKED("locked"),
    EXPIRED("expired"),
    DISABLED("disable"),
    PENDING("pending");

    private final String status;

    UserStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
