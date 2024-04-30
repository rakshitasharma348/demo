import { LightningElement ,api, track} from 'lwc';
import getData from '@salesforce/apex/FinalController.getData';

export default class FinalExamLWC extends LightningElement {

    @api apiName='';
    @api realtionShipField='';
    @api  fieldApiNAme='';
    @api filter='';
    @api recordId='';
    @track dataobj=[];
    columns=[];
    columnsList=[];

    connectedCallback() {
            
                this.columns = this.fieldApiNAme.split(",");
            
            this.columnsList=this.columns.map(columns =>({
                label: columns,
                fieldName: columns 
            }));

            getData({queryString: this.fieldApiNAme ,objectApiName:this.apiName , accId :this.recordId , relationshipfield:this.realtionShipField,Condition:this.filter}).then((result)=>{
                this.dataobj=result;
                console.log( 'Successful',result)
                
              }).catch((error)=>{
                console.log('data error');
                console.log(error)
              })
        }
       
    
    }