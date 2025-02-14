package User.pack.Pojo;

import java.util.Arrays;

import javax.persistence.*;

@Entity
@Table(name = "productCart") 
public class ProductCart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // Replace with your actual column name
    private int id;

    @Column(name = "name", nullable = false) // Replace with your actual column name
    private String name;

    @Column(name = "shop", nullable = false) // Replace with your actual column name
    private String shop;

    @Column(name = "price", nullable = false) // Replace with your actual column name
    private double price;

    @Column(name = "user_session") // Replace with your actual column name
    private String userSession;

    @Lob
    @Column(name = "image") // Replace with your actual column name
    private byte[] image;
    

    @Column(name = "quantity") // Replace with your actual column name
    private int quantity;
    
    public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUserSession() {
        return userSession;
    }

    public void setUserSession(String userSession) {
        this.userSession = userSession;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @Override
	public String toString() {
		return "ProductCart [id=" + id + ", name=" + name + ", shop=" + shop + ", price=" + price + ", userSession="
				+ userSession + ", image=" + Arrays.toString(image) + ", quantity=" + quantity + "]";
	}
}
