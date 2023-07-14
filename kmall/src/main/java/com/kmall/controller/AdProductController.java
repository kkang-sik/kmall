package com.kmall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmall.domain.CategoryVO;
import com.kmall.domain.ProductVO;
import com.kmall.dto.Criteria;
import com.kmall.dto.PageDTO;
import com.kmall.service.AdProductService;
import com.kmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/product/*")
@Controller
public class AdProductController {

	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	// 업로드폴더 (servlet-context.xml 확인할것)
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// CkEditor업로드폴더 (상품설명)
	@Resource(name = "uploadCkEditorPath")
	private String uploadCkEditorPath;
	
	
	// 상품등록
	@GetMapping("/pro_insert")
	public void pro_insert(Model model) {
		
		// 1차카테고리 목록
		model.addAttribute("categoryList", adProductService.getCategoryList());
	}
	
	@ResponseBody
	@GetMapping("/subCategory/{cat_code}")
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("cat_code") Integer cat_code) {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.subCategoryList(cat_code), HttpStatus.OK);
		
		return entity;
		
	}
	
	@PostMapping("/pro_insert")
	public String pro_insert(ProductVO vo, RedirectAttributes rttr) {
		
		String uploadDateFolder = FileUtils.getFolder();
		String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
		
		vo.setPro_img(saveImageName);
		vo.setPro_up_folder(uploadDateFolder);
		
		log.info("상품정보(이미지 포함): " + vo);
		
		
		// 상품테이블 DB 등록
		adProductService.pro_insert(vo);
		
		return "redirect:/admin/product/pro_list";
		
	}
	
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 클라이언트에게 보내는 정보에 설명.
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			// 1)업로드 작업
			String fileName = upload.getOriginalFilename(); // 클라이언트에서 보낸 파일이름.
			byte[] bytes = upload.getBytes(); // 클라이언트에서 보낸 업로드되는 파일을 바이트배열로 확보.
			
			String uploadPath = uploadCkEditorPath + fileName;
			
			log.info("파일업로드: " + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();
			
			// 2)업로드된 파일정보를 CKEditor 에게 보내는 작업.
			printWriter = res.getWriter();
			
			// 1)톰캣 Context Path에서 Add External Web Module 작업을 해야 함.
			// Path : /upload, Document Base : C:\\dev\\upload\\ckeditor 설정
			// 2)Tomcat server.xml에서 <Context docBase="업로드경로" path="/upload" reloadable="true"/>
			
			String fileUrl = "/upload/" + fileName;
			// {"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"}
			printWriter.println("{\"filename\":\"" +  fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
	}
	
	
	@GetMapping("/pro_list")
	public void pro_list(@ModelAttribute("cri") Criteria cri, Integer cat_code, Model model) {
		
		// 검색기능 사용 후, 검색 파라미터 초기화 작업
		if(cat_code != null ) {
			cri = new Criteria();
		}
		
		// 1차 카테고리 검색목록
		model.addAttribute("categoryList", adProductService.getCategoryList());
		
		// 2차 카테고리 검색목록
		List<ProductVO> pro_list = adProductService.getListWithPaging(cri, cat_code);
		
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("pro_list", pro_list);
		
		int totalCount = adProductService.getTotalCount(cri, cat_code);
		model.addAttribute("pageMaker", new PageDTO(totalCount, cri));
	}
	
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@GetMapping("/pro_modify")
	public void modify(Integer pro_num, int cat_code, @ModelAttribute("cri") Criteria cri, Model model) {
		
		// 상품 수정폼
		ProductVO productVO = adProductService.modify(pro_num);
		productVO.setPro_up_folder(productVO.getPro_up_folder().replace("\\", "/"));
		
		model.addAttribute("productVO", productVO);		// 상품정보
		
		// 1차 카테고리 정보
		CategoryVO categoryVO = adProductService.get(cat_code);
		model.addAttribute("categoryVO", categoryVO);
		
		// 1차 카테고리 목록
		model.addAttribute("categoryList", adProductService.getCategoryList());
		// 1차 카테고리를 참조하는 2차 카테고리 목록
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryVO.getCat_code()));
		
	}
	
	@PostMapping("/pro_modify")
	public String modify(ProductVO vo, RedirectAttributes rttr) {
		
		//상품이미지를 업로드 한 경우 (변경)
		if(!vo.getUploadFile().isEmpty()) {
			
			// 1) 기존 상품 이미지 삭제
			FileUtils.deleteFile(uploadPath, vo.getPro_up_folder(), vo.getPro_img());
			// 2) 변경 상품이미지 업로드작업
			String uploadDateFolder = FileUtils.getFolder();
			String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
			
			vo.setPro_img(saveImageName);				// 실제 업로드 된 파일명
			vo.setPro_up_folder(uploadDateFolder); 		// 날짜폴더명
		}
		
		// 공통 : 상품수정작업. modify()
		adProductService.update(vo);
		
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/admin/product/pro_list";
	}
	
	@PostMapping("/pro_delete")
	public String pro_delete(Integer pro_num, Criteria cri, RedirectAttributes rttr) {
		
		adProductService.delete(pro_num);
		
		rttr.addFlashAttribute("msg", "delete");
		
		return "redirect:/admin/product/pro_list";
	}
	
	@ResponseBody
	@PostMapping("/pro_checked_modify")
	public ResponseEntity<String>
		pro_checked_modify(
				@RequestParam("pro_num_arr[]") List<Integer> pro_num_arr,
				@RequestParam("pro_price_arr[]") List<Integer> pro_price_arr,
				@RequestParam("pro_buy_arr[]") List<String> pro_buy_arr) {
	
		ResponseEntity<String> entity = null;
	
		// 수정 방법 1
		List<ProductVO> pro_list = new ArrayList<ProductVO> ();
		
		for(int i=0; i<pro_num_arr.size(); i++) {
			
			ProductVO productVO = new ProductVO();
			productVO.setPro_num(pro_num_arr.get(i));
			productVO.setPro_price(pro_price_arr.get(i));
			productVO.setPro_buy(pro_buy_arr.get(i));
			
			pro_list.add(productVO);
		}
		
		adProductService.pro_checked_modify1(pro_list);
		
		// 수정 방법 2
		/*
		for(int i=0; i<pro_num_arr.size(); i++) {
			adProductService.pro_checked_modify2(pro_num_arr.get(i), pro_price_arr.get(i), pro_buy_arr.get(i));
		}
		*/
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	// 선택상품 삭제
	@ResponseBody
	@PostMapping("/pro_checked_delete")
	public ResponseEntity<String> 
			pro_checked_modify(
					@RequestParam("pro_num_arr[]") List<Integer> pro_num_arr) {
		
		ResponseEntity<String> entity = null;
		

		
		// 1) 삭제작업. Connection객체 하나로 sql구문 실행 : 성능 향상
		adProductService.pro_checked_delete(pro_num_arr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		// 2) Connection객체를 for문 반복횟수 만큼 생성, sql구문 개별실행 : 성능떨어짐
		for(int i=0; i<pro_num_arr.size(); i++) {
			
		}
		
		return entity;
	}
	
}
