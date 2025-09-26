package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.DashboardStatusDAO;
import dto.DashboardStatus;

@Service
public class DashboardServiceImpl implements DashboardService{

	private final DashboardStatusDAO dashboardStatusDAO;
	
	@Autowired
	public DashboardServiceImpl(DashboardStatusDAO dashboardStatusDAO) {
		this.dashboardStatusDAO = dashboardStatusDAO;
	}
	
	@Override
	public DashboardStatus getDashboardStats() {
		return dashboardStatusDAO.getDashboardStats();
	}


}
