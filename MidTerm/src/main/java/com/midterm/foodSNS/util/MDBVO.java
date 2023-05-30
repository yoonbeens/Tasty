package com.midterm.foodSNS.util;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MDBVO {

	/*
	 @JsonProperty
	 Rest API 통신을 진행하다 보면 데이터를 주고 받을 때 JSON 형태의 데이터를 주로 이용합니다.
	 json은 스네이크 케이스 방식을 사용하고, 서버단에서는 카멜 케이스 방식을 사용합니다.
	 서로 표현 방식이 다름에 따라 데이터의 key가 달라지는 경우가 발생합니다.
	 이 때 @JsonProperty를 사용하면 값을 매칭할 수 있습니다. 
	 */
	
	
	@JsonProperty("COOKRCP01")
	private COOKRCP01 cookrcp01;



	@Getter @Setter @ToString
	static class COOKRCP01  {
		
	
		@JsonProperty("row")
		private List<Row> row;
		
	
		@Getter @Setter @ToString		
		static class Row{
			
			
			@JsonProperty("RCP_NM")
			private String foodname; //요리제목
		
			@JsonProperty("ATT_FILE_NO_MK")
			
			private String titleimg; //대표이미지

			@JsonProperty("RCP_PARTS_DTLS")
			private String ingredient; //필요재료

			@JsonProperty("RCP_NA_TIP")
			private String tip; //음식팁



			//조리 설명
			@JsonProperty("MANUAL01")
			private String text1;

			@JsonProperty("MANUAL02")
			private String text2;

			@JsonProperty("MANUAL03")
			private String text3;

			@JsonProperty("MANUAL04")
			private String text4;

			@JsonProperty("MANUAL05")
			private String text5;






			//조리이미지
			@JsonProperty("MANUAL_IMG01")
			private String img1;

			@JsonProperty("MANUAL_IMG02")
			private String img2;

			@JsonProperty("MANUAL_IMG03")
			private String img3;

			@JsonProperty("MANUAL_IMG04")
			private String img4;

			@JsonProperty("MANUAL_IMG05")
			private String img5;




		}



	}

}



















