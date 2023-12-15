package com.bookstore.customer.controller.buy;

import com.bookstore.dao.*;
import com.bookstore.entity.CartItem;
import com.bookstore.entity.Product;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "AddCardControl", value = "/cart")
public class AddCartController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF8");
        request.setCharacterEncoding("UTF-8");
        int idUser = Integer.parseInt(request.getParameter("uid"));
        int idP = Integer.parseInt(request.getParameter("pid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductDAO productDAO = new ProductDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();

        Product product = productDAO.getProductByID(idP);
        if(product.getQuantity() < 1){
            request.setAttribute("err", "Sản phẩm hiện tại hết hàng");
            request.setAttribute("pid", idP);
            request.getRequestDispatcher("detail").forward(request, response);
        }
        else{
            int price = productDAO.getSalePrice(idP);
            CartItem cartItem = new CartItem(idUser, idP, quantity, price);
            cartItemDAO.addCartItem(cartItem);

            request.setAttribute("uid", idUser);
            request.getRequestDispatcher("showCart").forward(request, response);
        }

    }
}
