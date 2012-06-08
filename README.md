app_templates
=============

#### Country Application Template
Genera il modello `Country` (se richiesto) ed il rake task di seeding dei corrispondenti dati.

* Per un nuovo progetto: `rails new <app_name> -m https://github.com/develonlab/app_templates/blob/master/countries.rb`
* Per aggiungere il codice ad un progetto esistente: `rake rails_template LOCATION=https://github.com/develonlab/app_templates/blob/master/countries.rb`

#### State Application Templates
Generano il modello `State` (se richiesto) ed il rake task di seeding dei corrispondenti dati.

* Per un nuovo progetto: `rails new <app_name> -m https://github.com/develonlab/app_templates/blob/master/states-<xx>.rb`
* Per aggiungere il codice ad un progetto esistente: `rake rails_template LOCATION=https://github.com/develonlab/app_templates/blob/master/states-<xx>.rb`