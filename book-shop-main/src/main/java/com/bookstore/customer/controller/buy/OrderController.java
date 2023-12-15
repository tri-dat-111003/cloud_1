package com.bookstore.customer.controller.buy;

import com.bookstore.dao.*;

import com.bookstore.entity.CartItem;
import com.bookstore.entity.Delivery;
import com.bookstore.entity.PayMethod;
import com.bookstore.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CartItemDAO cartItemDAO = new CartItemDAO();
        String uidString = request.getParameter("uid");
        int idUser = 0;
        if (uidString == null) {
            idUser = ((User) request.getSession().getAttribute("acc")).getId();
        }
        else {
            idUser = Integer.parseInt(uidString);
        }
        List<CartItem> cartItems = cartItemDAO.getItemListByUId(idUser);
        request.setAttribute("listItem", cartItems);
        int total = cartItemDAO.totalPrice(cartItems);

        PaymentDAO paymentDAO = new PaymentDAO();
        List<PayMethod> payMethods = paymentDAO.getAll();

        DeliveryDAO deliveryDAO = new DeliveryDAO();
        List<Delivery> deliveries = deliveryDAO.getAll();

        request.setAttribute("listPay", payMethods);
        request.setAttribute("listDelivery", deliveries);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/store/views/order.jsp").forward(request, response);
       /* response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();

        String uid  = request.getParameter("uid");

        printWriter.println(uid);*/

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
