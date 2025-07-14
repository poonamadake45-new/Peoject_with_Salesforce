import { LightningElement,track } from 'lwc';
export default class ShowPopup extends LightningElement {

@track isModelPopupOpne =false; 
openModelPopup(){                    //after onclick 
    this.isModelPopupOpne=true;
}

hideModalBox(){
    this.isModelPopupOpne=false;
}
}