import { LightningElement,track} from 'lwc';
import createObject from '@salesforce/apex/MetaDataServiceHandler.createObject';
import generateTextField from '@salesforce/apex/FieldController.generateTextField';

    

export default class CreateObj extends LightningElement {
    
         objectName = '';
         objectApiName = '';
         objectPlural = '';
         showFields =true;


         @track fieldAPIName = '';
         @track fieldDescription = '';
         @track fieldLabel = '';

         @track fields = [{ key: 0, input1: '', input2: '', input3: '' }];
    
        handleObjectNameChange(event) {
            this.objectName = event.target.value;
        }
    
        handleObjectApiNameChange(event) {
            this.objectApiName = event.target.value;
        }
    
        handleObjectPluralChange(event) {
            this.objectPlural = event.target.value;
        }
    
        handleCreateObject() {
            createObject({ objectName: this.objectName, objectAPI: this.objectApiName, objectPlural: this.objectPlural })
                .then(result => {
                    
                    console.log('Custom object created successfully.',result);
                    this.showFields=false;
                })
                .catch(error => {
                
                    console.error('Error creating custom object: ', error);
                });
            
        }
        handleFieldAPINameChange(event) {
            this.fieldAPIName = event.target.value;
        }
        handleFieldDescriptionChange(event) {
            this.fieldDescription = event.target.value;
        }
        handleFieldLabelChange(event) {
            this.fieldLabel = event.target.value;
        }
        handleCreateField() {
        generateTextField({
            objectAPIName: this.objectApiName,
            fieldAPIName: this.fieldAPIName,
            fieldDescription: this.fieldDescription,
            fieldLabel: this.fieldLabel
        })
            .then(result => {
                
                console.log('Custom field created successfully:', result);
            })
            .catch(error => {
                
                console.error('Error creating custom field:', error);
            });
        }

        handleInputChange(event) {
            const { index } = event.target.dataset;
            const fieldIndex = parseInt(index, 10);
            const { name, value } = event.target;
            this.fields[fieldIndex] = { ...this.fields[fieldIndex], [name]: value };
            this.fields = [...this.fields];
        }
    
        handleAddFields() {
            const newKey = this.fields[this.fields.length - 1].key + 1;
            const newField = { key: newKey, input1: '', input2: '', input3: '' };
            this.fields = [...this.fields, newField];
        }
    
    }