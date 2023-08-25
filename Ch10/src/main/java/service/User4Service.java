package service;

import java.util.List;

import dao.User4DAO;
import dto.User4DTO;

public class User4Service {

	private User4DAO dao = new User4DAO();
	
	public void insertUser4(User4DTO dto) {
		dao.insertUser4(dto);
	}
	
	public User4DTO selectUser1(String uid) {
		return dao.selectUser4(uid);
	}
	
	public List<User4DTO> selectUser1s() {
		List<User4DTO> users = dao.selectUser4s();
		return users;
	}
	
	public void updateUser4(User4DTO dto) {
		dao.updateUser4(dto);
	}
	
	public void deleteUser4(String uid) {
		dao.deleteUser4(uid);
	}
	
}