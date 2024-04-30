import { LightningElement } from 'lwc';
const columns = [
    { label: 'Date', fieldName: 'Date__c',type: 'date'},
    { label: 'Project Name', fieldName: 'Project_Name__c',type: 'text'},
    { label: 'Hours', fieldName: 'Hours__c',type: 'number'},
    { label: 'Status', fieldName: 'Status__c',type: 'picklist'},
    { label: 'Description', fieldName: 'Description__c',type: 'text'}
     
];



export default class MyApp extends LightningElement {
    timeSheetData = [];
    columns= columns;
  isModalOpen = false;
  OpenModalHandle(){
 this.isModalOpen = true;
  
  }

  closeModalHandle(){
    this.isModalOpen=false;
  }
   
}