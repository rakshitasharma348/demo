import { LightningElement,api } from 'lwc';
import findrelation from '@salesforce/apex/findRelationship.findrelation'
import getData from '@salesforce/apex/findRelationship.getData'

export default class AabraKaDabra extends LightningElement {

  @api objectApiName
  @api realtionShipField ='';
  @api fieldApiName='';
    data=[];
    columnsList;
    queryString='';
    connectedCallback(){
        findrelation({objectApiName:this.objectApiName,realtionShipField:this.realtionShipField})
      .then((result) => {
        console.log(result)
        this.columnsList=
        this.columnsList =  fieldApiName.map(column => ({
            label: column,
            fieldName: column
        }));
        result.forEach((element, index) => {
            this.queryString += element;
            if (index < result.length - 1) {
                this.queryString += ',';
            }
        });
        
        // this.queryString=this.queryString.slice(0, -1);
        getData({queryString: this.queryString ,objectApiName:this.objectApiName}).then((result)=>{
          console.log('data result')
          console.log(result)
          this.data=result;
        }).catch((error)=>{
          console.log('data error');
          console.log(error)
        })
      })
      .catch((error) => {
        console.log('column error')
        console.log(error)
      });
    }
}