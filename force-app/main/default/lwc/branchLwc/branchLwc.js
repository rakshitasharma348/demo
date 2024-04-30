import { LightningElement, track } from 'lwc';
import createCustomer from '@salesforce/apex/CustomerController.createCustomer';

export default class BranchLwc extends LightningElement {
    @track selectedAccountType = '';
    @track customerName = '';
    @track accountNumber = '';
    @track aadharNumber = '';
    @track panNumber = '';
    @track creditCardNumber = '';

    get accountTypeOptions(){
        return[
            { label: 'Saving Account', value: 'Saving Account' },
            { label: 'Current Account', value: 'Current Account' },
            { label: 'Credit Card', value: 'Credit Card' }
        ];
    }

    get showSavingAccountForm(){
        return this.selectedAccountType ==='Saving Account';
    }
    get showCurrentAccountForm(){
        return this.selectedAccountType==='Current Account';
    }

    get showCreditCardForm(){
        return this.selectedAccountType==='Credit Card';
    }

    handleAccountTypeChange(event){
        this.selectedAccountType= event.detail.value;
    }
    handleInputChange(event) {
        const fieldName = event.target.label.toLowerCase().replace(/\s/g, '');
        this[fieldName] = event.target.value;
    }
    createCustomer(){
        let customerData = {};
        if(this.selectedAccountType==='Saving Account'){
         customerData = {
            AccountType: 'Saving Account',
            CustomerName: this.customerName,
            AccountNumber: this.accountNumber,
            AadharNumber: this.aadharNumber
         };
        }
        else if (this.selectedAccountType === 'Current Account') {
            customerData = {
                AccountType: 'Current Account',
                CustomerName: this.customerName,
                PANNumber: this.panNumber,
                AccountNumber: this.accountNumber
            };
        } else if (this.selectedAccountType === 'Credit Card') {
            customerData = {
                AccountType: 'Credit Card',
                CustomerName: this.customerName,
                CreditCardNumber: this.creditCardNumber
            };
        }

        
        createCustomer({ customerData: JSON.stringify(customerData) })
            .then(result => {
                // Handle success
                console.log('Customer created:', result);
                // Reset form fields
                this.resetForm();
            })
            .catch(error => {
                // Handle error
                console.error('Error creating customer:', error);
            });
    }

    resetForm() {
        this.selectedAccountType = '';
        this.customerName = '';
        this.accountNumber = '';
        this.aadharNumber = '';
        this.panNumber = '';
        this.creditCardNumber = '';
    }
}