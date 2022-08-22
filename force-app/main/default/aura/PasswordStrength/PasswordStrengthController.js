({
    checkPasswordStrength : function(component, helper) {
         
        //Get password
        var password = component.get("v.password");
         
        //Password strength
        let strength = {
            1: 'Very Weak',
            2: 'Weak',
            3: 'Medium',
            4: 'Strong',
            5: 'Very Strong'
        };
         
        //Password Strength Check
        let strengthValue = {
            'caps': false,
            'length': false,
            'special': false,
            'numbers': false,
            'small': false
        };
         
        //Password strength styles
        let passwordStrengthStyle = {
            0: 'slds-theme--error',
            1: 'slds-theme--error',
            2: 'slds-theme--warning',
            3: 'slds-theme--info',
            4: 'slds-theme--alt-inverse',
            5: 'slds-theme--success'
        };
         
        //Check Password Length
        if(password.length >= 8) {
            strengthValue.length = true;
        }
         
        //Calculate Password Strength
        for(let index=0; index < password.length; index++) {
            let char = password.charCodeAt(index);
            if(!strengthValue.caps && char >= 65 && char <= 90) {
                strengthValue.caps = true;
            } else if(!strengthValue.numbers && char >=48 && char <= 57){
                strengthValue.numbers = true;
            } else if(!strengthValue.small && char >=97 && char <= 122){
                strengthValue.small = true;
            } else if(!strengthValue.numbers && char >=48 && char <= 57){
                strengthValue.numbers = true;
            } else if(!strengthValue.special && (char >=33 && char <= 47) || (char >=58 && char <= 64)) {
                strengthValue.special = true;
            }
        }
         
        let strengthIndicator = 0;
        for(let metric in strengthValue) {
            if(strengthValue[metric] === true) {
                strengthIndicator++;
            }
        }
         
        //get badge
        var psBadge = component.find('psBadge');
          
        //Remove style
        for(let strengthStyle in passwordStrengthStyle) {
            $A.util.removeClass(psBadge, passwordStrengthStyle[strengthStyle]);
        }
         
        //Add style
        $A.util.addClass(psBadge, passwordStrengthStyle[strengthIndicator]);
         
        //set password strength
        component.set("v.passwordStrength", strength[strengthIndicator]);
    }
})