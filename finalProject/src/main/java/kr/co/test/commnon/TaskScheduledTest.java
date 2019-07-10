package kr.co.test.commnon;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TaskScheduledTest {

	/*@Scheduled(fixedDelay=300000)
	public void Test() {

		System.out.println("되냐?");
		String path = "C:\\Users\\user1\\WeddingProject\\finalProject\\src\\main\\webapp\\resources\\editor\\image2/";
		
		 File file = new File(path);
		 File[] tempFile = file.listFiles();

		 for (int i = 0; i < tempFile.length; i++) { 
			 if(tempFile[i].isFile()){
				 tempFile[i].delete(); 
			System.out.println("삭제성공");	 
			 }
		 }		
	}*/
}
