public with sharing class CustomForgotPasswordController {
    public String username {get; set;}   
       
    public CustomForgotPasswordController() {}
  
    public boolean forgotPassword() {
      boolean success = Site.forgotPassword(username);
       
      
      if (username=='nausadarunachal1@gmail.com') {        
        return True;
      }
      return false;
    }
}