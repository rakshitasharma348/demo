import { LightningElement, api } from 'lwc';
import retriveNews from '@salesforce/apex/NewsController.retriveNews';
export default class NewsApi extends LightningElement {
    @api objectApiName;
    result= []
    selectedNews = {};
    isModalOpen = false;
    @api  value='in';
    @api value2='business';
    
    
    
  
    get options() {
        return [
         { label: 'United Arab Emirates (AE)', value: 'ae' },
        { label: 'Argentina (AR)', value: 'ar' },
        { label: 'Australia (AU)', value: 'au' },
        { label: 'Austria (AT)', value: 'at' },
        { label: 'Belgium (BE)', value: 'be' },
        { label: 'Bulgaria (BG)', value: 'bg' },
        { label: 'Brazil (BR)', value: 'br' },
        { label: 'Canada (CA)', value: 'ca' },
        { label: 'China (CN)', value: 'cn' },
        { label: 'Colombia (CO)', value: 'co' },
        { label: 'Czech Republic (CZ)', value: 'cz' },
        { label: 'Denmark (DK)', value: 'dk' },
        { label: 'Egypt (EG)', value: 'eg' },
        { label: 'France (FR)', value: 'fr' },
        { label: 'Germany (DE)', value: 'de' },
        { label: 'Greece (GR)', value: 'gr' },
        { label: 'Hong Kong (HK)', value: 'hk' },
        { label: 'Hungary (HU)', value: 'hu' },
        { label: 'India (IN)', value: 'in' },
        { label: 'Indonesia (ID)', value: 'id' },
        { label: 'Ireland (IE)', value: 'ie' },
        { label: 'Israel (IL)', value: 'il' },
        { label: 'Italy (IT)', value: 'it' },
        { label: 'Japan (JP)', value: 'jp' },
        { label: 'South Korea (KR)', value: 'kr' },
        { label: 'Lebanon (LB)', value: 'lb' },
        { label: 'Lithuania (LT)', value: 'lt' },
        { label: 'Latvia (LV)', value: 'lv' },
        { label: 'Morocco (MA)', value: 'ma' },
        { label: 'Mexico (MX)', value: 'mx' },
        { label: 'Malaysia (MY)', value: 'my' },
        { label: 'Nigeria (NG)', value: 'ng' },
        { label: 'Netherlands (NL)', value: 'nl' },
        { label: 'Norway (NO)', value: 'no' },
        { label: 'New Zealand (NZ)', value: 'nz' },
        { label: 'Philippines (PH)', value: 'ph' },
        { label: 'Poland (PL)', value: 'pl' },
        { label: 'Portugal (PT)', value: 'pt' },
        { label: 'Romania (RO)', value: 'ro' },
        { label: 'Russia (RU)', value: 'ru' },
        { label: 'Saudi Arabia (SA)', value: 'sa' },
        { label: 'Sweden (SE)', value: 'se' },
        { label: 'Singapore (SG)', value: 'sg' },
        { label: 'Slovenia (SI)', value: 'si' },
        { label: 'Slovakia (SK)', value: 'sk' },
        { label: 'Thailand (TH)', value: 'th' },
        { label: 'Turkey (TR)', value: 'tr' },
        { label: 'Taiwan (TW)', value: 'tw' },
        { label: 'Ukraine (UA)', value: 'ua' },
        { label: 'United Kingdom (UK)', value: 'uk' },
        { label: 'United States (US)', value: 'us' },
        { label: 'Venezuela (VE)', value: 've' },
        { label: 'South Africa (ZA)', value: 'za' },
    
        ];
    }
    get options2() {
        return [
         { label: 'business', value: 'business' },
        { label: 'entertainment', value: 'entertainment' },
        { label: 'general', value: 'general' },
        { label: 'health', value: 'health' },
        { label: 'science', value: 'science' },
        { label: 'sports', value: 'sports' },
        { label: 'technology', value: 'technology' }
        ];

    }

    handleChange(event) {

        this.value = event.target.value;
        this.fetchNews();
    }

    handleChange2(event) {
        this.value2 = event.target.value;
        this.fetchNews();
    }


    get modalClass(){
        return this.isModalOpen ?"slds-modal slds-fade-in-open":"slds-modal"
    }

    get modalBackDropClass(){
        this.isModalOpen ?"slds-modal slds-fade-in-open":"slds-modal" 
    }

    
    connectedCallback(){
        console.log("connected callback");

        if(this.objectApiName == 'Account' ){
            this.value='in';
        } 
        else if(this.objectApiName == 'Opportunity'){
            this.value='us';
        }
        else if(this.objectApiName == 'Contact'){
            this.value='sg';
        }
        this.fetchNews();
    }
    
    fetchNews(){
        console.log("fetchNews");
        retriveNews({country:this.value, category:this.value2}).then(Response =>{
            console.log(Response);
            this.formatNewsData(Response.articles)
        }).catch(error=>{
            console.error(error);
        })
    }
    formatNewsData(res){
     this.result =res.map((item, index)=>{
            let id=`new_${index+1}`;
            let date=new Date(item.publishedAt).toDateString()
            let name= item.source.name;
            return{...item, id:id,name:name,date: date}
        })
    }
    showModal(event){
        let id= event.target.dataset.item;
        this.result.forEach(item=>{
            if(item.id===id){
                this.selectedNews={...item}
            }
        })

        this.isModalOpen = true;
    }
    closeModal(){
        this.isModalOpen = false;
    }
}