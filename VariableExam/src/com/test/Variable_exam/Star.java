package com.test.Variable_exam;

import java.util.Scanner;

public class Star {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        while(true)
        {
        	System.out.println("숫자를 입력해 주세요.");
        int input= s.nextInt();
        switch(input){
        case 1:
        	for(int i=0; i<5; i++)
        	{
        		for(int j=0; j<=i; j++)
        		{
        		System.out.print("*");
        		}
        		System.out.println("");//done
        	}
        	break;
        case 2:
        	int temp=0;
          	for(int i=5; i>0; i--)
        	{
        		for(int j=i; j>0; j--)
        		{
        		System.out.print(" ");
        	
        		}
        		temp=i;
        		for(int k=0; k<=5-temp; k++)
        		{
        		System.out.print("*");
        		
        		}
        		System.out.println("");
        		
        		//not done
        	}
        	break;
        case 3:
       
          	for(int i=0; i<5; i++)
        	{
          		
        		for(int j=5; j>i; j--)
        		{
        		System.out.print("*");
        		}
        		System.out.println("");
        		
        		for(int k=0; k<i+1; k++)
        		{
        		System.out.print(" ");
        		}
        		//not done
        	}
        	break;
        case 4:
         	for(int i=6; i>0; i--)
        	{
          		
        		for(int j=1; j<i; j++)
        		{
        		System.out.print("*");
        		}
        		System.out.println("");
        		//not done
        	}
            break;
            
        }
        System.out.println("계속 하시겠습니까?(Y/N)");
        char check=s.next().charAt(0);
        if(check=='y' ){
        	System.out.println("재시작.");
        	continue;
        }
        else
        {
        	System.out.println("종료.");
        	break;
        }/**/
       }
     }
   }

    