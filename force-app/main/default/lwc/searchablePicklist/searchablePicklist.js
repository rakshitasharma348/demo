import { LightningElement } from 'lwc';
const picklist = [
    { label: 'New', value: 'new' },
    { label: 'In Progress', value: 'inProgress' },
    { label: 'Finished', value: 'finished' },
    { label: 'fin', value: 'fin' },
    { label: 'newi', value: 'newi' },
    { label: 'in', value: 'in' },
];
export default class SearchablePicklist extends LightningElement {
    picklistOrdered=picklist;
    searchResults;
    selectedSearchResult;
   
    get selectedValue() {
      return this.selectedSearchResult ? this.selectedSearchResult.label : null;
    }
   
  //   connectedCallback() {
  //     getValuesFromTable().then((result) => {
  //         this.picklistOrdered = result.map(({value: label, key: value}) => ({ label,value}))
  //         this.picklistOrdered = this.picklistOrdered.sort((a,b)=>{
  //             if(a.label < b.label){
  //                 return -1
  //             }
  //         })
  //     })
  //   }
   
    search(event) {
      const input = event.detail.value.toLowerCase();
      const result = this.picklistOrdered.filter((picklistOption) =>
        picklistOption.label.toLowerCase().trim().startsWith(input)
      );
      this.searchResults = result;
    }
   
    selectSearchResult(event) {
      const selectedValue = event.currentTarget.dataset.value;
      this.selectedSearchResult = this.picklistOrdered.find(
        (picklistOption) => picklistOption.value === selectedValue
      );
      this.clearSearchResults();
    }
   
    clearSearchResults() {
      this.searchResults = null;
    }
   
    showPicklistOptions() {
      if (!this.searchResults) {
        this.searchResults = this.picklistOrdered;
      }
    }
  }