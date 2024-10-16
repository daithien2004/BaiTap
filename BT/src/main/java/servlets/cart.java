package servlets;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		// Lấy thông tin sản phẩm từ yêu cầu
        String productDescription = request.getParameter("description");
        String priceString = request.getParameter("price");
        
        double productPrice = Double.parseDouble(priceString);

        // Tạo đối tượng sản phẩm mới (có thể cần chỉnh sửa để phù hợp với lớp Product của bạn)
        Product product = new Product(productDescription, productPrice);

        // Lấy phiên và giỏ hàng từ phiên
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        // Nếu giỏ hàng null, tạo một giỏ hàng mới
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Thêm sản phẩm vào giỏ hàng
        cart.add(product);

        // Chuyển hướng đến trang giỏ hàng
        response.sendRedirect("cart.jsp");
    }
}

