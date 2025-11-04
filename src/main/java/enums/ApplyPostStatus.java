package enums;

public enum ApplyPostStatus {
    PENDING(0, "Chờ duyệt"),
    VIEWED(1, "Đã xem"),
    SUITABLE(2, "Phù hợp"),
    UNSUITABLE(3, "Không phù hợp"),
    WITHDRAWN(4, "Ứng viên rút đơn");

    private final int code;
    private final String description;

    ApplyPostStatus(int code, String description) {
        this.code = code;
        this.description = description;
    }

    public int getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public static ApplyPostStatus fromCode(int code) {
        for (ApplyPostStatus status : ApplyPostStatus.values()) {
            if (status.code == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("Invalid status code: " + code);
    }
}

