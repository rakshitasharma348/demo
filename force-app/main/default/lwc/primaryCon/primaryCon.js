import { LightningElement, api } from 'lwc';
import createContact from '@salesforce/apex/ContactController.createContact';

export default class PrimaryCon  extends LightningElement {
    @api recordId;
    firstName;
    lastName;
    isPrimary = false;

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
        console.log('FirstName',this.firstName);
    }

    handleLastNameChange(event) {
         this.lastName = event.target.value; 
         console.log('lastName',this.lastName);
    }

    handleIsPrimaryChange(event) {
        this.isPrimary = event.target.checked;
        console.log(this.isPrimary);
     }

     createContact() {
         createContact({ accountId: this.recordId, firstName: this.firstName, lastName: this.lastName, isPrimary: this.isPrimary })
           .then(result => {
                 console.log('Contact created successfully:', result);
        })
            .catch(error => {

               console.error('Error creating contact:', error);
           });
    }
}