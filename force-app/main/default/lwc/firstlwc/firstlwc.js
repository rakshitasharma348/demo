import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { updateRecord } from 'lightning/uiRecordApi';

export default class CreateContactRecordPage extends LightningElement {
    @api recordId;
    accountId;
    contactName = '';
    isPrimary = false;

    handleContactNameChange(event) {
        this.contactName = event.target.value;
    }

    handlePrimaryCheckbox(event){
      this.isPrimary=event.target.checked;

    }

    handleAddContact() {
        const fields = {};
        fields.LastName = this.contactName;
        fields.AccountId = this.recordId;
        fields.Is_Primary__c = this.isPrimary;
        const recordInput = { apiName: 'Contact', fields };
        createRecord(recordInput)
            .then(contact => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created successfully',
                        variant: 'success',
                    }),
                );
                this.contactName = '';
                this.isPrimary = false;
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }

    handleSuccess(event) {
        if(this.isPrimary) {
            this.makeExistingContactsNonPrimary();
        }
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contact created successfully',
                variant: 'success',
            }),
        );
    }

   
}