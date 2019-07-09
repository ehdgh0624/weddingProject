package kr.co.reservation.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Comparator;

public class ReservationComparator implements Comparator<Reservation>{

	@Override
	public int compare(Reservation o1, Reservation o2) {
		// TODO Auto-generated method stub
		SimpleDateFormat format= new SimpleDateFormat("yyyy-mm-dd");
		Date firstValue=o1.getWeddingDate();
		Date secondValue=o2.getWeddingDate();
		
		
		int compare = firstValue.compareTo(secondValue);
		System.out.println(compare);
		// compare>0 firstValue>secondvalue
		// compare<0 firstValue<secondValue
		// compare==0 firstValue=secondvalue
		return compare;
	}

}
