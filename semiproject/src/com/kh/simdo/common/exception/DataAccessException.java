package com.kh.simdo.common.exception;

import com.kh.simdo.common.code.ErrorCode;

public class DataAccessException extends CustomException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3250815234204291015L;

	// SQL Exception을 unchecked로 감싸기 위해 사용하는 예외
	// 반드시 예외에 대한 로그를 남겨야 한다. 
	public DataAccessException(ErrorCode error, Exception e) {
		super(error,e);
	}

}
