package training.pack.Tpojo;
import javax.persistence.*;


@Entity
@Table(name = "account_details")
public class razorpaypojo {

	    
	    public razorpaypojo(int id, String accountHolderName, String merchantId, String publicApiKey, String privateApiKey,
			String userId) {
		super();
		this.id = id;
		this.accountHolderName = accountHolderName;
		this.merchantId = merchantId;
		this.publicApiKey = publicApiKey;
		this.privateApiKey = privateApiKey;
		this.userId = userId;
	}

		public razorpaypojo() {
			// TODO Auto-generated constructor stub
		}

		@Override
	public String toString() {
		return "razorpaypojo [id=" + id + ", accountHolderName=" + accountHolderName + ", merchantId=" + merchantId
				+ ", publicApiKey=" + publicApiKey + ", privateApiKey=" + privateApiKey + ", userId=" + userId + "]";
	}

		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private int id;
	    
	    @Column(name = "accountHolderName")
	    private String accountHolderName;
	    
	    @Column(name = "merchantId")
	    private String merchantId;
	    
	    @Column(name = "publicKey")
	    private String publicApiKey;
	    
	    @Column(name = "privateKey")
	    private String privateApiKey;
	    
	    @Column(name = "userId")
	    private String userId;

	    // Getters and Setters

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getAccountHolderName() {
	        return accountHolderName;
	    }

	    public void setAccountHolderName(String accountHolderName) {
	        this.accountHolderName = accountHolderName;
	    }

	    public String getMerchantId() {
	        return merchantId;
	    }

	    public void setMerchantId(String merchantId) {
	        this.merchantId = merchantId;
	    }

	    public String getPublicApiKey() {
	        return publicApiKey;
	    }

	    public void setPublicApiKey(String publicApiKey) {
	        this.publicApiKey = publicApiKey;
	    }

	    public String getPrivateApiKey() {
	        return privateApiKey;
	    }

	    public void setPrivateApiKey(String privateApiKey) {
	        this.privateApiKey = privateApiKey;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }
	}
