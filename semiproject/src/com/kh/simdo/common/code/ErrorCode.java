package com.kh.simdo.common.code;

public enum ErrorCode {

	SU01("회원정보를 조회하는 도중 에러가 발생하였습니다.", "/user/login.do"), //조민희 사용 에러
	IU01("회원정보를 입력하는 중 에러가 발생했습니다.", "/user/join.do"), //조민희 사용 에러
	UU01("회원정보 수정 중 에러가 발생했습니다."), //조민희 사용 에러
	DU01("회원정보 삭제 중 에러가 발생했습니다."), //조민희 사용 에러
	SRV01("내가 작성한 영화 후기를 조회하는 도중 에러가 발생하였습니다."), //조민희 사용 에러
	SFL01("내가 작성한 나만의 명대사를 조회하는 도중 에러가 발생하였습니다."), //조민희 사용 에러
	IB01("게시글 등록 중 에러가 발생했습니다."),
	SB01("게시글 정보를 조회하는 도중 에러가 발생하였습니다"),
	SF01("파일을 조회하는 도중 에러가 발생하였습니다."),
	IF01("파일정보 등록 중 에러가 발생했습니다."),
	AUTH01("해당 페이지에 접근하실 수 없습니다.","/member/login.do"),
	AUTH02("이미 인증이 만료된 링크입니다."),
	AUTH03("게시글은 로그인 후 작성할 수 있습니다."),
	MAIL01("메일 발송 중 에러가 발생했습ㅂ니다."), //조민희 사용 에러
	API01("API통신 도중 에러가 발생하였습니다."),
	CD_404("존재하지 않는 경로입니다."),
	FILE01("파일업로드 중 예외가 발생하였습니다.");
	
	//reslut.jsp를 사용해 띄울 안내문구
	private String errMsg;
	//result.jsp를 사용해 이동시킬 경로 
	private String url = "/index.do";
	
	// index로 이동시킬 경우 에러메시지만 전달받는다.
	ErrorCode(String errMsg){
		this.errMsg = errMsg;
	}
	
	//index외 지정페이지로 이동시 url도 같이 받는다.
	ErrorCode(String errMsg, String url){
		this.errMsg = errMsg;
		this.url = url;
	}

	public String errMsg() {
		return errMsg;
	}
	
	public String url() {
		return url;
	}

}
