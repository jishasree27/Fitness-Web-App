package training.pack.Tpojo;
import java.util.Arrays;

import javax.persistence.*;
@Entity
@Table(name = "product")
public class ProductPojo {


	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private Long id;

	    @Column(name = "userId", nullable = false)
	    private String userId;
	    
	    public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		@Column(name = "product_name", nullable = false)
	    private String productName;

	    @Column(name = "product_description", nullable = false, length = 1000)
	    private String productDescription;

	    @Lob
	    @Column(name = "image1", nullable = false)
	    private byte[] image1; 
	    @Lob
	    @Column(name = "image2", nullable = false)
	    private byte[] image2; 
	    @Lob
	    @Column(name = "image3", nullable = false)
	    private byte[] image3; 
	    @Lob
	    @Column(name = "image4", nullable = false)
	    private byte[] image4; 

	    @Column(name = "product_use", nullable = false)
	    private String productUse;

	    @Column(name = "product_price", nullable = false)
	    private double productPrice;

	    @Column(name = "product_discount", nullable = false)
	    private int productDiscount;

	    @Column(name = "trainer_name", nullable = false)
	    private String trainerName;

	    @Column(name = "shop_name", nullable = false)
	    private String shopName;

	    // Default constructor
	    public ProductPojo() {}

	    // Parameterized constructor
	    public ProductPojo(String userId,String productName, String productDescription, byte[] image1, byte[] image2,byte[] image3,byte[] image4,
	                   String productUse, double productPrice, int productDiscount, 
	                   String trainerName, String shopName) {
	    	this.userId = userId;
	        this.productName = productName;
	        this.productDescription = productDescription;
	        this.image1 = image1;
	        this.image2 = image2;
	        this.image3 = image3;
	        this.image4 = image4;
	        this.productUse = productUse;
	        this.productPrice = productPrice;
	        this.productDiscount = productDiscount;
	        this.trainerName = trainerName;
	        this.shopName = shopName;
	    }

	    // Getters and setters
	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getProductName() {
	        return productName;
	    }

	    public void setProductName(String productName) {
	        this.productName = productName;
	    }

	    public String getProductDescription() {
	        return productDescription;
	    }

	    public void setProductDescription(String productDescription) {
	        this.productDescription = productDescription;
	    }

	    public byte[] getImage1() {
	        return image1;
	    }

	    public void setImage1(byte[] image1) {
	        this.image1 = image1;
	    }
	    public byte[] getImage2() {
	        return image2;
	    }

	    public void setImage2(byte[] image2) {
	        this.image2 = image2;
	    }
	    public byte[] getImage3() {
	        return image3;
	    }

	    public void setImage3(byte[] image3) {
	        this.image3 = image3;
	    }
	    public byte[] getImage4() {
	        return image4;
	    }

	    public void setImage4(byte[] image4) {
	        this.image4 = image4;
	    }

	    public String getProductUse() {
	        return productUse;
	    }

	    public void setProductUse(String productUse) {
	        this.productUse = productUse;
	    }

	    public double getProductPrice() {
	        return productPrice;
	    }

	    public void setProductPrice(double productPrice) {
	        this.productPrice = productPrice;
	    }

	    public int getProductDiscount() {
	        return productDiscount;
	    }

	    public void setProductDiscount(int productDiscount) {
	        this.productDiscount = productDiscount;
	    }

	    public String getTrainerName() {
	        return trainerName;
	    }

	    public void setTrainerName(String trainerName) {
	        this.trainerName = trainerName;
	    }

	    public String getShopName() {
	        return shopName;
	    }

	    public void setShopName(String shopName) {
	        this.shopName = shopName;
	    }

		@Override
		public String toString() {
			return "ProductPojo [id=" + id + ", userId=" + userId + ", productName=" + productName
					+ ", productDescription=" + productDescription + ", image1=" + Arrays.toString(image1) + ", image2="
					+ Arrays.toString(image2) + ", image3=" + Arrays.toString(image3) + ", image4="
					+ Arrays.toString(image4) + ", productUse=" + productUse + ", productPrice=" + productPrice
					+ ", productDiscount=" + productDiscount + ", trainerName=" + trainerName + ", shopName=" + shopName
					+ "]";
		}

	   
	}


