package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.MemberDTO;

public class MemberDAO {
	
	public static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	// 로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	
	public void insertMember(MemberDTO dto) {
		try {
			logger.info("MemberDAO insertMember...");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("INSERT INTO `member` VALUES (?,?,?,?,?,NOW())");
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getPos());
			psmt.setInt(5, dto.getDep());
			psmt.executeUpdate();			
			psmt.close();
			logger.info("Data inserted successfully.");
			conn.close();
		}catch (Exception e) {
			logger.error("MemberDAO insertMember error : " + e.getMessage());
		}
	}
	
	public MemberDTO selectMember(String uid) {
		return null;
	}
	
	public List<MemberDTO> selectMembers() {
		List<MemberDTO> memberList = new ArrayList<>();

	    try {
	        logger.info("MemberDAO selectMembers...");

	        Context initCtx = new InitialContext();
	        Context ctx = (Context) initCtx.lookup("java:comp/env");

	        DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
	        Connection conn = ds.getConnection();

	        PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `member`");
	        ResultSet rs = psmt.executeQuery();

	        while (rs.next()) {
	            MemberDTO member = new MemberDTO();
	            member.setUid(rs.getString("uid"));
	            member.setName(rs.getString("name"));
	            member.setHp(rs.getString("hp"));
	            member.setPos(rs.getString("pos"));
	            member.setDep(rs.getInt("dep"));
	            member.setRdate(rs.getString("rdate"));
	            memberList.add(member);
	        }

	        rs.close();
	        psmt.close();
	        conn.close();
	    } catch (Exception e) {
	        logger.error("MemberDAO selectMembers error : " + e.getMessage());
	    }

	    return memberList;
	}
	
	public void updateMember(MemberDTO dto) {
		
	}
	
	public void deleteMember(String uid) {
		
	}
}