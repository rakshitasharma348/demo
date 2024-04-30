import { LightningElement, track } from 'lwc';

export default class CreateDynamicFields extends LightningElement {
    
        @track fields = [{ key: 0, input1: '', input2: '', input3: '' }];
    
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