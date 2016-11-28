package com.javalec.ex;

public class MyCalculator {
	Calculator calculator;
	private int firstNum;
	private int secondNum;
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}

	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}
	
	public MyCalculator() {
		
	}
	
	public void add() {
		calculator.add(firstNum,secondNum);
	}
	
	public void sub() {
		calculator.sub(firstNum,secondNum);
	}
	public void mult() {
		calculator.mult(firstNum,secondNum);
	}
	
	public void div() {
		calculator.div(firstNum,secondNum);
	}
	
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
}
