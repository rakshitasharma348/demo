import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    greeting='Rakshita';
    handleChange(event){
        this.greeting= event.target.value; 
    }
}