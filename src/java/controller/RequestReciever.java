/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import factory.DAOFactory;
import factory.MysqlFactory;
import factory.SessionFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.Product;

/**
 *
 * @author Hossam
 */
public class RequestReciever extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("sadjkashdjkgasdkjgasdagkhadkhfgzmvcnbzxvchadsgas");
        String productId = request.getParameter("productId");
        System.out.println("productId String dasdas   " + productId);
        MysqlFactory mysqlFactory = (MysqlFactory) DAOFactory.getDAOFactory();
        Product product = new Product();
        product.setId(Integer.parseInt(productId));
        product = (Product) mysqlFactory.getProduct().findObject(product);
        System.out.println("productId String dasdas   " + productId);
        System.out.println("product id dasdas   " + product.getId());
        
        ArrayList<Product> products = SessionFactory.getSession(request, SessionFactory.PRODUCT_ARRAY_LIST);
        // if (arrayList) products not initial ---- for nullPointerException 
        if (products == null) 
            products = new ArrayList<>();
        // if product already selected before .... flage will be false 
        boolean flag = true;
        for (Product p : products) 
            if (p.getId() == product.getId()) 
                flag = false;
        System.out.println("flag  : "+ flag);
        if (flag) {
            products.add(product); // add product to list of selected products
            SessionFactory.setSession(request, SessionFactory.PRODUCT_ARRAY_LIST, products);
            System.out.println("new Name:     " + product.getName());
            System.out.println("new Name:     " + product.getId());
            System.out.println("size of products : "+products.size());
        }
    }
}
