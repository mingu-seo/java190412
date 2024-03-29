package util;

import java.util.ArrayList;
import java.util.Arrays;

import manage.reserve.ReserveVO;

/**
 * 각종 코드값 가져오기
 * 각 코드들의 option, select 값 구하기
 * @author withsky
 *
 */
public class CodeUtil {

	/**
	 * 관리자 등급
	 * @param type int
	 * @return option Html
	 */
	public static String getGradeName(int type) {
		String result = "";
		switch (type) {
		case 1:
			result = "1등급관리자";
			break;
		case 2:
			result = "2등급관리자";
			break;
		case 3:
			result = "3등급관리자";
			break;
		}
		return result;
	}

	/**
	 * 관리자 등급 option
	 * @param type int
	 * @return option Html
	 */
	public static String getGrade(int type) {
		StringBuffer result = new StringBuffer();
		for (int i=1; i<=3; i++) {
			result.append("<option value="+i+" "+Function.getSelected(i, type)+">" + CodeUtil.getGradeName(i)+"</option>");
		}
		return result.toString();
	}

	/**
	 *  회원상태
	 * @param type int
	 * @return String
	 */
	public static String getMemberStateTypeName(int type){

		String result = null;

        switch ( type ){
        	case 0 :
        	    result = "회원";
        	    break;
        	case 1 :
        	    result = "탈퇴신청";
        	    break;
        }

        return result;
    }

	/**
	 * 회원상태 option
	 * @param type int
	 * @return String
	 */
	public static String getMemberStateType(int type){

		StringBuffer result = new StringBuffer();

        for ( int i=0; i<2; i++ ){
            result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getMemberStateTypeName(i)+"</option>");
        }

