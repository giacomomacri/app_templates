if yes? 'Would you like to add a migration for the Country model?'
  generate 'model', 'country title:string tld:string cca2:string ccn3:string cca3:string alt_spellings:string'
  rake 'db:migrate'
end

rakefile 'countries.rake' do
  %Q{# encoding: utf-8

require 'csv'

namespace :db do
  namespace :seed do
    task :countries => :environment do
      countries = <<EOF
title,tld,cca2,ccn3,cca3,alt_spellings
Afghanistan,.af,AF,4,AFG,AF
Åland Islands,.ax,AX,248,ALA,AX Aaland Aland
Albania,.al,AL,8,ALB,AL
Algeria,.dz,DZ,12,DZA,DZ
American Samoa,.as,AS,16,ASM,AS
Andorra,.ad,AD,20,AND,AD
Angola,.ao,AO,24,AGO,AO
Anguilla,.ai,AI,660,AIA,AI
Antarctica,.aq,AQ,10,ATA,AQ
Antigua and Barbuda,.ag,AG,28,ATG,AG
Argentina,.ar,AR,32,ARG,AR
Armenia,.am,AM,51,ARM,AM
Aruba,.aw,AW,533,ABW,AW
Australia,.au,AU,36,AUS,AU
Austria,.at,AT,40,AUT,AT Österreich Osterreich Oesterreich
Azerbaijan,.az,AZ,31,AZE,AZ
Bahamas,.bs,BS,44,BHS,BS
Bahrain,.bh,BH,48,BHR,BH
Bangladesh,.bd,BD,50,BGD,BD
Barbados,.bb,BB,52,BRB,BB
Belarus,.by,BY,112,BLR,BY
Belgium,.be,BE,56,BEL,BE België Belgie Belgien Belgique
Belize,.bz,BZ,84,BLZ,BZ
Benin,.bj,BJ,204,BEN,BJ
Bermuda,.bm,BM,60,BMU,BM
Bhutan,.bt,BT,64,BTN,BT
Bolivia,.bo,BO,68,BOL,BO
Bonaire,.bq,BQ,535,BES,BQ
Bosnia and Herzegovina,.ba,BA,70,BIH,BA
Botswana,.bw,BW,72,BWA,BW
Bouvet Island,.bv,BV,74,BVT,BV
Brazil,.br,BR,76,BRA,BR Brasil
British Indian Ocean Territory,.io,IO,86,IOT,IO
Brunei Darussalam,.bn,BN,96,BRN,BN
Bulgaria,.bg,BG,100,BGR,BG
Burkina Faso,.bf,BF,854,BFA,BF
Burundi,.bi,BI,108,BDI,BI
Cambodia,.kh,KH,116,KHM,KH
Cameroon,.cm,CM,120,CMR,CM
Canada,.ca,CA,124,CAN,CA
Cape Verde,.cv,CV,132,CPV,CV Cabo
Cayman Islands,.ky,KY,136,CYM,KY
Central African Republic,.cf,CF,140,CAF,CF
Chad,.td,TD,148,TCD,TD Tchad
Chile,.cl,CL,152,CHL,CL
China,.cn,CN,156,CHN,CN Zhongguo Zhonghua Peoples Republic
Christmas Island,.cx,CX,162,CXR,CX
Colombia,.co,CO,170,COL,CO
Comoros,.km,KM,174,COM,KM
Republic of the Congo,.cg,CG,178,COG,CG
Democratic Republic of the Congo,.cd,CD,180,COD,CD Congo-Brazzaville Repubilika ya Kongo
Cook Islands,.ck,CK,184,COK,CK
Costa Rica,.cr,CR,188,CRI,CR
Côte d'Ivoire,.ci,CI,384,CIV,CI Cote dIvoire
Croatia,.hr,HR,191,HRV,HR Hrvatska
Cuba,.cu,CU,192,CUB,CU
Curaçao,.cw,CW,531,CUW,CW Curacao
Cyprus,.cy,CY,196,CYP,CY Kýpros
Czech Republic,.cz,CZ,203,CZE,CZ Ceska
Denmark,.dk,DK,208,DNK,DK Danmark
Djibouti,.dj,DJ,262,DJI,DJ Jabuuti Gabuuti
Dominica,.dm,DM,212,DMA,DM Dominique
Dominican Republic,.do,DO,214,DOM,DO
Ecuador,.ec,EC,218,ECU,EC
Egypt,.eg,EG,818,EGY,EG
El Salvador,.sv,SV,222,SLV,SV
Equatorial Guinea,.gq,GQ,226,GNQ,GQ
Eritrea,.er,ER,232,ERI,ER
Estonia,.ee,EE,233,EST,EE Eesti
Ethiopia,.et,ET,231,ETH,ET
Falkland Islands (Malvinas),.fk,FK,238,FLK,FK
Faroe Islands,.fo,FO,234,FRO,FO Føroyar Færøerne
Fiji,.fj,FJ,242,FJI,FJ Viti
Finland,.fi,FI,246,FIN,FI Suomi
France,.fr,FR,250,FRA,FR République française
French Guiana,.gf,GF,254,GUF,GF
French Polynesia,.pf,PF,258,PYF,PF Polynésie française
French Southern Territories,.tf,TF,260,ATF,TF
Gabon,.ga,GA,266,GAB,GA République Gabonaise
Gambia,.gm,GM,270,GMB,GM
Georgia,.ge,GE,268,GEO,GE
Germany,.de,DE,276,DEU,DE Bundesrepublik Deutschland
Ghana,.gh,GH,288,GHA,GH
Gibraltar,.gi,GI,292,GIB,GI
Greece,.gr,GR,300,GRC,GR
Greenland,.gl,GL,304,GRL,GL grønland
Grenada,.gd,GD,308,GRD,GD
Guadeloupe,.gp,GP,312,GLP,GP
Guam,.gu,GU,316,GUM,GU
Guatemala,.gt,GT,320,GTM,GT
Guernsey,.gg,GG,831,GGY,GG
Guinea,.gn,GN,324,GIN,GN
Guinea-Bissau,.gw,GW,624,GNB,GW
Guyana,.gy,GY,328,GUY,GY
Haiti,.ht,HT,332,HTI,HT
Heard Island and McDonald Islands,.hm,HM,334,HMD,HM
Vatican City,.va,VA,336,VAT,VA
Honduras,.hn,HN,340,HND,HN
Hong Kong,.hk,HK,344,HKG,HK
Hungary,.hu,HU,348,HUN,HU Magyarország
Iceland,.is,IS,352,ISL,IS Island
India,.in,IN,356,IND,IN Hindustan
Indonesia,.id,ID,360,IDN,ID
Iran,.ir,IR,364,IRN,IR
Iraq,.iq,IQ,368,IRQ,IQ
Ireland,.ie,IE,372,IRL,IE Éire
Isle of Man,.im,IM,833,IMN,IM
Israel,.il,IL,376,ISR,IL
Italy,.it,IT,380,ITA,IT Italia
Jamaica,.jm,JM,388,JAM,JM
Japan,.jp,JP,392,JPN,JP Nippon Nihon
Jersey,.je,JE,832,JEY,JE
Jordan,.jo,JO,400,JOR,JO
Kazakhstan,.kz,KZ,398,KAZ,KZ
Kenya,.ke,KE,404,KEN,KE
Kiribati,.ki,KI,296,KIR,KI
North Korea,.kp,KP,408,PRK,KP
South Korea,.kr,KR,410,KOR,KR
Kuwait,.kw,KW,414,KWT,KW
Kyrgyzstan,.kg,KG,417,KGZ,KG
Laos,.la,LA,418,LAO,LA
Latvia,.lv,LV,428,LVA,LV Latvija
Lebanon,.lb,LB,422,LBN,LB
Lesotho,.ls,LS,426,LSO,LS
Liberia,.lr,LR,430,LBR,LR
Libya,.ly,LY,434,LBY,LY
Liechtenstein,.li,LI,438,LIE,LI
Lithuania,.lt,LT,440,LTU,LT Lietuva
Luxembourg,.lu,LU,442,LUX,LU
Macao,.mo,MO,446,MAC,MO
Macedonia,.mk,MK,807,MKD,MK
Madagascar,.mg,MG,450,MDG,MG Madagasikara
Malawi,.mw,MW,454,MWI,MW
Malaysia,.my,MY,458,MYS,MY
Maldives,.mv,MV,462,MDV,MV
Mali,.ml,ML,466,MLI,ML
Malta,.mt,MT,470,MLT,MT
Marshall Islands,.mh,MH,584,MHL,MH
Martinique,.mq,MQ,474,MTQ,MQ
Mauritania,.mr,MR,478,MRT,MR
Mauritius,.mu,MU,480,MUS,MU
Mayotte,.yt,YT,175,MYT,YT
Mexico,.mx,MX,484,MEX,MX Mexicanos
Micronesia,.fm,FM,583,FSM,FM
Moldova,.md,MD,498,MDA,MD
Monaco,.mc,MC,492,MCO,MC
Mongolia,.mn,MN,496,MNG,MN
Montenegro,.me,ME,499,MNE,ME
Montserrat,.ms,MS,500,MSR,MS
Morocco,.ma,MA,504,MAR,MA
Mozambique,.mz,MZ,508,MOZ,MZ Moçambique
Myanmar,.mm,MM,104,MMR,MM
Namibia,.na,NA,516,NAM,NA Namibië
Nauru,.nr,NR,520,NRU,NR Naoero
Nepal,.np,NP,524,NPL,NP
Netherlands,.nl,NL,528,NLD,NL Holland Nederland
New Caledonia,.nc,NC,540,NCL,NC
New Zealand,.nz,NZ,554,NZL,NZ Aotearoa
Nicaragua,.ni,NI,558,NIC,NI
Niger,.ne,NE,562,NER,NE Nijar
Nigeria,.ng,NG,566,NGA,NG Nijeriya Naíjíríà
Niue,.nu,NU,570,NIU,NU
Norfolk Island,.nf,NF,574,NFK,NF
Northern Mariana Islands,.mp,MP,580,MNP,MP
Norway,.no,NO,578,NOR,NO Norge Noreg
Oman,.om,OM,512,OMN,OM
Pakistan,.pk,PK,586,PAK,PK
Palau,.pw,PW,585,PLW,PW
Palestinian Territory,.ps,PS,275,PSE,PS
Panama,.pa,PA,591,PAN,PA
Papua New Guinea,.pg,PG,598,PNG,PG
Paraguay,.py,PY,600,PRY,PY
Peru,.pe,PE,604,PER,PE
Philippines,.ph,PH,608,PHL,PH Pilipinas
Pitcairn,.pn,PN,612,PCN,PN
Poland,.pl,PL,616,POL,PL Polska
Portugal,.pt,PT,620,PRT,PT Portuguesa
Puerto Rico,.pr,PR,630,PRI,PR
Qatar,.qa,QA,634,QAT,QA
Réunion,.re,RE,638,REU,RE Reunion
Romania,.ro,RO,642,ROU,RO Rumania Roumania România
Russian Federation,.ru,RU,643,RUS,RU Rossiya
Rwanda,.rw,RW,646,RWA,RW
Saint Barthélemy,.bl,BL,652,BLM,BL St. Barthelemy
Saint Helena,.sh,SH,654,SHN,SH St.
Saint Kitts and Nevis,.kn,KN,659,KNA,KN St.
Saint Lucia,.lc,LC,662,LCA,LC St.
Saint Martin,.mf,MF,663,MAF,MF St.
Saint Pierre and Miquelon,.pm,PM,666,SPM,PM St.
Saint Vincent and the Grenadines,.vc,VC,670,VCT,VC St.
Samoa,.ws,WS,882,WSM,WS
San Marino,.sm,SM,674,SMR,SM
Sao Tome and Principe,.st,ST,678,STP,ST
Saudi Arabia,.sa,SA,682,SAU,SA
Senegal,.sn,SN,686,SEN,SN Sénégal
Serbia,.rs,RS,688,SRB,RS Srbija
Seychelles,.sc,SC,690,SYC,SC
Sierra Leone,.sl,SL,694,SLE,SL
Singapore,.sg,SG,702,SGP,SG Singapura
Sint Maarten,.sx,SX,534,SXM,SX
Slovakia,.sk,SK,703,SVK,SK Slovenská Slovensko
Slovenia,.si,SI,705,SVN,SI Slovenija
Solomon Islands,.sb,SB,90,SLB,SB
Somalia,.so,SO,706,SOM,SO
South Africa,.za,ZA,710,ZAF,ZA RSA Suid-Afrika
South Georgia,.gs,GS,239,SGS,GS
South Sudan,.ss,SS,728,SSD,SS
Spain,.es,ES,724,ESP,ES España
Sri Lanka,.lk,LK,144,LKA,LK
Sudan,.sd,SD,729,SDN,SD
Suriname,.sr,SR,740,SUR,SR Sarnam Sranangron
Svalbard and Jan Mayen,.sj,SJ,744,SJM,SJ
Swaziland,.sz,SZ,748,SWZ,SZ weSwatini Swatini Ngwane
Sweden,.se,SE,752,SWE,SE Sverige
Switzerland,.ch,CH,756,CHE,CH Swiss Confederation Schweiz Suisse Svizzera Svizra
Syrian Arab Republic,.sy,SY,760,SYR,SY Syria
Taiwan,.tw,TW,158,TWN,TW
Tajikistan,.tj,TJ,762,TJK,TJ Toçikiston
Tanzania,.tz,TZ,834,TZA,TZ
Thailand,.th,TH,764,THA,TH Prathet Thai
Timor-Leste,.tl,TL,626,TLS,TL
Togo,.tg,TG,768,TGO,TG Togolese
Tokelau,.tk,TK,772,TKL,TK
Tonga,.to,TO,776,TON,TO
Trinidad and Tobago,.tt,TT,780,TTO,TT
Tunisia,.tn,TN,788,TUN,TN
Turkey,.tr,TR,792,TUR,TR Türkiye Turkiye
Turkmenistan,.tm,TM,795,TKM,TM Türkmenistan
Turks and Caicos Islands,.tc,TC,796,TCA,TC
Tuvalu,.tv,TV,798,TUV,TV
Uganda,.ug,UG,800,UGA,UG
Ukraine,.ua,UA,804,UKR,UA Ukrayina
United Arab Emirates,.ae,AE,784,ARE,AE UAE
United Kingdom,.gb,GB,826,GBR,GB Great Britain England UK Wales Scotland Northern Ireland
United States,.us,US,840,USA,US USA United States of America
United States Minor Outlying Islands,.um,UM,581,UMI,UM
Uruguay,.uy,UY,858,URY,UY
Uzbekistan,.uz,UZ,860,UZB,UZ O'zbekstan Ozbekiston
Vanuatu,.vu,VU,548,VUT,VU
"Venezuela, Bolivarian Republic of",.ve,VE,862,VEN,VE
Viet Nam,.vn,VN,704,VNM,VN Viet Nam
Virgin Islands (British),.vg,VG,92,VGB,VG
Virgin Islands (U.S.),.vi,VI,850,VIR,VI
Wallis and Futuna,.wf,WF,876,WLF,WF
Western Sahara,.eh,EH,732,ESH,EH
Yemen,.ye,YE,887,YEM,YE
Zambia,.zm,ZM,894,ZMB,ZM
Zimbabwe,.zw,ZW,716,ZWE,ZW
EOF
      CSV.parse(countries, :headers => true) do |row|
        attrs = {}
        Country.column_names.each do |key|
          attrs[key.to_sym] = row[key].strip if row[key]
        end
        Country.create(attrs)
      end
    end
  end
end
}
end

rake 'db:seed:countries' if yes? 'Would you like to launch the seed task?'
