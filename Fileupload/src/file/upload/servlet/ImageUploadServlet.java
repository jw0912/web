package file.upload.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.jni.File;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import file.upload.vo.ImgUploadVO;

public class ImageUploadServlet extends HttpServlet {
	   
	   @Override
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // 이미지를 저장할 경로
	      ServletContext ctx = getServletContext();
	   //   String imageDir = ctx.getRealPath("/up_images"); // /up_images의 실제 파일경로(c:\xxxx)를 리턴 , 안쓰는 변수라면 주석처리
	      
	   //   String temDir = ctx.getInitParameter("tempdir"); // 업로드된 파일을 저장할 임시 디렉토리, 안쓰는 변수라면 주석처리
	      
	      // 1. DiskFileItemFactory 객체를 생성 - 임시저장소 정보 설정
//	      DiskFileItemFactory factory=new DiskFileItemFactory(1024*1024, new File( ctx.getInitParameter("tempdir")));
	      
	      // 2. ServletFileUpload 객체 생성 - DiskFileItemFactory객체를 전달
	      ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory(1024*1024, new File( ctx.getInitParameter("tempdir"))));
	      
	      ImgUploadVO vo = new ImgUploadVO();
	      // 3. 요청파라미터 조회 작업
	      
	      try {
	         List<FileItem> list = upload.parseRequest(request);
	         for(FileItem item : list){
	            String reqName=item.getFieldName(); // 요청파라미터 이름 조회
	            
	            if(item.isFormField()){ // 일반 요청 파라미터(String)
	               String reqValue = item.getString("utf-8"); // 요청파라미터 조회. 인코딩 설정 반드시 해야 한다.
	               
	               //vo에 요청파라미터 set
	               if(reqName.equals("uploader")){
	            	   vo.setUploader(reqValue);
	               }else if(reqName.equals("comment")){
	            	   vo.setComment(reqValue);
	               }
	               
	               request.setAttribute(reqName, reqValue);
	            }else{ // 파일 요청파라미터 ( input type="file" )
	               // 업로드 된 파일명 조회
	               String fileName = item.getName(); // 업로드된 파일명 조회
	               // 업로드 된 파일이 있는지 체크 getSize() : long - 업로드된 파일의 크기(byte)
	               if(item.getSize()!=0){
	                  // 1. 임시경로의 파일을 최종 경로로 이동
	                  item.write(new File(ctx.getRealPath("/up_images"),fileName)); // 매개변수로 받은 파일로 카피
	                  
	                  // 2. 임시경로의 파일을 삭제
	                  item.delete();
	                  
	                  request.setAttribute(reqName, fileName);
	               }
	            }
	         }// end if for문
	         
	         // 응답처리
	         
	         request.getRequestDispatcher("/upload_result.jsp").forward(request, response);
	         
	         
	      } catch (Exception e) {
	         // 에러 처리 페이지로 이동
	         e.printStackTrace();
	         throw new ServletException(e); // 예외 처리를 톰켓에게 맡긴다.
	      }
	   }
	}






