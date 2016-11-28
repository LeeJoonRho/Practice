package com.javalec.ex;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
		/*
		MyCalculator cal=new MyCalculator();
		cal.setCalculator(new Calculator());
		
		cal.setFirstNum(10);
		cal.setSecondNum(2);
		
		cal.add();
		cal.sub();
		cal.mult();
		cal.div();
		*/
		
		String configLocation = "classpath:applicationCTX.xml";	//이부분 에러, classpath(환경변수 설정 안해서 인듯함.)
		AbstractApplicationContext ctx=new GenericXmlApplicationContext(configLocation);
		MyCalculator myCalculator = ctx.getBean("myCalculator", MyCalculator.class);
		
		myCalculator.add();
		myCalculator.sub();
		myCalculator.mult();
		myCalculator.div();
	}	
}
