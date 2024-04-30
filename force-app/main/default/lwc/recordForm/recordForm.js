import { LightningElement, api } from 'lwc';

export default class RecordForm extends LightningElement {
    handleSuccess(event) {
        // this.accountId = event.detail.id;
        console.log('handleSuccess')
        console.log(event.detail.id)


    }
    handleError(event) {
        console.log("handleError event");
        console.log(JSON.stringify(event.detail));
    }
}