package com.example.spring01.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring01.model.dao.MovieDAO;

@Service
public class MovieAPIServiceImpl implements MovieAPIService {

	@Inject
	MovieDAO moviedao;

	public String search(String movieNm,String startDt) {
		 String clientId = "x8SjisxW1KilgEyzGF7B"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
	        String clientSecret = "AMf0cqOIpA"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"

	        String text = null;
	        try {
	            text = URLEncoder.encode(movieNm, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("�˻��� ���ڵ� ����",e);
	        }

	        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text+"&yearfrom="+startDt.substring(0, 4);    // json ���
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���

	        Map<String, String> requestHeaders = new HashMap<String, String>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        return get(apiURL,requestHeaders);
	        
	    }

	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
	                return readBody(con.getInputStream());
	            } else { // ���� �߻�
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API ��û�� ���� ����", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
	        }
	    }
	
}
