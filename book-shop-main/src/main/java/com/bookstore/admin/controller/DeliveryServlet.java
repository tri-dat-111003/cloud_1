package com.bookstore.admin.controller;

import com.bookstore.admin.business.DeliveryBS;
import com.bookstore.dao.DeliveryDAO;
import com.bookstore.dao.PaymentDAO;
import com.bookstore.entity.Delivery;
import com.bookstore.entity.PayMethod;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeliveryServlet", value = "/admin/delivery")
public class DeliveryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Delivery> deliveryList = DeliveryDAO.getAll();
        request.setAttribute("deliveryList", deliveryList);

//      Thêm tiếng việt
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // Lấy action của người dùng
        String action = request.getParameter("action");
        if (action == null) {
            action = new String("home");
        }
        switch (action) {
            case "insert":
                actionInsert(request, response);
                break;
            case "edit":
                actionEdit(request, response);
                break;
            case "save":
                actionSave(request, response);
                break;
            case "home":
//                actionHome(request, response);
                request.getRequestDispatcher("/admin/delivery.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/admin/delivery.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Delivery> deliveryList = DeliveryDAO.getAll();
        request.setAttribute("deliveryList", deliveryList);

//      Thêm tiếng việt
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // Lấy action của người dùng
        String action = request.getParameter("action");
        if (action == null) {
            action = new String("home");
        }
        switch (action) {
            case "insert":
                actionInsert(request, response);
                break;
            case "edit":
                actionEdit(request, response);
                break;
            case "save":
                actionSave(request, response);
                break;
            case "home":
//                actionHome(request, response);
                request.getRequestDispatcher("/admin/delivery.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("/admin/delivery.jsp").forward(request, response);
                break;
        }
    }

    protected void actionInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.setAttribute("action", "insert");
        request.getRequestDispatcher("/admin/delivery-form.jsp").forward(request, response);
    }

    protected void actionEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.setAttribute("action", "edit");
        String dID = request.getParameter("deliveryID");
//        Lấy delivery có id tương ứng ra
        Delivery selectedDelivery = DeliveryDAO.getDeliveryByID(Integer.parseInt(dID));
        request.setAttribute("delivery", selectedDelivery);
        request.getRequestDispatcher("/admin/delivery-form.jsp").forward(request, response);
    }

    protected void actionSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String dID = request.getParameter("dID");
        String dName = request.getParameter("deliveryName");
        String dShipFee=request.getParameter("deliveryShipFee");

//        Kiểm tra người dùng có nhập dữ liệu vào hay chưa
        if (!dName.trim().equals("")&&!dShipFee.trim().equals("")) {
//            Thực hiện kiểm tra dữ liệu vào

//            Tạo một đối tượng Product để lưu dữ liệu
            Delivery delivery = new Delivery();
            if (!dID.equals("")) {
                delivery.setId(Integer.parseInt(dID));
            }
            delivery.setName(dName);
            delivery.setShipFee(Integer.parseInt(dShipFee));

//          Kiểm tra xem có ID chưa, nếu chưa là thêm mới, nếu có là cập nhật
            if (delivery.getId() == 0) {
                request.setAttribute("action", "insert");
                request.setAttribute("delivery", delivery);
//                  Kiểm tra xem một số thông tin phải là unique
//              Nếu số tên đã tồn tại
                if (!"OK".equals(DeliveryBS.CheckInputData(delivery))) {
                    request.setAttribute("message", DeliveryBS.CheckInputData(delivery));
                    request.getRequestDispatcher("/admin/delivery-form.jsp").forward(request, response);
                }
//              Nếu là tên mới
                else {
                    DeliveryDAO.save(delivery);
                    String message = new String("Vừa thêm phương thức vâ chuyển <b>" + delivery.getName() + "</b>");
                    request.setAttribute("message", message);
                    List<Delivery> deliveryList = DeliveryDAO.getAll();
                    request.setAttribute("deliveryList", deliveryList);
                    request.getRequestDispatcher("/admin/delivery.jsp").forward(request, response);
                }
            }
//          Đang cập nhật sách
            else {
                String message = new String("Vừa xem thông tin khách hàng <b>" + delivery.getName() + "</b>");
                request.setAttribute("message", message);
                List<PayMethod> paymethodList = PaymentDAO.getAll();
                request.setAttribute("paymethodList", paymethodList);
                request.getRequestDispatcher("/admin/customer.jsp").forward(request, response);
            }
        }
    }
}