        return result.toString();

    }

	/**
	 *  Mysql 요일구하기
	 * @param type int
	 * @return STring
	 */
    public static String getYoilName(int type){

		String result = "";

        switch ( type ){
        	case 1 :
        	    result = "일요일";
        	    break;
        	case 2 :
        	    result = "월요일";
        	    break;
			case 3 :
        	    result = "화요일";
        	    break;
			case 4 :
        	    result = "수요일";
        	    break;
			case 5 :
        	    result = "목요일";
        	    break;
			case 6 :
        	    result = "금요일";
        	    break;
			case 7 :
        	    result = "토요일";
        	    break;
        }
        return result;
    }


	/**
	 *   sms 및 메일 수신여부
	 * @param type int
	 * @return STring
	 */
	public static String getReceiveTypeName(int type){

		String result = null;

        switch ( type ){
        	case 1 :
        	    result = "수신";
        	    break;
        	case 0:
        	    result = "수신안함";
        	    break;
        }
        return result;
    }

	/**
	 * sms 및 메일 수신여부 option
	 * @param name String
	 * @param type int
	 * @return String
	 */
	public static String getReceiveSelectType(int type){

			StringBuffer result = new StringBuffer();

			for ( int i=0; i<=1; i++ ){
				result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getReceiveTypeName(i)+"</option>");
			}

			return result.toString();
	}

	/**
	 *  회원 권한
	 * @param type
	 * @return
	 */
	public static String getGradeTypeName(int type){

		String result = null;

        switch ( type ){
        	case 0 :
        	    result = "최상위관리자";
        	    break;
        	case 1 :
        	    result = "1등급지사관리자";
        	    break;
        	case 2 :
        	    result = "2등급지사관리자";
        	    break;
        	case 3 :
        	    result = "3등급지사관리자";
        	    break;
			case 9 :
        	    result = "일반회원";
        	    break;
        }

        return result;
    }

	/**
	 * 회원 관리 조회시 사용되는 함수(지점별게시판여부, 데이터의 권한 값)
	 * @param branch
	 * @param type
	 * @return
	 */
	public static String getMemberGradeType(int branch, int type){

		StringBuffer result = new StringBuffer();

		// 지점별 게시판일때
		if(branch == 1) {

			for ( int i=0; i<4; i++ ){
				result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getGradeTypeName(i)+"</option>");
			}

			result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getGradeTypeName(9)+"</option>");

		// 지점별 게시판이 아닐때
		} else {

			result.append("<option value='0' "+Function.getSelected(0,type)+">"+CodeUtil.getGradeTypeName(0)+"</option>");
			result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getGradeTypeName(9)+"</option>");

		}

        return result.toString();

    }

	/**
	 * 회원 관리 등록, 수정시 사용되는 함수(지점별게시판여부, 로그인사용자의 권한값, 데이터의 권한 값)
	 * @param branch
	 * @param grade
	 * @param type
	 * @return
	 */
	public static String getMemberGradeType(int branch, int grade, int type){

		StringBuffer result = new StringBuffer();

		// 지점별 게시판일때
		if(branch == 1) {

			if(grade > 0) {		// 로그인사용자의 권한값이 최상위관리자가 아닐때

				for ( int i=grade; i<4; i++ ) {
					result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getGradeTypeName(i)+"</option>");
				}

				result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getGradeTypeName(9)+"</option>");

			} else {			// 최상위 관리자 일때

				for ( int i=0; i<4; i++ ){
					result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getGradeTypeName(i)+"</option>");
				}

				result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getGradeTypeName(9)+"</option>");

			}

		// 지점별 게시판이 아닐때
		} else {

			result.append("<option value='0' "+Function.getSelected(0,type)+">"+CodeUtil.getGradeTypeName(0)+"</option>");
			result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getGradeTypeName(9)+"</option>");

		}

        return result.toString();

    }

	/**
	 * 회원분류(type)
	 * @param type
	 * @return
	 */
	public static String getMemberTypeName(int type){

		String result = null;

        switch ( type ){
        	case 0 :
        	    result = "인트라넷관리자";
        	    break;
        	case 1 :
        	    result = "의사";
        	    break;
        	case 2 :
        	    result = "간호사+스텝";
        	    break;
        	case 3 :
        	    result = "간호사";
        	    break;
        	case 4 :
        	    result = "스텝";
        	    break;
        	case 9 :
        	    result = "일반회원";
        	    break;
        }

        return result;
    }

	/**
	 * 회원분류(출력부분)
	 * @param type
	 * @return
	 */
	public static String getMemberType(int type){

		StringBuffer result = new StringBuffer();

        for ( int i=0; i<5; i++ ){
            result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getMemberTypeName(i)+"</option>");
        }

		result.append("<option value='9' "+Function.getSelected(9,type)+">"+CodeUtil.getMemberTypeName(9)+"</option>");

        return result.toString();

    }

	/**
	 * 검색조건분류(type)
	 * @param type
	 * @return String
	 */
	public static String getSearchTypeName(int type){

		String result = null;

		switch ( type ){
		case 0 :
			result = "제목";
			break;
		case 1 :
			result = "작성자";
			break;
		case 2 :
			result = "내용";
			break;
		case 3 :
			result = "제목+작성자+내용";
			break;
		}

		return result;
	}

	/**
	 * 검색조건분류(type)
	 * @param type
	 * @return String
	 */
	public static String getSearchTypeEngName(int type){

		String result = null;

		switch ( type ){
		case 0 :
			result = "title";
			break;
		case 1 :
			result = "name";
			break;
		case 2 :
			result = "contents";
			break;
		case 3 :
			result = "all";
			break;
		}

		return result;
	}

	/**
	 * 검색조건분류(type)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getSearchType(String type){

		StringBuffer result = new StringBuffer();

		for ( int i=0; i<4; i++ ){
			result.append("<option value='"+i+"' "+Function.getSelected(CodeUtil.getSearchTypeEngName(i),type)+">"+CodeUtil.getSearchTypeName(i)+"</option>");
		}

		return result.toString();

	}


	/**
	 * 온오프구분(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getOnoffTypeName(int type){
		String result = "";
        switch ( type ){
        	case 0 :
        	    result = "온라인";
        	    break;
        	case 1:
        	    result = "오프라인";
        	    break;
        }
        return result;
    }

	/**
	 * 온오프구분(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getOnoffType(int type){
		StringBuffer result = new StringBuffer();
		for ( int i=0; i<=1; i++ ){
			result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getOnoffTypeName(i)+"</option>");
		}

		return result.toString();
	}

	/**
	 * SMS 결과
	 * @param code
	 * @return
	 */
	public static String sendingResult(String code){
        String result = null;
        /*
		if ( "0".equals(code) ){
            result = "<font color='BLUE'>성공</font>";
        } else if ( "1".equals(code) ){
            result = "<font color='RED'>실패</font>";
        } else if ( "2".equals(code) ){
            result = "<font color='RED'>번호오류</font>";
        } else {
            result = "<font color='GRAY'>결과수신대기</font>";
        }
        return result;
		*/
		/*
        if ( "0".equals(code) ){
            result = "<font color='BLUE'>성공</font>";
        } else if ( "1".equals(code) ){
            result = "<font color='RED'>실패</font>";
        } else if ( "2".equals(code) ){
            result = "<font color='RED'>번호오류</font>";
        } else if ( "A".equals(code) ){
            result = "<font color='RED'>핸드폰 호 처리중</font>";
        } else if ( "B".equals(code) ){
            result = "<font color='RED'>음영지역</font>";
        } else if ( "C".equals(code) ){
            result = "<font color='RED'>power off</font>";
        } else if ( "D".equals(code) ){
            result = "<font color='RED'>메세지 저장개수 초과</font>";
        } else if ( "a".equals(code) ){
            result = "<font color='RED'>일시 서비스 정지</font>";
        } else if ( "b".equals(code) ){
            result = "<font color='RED'>기타 단말기 문제</font>";
        } else if ( "c".equals(code) ){
            result = "<font color='RED'>착신 거절</font>";
        } else if ( "d".equals(code) ){
            result = "<font color='RED'>기타</font>";
        } else if ( "e".equals(code) ){
            result = "<font color='RED'>이통사 SMC 형식 오류</font>";
        } else if ( "f".equals(code) ){
            result = "<font color='RED'>아이하트 자체 형식 오류</font>";
        } else if ( "g".equals(code) ){
            result = "<font color='RED'>sms 서비스 불가 단말기</font>";
        } else if ( "h".equals(code) ){
            result = "<font color='RED'>핸드폰 호 불가 상태</font>";
        } else if ( "i".equals(code) ){
            result = "<font color='RED'>운영자가 메세지 삭제</font>";
        } else if ( "j".equals(code) ){
            result = "<font color='RED'>이통사 내부 메시지 Que Full</font>";
        } else if ( "k".equals(code) ){
            result = "<font color='RED'>이통사에서 spam 처리</font>";
        } else if ( "l".equals(code) ){
            result = "<font color='RED'>www.nospam.go.kr 에 등록된 번호에 대해 아이하트에서 spam 처리한 건</font>";
        } else if ( "m".equals(code) ){
            result = "<font color='RED'>아이하트에서 Spam 처리한 건</font>";
        } else if ( "n".equals(code) ){
            result = "<font color='RED'>건수제안에 걸린 경우</font>";
        } else if ( "o".equals(code) ){
            result = "<font color='RED'>메시지의 길이가 제안된 길이를 벗어난 경우</font>";
        } else if ( "p".equals(code) ){
            result = "<font color='RED'>폰 번호가 형식에 어긋난 경우</font>";
        } else if ( "q".equals(code) ){
            result = "<font color='RED'>필드 형식이 잘못된 경우 (예:데이터 내용이 없는 경우)</font>";
        } else if ( "x".equals(code) ){
            result = "<font color='RED'>MMS 콘텐트의 정보를 참조할 수 없음</font>";
        } else if ( "z".equals(code) ){
            result = "<font color='RED'>처리 되지 않은 기타오류</font>";
        } else {
            result = "<font color='GRAY'>결과수신대기</font>";
        }
		*/
        if ( "0".equals(code) ){
            result = "<font color='BLUE'>성공</font>";
        } else if ( "1".equals(code) ){
            result = "<font color='RED'>실패</font>";
        } else if ( "2".equals(code) ){
            result = "<font color='RED'>번호오류</font>";
        } else if ( "A".equals(code) ){
            result = "<font color='RED'>호처리중</font>";
        } else if ( "B".equals(code) ){
            result = "<font color='RED'>음영지역</font>";
        } else if ( "C".equals(code) ){
            result = "<font color='RED'>poweroff</font>";
        } else if ( "D".equals(code) ){
            result = "<font color='RED'>메세초과</font>";
        } else if ( "a".equals(code) ){
            result = "<font color='RED'>일시정지</font>";
        } else if ( "b".equals(code) ){
            result = "<font color='RED'>단말문제</font>";
        } else if ( "c".equals(code) ){
            result = "<font color='RED'>착신거절</font>";
        } else if ( "d".equals(code) ){
            result = "<font color='RED'>기타</font>";
        } else if ( "e".equals(code) ){
            result = "<font color='RED'>SMC오류</font>";
        } else if ( "f".equals(code) ){
            result = "<font color='RED'>형식오류</font>";
        } else if ( "g".equals(code) ){
            result = "<font color='RED'>불가단말</font>";
        } else if ( "h".equals(code) ){
            result = "<font color='RED'>호불가</font>";
        } else if ( "i".equals(code) ){
            result = "<font color='RED'>운영삭제</font>";
        } else if ( "j".equals(code) ){
            result = "<font color='RED'>Que Full</font>";
        } else if ( "k".equals(code) ){
            result = "<font color='RED'>spam처리</font>";
        } else if ( "l".equals(code) ){
            result = "<font color='RED'>하트spam</font>";
        } else if ( "m".equals(code) ){
            result = "<font color='RED'>하트Spam2</font>";
        } else if ( "n".equals(code) ){
            result = "<font color='RED'>건수제안</font>";
        } else if ( "o".equals(code) ){
            result = "<font color='RED'>길이오버</font>";
        } else if ( "p".equals(code) ){
            result = "<font color='RED'>번호오류</font>";
        } else if ( "q".equals(code) ){
            result = "<font color='RED'>필드오류</font>";
        } else if ( "x".equals(code) ){
            result = "<font color='RED'>참조오류</font>";
        } else if ( "z".equals(code) ){
            result = "<font color='RED'>기타오류</font>";
        } else {
            result = "<font color='GRAY'>결과수신대기</font>";
        }
        return result;
    }

	/**
	 * 내원경로(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getRouteTypeName(int type){
		String result = null;
        switch ( type ){
        	case 1 :
        	    result = "인터넷";
        	    break;
        	case 2:
        	    result = "간판";
        	    break;
        	case 3:
        	    result = "소개";
        	    break;
			case 4:
        	    result = "현수막/전단지";
        	    break;
			case 5 :
        	    result = "버스";
        	    break;
			case 6 :
        	    result = "지하철";
        	    break;
			case 7 :
        	    result = "신문";
        	    break;
			case 8 :
        	    result = "TV";
        	    break;
			case 9 :
        	    result = "잡지";
        	    break;
			case 10 :
        	    result = "기타";
        	    break;
			default :
				result = "";
				break;
        }
        return result;
    }

	/**
	 * 온오프구분(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getRouteNameType(int type){
		StringBuffer result = new StringBuffer();
		for ( int i=1; i<=10; i++ ){
			result.append("<option value='"+i+"' "+Function.getSelected(i,type)+">"+CodeUtil.getRouteTypeName(i)+"</option>");
		}
		return result.toString();
	}

	/**
	 * 전화요청(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getTelIncipientName(int arg){
        String result = null;
        switch ( arg ){
        	case 1 :
        	    result = "<font color='#0064ff'>요청</font>";
        	    break;
        	case 2 :
        	    result = "<font color='#ff0000'>요청 안함</font>";
        	    break;
			default :
				result = "";
				break;
        }
        return result;
    }
	/**
	 * 전화요청(출력부분)
	 * @param type
	 * @return StringBuffer
	 */
	public static String getTelIncipientType(int arg){
        StringBuffer result = new StringBuffer();
        	result.append("<option style='color:#0064ff' value='"+1+"'"+Function.getSelected(1,arg)+">"+getTelIncipientName(1)+"</option>");
        	result.append("<option style='color:#ff0000' value='"+2+"'"+Function.getSelected(2,arg)+">"+getTelIncipientName(2)+"</option>");
        return result.toString();
    }
	
	
	// 상품 노출여부
	public static String getDisplayName(int display) {
		String result = "";
		if (display == 1) {
			result = "노출";
		} else if (display == 0) {
			result = "숨김";
		}
		return result;
	}
	
	public static String getDisplayOption(int arg){
        StringBuffer result = new StringBuffer();
        	result.append("<option value='0'"+Function.getSelected(0,arg)+">"+getDisplayName(0)+"</option>");
        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDisplayName(1)+"</option>");
        return result.toString();
    }
		
	 // 결제방법
 	public static String getPaymentName(String payment) {
 		String result = "";
 		if ("bank".equals(payment)) {
 			result = "무통장";
 		} else if ("card".equals(payment)) {
 			result = "신용카드";
 		} else if ("chk_bank".equals(payment)){
 			result = "실시간계좌이체";
 		}
 		return result;
 	}

	 public static String getState(int type){
	    String result = null;
	    
	    switch ( type ){
	    	case 1 :
	    	    result = "결제대기";
	    break;
			case 2 :
			    result = "주문완료";
			    break;
			case 3 :
			    result = "상품준비중";
			    break;
			case 4 :
			    result = "배송중";
			    break;
			case 5 :
			    result = "배송완료";
			    break;
			case 6 :
			    result = "반품신청";
			    break;
			case 7 :
			    result = "주문취소";
			    break;
			case 8 :
			    result = "취소완료";
	    	    break;
	    }
	    return result;
	}
	 
	 public static String getDoctorDepartmentName(int department) {
			String result = "";
			if (department == 1) {
				result = "외과";
			} else if (department == 2) {
				result = "내과";
			}else if (department == 3) {
				result = "영상의학과";
			} else if (department == 4) {
				result = "응급중환자센터";
			} else if (department == 5) {
				result = "원무과";
			} 
			return result;
		}
		
		public static String getDoctorDepartmentOption(int arg){
	        StringBuffer result = new StringBuffer();
	        
	        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDoctorDepartmentName(1)+"</option>");
	        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getDoctorDepartmentName(2)+"</option>");
	        	result.append("<option value='3'"+Function.getSelected(3,arg)+">"+getDoctorDepartmentName(3)+"</option>");
	        	result.append("<option value='4'"+Function.getSelected(4,arg)+">"+getDoctorDepartmentName(4)+"</option>");
	        	result.append("<option value='5'"+Function.getSelected(5,arg)+">"+getDoctorDepartmentName(5)+"</option>");
	        return result.toString();
	    }
	 
		 public static String getDoctorPositionName(int department) {
				String result = "";
				if (department == 1) {
					result = "원장";
				} else if (department == 2) {
					result = "수의사";
				}else if (department == 3) {
					result = "테크니션";
				} else if (department == 4) {
					result = "리셉션리스트";
				} 
				return result;
			}
			
			public static String getDoctorPositionOption(int arg){
		        StringBuffer result = new StringBuffer();
		        
		        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDoctorPositionName(1)+"</option>");
		        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getDoctorPositionName(2)+"</option>");
		        	result.append("<option value='3'"+Function.getSelected(3,arg)+">"+getDoctorPositionName(3)+"</option>");
		        	result.append("<option value='4'"+Function.getSelected(4,arg)+">"+getDoctorPositionName(4)+"</option>");
		        return result.toString();
		    }
	 	
			
			 public static String getDoctorGenderName(int gender) {
					String result = "";
					if (gender == 1) {
						result = "여";
					} else if (gender == 2) {
						result = "남";
					} 
					return result;
				}
				
				public static String getDoctorGenderOption(int arg){
			        StringBuffer result = new StringBuffer();
			        
			        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDoctorGenderName(1)+"</option>");
			        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getDoctorGenderName(2)+"</option>");
			        return result.toString();
			    }
				
				
				public static String getDoctorCategoryName(int category) {
					String result = "";
					if (category == 1) {
						result = "이름";
					} else if (category == 2) {
						result = "연락처";
					}
					return result;
				}
				
						
				public static String getDoctorCategoryOption(int arg){
			        StringBuffer result = new StringBuffer();
			        
			        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDoctorCategoryName(1)+"</option>");
			        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getDoctorCategoryName(2)+"</option>");
			        return result.toString();
			    }
				
				
				public static String getDoctorScheduleName(int time) {
					String result = "";
					if (time == 1) {
						result = "9:00";
					} else if (time == 2) {
						result = "9:30";
					} else if (time == 3) {
						result = "10:00";
					} else if (time == 4) {
						result = "10:30";
					} else if (time == 5) {
						result = "11:00";
					} else if (time == 6) {
						result = "11:30";
					} else if (time == 7) {
						result = "12:00";
					} else if (time == 8) {
						result = "12:30";
					} else if (time == 9) {
						result = "13:00";
					} else if (time == 10) {
						result = "13:30";
					} else if (time == 11) {
						result = "14:00";
					} else if (time == 12) {
						result = "14:30";
					} else if (time == 13) {
						result = "15:00";
					} else if (time == 14) {
						result = "15:30";
					} else if (time == 15) {
						result = "16:00";
					} else if (time == 16) {
						result = "16:30";
					} else if (time == 17) {
						result = "17:00";
					} else if (time == 18) {
						result = "17:30";
					} else if (time == 19) {
						result = "18:00";
					} else if (time == 20) {
						result = "18:30";
					} else if (time == 21) {
						result = "19:00";
					} else if (time == 22) {
						result = "19:30";
					} else if (time == 23) {
						result = "20:00";
					} else if (time == 24) {
						result = "20:30";
					} else if (time == 25) {
						result = "21:00";
					} 
					return result;
				}
				
				public static String getDoctorScheduleOption(int arg){
			        StringBuffer result = new StringBuffer();
			        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getDoctorScheduleName(1)+"</option>");
			        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getDoctorScheduleName(2)+"</option>");
			        	result.append("<option value='3'"+Function.getSelected(3,arg)+">"+getDoctorScheduleName(3)+"</option>");
			        	result.append("<option value='4'"+Function.getSelected(4,arg)+">"+getDoctorScheduleName(4)+"</option>");
			        	result.append("<option value='5'"+Function.getSelected(5,arg)+">"+getDoctorScheduleName(5)+"</option>");
			        	result.append("<option value='6'"+Function.getSelected(6,arg)+">"+getDoctorScheduleName(6)+"</option>");
			        	result.append("<option value='7'"+Function.getSelected(7,arg)+">"+getDoctorScheduleName(7)+"</option>");
			        	result.append("<option value='8'"+Function.getSelected(8,arg)+">"+getDoctorScheduleName(8)+"</option>");
			        	result.append("<option value='9'"+Function.getSelected(9,arg)+">"+getDoctorScheduleName(9)+"</option>");
			        	result.append("<option value='10'"+Function.getSelected(10,arg)+">"+getDoctorScheduleName(10)+"</option>");
			        	result.append("<option value='11'"+Function.getSelected(11,arg)+">"+getDoctorScheduleName(11)+"</option>");
			        	result.append("<option value='12'"+Function.getSelected(12,arg)+">"+getDoctorScheduleName(12)+"</option>");
			        	result.append("<option value='13'"+Function.getSelected(13,arg)+">"+getDoctorScheduleName(13)+"</option>");
			        	result.append("<option value='14'"+Function.getSelected(14,arg)+">"+getDoctorScheduleName(14)+"</option>");
			        	result.append("<option value='15'"+Function.getSelected(15,arg)+">"+getDoctorScheduleName(15)+"</option>");
			        	result.append("<option value='16'"+Function.getSelected(16,arg)+">"+getDoctorScheduleName(16)+"</option>");
			        	result.append("<option value='17'"+Function.getSelected(17,arg)+">"+getDoctorScheduleName(17)+"</option>");
			        	result.append("<option value='18'"+Function.getSelected(18,arg)+">"+getDoctorScheduleName(18)+"</option>");
			        	result.append("<option value='19'"+Function.getSelected(19,arg)+">"+getDoctorScheduleName(19)+"</option>");
			        	result.append("<option value='20'"+Function.getSelected(20,arg)+">"+getDoctorScheduleName(20)+"</option>");
			        	result.append("<option value='21'"+Function.getSelected(21,arg)+">"+getDoctorScheduleName(21)+"</option>");
			        	result.append("<option value='22'"+Function.getSelected(22,arg)+">"+getDoctorScheduleName(22)+"</option>");
			        	result.append("<option value='23'"+Function.getSelected(23,arg)+">"+getDoctorScheduleName(23)+"</option>");
			        	result.append("<option value='24'"+Function.getSelected(24,arg)+">"+getDoctorScheduleName(24)+"</option>");
			        	result.append("<option value='25'"+Function.getSelected(25,arg)+">"+getDoctorScheduleName(25)+"</option>");
			        return result.toString();
			    }
				
				public static String getDoctorScheduleOptionForReserve(int arg, int start, int end, ArrayList<ReserveVO> timeList) throws Exception{
					int[] res_hour = new int[timeList.size()];
					String[] res_date = new String[timeList.size()];
					for (int i=0; i<timeList.size(); i++) {
						res_hour[i] = timeList.get(i).getRes_hour();
						res_date[i] = timeList.get(i).getRes_date();
					}
			        StringBuffer result = new StringBuffer();
			        for (int i=start; i<=end; i++) {
			        	if (Arrays.binarySearch(res_hour, i) < 0 || arg == i ) {
			        		result.append("<option value='"+i+"'"+Function.getSelected(i,arg)+">"+getDoctorScheduleName(i)+"</option>");
			        	}
			        	
			        }
			        return result.toString();
			    }
				
				public static String getReserveRouteOption(int arg){
			        StringBuffer result = new StringBuffer();
			        
			        	result.append("<option value='1'"+Function.getSelected(1,arg)+">"+getReserveRouteName(1)+"</option>");
			        	result.append("<option value='2'"+Function.getSelected(2,arg)+">"+getReserveRouteName(2)+"</option>");
			        return result.toString();
			    }
				
				public static String getReserveRouteName(int route) {
					String result = "";
					if (route == 1) {
						result = "온라인";
					} else if (route == 2) {
						result = "오프라인";
					}
					return result;
				}
				

}
