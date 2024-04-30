import { LightningElement } from 'lwc';

export default class GoEcoForm extends LightningElement {
 
     mapObjects = [
        { heading: "Email", type: "text" },
        { heading: "Your Name", type: "number" },
        { heading: "Your Role With School ", type: "text" },
        { heading: "Your Phone Number", type: "text" },
        { heading: "Your School Name", type: "number" },
        { heading: "Your School Address", type: "text" },
        { heading: "Grade Levels Participating: Show is for k-6 ", type: "text" },
        { heading: "Anticipated Number Of Student Attendees ", type: "text" },
        { heading: "Rating", type: "number" }
    ];


}