import { LightningElement,api } from 'lwc';

export default class ApiDecorator extends LightningElement {
    message='Public -Property';
    @api recordId;
}