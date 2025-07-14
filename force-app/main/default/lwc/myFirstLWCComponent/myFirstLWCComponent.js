import { LightningElement, track } from 'lwc';
export default class MyFirstLWCComponent extends LightningElement { //if we use @track here then needs to add to import

@track isModelPopupOpne =false; 
openModelPopup(){                    //after onclick 
this.isModelPopupOpne=true;
}
}