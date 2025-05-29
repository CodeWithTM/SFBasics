import { LightningElement } from 'lwc';

export default class EventDatePicker1 extends LightningElement {
    greeting = 'World';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}