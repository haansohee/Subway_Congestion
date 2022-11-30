import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
    public static void main(String[] args) throws IOException, ParseException {
    	// 오늘 날짜 받아오기 
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	System.out.println(sdf.format(date));
    	
    	// 초단기실황조회.
    	String apiURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
    	String serviceKey = "tjD5lYUAzevWJitnYN0uROhvyqlGc4NcgUCPWef%2F%2FfI3sAEhPEb%2BzxSzms8ocoznYQ9UsAAGaUXQlvlcVk%2Fksw%3D%3D";
    	String nx = "60";  // 위도 
    	String ny = "127"; // 경도 
    	String baseDate = sdf.format(date);  // 조회하고 싶은 날짜
    	String baseTime = "1100";  // 조회하고 싶은 시간 
    	String type = "json";  // 타입 
    	String numberOfRows = "1";  // 한 페이지 결과 수
    	
    	StringBuilder urlBuilder = new StringBuilder(apiURL);
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey);
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numberOfRows", "UTF-8") + "=" + URLEncoder.encode(numberOfRows, "UTF-8")); 
        
        /*
         * Get 방식으로 전송해서 파라미터 받아오기
         */        
        URL url = new URL(urlBuilder.toString());
        System.out.println(url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String data = sb.toString();
        System.out.println(data);
        
        // Json parser를 만들어 만들어진 문자열 데이터를 객체화.
        JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject)parser.parse(data);
        
        // response 키를 가지고 데이터를 파싱
        JSONObject parse_response = (JSONObject)obj.get("response");
        
        // response로부터 body 찾기
        JSONObject parse_body = (JSONObject)parse_response.get("body");
        
        // body로부터 items 찾기
        JSONObject parse_items = (JSONObject)parse_body.get("items");
        JSONArray parse_item = (JSONArray)parse_items.get("item");
        
        for (int i = 0; i <parse_item.size(); i++) {
        	System.out.println(parse_item.get(i));
        }
        
        
        
        /*
         * POP	강수확률	 %
         * PTY	강수형태	코드값
         * R06	6시간 강수량	범주 (1 mm)
         * REH	습도	 %
         * S06	6시간 신적설	범주(1 cm)
         * SKY	하늘상태	코드값
         * T3H	3시간 기온	 ℃
         * TMN	아침 최저기온	 ℃
         * TMX	낮 최고기온	 ℃
         * UUU	풍속(동서성분)	 m/s
         * VVV	풍속(남북성분)	 m/s
         */        
    }
}