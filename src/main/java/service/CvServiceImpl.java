package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CvDAO;
import model.Cv;
import model.User;

@Service
public class CvServiceImpl implements CvService {
	private final CvDAO cvDAO;
	
	@Autowired
	public CvServiceImpl(CvDAO cvDAO) {
		this.cvDAO = cvDAO;
	}

	@Override
	public Cv findByUser(User user) {
		Cv cv = cvDAO.findByUser(user).orElse(null);
		return cv;
	}
}
