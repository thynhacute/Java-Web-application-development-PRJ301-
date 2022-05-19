package sample.products;

public class ProductError {

    private String productIDError;
    private String productNameError;
    private String imageError;
    private double priceError;
    private int quantityError;
    private String categoryIDError;
    private String importDateError;
    private String usingDateError;
    private String messageError;

    public ProductError() {
        this. productIDError = "";
        this. productNameError = "";
        this. imageError = "";
        this. priceError = 0;
        this. quantityError= 0;
        this.categoryIDError = "";
        this. importDateError = "";
        this. usingDateError = "";
        this. messageError = "";

    }

    public ProductError(String productIDError, String productNameError, String imageError, double priceError, int quantityError, String categoryIDError, String importDateError, String usingDateError, String messageError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.categoryIDError = categoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.messageError = messageError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public double getPriceError() {
        return priceError;
    }

    public void setPriceError(double priceError) {
        this.priceError = priceError;
    }

    public int getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(int quantityError) {
        this.quantityError = quantityError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }

}
