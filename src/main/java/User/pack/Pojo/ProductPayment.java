package User.pack.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "product_payment") // Table name
public class ProductPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private int paymentId;

    @Column(name = "user_id", nullable = false)
    private String userId; // User ID

    @Column(name = "product_name", nullable = false)
    private String productName;

    @Column(name = "shop_name", nullable = false)
    private String shopName;

    @Column(name = "user_address", nullable = false)
    private String userAddress;

    @Column(name = "amount", nullable = false)
    private double amount;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Column(name = "trainerId", nullable = false)
    private String trainerId;
    public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	// Default constructor
    public ProductPayment() {}

    // Parameterized constructor


    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public ProductPayment(int paymentId, String userId, String productName, String shopName, String userAddress,
			double amount, int quantity, String trainerId) {
		super();
		this.paymentId = paymentId;
		this.userId = userId;
		this.productName = productName;
		this.shopName = shopName;
		this.userAddress = userAddress;
		this.amount = amount;
		this.quantity = quantity;
		this.trainerId = trainerId;
	}

	public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
	public String toString() {
		return "ProductPayment [paymentId=" + paymentId + ", userId=" + userId + ", productName=" + productName
				+ ", shopName=" + shopName + ", userAddress=" + userAddress + ", amount=" + amount + ", quantity="
				+ quantity + ", trainerId=" + trainerId + "]";
	}
}
