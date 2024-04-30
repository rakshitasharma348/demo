import { LightningElement } from 'lwc';
// import goEcoImage from '@salesforce/resourceUrl/goEcoImage';
import customcssFile from '@salesforce/resourceUrl/customcssFile';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

 
const options = [
    { label: " Friday April 19th at 8am EST (Eastern Standard Time)", value: "Friday 4/19/24: 5:00 AM EST" },
    { label: "Friday April 19th at 9am EST (Eastern Standard Time)", value: "Friday 4/19/24: 6:00 AM EST" },
    { label: "Friday April 19th at 10am EST (Eastern Standard Time)", value: "Friday 4/19/24: 7:00 AM EST" },
    { label: "Friday April 19th at 1pm EST (Eastern Standard Time)", value: "Friday 4/19/24: 8:00 AM EST" },
    { label: "Friday April 19th at 4pm EST (Eastern Standard Time)", value: "Friday 4/19/24: 9:00 AM EST" },
    { label: "Monday April 22nd at 8am EST (Eastern Standard Time)", value: "Friday 4/19/24: 10:00 AM EST" },
    { label: "Monday April 22nd at 9am EST (Eastern Standard Time)", value: "Friday 4/19/24: 11:00 AM EST" },
    { label: "Monday April 22nd at 10am EST (Eastern Standard Time)", value: "Friday 4/19/24: 12:00 PM EST" },
    { label: "Monday April 22nd at 1pm EST (Eastern Standard Time)", value: "Friday 4/19/24: 1:00 PM EST" },
    { label: "Monday April 22nd at 4pam EST (Eastern Standard Time)", value: "Friday 4/19/24: 2:00 PM EST" },
    { label: "Friday April 26th at 8am EST (Eastern Standard Time)", value: "Friday 4/19/24: 3:00 PM EST" },
    { label: "Friday April 26th at 9am EST (Eastern Standard Time)", value: "Friday 4/19/24: 4:00 PM EST" },
    { label: "Friday April 26th at 10am EST (Eastern Standard Time)", value: "Friday 4/19/24: 5:00 PM EST" },
    { label: "Friday April 26th at 1pm EST (Eastern Standard Time)", value: "Friday 4/19/24: 6:00 PM EST" },
    { label: "Friday April 26th at 4pm EST (Eastern Standard Time)", value: "Friday 4/19/24: 7:00 PM EST" }
    
];
 const checkboxOptions = [
    { label: 'From individual classrooms', value: 'individualClassrooms' },
    { label: 'All together in MPR/Auditorium', value: 'allTogetherMPR' }
];
const picklist2=[
    { label: 'Just your class', value: 'Just your class' },
    { label: 'Multiple teachers', value: 'Multiple teachers' },
    { label: ' Entire school ', value: ' Entire school ' }
]
    

export default class Crateform extends LightningElement {
    optionPicklist = options;
    checkboxOptionslist=checkboxOptions;
    value1 = ['individualClassrooms'];
    signingPicklist= picklist2;

    connectedCallback() {
        loadStyle(this, customcssFile); 
        //you can add a .then().catch() if you'd like, as loadStyle() returns a promise
    }

    
 
    mapObjects = [
        { heading: "Grade levels participating ", type: "textl" },
        { heading: "Anticipated number of students ", type: "number" },
        { heading: "Your Name ", type: "text" },
        { heading: " Your Email ", type: "text" },
        { heading: "Your Role with school", type: "text" },
        { heading: "Your School Address", type: "text" },
        { heading: "School name ", type: "text" },
        { heading: "School address ", type: "text" },
        
    ]
        

}