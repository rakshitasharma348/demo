import { LightningElement } from 'lwc';
import lstAccount from '@salesforce/apex/AccountSearchClass.searchAccount' ;


const colums = [
    {label : 'Account Name', fieldName: 'Name'},
    {label: 'Phone',fieldName : 'Phone' },
    {label : 'Type', fieldName: 'Type'},
]

export default class Listview extends LightningElement {
    columns=colums;
    searchKey='';
    accounts;
    error;
    handleOnChange(event){
      this.searchKey= event.target.value;  
    }

    handleButtononClick(){
        lstAccount({KeyWord : this.searchKey})
        .then(result =>{
            this.accounts = result;
        })
        .catch(error =>{
            this.error= error;
        })
    }


    
}