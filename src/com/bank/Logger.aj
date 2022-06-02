package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	    
	File file = new File("src/log.txt");
    Calendar cal = Calendar.getInstance();
    private FileWriter a;
    
	pointcut successC() : call(* create*(..) );
	    after() : successC() {
	    	String mensaje  = "**** Usuario creado ****   -" + cal.getTime();
	    	System.out.println(mensaje);
	    	writeLog(mensaje,file);
	    }
	    
	    pointcut successT() : call(* moneyMakeTransaction*(..) );
	    after() : successT() { 
	    	String mensaje  = "**** Transaccion exitosa ****   -" + cal.getTime();
	    	System.out.println(mensaje);
	    	writeLog(mensaje,file);
	    }
	    
	    pointcut successR() : call(* moneyWithdrawal*(..) );
	    after() : successR() { 
	    	String mensaje  = "**** Retiro exitoso ****   -" + cal.getTime();
	    	System.out.println(mensaje);
	    	writeLog(mensaje,file);
	    }
	    
	    private void writeLog(String m, File file) {
	    	try {
	    		a = new FileWriter(file,true);
	    		a.write(m+"\n");
	    		a.close();
	    	}catch(IOException e) {
	    		e.printStackTrace();
	    	}
	    }
}
