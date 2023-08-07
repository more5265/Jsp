package kr.co.jboard1.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.vo.ArticleVO;

public class ArticleDAO extends DBHelper {

	// 기본 CRUD
	public void insertArticle(ArticleVO vo) {

		try {
			conn = getConnection();

			psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegip());
			psmt.executeUpdate();

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ArticleVO selectArticle(int no) {
		try {
			conn = getConnection();

			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NO);
			psmt.setInt(1, no);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	public List<ArticleVO> selectArticles() {
		List<ArticleVO> articles = new ArrayList<>(); // 리스트 초기화

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ArticleVO vo = new ArticleVO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(9));
				vo.setRegip(rs.getString(10));
				vo.setRdate(rs.getString(11));
				

				articles.add(vo); 
				}
			close();
			} catch (SQLException e) {
				e.printStackTrace();
	    }
		return articles;
	}


	public void updateArticle() {

	}

	public void deleteArticle() {

	}

}


