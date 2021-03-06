package com.kh.simdo.common.util.file;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.kh.simdo.common.code.ConfigCode;
import com.kh.simdo.common.code.ErrorCode;
import com.kh.simdo.common.exception.ToAlertException;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

public class FileUtil {
	//파일 업로드 할 떄 파일업로드 정보(파일테이블에 저장할 파일 메타정보), 파라미터 값 2개를 저장해서 Map에 담아 리턴
	private final int maxSize = 1024*1024*10; //10MB
	Map<String, List> multiParamMap = new HashMap<String, List>();
	List<FileVo> fileDataList = new ArrayList<FileVo>();
	//기능 분리
	//1. 파일업로드 
	//	-> renameFileName 분리
	//	-> 서브 저장경로 생성 분리
	//	-> 저장경로 생성하고 파일 저장하는 기능 분리
	//2. 파라미터정보, 파일메타정보
	//	-> 파라미터 저장 분리 getParamList
	//	-> 파일 메타정보 저장하는 List 분리
	//3. 파일삭제
	
	// 2-1. 파라미터정보 
	public List<String> getParamList(ParamPart params) throws UnsupportedEncodingException{
		// 파라미터 정보 가져오기
		// 글제목 가져오기 
		String paramName = params.getName();
		
		// 글내용 가져오기 
		// 여기서 인코딩 지정해주기, 안해주면 인코딩이 깨진다.
		String paramValue = params.getStringValue("UTF-8");
		
		// 2. 파라미터 저장할 리스트 생성
		List<String> paramList;
		
		// multiParamMap에 paramName으로 아무것도 없다면 처음한다는 뜻 
		// 한번도 같은 이름으로 데이터가 들어온 적이 없다면
		if(multiParamMap.get(paramName) == null) {
			paramList = new ArrayList<String>();
			//파라미터 값 넣어주기
			paramList.add(paramValue);
			// 파라미터 list를 map으로 넣어주기. 
			// 기능분리! 가독성을위해 map에 넣는건원래자리에 놔주자.
			//multiParamMap.put(paramName, paramList);
		} else {
			// 파라미터가 있다면, 기존 파라미터명 리스트 가져와서 값만 추가해주기.
			// 이미 들어가있던 map의 데이터를 받아서 list에 넣어주기 
			paramList = multiParamMap.get(paramName);
			paramList.add(paramValue);
			// 추가한 리스트를 다시 맵에 넣어주기.
			
		}
		return paramList;
	}
	// 1-1. 파일메타정보-rename분리
	private String getRenameFileName(String originFileName) {
		//유니크한 파일명 생성
		UUID renameFileId = UUID.randomUUID();
		
		// 마지막 . 을 기준으로 뒤의 문자열까지를 잘라 반환 : 확장자
		String renameFileName = renameFileId.toString() + 
				originFileName.substring(originFileName.lastIndexOf("."));
		
		return renameFileName;
	}
	
	// 1-2. 파일메타정보-subpath 분리
	private String getSubPath() {
		// 저장경로 생성 UPLOADPATH안에 날짜별로 나눠 넣기로 했으니깐
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DAY_OF_MONTH);
		
		String subPath = year + "/" + month + "/" + date;
		
		
		return subPath;
		
		
	}
	// 1-3.파일 저장하기. 저장을 위해서 필요한건 업로드한 파일이랑 파일 메타정보.
	private void saveFile(FilePart userFile,FileVo fileData) throws IOException {
		//파일 저장할때는 유니크한 파일명으로 저장해야함
		//File file = new File(savePath+renameFileName);
		//file.mkdirs();
		//userFile.writeTo(file);
		new File(fileData.getSavePath()).mkdirs();
		File file = new File(fileData.getSavePath()+fileData.getRenameFileName());
		userFile.writeTo(file);
		
	}
	
	// 2-2.파일메타정보 하기 전 메타정보 만드는 기능부터 분리.
	// 메타정보는 FileVo에 다 들어있따.
	private FileVo getFileData(FilePart userFile) throws UnsupportedEncodingException {
		// 파일 선언
		//파일 제목 인코딩이 깨져 바이트로 바꾸고 다시 만들기
		String originFileName = new String(userFile.getFileName().getBytes("iso-8859-1"), "UTF-8");
		String renameFileName = getRenameFileName(originFileName);
		String savePath = ConfigCode.UPLOAD_PATH + getSubPath();
		
		
		//이 정보를 vo에 저장해주기
		FileVo fileData = new FileVo();
		fileData.setOriginFileName(originFileName);
		fileData.setRenameFileName(renameFileName);
		fileData.setSavePath(savePath);
		
		return fileData;	
		
	}
	
	
	public Map<String, List> fileUpload(HttpServletRequest request){

		//두개의 list를 만들거임.
		// 1. 파일메타정보 담을 list. 사용자가 파일을 1개만 올리는건 아니니깐
		// 2. 파라미터. 같은 이름의 파라미터로 여러 개가 넘어 올 수 있기 때문.
		
		// 파일업로드 MultipartParser 선언 얘를 통해서 form으로 넘어온 데이터들을 읽을 것임
		// 읽기위해서 쓰는 메서드가 readNextPart이다.
		MultipartParser mp;
		
		try {
			mp = new MultipartParser(request, maxSize);
			// 저번에 http api 자바 통신할때 읽어온 방법처럼 파트별로 반복해 읽어올거임
			Part part;
			// 이렇게 담긴 part에는 FilePart/ParamPart가 있다
			while((part = mp.readNextPart()) != null) {
				// part가 파라미터인지 파일인지 구분해주는 메서드 isParam, isFile
				// isParam은 part가 파라미터 part라면? 이라는 뜻
				// 파일이 아니라 사용자로부터 넘어올 파라미터 라면! ParamPart의 메서드를 사용
				if(part.isParam()) {
					//part를 ParamPart 다운캐스팅해야 getName, getStringValue 메서드 사용 가능하다
					ParamPart params = (ParamPart) part;
					List<String> paramList = getParamList(params);
					multiParamMap.put(params.getName(), paramList);
				} else {
					// part가 파일이라면
					FilePart userFile = (FilePart) part;
					// 파일이 디폴트로 null로 들어간건지 계속 돈다. 분기처리 해주자
					if(userFile.getFileName() != null) {
						FileVo fileData = getFileData(userFile);
						fileDataList.add(fileData);
						saveFile(userFile,fileData);
					}
				}
			}
			multiParamMap.put("fileData", fileDataList);
		} catch (IOException e) {
			throw new ToAlertException(ErrorCode.FILE01,e);
		} 
		return multiParamMap;
	}
	
	//3. 파일삭제
	public void deleteFile(String path) {
		File file = new File(path);
		file.delete();
	}
}
