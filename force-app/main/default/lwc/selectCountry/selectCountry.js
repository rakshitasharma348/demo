import { LightningElement } from 'lwc';

export default class SelectCountry extends LightningElement {

    value = '';
    value2='';

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
        this.value = event.detail.value;
    }

    handleChange2(event) {
        this.value2 = event.detail.value;
    }
}