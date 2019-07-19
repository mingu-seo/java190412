package property;

public class SiteProperty {
	/*
	 * �⺻����
	 */
	/**
	 * ��ü��
	 */
	public static final String 	COMPANY_NAME			= "SPRING";
	/**
	 * ������ ����������
	 */
	public static final String	INDEX_PAGE				= "/manage/admin/index.do";
	/**
	 * ���ȼ���������(SSL)��뿩��
	 */
	public static final boolean	SSL_USE					= false;
	/**
	 * URL http
	 */
	public static final String 	COMPANY_URL				= "http://localhost:8080";
//	public static final String 	COMPANY_URL_MO			= "http://m.bigbang";

	/**
	 * URL https SSL
	 */
	public static final String 	COMPANY_SSL_URL			= "https://localhost:8080";
	public static final String 	COMPANY_SSL_URL_MO		= "https://localhost:8080";
	
	/**
	 * JSP ���ϰ����ġ
	 */
	public static final String	JSP_HOME				= "/WEB-INF/view";

	/**
	 * mysql ��й�ȣ ��ȣȭ ���
	 * password, old_password, md5, sha
	 */
	public static final String	DB_ENCRYPTION			= "password";
	/**
	 * ��ǥ �̸���
	 */
	public static final String 	COMPANY_EMAIL			= "withsky999@gmail.com";

	/*
	 * ���ϰ���
	 */
	/**
	 * ���ϼ���
	 */
	public static final String 	SMTP_HOST				= "mail.";
	/**
	 * ���ϰ��� ���̵�
	 */
	public static final String 	SMTP_USER				= "";
	/**
	 * ���ϰ��� �н�����
	 */
	public static final String 	SMTP_PASSWORD			= "";
	/**
	 * �̸��� �⺻ ��
	 */
	public static final String 	EMAIL_FORM				= "/include/emailForm.jsp";

	/**
	 * ������ �̹��� ���ε� ���
	 */
	public static final String	EDITOR_UPLOAD_PATH		= "/upload/editor/";

	/**
	 * ������ �̹��� ���ε� �뷮����
	 */
	public static final int		EDITOR_MAXSIZE 			= 10*1024*1024;

	/**
	 * ó�������� (process.jsp)���� ���۷�(������������) �񱳿���
	 */
	public static final boolean	CHECK_REFERER			= true;

	public static final String	REFERER_URL				= "localhost";

	public static boolean getCHECK_REFERER(){
		return CHECK_REFERER;
	}
	
	public static String getREFERER_URL(){
		return REFERER_URL;
	}
	
	// ���Ͼ��ε� ���
	/**
	 * ���� Ȩ���丮��� (�Ǽ��� ���� �ʿ�)
	 */

	public static final String REAL_PATH = "C:\\java\\git\\java190412\\portfoliohotel\\WebContent";
	


	/**

	 * �������� ÷������ ���
=======
	 * 객실 사진 경로

	 */

	public static final String NOTICE_UPLOAD_PATH		= "/upload/notice/";
	
	public static final String DINING_UPLOAD_PATH		= "/upload/dining/";

	public static final String ROOM_UPLOAD_PATH         = "/upload/room/";
	
	/**
	 * 객실 옵션 사진 경로
	 */
	public static final String ROOM_OPT_UPLOAD_PATH = "/upload/room_opt/";
	
	
	public static final String QNA_UPLOAD_PATH = "/upload/qna/";

}
