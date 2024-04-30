import { LightningElement } from 'lwc';

export default class CreateTimeSheet extends LightningElement {
    
     timeSheetData;
    
    columns = [
        { label: 'Date', fieldName: 'Date', type: 'date' },
        { label: 'Project Name', fieldName: 'ProjectName', type: 'text' },
        { label: 'Hours', fieldName: 'Hours', type: 'number' },
        { label: 'Status', fieldName: 'Status', type: 'text' },
        { label: 'Description', fieldName: 'Description', type: 'text' }
    ];

    generateTimeSheet() {
        
        this.timeSheetData = [
            { Id: '1', Date: '2024-02-13', ProjectName: 'Project A', Hours: 8, Status: 'Completed', Description: 'Worked on frontend design' },
            { Id: '2', Date: '2024-02-14', ProjectName: 'Project B', Hours: 6, Status: 'In Progress', Description: 'Backend development' }
        ];
    }
}