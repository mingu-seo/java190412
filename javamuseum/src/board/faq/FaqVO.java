package board.faq;

import util.Parameter;

public class FaqVO extends Parameter{
	
	private int no;
	private String question;
	private String answer;

	
	public FaqVO() {
		super.setPageRows(10);
		
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	
	

	
	
}
