/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Donate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author LE ANH TUAN
 */
@Getter
@Setter
@ToString
public class DonateVO extends Donate {
    private String name;
    private String programName;
    private int userId;
    private String isProgramClosed;
    private String avatar;
    private String email;

    public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
    }
    
     public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message, String name) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
        this.name=name;
    }
     
     public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message, String name, int userId) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
        this.name=name;
        this.userId = userId;
    }
     
      public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message,String name, String programName) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
        this.name=name;
        this.programName=programName;
    }
      
      public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message,String name, String programName, String isProgramClosed) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
        this.name=name;
        this.programName=programName;
        this.isProgramClosed = isProgramClosed;
    }
    public DonateVO(int donate_id, int user_id, int program_id, double amount, String donate_date, String message,String name, String avatar, String email, String programName) {
        super(donate_id, user_id, program_id, amount, donate_date, message);
        this.name=name;
        this.programName=programName;
        this.avatar=avatar;
        this.email=email;
    }
}
