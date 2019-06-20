package com.rent.car.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateuserprofile")
public class UpdateUserProfile extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//response.setContentType("application/json");
		
		
		UserController user = (UserController)request.getSession().getAttribute("user_controller");
		String id = (String)request.getSession().getAttribute("session_id");
		String username=(String)request.getParameter("username");
//		String password=request.getParameter("password");
		
		if(!id.equals(""))	{
			if(!username.equals("")) {
			user.updateUsername(id,username);		
//			response.getWriter().append(username+id);
			//Moving to the login page
			request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
			}

//			if(!password.equals("")) {
//				user.updatePassword(id,username);		

				//Moving to the login page
//				request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
//				}
			else {
				
			}
		
		}
		else	{
			response.sendRedirect("index.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
