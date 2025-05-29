import { LightningElement, track, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import profileimg from '@salesforce/resourceUrl/profileimg';
import { defaultInputDate } from './helper';

export default class Firstsflwc extends NavigationMixin(LightningElement) {
    lwcTitle= "";

    profileImage = profileimg;

    handleClick(event) {
        this.lwcTitle = event.target.label;
    }

    disconnectedCallback(){
        console.log('Parent removed from DOM..');
    }

    navigateNext() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: this.tabName,
            },
        });
    }

    navigateToViewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0015i00000kCZScAAO',
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    }

    navigateToNewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
        });
    }

    //this is just dummy data
    Announcements = {
        data: [
            {
                Id: 1,
                AnnouncementDescription__c: 'test1'
            },
            {
                Id: 2,
                AnnouncementDescription__c: 'test2'
            },
            {
                Id: 3,
                AnnouncementDescription__c: 'test3'
            }
        ]
    }

    @track clickedButtonLabel = 'Show';
    handleClick(event) {  
        const label = event.target.label;
        //get the id
        const id = event.currentTarget.id  
        //finds the text field
        const annoucement = this.template.querySelector('span[id="' + id + '"]');
        //finds the button
        let button = this.template.querySelector('lightning-button[id="' + id + '"]') 
        //sets the description field to diaplay
        annoucement.style.display = ''
        if ( label === 'Show' ) {  
            //sets the button label to hide
            button.label = 'Hide'

        } else if  ( label === 'Hide' ) {  
            //sets the button label to show
            button.label = 'Show';
            //sets the decription field to hidden   
            annoucement.style.display = 'none'
        }
    }
    
	@api rangeInMillisecs;
	@api startDate;
	@api endDate;
	@api startDateLabel;
	@api endDateLabel;

	constructor() {
		super();
		this.rangeInMillisecs = 3600000; // 3600000 ms = 1 hour
		this.startDateLabel = 'Start date';
		this.endDateLabel = 'End date';
	}

	connectedCallback() {
		const range = this.rangeInMillisecs;
		const {startDate, endDate} = defaultInputDate(range); 

		this.startDate = startDate;
		this.endDate = endDate;
	} 

    @track isAllDayEvent = false;
    handleCheckboxChange(event) {
        this.isAllDayEvent = event.target.checked;
    }

    get getType() {
        if (this.isAllDayEvent) {
            return 'date';
        } else {
            return 'datetime';
        }
    }

	handleStartDateChange(event) {
		const currentStartDate = new Date(event.target.value);
		this.startDate = currentStartDate.toISOString();

		const newEndDate = new Date(currentStartDate);
		newEndDate.setTime(currentStartDate.getTime() + this.rangeInMillisecs);

		this.endDate = newEndDate.toISOString();

		this.dispatchEvent(createEvent({startDate: this.startDate, endDate: this.endDate}));
	}

	handleEndDateChange(event) {
		const currentStartDate = new Date(this.startDate);
		const currentEndDate = new Date(event.target.value);

		if (currentEndDate <= currentStartDate) {
			const newStartDate = new Date(currentEndDate);
			newStartDate.setTime(currentEndDate.getTime() - this.rangeInMillisecs);

			this.startDate = newStartDate.toISOString();
		}
		else if (currentEndDate > currentStartDate) {
			const timeInterval = (currentEndDate - currentStartDate);
			
			this.rangeInMillisecs = timeInterval;
		}

		this.endDate = currentEndDate.toISOString();

		this.dispatchEvent(createEvent({startDate: this.startDate, endDate: this.endDate}));
	}   
}

function createEvent(data) {
	const event = new CustomEvent('getdatevalues', {
		detail: data
	});

	return event;
}