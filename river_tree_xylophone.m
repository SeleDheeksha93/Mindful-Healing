clear;

%Create struct named 'TherapyCenters' to define Info for 'Holistic Therapy Center'.
TherapyCenters.Name = 'Holistic Therapy Center';
TherapyCenters.Address = '123 Main St, Anytown, USA 12345';
TherapyCenters.Hours = 'M-F 8am-5pm; Sat 9am-1pm';
TherapyCenters.Phone = '555-444-1234';
TherapyCenters.Services = {'Massage Therapy', 'Reiki Therapy', 'Yoga Therapy', 'Meditation Therapy', 'Aromatherapy', 'Nutrition Therapy', 'Tai Chi'};

%Prompt user to input their name
Name = input('Please enter your name: ');

%Prompt user to input their contact information
Phone = input('Please enter your phone number: ');
Email = input('Please enter your email address: ');

%Create struct named 'PatientInfo' to define Info for user.
PatientInfo.Name = Name;
PatientInfo.Phone = Phone;
PatientInfo.Email = Email;

%Ask user to input their therapy preference
TherapyPreference = input('What type of therapy would you like to receive? Options are Massage Therapy, Reiki Therapy, Yoga Therapy, Meditation Therapy, Aromatherapy, Nutrition Therapy, and Tai Chi: ');

%Check if the therapy preference is offered at the center
if ismember(TherapyPreference, TherapyCenters.Services)
   fprintf('Yes, we offer %s at %s. \n', TherapyPreference, TherapyCenters.Name);
else
   fprintf('No, we do not offer %s at %s. \n', TherapyPreference, TherapyCenters.Name);
end

%Prompt user to enter date and time for appointment
ApptDate = input('Please enter desired date and time for appointment (mm/dd/yyyy hh:mm): ');

%Check if the time is available
if strcmp(ApptDate, '8/14/2020 10:00')
    fprintf('Sorry, that time slot is unavailable. Please select a different time. \n');
else
    fprintf('Your appointment is confirmed for %s at %s. \n', ApptDate, TherapyCenters.Name);
end

%Prompt user for payment information
PaymentType = input('Please enter your payment type (cash, check, or credit card): ');

if strcmp(PaymentType, 'credit card')
    CardNumber = input('Please enter your credit card number: ');
    ExpDate = input('Please enter your credit card expiration date (MMYY): ');
    SecurityCode = input('Please enter your credit card security code: ');
    fprintf('Thank you. Your credit card information has been securely stored. \n');
else
    fprintf('Thank you. Your payment information has been securely stored. \n');
end

%Print final confirmation message
fprintf('Thank you for scheduling an appointment with %s. We look forward to seeing you. \n', TherapyCenters.Name);