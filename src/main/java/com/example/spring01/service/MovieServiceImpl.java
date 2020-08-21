package com.example.spring01.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring01.model.dao.MovieDAO;
import com.example.spring01.model.dto.BookingDTO;
import com.example.spring01.model.dto.MovieDTO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

@Service
public class MovieServiceImpl implements MovieService {

	@Inject
	MovieDAO moviedao;
	
	@Autowired
	MovieAPIService apiService;


	public List<String> search() {
		List<String> imgurl = new ArrayList<>();
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, -1);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		String targetDt = format1.format(c.getTime());

//		String targetDt = format1.format(date);
		
		System.out.println(targetDt);
		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd ="";
		String wideAreaCd = "";

		String key = "511de146fb18096bd169f70969dc5ff7";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse;
		try {
			dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
			JSONParser parser = new JSONParser();
        
		
			System.out.println("::::"+dailyResponse);
			
			
			JSONObject obj = (JSONObject)parser.parse(dailyResponse);
			String objStr = obj.get("boxOfficeResult").toString();
			
			JSONObject obj2 =  (JSONObject)parser.parse(objStr);
			String objStr2 = obj2.get("dailyBoxOfficeList").toString();
			
			
			JSONArray list = (JSONArray)parser.parse(objStr2);
			int top3 =3;
			
			for(int i = 0; i < top3; i++) {
				JSONObject ttt =  (JSONObject)parser.parse(list.get(i).toString());
				String tttstr = ttt.get("movieNm").toString();
				String tttstr2 = ttt.get("openDt").toString();
				System.out.println(tttstr);
				JSONObject movie = (JSONObject)parser.parse(apiService.search(tttstr,tttstr2));
				JSONArray test = (JSONArray)parser.parse(movie.get("items").toString());
				JSONObject test2 =  (JSONObject)parser.parse(test.get(0).toString());
				System.out.println(test2.get("image"));
				imgurl.add(test2.get("image").toString());
				
			}
             
             
        } catch (ParseException e) {
             System.out.println("변환에 실패");
             e.printStackTrace();
        }catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
		}
//
		return imgurl;
//
//		ObjectMapper mapper = new ObjectMapper();
//		HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
//		
//		request.setAttribute("dailyResult",dailyResult);
//		
//		String codeResponse = service.getComCodeList(true,"0105000000");
//		HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
//		request.setAttribute("codeResult",codeResult);

	
	}
	
	public List<String> movie_list()
	{
		List<String> m_name = new ArrayList<>();
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, -1);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		String targetDt = format1.format(c.getTime());

//		String targetDt = format1.format(date);
		
		System.out.println(targetDt);
		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd ="";
		String wideAreaCd = "";

		String key = "511de146fb18096bd169f70969dc5ff7";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse;
		try {
			dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
			JSONParser parser = new JSONParser();
        
		
			System.out.println("::::"+dailyResponse);
			
			
			JSONObject obj = (JSONObject)parser.parse(dailyResponse);
			String objStr = obj.get("boxOfficeResult").toString();
			
			JSONObject obj2 =  (JSONObject)parser.parse(objStr);
			String objStr2 = obj2.get("dailyBoxOfficeList").toString();
			
			
			JSONArray list = (JSONArray)parser.parse(objStr2);
			
			System.out.println(list.size());
			
			for(int i = 0; i < list.size(); i++) {
				JSONObject ttt =  (JSONObject)parser.parse(list.get(i).toString());
				String tttstr = ttt.get("movieNm").toString();
				System.out.println(tttstr);
				m_name.add(tttstr);
				
			}
             
             
        } catch (ParseException e) {
             System.out.println("변환에 실패");
             e.printStackTrace();
        }catch (Exception e) {
			// TODO: handle exception
        	e.printStackTrace();
		}
		
		return m_name;
	
	}
	
	@Override
	public void insertMovie (BookingDTO vo) {
		moviedao.insertMovie(vo);
	}
	
	@Override
	public List<MovieDTO> movieList(String movie){
		return moviedao.movieList(movie);
	}
	
	@Override
	public List<BookingDTO> bookingList(BookingDTO vo){
		return moviedao.bookingList(vo);
	}
}
