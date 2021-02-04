package com.kh.simdo.common.exception;

import com.kh.simdo.common.code.ErrorCode;

public class ToAlertException extends CustomException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9079339995146466004L;

	public ToAlertException(ErrorCode error) {
		// TODO Auto-generated constructor stub
		super(error);
	}

	public ToAlertException(ErrorCode error, Exception e) {
		super(error,e);
	}
}
