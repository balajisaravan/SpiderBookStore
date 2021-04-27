package com.serviceClientRest;

import com.dto.BookWarehouseDto;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class ClientRestServiceImpl implements ClientRestService {

    private RestTemplate restTemplate;

    private static final Logger logger = LogManager.getLogger(ClientRestServiceImpl.class);

    private static String REST_SERVICE_URL = "http://localhost:8082/spiderBookWarehouse_war_exploded";

    @Override
    public ResponseEntity<Integer> addBookInClientSide(BookWarehouseDto bookWarehouseDto) {
        BasicConfigurator.configure();
        getLogger().info("Inside addBookInClientSide method");
        String url = REST_SERVICE_URL + "/addBookFromClientToServer";
        try {
            return getRestTemplate().postForEntity(url, bookWarehouseDto, Integer.class);
        } catch (RestClientException e) {
            getLogger().error("Execption in addBookInClientSide", e);
        }
        return null;
    }

    @Override
    public ResponseEntity<Integer> updateBookInClientSide(BookWarehouseDto bookWarehouseDto) {
        String url = REST_SERVICE_URL + "/updateBookFromClientToServer";
        try {
            return getRestTemplate().postForEntity(url, bookWarehouseDto, Integer.class);
        } catch (RestClientException e) {
            getLogger().error("Execption in updateBookInClientSide", e);
        }
        return null;
    }

    @Override
    public List<BookWarehouseDto> getbookWarehouseDtoBySellerName(String sellerName) {
        String url = REST_SERVICE_URL + "/" + sellerName;
        try {
            ResponseEntity<BookWarehouseDto[]> bookWarehouseDto = getRestTemplate().getForEntity(url, BookWarehouseDto[].class);

            if (bookWarehouseDto.getBody() != null) {
                return Arrays.asList(bookWarehouseDto.getBody());
            }
        } catch (RestClientException e) {
            getLogger().error("Execption in getbookWarehouseDtoBySellerName", e);
        }
        return Collections.emptyList();
    }

    @Override
    public List<BookWarehouseDto> getAllbookWarehouseDto() {
        String url = REST_SERVICE_URL + "/convertAllBookWarehouseDtoToJson";
        try {
            ResponseEntity<BookWarehouseDto[]> bookWarehouseDto = getRestTemplate().getForEntity(url, BookWarehouseDto[].class);

            if (bookWarehouseDto.getBody() != null) {
                return Arrays.asList(bookWarehouseDto.getBody());
            }
        } catch (RestClientException e) {
            getLogger().error("Execption in getAllbookWarehouseDto", e);
        }
        return Collections.emptyList();
    }

    @Override
    public BookWarehouseDto getbookWarehouseDtoById(int bookId) {
        String url = REST_SERVICE_URL + "/convertBookWarehouseDtoToJsonByBookId/" + bookId;
        try {
            return getRestTemplate().getForObject(url, BookWarehouseDto.class);
        } catch (RestClientException e) {
            getLogger().error("Execption in getbookWarehouseDtoById", e);
        }
        return null;
    }

    @Override
    public BookWarehouseDto getbookWarehouseDtoByBookName(String bookName) {
        String url = REST_SERVICE_URL + "/convertBookWarehouseDtoToJsonByBookName/" + bookName;
        try {
            return getRestTemplate().getForObject(url, BookWarehouseDto.class);
        } catch (RestClientException e) {
            getLogger().error("Execption in getbookWarehouseDtoByBookName", e);
        }
        return null;
    }

    @Override
    public ResponseEntity<Integer> deleteBookInClientSide(int bookId) {
        String url = REST_SERVICE_URL + "/deleteBookFromClientToServer/" + bookId;
        try {
            return getRestTemplate().getForEntity(url, Integer.class);
        } catch (RestClientException e) {
            getLogger().error("Execption in getbookWarehouseDtoBySellerName", e);
        }
        return null;
    }

    public RestTemplate getRestTemplate() {
        return restTemplate;
    }

    public void setRestTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public static Logger getLogger() {
        return logger;
    }
}
