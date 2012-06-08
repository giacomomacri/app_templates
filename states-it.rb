if yes? 'Would you like to add a migration for the State model object creation?'
  generate 'model', 'state code:string title:string region:string'
  rake 'db:migrate'
end

rakefile 'states-it.rake' do
  %Q{# encoding: utf-8

require 'csv'

namespace :db do
  namespace :seed do
    namespace :states do
      task :it => :environment do
        states = <<EOF
region,title,code
Piemonte,Torino,TO
Piemonte,Vercelli,VC
Piemonte,Novara,NO
Piemonte,Cuneo,CN
Piemonte,Asti,AT
Piemonte,Alessandria,AL
Piemonte,Biella,BI
Piemonte,Verbano-Cusio-Ossola,VB
Valle d'Aosta/Vallée d'Aoste,Valle d'Aosta/Vallée d'Aoste,AO
Lombardia,Varese,VA
Lombardia,Como,CO
Lombardia,Sondrio,SO
Lombardia,Milano,MI
Lombardia,Bergamo,BG
Lombardia,Brescia,BS
Lombardia,Pavia,PV
Lombardia,Cremona,CR
Lombardia,Mantova,MN
Lombardia,Lecco,LC
Lombardia,Lodi,LO
Lombardia,Monza e della Brianza,MB
Trentino-Alto Adige/Südtirol,Bolzano/Bozen,BZ
Trentino-Alto Adige/Südtirol,Trento,TN
Veneto,Verona,VR
Veneto,Vicenza,VI
Veneto,Belluno,BL
Veneto,Treviso,TV
Veneto,Venezia,VE
Veneto,Padova,PD
Veneto,Rovigo,RO
Friuli-Venezia Giulia,Udine,UD
Friuli-Venezia Giulia,Gorizia,GO
Friuli-Venezia Giulia,Trieste,TS
Friuli-Venezia Giulia,Pordenone,PN
Liguria,Imperia,IM
Liguria,Savona,SV
Liguria,Genova,GE
Liguria,La Spezia,SP
Emilia-Romagna,Piacenza,PC
Emilia-Romagna,Parma,PR
Emilia-Romagna,Reggio nell'Emilia,RE
Emilia-Romagna,Modena,MO
Emilia-Romagna,Bologna,BO
Emilia-Romagna,Ferrara,FE
Emilia-Romagna,Ravenna,RA
Emilia-Romagna,Forlì-Cesena,FC
Emilia-Romagna,Rimini,RN
Toscana,Massa-Carrara,MS
Toscana,Lucca,LU
Toscana,Pistoia,PT
Toscana,Firenze,FI
Toscana,Livorno,LI
Toscana,Pisa,PI
Toscana,Arezzo,AR
Toscana,Siena,SI
Toscana,Grosseto,GR
Toscana,Prato,PO
Umbria,Perugia,PG
Umbria,Terni,TR
Marche,Pesaro e Urbino,PU
Marche,Ancona,AN
Marche,Macerata,MC
Marche,Ascoli Piceno,AP
Marche,Fermo,FM
Lazio,Viterbo,VT
Lazio,Rieti,RI
Lazio,Roma,RM
Lazio,Latina,LT
Lazio,Frosinone,FR
Abruzzo,L'Aquila,AQ
Abruzzo,Teramo,TE
Abruzzo,Pescara,PE
Abruzzo,Chieti,CH
Molise,Campobasso,CB
Molise,Isernia,IS
Campania,Caserta,CE
Campania,Benevento,BN
Campania,Napoli,NA
Campania,Avellino,AV
Campania,Salerno,SA
Puglia,Foggia,FG
Puglia,Bari,BA
Puglia,Taranto,TA
Puglia,Brindisi,BR
Puglia,Lecce,LE
Puglia,Barletta-Andria-Trani,BT
Basilicata,Potenza,PZ
Basilicata,Matera,MT
Calabria,Cosenza,CS
Calabria,Catanzaro,CZ
Calabria,Reggio di Calabria,RC
Calabria,Crotone,KR
Calabria,Vibo Valentia,VV
Sicilia,Trapani,TP
Sicilia,Palermo,PA
Sicilia,Messina,ME
Sicilia,Agrigento,AG
Sicilia,Caltanissetta,CL
Sicilia,Enna,EN
Sicilia,Catania,CT
Sicilia,Ragusa,RG
Sicilia,Siracusa,SR
Sardegna,Sassari,SS
Sardegna,Nuoro,NU
Sardegna,Cagliari,CA
Sardegna,Oristano,OR
Sardegna,Olbia-Tempio,OT
Sardegna,Ogliastra,OG
Sardegna,Medio Campidano,VS
Sardegna,Carbonia-Iglesias,CI
EOF
        CSV.parse(states, :headers => true) do |row|
          attrs = {}
          State.column_names.each do |key|
            attrs[key.to_sym] = row[key].strip if row[key]
          end
          State.create(attrs)
        end
      end
    end
  end
end
}
end

rake 'db:seed:states:it' if yes? 'Would you like to launch the seed task?'