package kr.co.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reservationDao")
public class ReservationDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}
