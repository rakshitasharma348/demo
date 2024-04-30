import { LightningElement, track } from 'lwc';
// import MyCustomCss from '@salesforce/resourceUrl/MyCustomCss';
// import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

import createContact from '@salesforce/apex/ApplicationBankFormController.createContact';
 



//  const radioOptionsList = [
//     { label: 'From individual classrooms', value: 'From individual classrooms' },
//     { label: 'All together in MPR/Auditorium', value: 'All together in MPR/Auditorium' }
// ];
const picklist2=[
    { label: 'Fixed Deposit', value: 'Fixed Deposit' },
    { label: 'Saving Account', value: 'Saving Account' },
    
];
 const checkBoxOptions=[
    { label:'20', value: '20' },
    { label:'40', value: '40' }
];
export default class BankAccountForm extends LightningElement {
    
    template2=true;
   @track optionPicklist = picklist2;
    // radioButtonOptions=radioOptionsList;
    // signingPicklist= picklist2;
    // url='Meeting_Link__c';
    

    mapObjects = [
        { heading: "Email", type: "email" ,api:'Email',maxLength:'255', pattern:"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",message: ""},
        { heading: "Your Name", type: "text",api: 'Name',maxLength:'255',pattern: "^([^0-9]*)$",message: "Numbers are not allowed"},        
        { heading: "Your Phone Number", type: "text",api:'Phone',maxLength:'10',pattern: "[0-9]{10}" ,message: ""},
        { heading: "Address", type: "text",api:'Address',maxLength:'255',pattern: "^[a-zA-Z0-9_.-]*$",message: "" },
        { heading: "Amount", type: "number",api:'TotalAmount',maxLength:'18',pattern: "[0-9,]+",message: ""}, ];



    @track checkboxOptionslist=checkBoxOptions;   
    @track checkboxGroupValue =[ ];
    @track contactDetail={ };
   
    // connectedCallback() {
    //     Promise.all([
    //         loadStyle(this, MyCustomCss)
    //     ])
    //     .then(() => {
    //         console.log("All CSS are loaded.");
    //     })
    //     .catch(error => {
    //         console.log("failed to load the style");
    //     });
       
    // }  
handleInputChange(event) {
    let fieldName = event.target.name; 
    let fieldValue = event.target.value; 
    
    console.log('fieldName'+fieldName);
    console.log('fieldValue'+fieldValue);
    this.contactDetail[fieldName]  = fieldValue;
    console.log('contactDetail Object in json form'+  JSON.stringify(this.contactDetail));   
}  
onSubmit(event) {
    let isError = this.validateFields();
    console.log('## Error ## ' + isError);
    if(!isError) {
         console.log('Inside if'+JSON.stringify(this.contactDetail));
        createContact({data: JSON.stringify(this.contactDetail)}) 
      .then((result) => {
          console.log('#####');
        this.contacts = result;
      })
      .catch((error) => {
        this.error = error;
        console.log('#####', error);

      }); 
    this.template2=false;
    }
}
validateFields() {
    let isValid = false;
    let inputFields = this.template.querySelectorAll('.validate');
    console.log('inputFields'+inputFields);
    try{
    inputFields.forEach(inputField => {
        if(!inputField.checkValidity()) {
            // console.warn(inputField);
            inputField.reportValidity();
            
            isValid = true;
        }
    });
    return isValid;
}
catch(e){
    console.error('errormessage '+e.message);   
    }
}
onclear(event){
    this.template.querySelectorAll("lightning-input").forEach(element => {
           element.value = '';
        }); 
   } 

 }