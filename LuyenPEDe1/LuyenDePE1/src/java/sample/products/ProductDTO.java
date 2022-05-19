package sample.products;

public class ProductDTO {

    public int productID;
    public String productName;
    public String image;
    public double price;
    public int quantity;
    public int categoryID;
    public String importDate;
    public String usingDate;
    public int quantityPurchase;

    public ProductDTO() {
        this.productID = 0;
        this.productName = "";
        this.image = "";
        this.price = 0;
        this.quantity = 0;
        this.categoryID = 0;
        this.importDate = "";
        this.usingDate = "";
        this.quantityPurchase = 0;
    }

    public ProductDTO(int productID, String productName, String image, double price, int quantity, int categoryID, String importDate, String usingDate, int quantityPurchase) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.quantityPurchase = quantityPurchase;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public int getQuantityPurchase() {
        return quantityPurchase;
    }

    public void setQuantityPurchase(int quantityPurchase) {
        this.quantityPurchase = quantityPurchase;
    }

}
