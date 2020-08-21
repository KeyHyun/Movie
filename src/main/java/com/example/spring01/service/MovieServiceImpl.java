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

		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd = "";
		String wideAreaCd = "";

		String key = "511de146fb18096bd169f70969dc5ff7";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		String dailyResponse;
		try {
			dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd,
					wideAreaCd);
			JSONParser parser = new JSONParser();

			JSONObject dailyobj = (JSONObject) parser.parse(dailyResponse);
			String dailyobjStr = dailyobj.get("boxOfficeResult").toString();

			JSONObject dailyobj2 = (JSONObject) parser.parse(dailyobjStr);
			String objStr2 = dailyobj2.get("dailyBoxOfficeList").toString();

			JSONArray list = (JSONArray) parser.parse(objStr2);
			int top3 = 3;

			for (int i = 0; i < top3; i++) {
				JSONObject top = (JSONObject) parser.parse(list.get(i).toString());
				String top_name = top.get("movieNm").toString();
				String top_dt = top.get("openDt").toString();
				JSONObject movie = (JSONObject) parser.parse(apiService.search(top_name, top_dt));
				JSONArray top_array = (JSONArray) parser.parse(movie.get("items").toString());
				JSONObject top_object = (JSONObject) parser.parse(top_array.get(0).toString());
				System.out.println(top_object.get("image"));
				imgurl.add(top_object.get("image").toString());

			}

		} catch (ParseException e) {
			System.out.println("변환에 실패");
			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		return imgurl;

	}

	public List<String> movie_list() {
		List<String> m_name = new ArrayList<>();
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, -1);

		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		String targetDt = format1.format(c.getTime());

//		String targetDt = format1.format(date);

		System.out.println(targetDt);
		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd = "";
		String wideAreaCd = "";

		String key = "511de146fb18096bd169f70969dc5ff7";
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		String dailyResponse;
		try {
			dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd,
					wideAreaCd);
			JSONParser parser = new JSONParser();

			System.out.println("::::" + dailyResponse);

			JSONObject daily_m = (JSONObject) parser.parse(dailyResponse);
			String daily_obj = daily_m.get("boxOfficeResult").toString();

			JSONObject obj2 = (JSONObject) parser.parse(daily_obj);
			String objStr2 = obj2.get("dailyBoxOfficeList").toString();

			JSONArray list = (JSONArray) parser.parse(objStr2);

			System.out.println(list.size());

			for (int i = 0; i < list.size(); i++) {
				JSONObject movie = (JSONObject) parser.parse(list.get(i).toString());
				String mov_name = movie.get("movieNm").toString();
				System.out.println(mov_name);
				m_name.add(mov_name);

			}

		} catch (ParseException e) {
			System.out.println("변환에 실패");
			e.printStackTrace();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return m_name;

	}

	@Override
	public void insertMovie(BookingDTO vo) {
		moviedao.insertMovie(vo);
	}

	@Override
	public List<MovieDTO> movieList(String movie) {
		return moviedao.movieList(movie);
	}

	@Override
	public List<BookingDTO> bookingList(BookingDTO vo) {
		return moviedao.bookingList(vo);
	}
}
