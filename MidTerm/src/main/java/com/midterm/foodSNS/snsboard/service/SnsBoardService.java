package com.midterm.foodSNS.snsboard.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.midterm.foodSNS.command.MSnsBoardVO;
import com.midterm.foodSNS.snsboard.mapper.ISnsBoardMapper;
import com.midterm.foodSNS.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SnsBoardService implements ISnsBoardService {

	@Autowired
	private ISnsBoardMapper mapper;
	
	
	@Override
	public void insert(MSnsBoardVO vo, MultipartFile file) {

		//날짜별로 폴더를 생성
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		String fileLoca = now.format(dtf);
		
		//기본 경로 지정
		String uploadPath = "C:/myRecipe/upload/";
		
		//폴더 없으면 새 폴더 생성
		File folder = new File(uploadPath + fileLoca);
		if(!folder.exists()) folder.mkdirs();
		
		//UUID를 파일명으로 지정
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");

		//확장자 추출
		String fileRealName = file.getOriginalFilename();
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
		String fileName = uuids + fileExtension;
		
		log.info("저장할 폴더 경로: " + uploadPath);
		log.info("실제 파일명: " + fileRealName);
		log.info("폴더명: " + fileLoca);
		log.info("확장자: " + fileExtension);
		log.info("고유랜덤문자: " + uuids);		
		log.info("변경해서 저장할 파일명: " + fileName);
		
		//업로드한 파일을 지정한 로컬 경로로 전송
		File saveFile = new File(uploadPath + fileLoca + "/" + fileName);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		vo.setUploadPath(uploadPath);
		vo.setFileLoca(fileLoca);
		vo.setFileName(fileName);
		vo.setFileRealName(fileRealName);
		
		mapper.insert(vo);
		
	}

	@Override
	public List<MSnsBoardVO> getList(PageVO vo) {

		return null;
	}

	@Override
	public MSnsBoardVO getDetail(int bno) {

		return null;
	}

	@Override
	public void delete(int bno) {


	}

}
