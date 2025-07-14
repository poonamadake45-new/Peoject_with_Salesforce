import { LightningElement } from 'lwc';
export default class LeaveApplication extends LightningElement {
accName; //variable declare
handleChangeName(){
    this.accName = event.target.value;
}
}