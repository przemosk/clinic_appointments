# README

## OVERVIEW

To make doctor's work more efficient ( and easier ), I prepared some API for managing patient visits. I made some assumptions, like: `each doctor's availability will be recurring` Based on that, I'm creating appointment slots for patients where they can choose to visit whenever they need.The current logic, will create those appointments 6 months ahead, also I set a static time for each visit, which in this place takes 30 min.

## INSTALATION

* clone this repo && go into project folder `clinic_appointments`
* run `bundle install`
* run `rails db:create`
* run `rails db:migrate`
* run `rails db:seeds` --> create by default: Doctors, Avability for them ( 7 days ) and Patient's

## ENDPOINTS OVERVIEW

- **[GET] localhost:3000/api/v1/doctors/available_slots** --> Endpoint returning appointments which are free to be booked by patients
  Accepted params: `doctor_id`
- **[GET] localhost:3000/api/v1/doctors/working_hours** --> Endpoint returning doctors working hours in a 12-hour format. Accepted params: `doctor_id`

- **[PUT] localhost:3000/api/v1/appointments/book_visit** --> The endpoint which booking visits for patients. Accepted params: `appointment_id` and `patient_id`
- **[PUT] localhost:3000/api/v1/appointments/update_visit** --> Endpoint which updating appointments. Accepted params: `appointment_id`,`cancelled`, `appointment_date`, `doctor_id`. Allowed fields for update: `cancelled`, `appointment_date`, `doctor_id`
- **[DELETE]'localhost:3000/api/v1/appointments/remove_visit** --> Endpoint which removing created appointment. Accepted params: `appointment_id`


## MODELS OVERVIEW

**Doctor**

This model keeps details about Doctor, like: `first_name`, `last_name`, `email` or `specialization`.

**Patient**

This model keeps details about Doctor, like: `first_name`, `last_name`, `email`.

**Appointment**

This model represent appointments Patient with Doctor. It's containing reference with Doctor and Patient model, aparat from that, containing attributes like: `cancelled` and `appointment_date`

**Avability**

This model keeps details related to doctor workings hours by attributes such as: `start_time`, `end_time`, `weekday`.
In this model also I created callback method `create_appointments` which creating Appointment's slots relaying on Doctor avability.

## TODO

* authorization
* authentication
