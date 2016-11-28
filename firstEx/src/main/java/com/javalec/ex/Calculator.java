package com.javalec.ex;

public class Calculator {
	public void add(int f, int s) {
		System.out.println("add");
		System.out.println(f+" + "+s+" = "+(f+s));
	}
	
	public void sub(int f, int s) {
		System.out.println("sub");
		System.out.println(f+" - "+s +" = "+(f-s));
	}
	
	public void mult(int f, int s) {
		System.out.println("mult");
		System.out.println(f+" X "+s +" = "+(f*s));
	}
	
	public void div(int f, int s) {
		System.out.println("div");
		System.out.println(f+" / "+s +" = "+(f/s));
	}
}
