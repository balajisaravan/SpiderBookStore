package com.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class BookWarehouseDto {

    @XmlElement
    @NotNull(message = "*should not be empty")
    private int bookId;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    @Pattern(regexp ="^(?=.{3,50}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._ ]+(?<![_.])$", message=" *Give Valid Book Name")
    private String bookName;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    @Pattern(regexp ="^(?=.{3,50}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._ ]+(?<![_.])$", message=" *author Name required")
    private String author;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    private String description;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    @Pattern(regexp ="^\\d{0,8}(\\.\\d{1,4})?$", message=" *Price Should be in Number")
    private String price;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    private String publishYear;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    private String sellerName;

    @XmlElement
    @NotBlank(message = "*should not be empty")
    private String publication;

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(String publishYear) {
        this.publishYear = publishYear;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getPublication() {
        return publication;
    }

    public void setPublication(String publication) {
        this.publication = publication;
    }

    @Override
    public String toString() {
        return "BookWarehouseDto{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", description='" + description + '\'' +
                ", price='" + price + '\'' +
                ", publishYear='" + publishYear + '\'' +
                ", sellerName='" + sellerName + '\'' +
                ", publication='" + publication + '\'' +
                '}';
    }
}
