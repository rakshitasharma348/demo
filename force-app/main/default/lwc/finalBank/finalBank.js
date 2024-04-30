import { LightningElement } from 'lwc';
import IMAGES from "@salesforce/resourceUrl/bankAssets";

export default class FinalBank extends LightningElement {
bankBanner = IMAGES + '/bankAssets/bankBanner.png';
bankMap = IMAGES + '/bankAssets/bankMap.jpg';
loginModal =false;

   get getBannnerBackgroundImage(){
        return `background-image:url("${this.bankBanner}")`;
    }
       get getMapBackgroundImage(){
        return `background-image:url("${this.bankMap}")`;
    }
    handleLoginClick(){
        this.loginModal=true;
    }
    hideModalBox(){
         this.loginModal=false;
    }
    callChildComponent(){
        this.template.querySelector('c-bank-account-form')
    }
    
}