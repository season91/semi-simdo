package com.kh.simdo.common.code;

public enum ConfigCode {
	//런칭용
		//DOMAIN("https://www.bookmanager.ga"),
		//개발용
<<<<<<< HEAD
		DOMAIN("http://localhost:9090"),
=======
		DOMAIN("http://localhost:8989"),
>>>>>>> 9f62b99ea28cbd38c51617ba3de9a7dafb44d13e
		EMAIL("choayoung91@naver.com"),
		// 파일 저장은 내부에다하면 배포할때 다날라가니까 꼭 외부 파일서버에다가 업로드 할 것
		UPLOAD_PATH("C:\\CODE\\05_Servlet\\resources\\upload\\");
		
		public String desc;
		
		ConfigCode(String desc) {
			// TODO Auto-generated constructor stub
			this.desc = desc;
		}
		
		public String toString() {
			return desc;
		}

}
