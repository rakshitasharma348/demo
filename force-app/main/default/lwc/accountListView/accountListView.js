import { LightningElement, track, wire } from 'lwc';
import showListOfAccounts from '@salesforce/apex/ObjectDetails.showListOfAccounts';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';
const columns = [
    {label: 'Name', fieldName:'Name', editable:'True'},
    {label: 'Account Site', fieldName:'Site', editable:'True'},
    {label: 'Phone', fieldName:'Phone',type:'phone' ,editable:'True'} ,
    {label: 'Email', fieldName:'Email__c', type:'email', editable:'True'},
];

export default class AccountListView extends LightningElement {
    error;
    columns = columns;
    @track accountObj;
    fldsItemValues = [];


@wire(showListOfAccounts)
cons(result){
    this.accountObj= result;
    if(result.error) {
        this.accountObj = undefined;
    }
};
handleSave(event){
    this.fldsItemValues = event.detail.draftValues;
    const inputsItems = this.fldsItemValues.slice().map(draft =>{
        const fields = Object.assign({}, draft);
        return{ fields};
    });

    const promises = inputsItems.map(recordInput => updateRecord(recordInput));
    promise.all(promises).then(res =>{
        this.dispatchEvent(  new ShowToastEvent({
            title:'Success',
            message: ' Record Updated Successfully',
            variant:'success'
        }))
        this.fldsItemValues = [];
        return this.refresh();
    })
    .catch(error =>{
        this.dispatchEvent(
            new ShowToastEvent({
            title:'Error',
            message:'An Error Occured',
            variant: 'error'
        }))
            
            
        
    })


}
}