import { api, LightningElement } from 'lwc';

export default class Childlwc extends LightningElement {

    @api childTitle;

    constructor(){
        super();
        console.log('Child constructor..')
    }

    connectedCallback(){
        this.childTitle = 'This is coming from child component..';
        console.log('Child callback..');
    }
}