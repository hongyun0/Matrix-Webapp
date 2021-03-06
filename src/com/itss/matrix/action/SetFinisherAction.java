package com.itss.matrix.action;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.itss.matrix.model.DailyDAO;

public class SetFinisherAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		new DailyDAO().setFinisher((String)session.getAttribute("userId"), (String)session.getAttribute("staffName"), request.getParameter("assignDate"), Integer.parseInt((String)request.getSession(true).getAttribute("branchSeq")), request.getParameter("dailyTask").trim());
		return "results/succeed.jsp";
	}

}
