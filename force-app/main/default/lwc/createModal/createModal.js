import { LightningElement } from 'lwc';


export default class CreateModal extends LightningElement {
    handleOkay(){
        this.close("okay");
    }
}