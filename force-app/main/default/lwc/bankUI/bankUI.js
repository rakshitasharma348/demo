import { LightningElement } from 'lwc';
import { api } from 'lwc';
import LightningModal from 'lightning/modal';

export default class BankUI extends LightningElement {
    @api content;

    handleOkay() {
        this.close('okay');
    }
}