<?php

       /*         for ($i = 1; $i < 100; $i++) {
            shuffle($groups);
            shuffle($groups);
            shuffle($groups);
            shuffle($address);
            shuffle($subs);
            shuffle($subs);
            shuffle($subs);
            $c = new Person();
            $c->administrator_id = 1;
            $c->address = $address[2];
            $c->created_at = $faker->dateTimeBetween('-2 month', '+1 month');
            $c->dob = $faker->dateTimeBetween('-30 year', '-10 year');
            $c->group_id = $groups[2];
            $c->name = $faker->name();
            $c->caregiver_name = $faker->name();
            $c->parish = 'Kawanda';
            $c->village = 'Kansangati';
            $c->village = 'Kansangati';
            $c->phone_number = '+256706638494';
            $c->caregiver_phone_number = '+256706638494';
            $c->phone_number_2 = '+256793204665';
            $c->email = 'muhindo@gmail.com';
            $c->education_level = [
                'None',
                'Below primary',
                'Primary',
                'Secondary',
                'A-Level',
                'Bachelor',
                'Masters',
                'PhD',
            ][rand(0, 7)];
            $c->caregiver_relationship = [
                'Friend',
                'Brother',
                'Mother',
                'Father',
                'Sister',
                'Cousin',
                'Uncle',
                'Other',
            ][rand(0, 7)];
            $c->subcounty_id = $subs[15];
            $c->sex = ['Male', 'Female'][rand(0, 1)];
            $c->caregiver_sex = ['Male', 'Female'][rand(0, 1)];
            $c->has_caregiver = ['Yes', 'No'][rand(0, 1)];
            $c->caregiver_age = rand(10,50);
            $c->employment_status = ['Employed', 'Not Employed'][rand(0, 1)];
            $c->photo = 'images/u-'.rand(1,16).'.png';
            $c->save(); 
        }
 */

/*     $names = [
    "Abdul Rahman Mulinde",
    "Abdullah Kituku Abdullah",
    "Abdul Rahman Faisal",
    "Abdulrashid Uthman Buzimwa",
    "Ahmad Muslim Kayondo",
    "Ahmed Muhammad Kayondo",
    "Ahsan Taib Ssali",
    "Aryan Sulaiman",
    "Asma Zainab Mayanja",
    "Ayan Rashid Zalwango",
    "Bahaa Ehab Sserwadda",
    "Ilmah Nagadya Buyondo",
    "Harry Elsheikh Chol Ajeing",
    "Hatim Jamal Dhakaba",
    "Hayan Mumanzi Ramadhan",
    "Heyzern Sufi Jad",
    "Hibatullah Kirabo",
    "Huzaifa Farouk Kitaka",
    "Huzayl Tareeq Kasigwa",
    "Israh Idris Mubiru",
    "Istarlin Maryam Buga",
    "Jibran Uwais Muguzi",
    "Abdul Wahab Juuko",
    "Imran Yusuf Kabenge",
    "Osman Ramathan Kambo",
    "Abdullatif Hamid Kamulegeya",
    "Yusuf Junior Kavuma",
    "Mahad Kavuma",
    "Zaituni Nabaweesi Kaweesi",
    "Muniira Zainab Kayondo",
    "Skylar Amor Lwantale",
    "Manzi Habla Rwigyema",
    "Maya Katongole",
    "Miiro Faris Kagalye",
    "Abdul Rahman Mpaata",
    "Muhammad Rukidi",
    "Musa Musasizi",
    "Zakiirah Nabakka",
    "Rafiat Husnah Nakiyemba",
    "Inarah Nakyanzi",
    "Mariam Namatovu",
    "Tahiyah Namatovu",
    "Asma Jaziirah Namuddu",
    "Hazel Nassiwa",
    "Abdallah Malik Nkoyoyo",
    "Ridhwan Ssentamu Nyanzi",
    "Raheem Musoke",
    "Sahir Nsubuga",
    "Saidi Mubaraq Illan",
    "Shaheed Ssematimba",
    "Haitham Sserubula",
    "Tamiah Masudi Nakyanzi",
    "Fuzail Wadembere",
    "Yousha Musa Mubiru",
    "Hadi Zimula",
    "Isham Lukwago",
    "Kauthara Isa Babirye",
    "Abrah Kateregga",
    "Hana Yasmine Mbowa",
    "Norah Rajab",
    "Aryaan Khai Mugume",
    "Samuels Andiga Miranda",
    "Acram Ssemaganda",
    "Osama Ismail",
    "Tarah Nimurungi Nalubega",
    "Hailey Blessing Ayebale",
    "Ahmed Ssekatte Kaweesi",
    "Hibah Muwaya",
    "Waseelah Husn Mwanje",
    "Maxen Noel Nabuuma",
    "Ruqayya Nabbosa",
    "Shafic Saeed",
    "Shakeel Maki Shaban",
    "Lenia Rahma Janat",
    "Gobango Ehsan Muhammad",
    "Farihah Abdul Swabur",
    "Bukenya Shuraym",
    "Tarah Alaadin Ahmed",
    "Raheem Muhammad Ismail",
    "Yusuf Mayanja",
    "Mbuga Genesi Chloe",
    "Hannah Jannah Kitaka",
    "Abdulrahiim Hashim Luyimbazi",
    "Halimah Abed Salim",
    "Fatuma Abed Salim",
    "Farhana Ndagire Kagalye",
    "Nagayi Ruqqayah",
    "Faizan Humd Serunkuma",
    "Najjuma Azraa Sembatya",
    "Bumu Mahseen",
    "Kamran Jazeel Rayan",
    "Khadijah Aliana Nassolo",
    "Kyeswa Ali Mulungi",
    "Matovu Erias",
    "Nsereko Amiirah",
    "Atwongiire Hudah",
    "Farhan Abdulrahman Nsamba",
    "Hamza Lubega",
    "Nsimbe Haulah",
    "Malikka Mugalula Masudi",
    "Abdulrahman Muawiya Kaweesa",
    "Mawanda Shakir Sserwadda",
    "Otana Aseelah",
    "Lubega Jumah",
    "Kayondo Uwais Abdulrahman",
    "Kyambadde Rafsan Mulungi",
    "Shamsa Rannie Bukka",
    "Katabira Ukasha",
    "Aamira Nakato Muwonge",
    "Aahil Wasswa Muwonge",
    "Hayaan Kasule Kirumira",
    "Kigozi Hisham",
    "Nambusi Hanna Kawaase",
    "Namakula Hakimah",
    "Zaharah Nalubwaama",
    "Yaseerah Kigozi Erias",
    "Hebah Sarah Zalwango",
    "Kintu Shafik",
    "Mukiibi Kumayl Itaaga",
    "Mahad Katongole",
    "Musa Kyamudu Kiggundu",
    "Aleem Jaffer Muhindo",
    "Rahma Nalule",
    "Amirah Nalika",
    "Abdulkarim Sserunjogi",
    "Aqeelah Wamala",
    "Aisha Madinah Kiggundu",
    "Hilal Thabit Hilal",
    "Ammaar Yasir Kaye",
    "Ntanda Sulaiman Sserunkuma",
    "Success Pretty Akol",
    "Rayyan Ssemaganda",
    "Abdulmajid Kafeero",
    "Hibah Nkwanzi Tusiime",
    "Isabela Naluyinda",
    "Aliza Ali Sajid",
    "Iddi Mbaziira",
    "Uthaymeen Munir Kigozi",
    "Taqia Nantale",
    "Najib Mugoba",
    "Rayan Waiswa",
    "Halimah Hussein Nakafeero",
    "Aliyah Kasule",
    "Mariam Senkungu",
    "Nuha Rashid Ndagire",
    "Salmah Matovu",
    "Ilham Hasanah",
    "Rayhana Babirye",
    "Tasnim Ojula",
    "Ssebudde Shihaam Janat",
    "Lukowe Hajara Mazzi",
    "Faris Abdulswabur",
    "Hiqmah Asha Nakatale",
    "Nassuuna Husnah Nalugwa",
    "Nakyagaba Roshni",
    "Faisal Muhammad",
    "Maha Katongole",
    "Lamia Raphayda Nagujja",
    "Hisham Tawlan Kasigwa",
    "Kityamuwesi Saad Junior",
    "Abed Ahmed Salim",
    "Bissan Omar Khalifah",
    "Raham Rashid",
    "Hayah Namusobya Umuhoza",
    "Ashlim Mukyemena",
    "Qudra Melvin",
    "Ihsan Aliga Agele",
    "Aadila Khadijah Denya",
    "Faris Nsereko",
    "Mulindwa Raudha",
    "Shuraim Ammar Nsamba",
    "Fahad Nsamba",
    "Raudha Namagembe Kabanda",
    "Hashim Ssebidde",
    "Kyambadde Rashad Kalungi",
    "Nseko Fadhiilah",
    "Buyondo Ilham Namata",
    "Sitara Naima Dongo",
    "Nakiyaga Ashurah Hajarah",
    "Kaweesa Noman Busingye",
    "Tharya Alerasia Buga",
    "Arbaan Mustafa Ochom",
    "Farhat Hussein Kayizi",
    "Luwedde Hibatullah",
    "Ayaan Feisal",
    "Abdul Rauf Kaliisa",
    "Hanan Abdallah Ahlam",
    "Jamal Salman Atuhaire",
    "Abdul Rahim Badogi",
    "Mastulah Ali Bayiga",
    "Amiira Jaffer Biira",
    "Muniira Bukenya",
    "Soheilah Buyondo",
    "Elma Mansour Sultan",
    "Adinan Lenia Fariha",
    "Hanan Jaffer Sadala",
    "Ssali Kiggundu Ibrahim",
    "Hamis Kakande",
    "Raifah Sheza Kalanzi",
    "Ata Kapchemut",
    "Shimah Kapchemut",
    "Hunaifah Abdallah Kasemire",
    "Salman Faris Kasoma",
    "Shameel Katende",
    "Tariq Kiddu",
    "Maher Ghaith Sserwadda",
    "Amatullah Masamba Tusiime",
    "Yunus Roshan Masembe",
    "Abdul Swabur Mawanda",
    "Mikaelah Hilal Batul",
    "Samirah Kushi Muhammad",
    "Muhsin Magala",
    "Hakeem Kakumba Mulindwa",
    "Harun Chemisto Mutai",
    "Dhakiirah Nabaweesi",
    "Nahia Abdallah Walugembe Nabukeera",
    "Nakiyah Naigaga",
    "Hafswa Nakagiri",
    "Munirah Muawiya Nakimuli",
    "Hannah Yusuf Ndagire",
    "Ayaan Yasir Ntume",
    "Ranny Nyende",
    "Ayaan Rajab Yasir",
    "Muhammad Ssabwe",
    "Shaban Kimuli Sserunkuma",
    "Abdulhakim Ssesanga",
    "Fatuma Luyima Taneesha",
    "Muhdi Wafula",
    "Shukrah Lutaaya",
    "Kisembo Moses",
    "Roshan Badru Gabula",
    "Salman Faris Nsimbe",
    "Maryam Nabwala Kisakye",
    "Sharifah Mariam Saidi",
    "Taalia Kirumira",
    "Kisembo Hanim",
    "Sseguya Janan",
    "Hamza Hussein Ssali",
    "Nansubuga Latifah Kajaya",
    "Nakatudde Shatrah",
    "Namitala Nuria",
    "Nsubuga Rayan",
    "Kazibwe Tariq",
    "Miiro Aqram Zzinda",
    "Iqmal Kisambira Sentamu",
    "Nakabira Ammah Kyanda",
    "Hanaya Mastula Kyamwine",
    "Raeesa Birungi Nalunkuma",
    "Eshan Raees Serunkuma",
    "Rahmah Nalutaaya",
    "Hassim Tawfeeq Kasigwa",
    "Ayana Rukia Kawuma",
    "Musa Francis Miiro",
    "Rania Nakate Buyinza",
    "Niram Zarika Nansamba",
    "Shasmeen Swamit Itaaga",
    "Fahiima Rukidi",
    "Shahid Mohammed Ssebatindira",
    "Asad Hashim Lutale",
    "Abdallah Junior kayondo Kiweewa",
    "Laika Kabanda Nantume",
    "Rania Fatima Atuhaire",
    "Aaliyah Letasi Dongo",
    "Salman Noman Serunkuma",
    "Rayhan Tendo Kyambadde",
    "Zimula Nairah",
    "Kiganda Abubakar",
    "Ammara Swabra Mulema",
    "Faizah Kawino Mawanda",
    "Kahunde Hanisha",
    "Ismael Juuko",
    "Qadhim Itaaga Mukiibi",
    "Tajweedah Sekajugo Nakyanzi",
    "Haira Nagujja",
    "Kauthar Hamba",
    "Waheedah Nalukwago Kyamundu",
    "Buthaynah Muneerah Kigozi",
    "Sanyu Sahla Kyeswa Mirembe",
    "Nakiryowa Mariam Zoya",
    "Fayan Mugasa",
    "Sayyid Swaib Okello",
    "Alson Eseosa Osakwe",
    "Luqman Jazeeb Rayyan",
    "Kisekka Ilan Taj",
    "Hatim Mbago",
    "Isaac Tasobya",
    "Hawa Lutfah Kalibakya",
    "Ashurah Namugerwa",
    "Ferdan Izy Bukenya",
    "Rehaan Salim Kizito",
    "Eshan Shambe Nsubuga",
    "Hibbatullah Nabiryo",
    "Haan Ahmed Mukungu",
    "Humairah Abdul Kemigisa",
    "Faisal Mutyaba",
    "Mariam Ali Hussein",
    "Amna Saeed Idris",
    "Abdulshaheed Ssekajja",
    "Muhammad Najib Seguya",
    "Anisa Rashid Nakitto",
    "Hamidah Farouk Kitaka",
    "Hatwiya Matovu Nakanwagi",
    "Najib Kajaya",
    "Abdul Salaam Tahleem Mwanje",
    "Husnah Ali Matovu",
    "Amiirah Farida Mayanja",
    "Amiirah Farida Mayanja",
    "Yusuf Aydin Kitunzi",
    "Kitibwa Moses Guloba",
    "Saidi Ahmed Rayan",
    "Kalanzi Amaal Kagera",
    "Ssali Adams Sewankambo",
    "Nansubuga Shaimah",
    "Namulondo Rochelle",
    "Sumaya Kaweesi",
    "Rabiah Husnah Mulungi",
    "Nakayinda Hadijah",
    "Lwoga Junior Muhammad",
    "Nakimwero Mariam",
    "Khalid Ramadhan Baiman Muyongi",
    "Abed Juma Salim",
    "Sabri Nasrullah Mubajje",
    "Hassan Saad Muziransa",
    "Juuko Hannah",
    "Amaani Mubarak Karama",
    "Nsibirwa Nasif",
    "Itaaga Shahnaaz Swamit",
    "Shakira Kyamwino",
    "Ssali Amjad",
    "Nawaz Hayyan Kaddu",
    "Kigozi Shuaib Diin",
    "Gimara Okello Laylah",
    "Mulindwa Uthman",
    "Namaganda Zaharah",
    "Tara Riziki Nsamba",
    "Ssebudde Tamir Abubakar",
    "Tadaaga Inayya Rakiib",
    "Asmah Tahseenah Rajab",
    "Flavia Nalujja",
    "Omar Bagonza",
    "Muhammad Galiwango",
    "Farid Kaliika",
    "Ajmal Bukenya",
    "Jaffar Bashirah Masika",
    "Rehan Rashid Gabula",
    "Asmaa Sserwadda Sarah",
    "Rayat Kirunda Mutesi",
    "Aisha Mulinde",
    "Kisekka Arkam",
    "Muhammad Ngoma",
    "Aiza Sembatya Lunkuse",
    "Kaheru Ali Loubna",
    "Rayan Sserunga",
    "Ganza Alpha Eman",
    "Matovu Bashir",
    "Abdul Aziz Akuma",
    "Raaji Muhammed Mukose",
    "Jibran Junior Magezi",
    "Hajarah Lutaaya",
    "Katende Nashimia",
    "Tahia Nassuna",
    "Rania Jethwa Sakeena",
    "Sidrah Ismail Nadirah",
    "Safina Namyalo",
    "Rafah Wadri Amin",
    "Heebah Ntume",
    "Gibril Mubiru",
    "Abdul Razak Mugumbu",
    "Maira Elias Busingye",
    "Imran Umar Mutale",
    "Mehran Naeem Kaddu",
    "Malkia Hamidah Ssemugabi",
    "Rahidah Kabugho",
    "Kiramba Sharif Muhammad",
    "Rashad Abdin Nsubuga",
    "Amaar Kirumira",
    "Hatim Kapchemut",
    "Ramadhan Sserunkuma",
    "Kahil Babu",
    "Maktoom Kateregga",
    "Abubaker Yiga",
    "Hytham Ibrahim Abedi Kawooya",
    "Hytham Ibrahim Abedi Kawooya",
    "Atiiqah Zawedde",
    "Nabakka Husnah",
    "Zaheer Abdul Latif",
    "Abdul Shahid Muhammad Kiyaga",
    "Hamza Yusuf Kabenge",
    "Hassan Adinan Wasswa",
    "Uthuman Fahad Buyungo",
    "Imran Kirunda",
    "Nasrullah Sserunjoji",
    "Nawaz Ramadhan Mubajje",
    "Nihla Muhoagya Ibrahim",
    "Falisha Mairah Mugasa",
    "Ssemanda Jashir",
    "Taj Farhan Abdulrahman",
    "Namagembe Fadhilah Bugembe",
    "Tariq Abdul Nasser",
    "Mutaasa Hassan",
    "Nakaddu Israh",
    "Kakembo Luqman",
    "Mbago Hydery Tendo",
    "Mawanda Riaz",
    "Chille Adam Amani",
    "Tariq Matovu Ahmed",
    "Atika Matovu Nalubega",
    "Abdul Rahim Abraham obella Okanya",
    "Nkinzi Mumina",
    "Ssebudde Shumairah Mwajjuma",
    "Kaweesa Musa Myles",
    "Jasmine Kaitesi Kalangwa",
    "Imran Feisal",
    "Hashib Ssebidde",
    "Tadaaga Ibtihal Rakiib",
    "Hayan Ssenfuka",
    "Abdul Hakim Matovu",
    "Hajarah Nabatanzi",
    "Raul Kassim Roshan",
    "Hilal Ssentongo",
    "Sumayya Mariam Naluzze",
    "Moemen Muhammad Lugobe",
    "Sanyu Mirembe Suhayla",
    "Aliza Fatumah Najma",
    "Fatiah Nagutta",
    "Hashim Kasozi",
    "Hasheem Musa Ssenyange",
    "Nimrah Navvuga",
    "Hibatullah Buyondo",
    "Farzan Kawuma",
    "Hadijah Nalukwago",
    "Aliza Hana Ngoma",
    "Nashira Katende",
    "Imran Shukran Kyanda",
    "Isa Mwesigye",
    "Hadad Nsubuga",
    "Arham Segujja",
    "Ibrahim Juuko",
    "Yusuf Kaweesi",
    "Yahaya Ntale",
    "Tahsin Ssenfuka",
    "Swabrah Najjuma",
    "Aaliyah Muhiire",
    "Nahiyah Muhiire",
    "Faheem Owino",
    "Lana Gabula",
    "Alma Kisekka",
    "Thana Nazziwa",
    "Fahia Nakalembe",
    "Aalysha Nalumansi",
    "Lina Liana Kiggundu",
    "Mushawil Nuwagira",
    "Treasure Tumusiime",
    "Matovu Adinan",
    "Muhsin Bukenya",
    "Imran Elias",
    "Ali Imran Mugambwa",
    "Mujitaba Kisitu",
    "Imran Ssali",
    "Hytham Ibrahim Abedi Kawooya",
    "Atiiqah Zawedde",
    "Nabakka Husnah",
    "Zaheer Abdul Latif",
    "Abdul Shahid Muhammad Kiyaga",
    "Hamza Yusuf Kabenge",
    "Hassan Adinan Wasswa",
    "Uthuman Fahad Buyungo",
    "Imran Kirunda",
    "Nasrullah Sserunjoji",
    "Nawaz Ramadhan Mubajje",
    "Nihla Muhoagya Ibrahim",
    "Falisha Mairah Mugasa",
    "Ssemanda Jashir",
    "Taj Farhan Abdulrahman",
    "Namagembe Fadhilah Bugembe",
    "Tariq Abdul Nasser",
    "Mutaasa Hassan",
    "Nakaddu Israh",
    "Wasswa Abdulrahman Kiyingi",
    "Nahia Husna Nakuya",
    "Saidi Ibrahim",
    "Magezi Nihma",
    "Matongolo Abdallah",
    "Atwiine Ibrahim",
    "Kiyaga Muhammad Saifullah",
    "Hairah Newumbe Gift Sserunkuma",
    "Kakooza Jamil",
    "Umayma Sanyu Buyungo",
    "Sserunkuuma Alma",
    "Maboa Sekyondwa Sairish",
    "Naheem Ssenkaali",
    "Kaziba Mpaata Rayan",
    "Batoor Itaaga",
    "Ferwaaz Tahmeed Abdulrahman",
    "Ahlam Letasi Agele",
    "Abed Salim Abdallazak",
    "Nakyanzi Jannah",
    "Namulema Jalia",
    "Kikomeko Imran",
    "Naveen Heela Kaddu",
    "Kamulegeya Jadel Obeid",
    "Amirah Nakyoni",
    "Barigye Nicole",
    "Aisha Sembatya Najjemba",
    "Hudah Kakumba Nakalema",
    "Riaz Kyagulanyi",
    "Rayyan Hamba",
    "Aleena Ssonko",
    "Raidah Iman Nsubuga",
    "Zam Galiwango",
    "Simran Abraar Magezi",
    "Muhammad Saidi Mubiru",
    "Shafik Matovu",
    "Sophia Ageno",
    "Yusuf Haitham",
    "Imran Kasule",
    "Kirunda Ahmed",
    "Abdul Rahim Mulindwa",
    "Muhammad Katongole Ssempijja",
    "Jamal Basalirwa",
    "Hudah Khamis Adinan"

];


$subs = [];
foreach (Location::get_sub_counties_array() as $key => $value) {
    $subs[] =  $key;
}

$faker = Faker::create();
foreach ($names as $key => $name) {
    $c = new Candidate();
    $c->created_at = $faker->dateTimeBetween('-2 month', '+1 month');
    $c->dob = $faker->dateTimeBetween('-30 year', '-21 year');
    $c->passport_issue_date = $faker->dateTimeBetween('-2 year', '8 year');
    $c->passport_expiry = $faker->dateTimeBetween('-2 year', '8 year');
    $c->medical_date = $faker->dateTimeBetween('1 day', '30 day');
    $c->interpal_appointment_date = $faker->dateTimeBetween('2 day', '30 day');
    $c->training_start_date = $faker->dateTimeBetween('2 day', '30 day');
    $c->training_end_date = $faker->dateTimeBetween('2 day', '30 day');
    $c->depature_date = $faker->dateTimeBetween('2 day', '30 day');
    $c->name = $name;
    $names = explode(' ', $name);
    if (isset($names[0])) {
        $c->first_name = $names[0];
    }
    if (isset($names[1])) {
        $c->first_name = $names[1];
    }
    if (isset($names[2])) {
        $c->middle_name = $names[2];
    }
    $c->sex = ['Male', 'Female'][rand(0, 1)];
    $c->next_of_kin_releationship = ['Brother', 'Sister', 'Husband', 'Wife', 'Friend'][rand(0, 1)];
    $c->education_level = [
        'None',
        'Below primary',
        'Primary',
        'Secondary',
        'A-Level',
        'Bachelor',
        'Masters',
        'PhD',
    ][rand(0, 7)];

    $c->stage = [
        'Musaned',
        'Interpol',
        'Shared CV',
        'EMIS',
        'Training',
        'Ministry',
        'Enjaz',
        'Embasy',
        'Departure',
        'Traveled',
        'Failed',
    ][rand(0, 10)];
    $c->has_passport = ['Yes', 'No'][rand(0, 1)];
    $c->has_paid = ['Yes', 'No'][rand(0, 1)];
    $c->religion = ['Muslem', 'Christian', 'Other'][rand(0, 2)];
    $c->destination_country = ['Saudi Arabia', 'Dubai', 'Qatar'][rand(0, 2)];
    $c->job_type = ['House maid', 'Driver', 'Security'][rand(0, 2)];
    $c->account = ['Cash', 'Bank', 'Mobile Money'][rand(0, 2)];
    $c->phone_number = $faker->phoneNumber();
    $c->phone_number_2 = $faker->phoneNumber();
    $c->parent_mother_contact = $faker->phoneNumber();
    $c->parent_farther_contact = $faker->phoneNumber();
    $c->parent_mother_name = $faker->name('Female');
    $c->parent_farther_address = $faker->address();
    $c->parent_mother_address = $faker->address();
    $c->agent = $faker->name();
    $c->email = $faker->email();
    $c->village = $faker->address();
    $c->address = $faker->address();
    $c->weight = rand(50, 82);
    $c->height = rand(50, 82);
    $c->photo = rand(1, 20) . ".jpg";
    $c->skills = 'Cooking,Driving';
    $c->nin = 'CM' . rand(1000000, 100000000) . rand(1000000, 100000000);
    $c->passport_number = 'UG' . rand(1000000, 100000000);
    $c->parent_farther_name = $faker->name('M');
    $c->next_of_kin_name = $faker->name();
    $c->next_of_kin_contact = $faker->phoneNumber();
    $c->next_of_kin_address = $faker->address();
    $c->passport_copy = 'passport.jpg';
    $c->full_photo = 'full-photo.jpg';
    $c->registration_fee = '120000';
    $c->failed_reason = 'Reason to fail.';
    $c->medical_hospital = ['Hosptial 1', 'Hosptial 2'][rand(0, 1)];
    $c->medical_status = ['Yes', 'Failed'][rand(0, 1)];
    $c->musaned_status = ['Yes', 'Failed'][rand(0, 1)];
    $c->interpal_done = ['Yes', 'Failed'][rand(0, 1)];
    $c->interpal_status = ['Yes', 'Failed'][rand(0, 1)];
    $c->cv_sharing = ['Yes', 'Failed'][rand(0, 1)];
    $c->cv_shared_with_partners = ['Yes', 'Failed'][rand(0, 1)];
    $c->emis_upload = ['Yes', 'Failed'][rand(0, 1)];
    $c->on_training = ['Yes', 'Failed'][rand(0, 1)];
    $c->ministry_aproval = ['Yes', 'Failed'][rand(0, 1)];
    $c->enjaz_applied = ['Yes', 'Failed'][rand(0, 1)];
    $c->enjaz_status = ['Yes', 'Failed'][rand(0, 1)];
    $c->embasy_submited = ['Yes', 'Failed'][rand(0, 1)];
    $c->embasy_date_submited = ['Yes', 'Failed'][rand(0, 1)];
    $c->embasy_status = ['Yes', 'Failed'][rand(0, 1)];
    $c->depature_status = ['Yes', 'Failed'][rand(0, 1)];
    shuffle($subs);
    $c->subcounty_id = $subs[rand(1, 50)];
    $c->save();
    echo ($c->name . "<br>");
}


echo "<pre>";
die(); */


/* $g = Garden::find(1);
Garden::generate_protocols($g);

die("as"); */
/*  
Utils::importPwdsProfiles(Utils::docs_root().'/people.csv');
die();
  

foreach (Administrator::all() as $key => $as) {
    $as->avatar = 'images/u-'.rand(1,10).'.png';
    $as->save();
} */



$faker = Faker::create();
$name = [
    'Gulu Women with Disabilities Union (GUWODU)',
    'Kijura Disabled Women Association (KIDWA)',
    'SignHealth Uganda (SU)',
    'Spinal Injuries Association Uganda (SIA-U)',
    'The National Association of the Deafblind in Uganda',
    'Jinja District Association of the Blind (JDAB)',
    'Busia District Union of People with Disabilities (BUDIPD)',
    'Kabale Association of People with Disabilities (KAPD)',
    'National Union of Disabled Persons of Uganda (NUDIPU)',
    'The Organisation for Emancipation of the Disabled',
    'United Deaf Women Organisation (UDEWO)',
    'Uganda Albinos Association',
    'Action for Youth with Disabilities Uganda (AYDU)',
    'Action on Disability& Development (ADD) International',
    'Masaka Disabled People Living with HIV/AIDS Association',
    'Uganda Parents with Deaf-Blind Association',
    'Comprehensive Rehabilitation Services in Uganda (CORSU)',
    'Uganda Persons with Disabilities Development Advocacy',
    'Youth and Persons with Disability (s) Integrated Development',
    'Uganda Landmine Survivors Association (ULSA)',
    'Sense International Uganda',
    'Masindi District People with Disability Union (MADIPHU)',
    'Save Children with Disabilities',
    'Youth with Physical Disability Development Forum',
    'Katalemwa Cheshire Home for Rehabilitation Services',
];
$address = [
    'P.O Box 249, Gulu,Pawel Road, Opposite SOS children, Gulu',
    'P.O Box 36563, Kampala,Plot 99, Ntinda-Nakawa Road, Kampala, Kampala, Uganda',
    'P.O Box 1611 Wandegeya,Metal Health Uganda Office , Kampala',
    'P.O Box 379 Jinja ,JDAB offices, Mufubria subconty-Kumuli Road, Jinja',
    'P.O Box 124 Busia,District headquarters (District union office), Busia',
    'P.O Box 774 Kabale,District Headquarters near Education Department, Kabale',
];
$subs = [];
foreach (Location::get_sub_counties_array() as $key => $value) {
    $subs[] =  $key;
}
/*  
foreach ($name as $key => $value) {
    $as = new Association();
    shuffle($subs);
    shuffle($subs);
    shuffle($address);
    shuffle($address);
    shuffle($address);
    $as->administrator_id = 1;
    $as->name = $value;
    $as->members = rand(50,1000);
    $as->parish = 'Nyamambuka II';
    $as->status = 'Approved';
    $as->village = 'Bwera';
    $as->vision = 'Simple vision of this association';
    $as->mission = 'Simple mission of this association';
    $as->phone_number = '+256706638494';
    $as->phone_number_2 = '+256793204665';
    $as->email = 'test-maiil@gmail.com';
    $as->website = 'http://www.test-ste.com';
    $as->address = $address[2];
    $as->subcounty_id = $subs[15];
    $as->gps_latitude = '0.36532221688073396';
    $as->gps_longitude = '32.606444250275224';
    $as->photo = 'images/l-'.rand(1,10).'.png';
    $as->about = 'P.O Box 249, Gulu,Pawel Road, Opposite SOS children, Gulu The organization was founded by a group of disabled women. Initially, the group was called Makmatic. It was established to prevent discrimination, violence or abuse of women and girls with disabilities and empower them economically, socially and politically to have a dignified life. Vision Women and girls with disabilities able to unite, organize, manage and empowered to affirm their human rights and freedoms in a dignified mannerObjectives';

    $as->save();  
} */

$ass = [];

$groups = [];
foreach (Group::all() as $key => $ass) {
    $groups[] = $ass->id;
}

/*  

foreach (Association::all() as $key => $ass) {

    $max = rand(2,10);
    for ($i = 1; $i < $max; $i++) {
        shuffle($address);
        shuffle($subs);
        shuffle($address);
        $c = new Group();
        $c->name = 'Group '.$i;
        $c->leader = 'M. Muhindo';
        $c->association_id = $ass->id;
        $c->address = $address[2];
        $c->parish = 'Test parish';
        $c->village = 'Test parish';
        $c->phone_number = '+256706638494';
        $c->phone_number_2 = '+256793204665';
        $c->email = 'muhindo@gmail.com';
        $c->subcounty_id = $subs[15]; 
        $c->members = rand(100,1000); 
        $c->started = Carbon::now(); 
        $c->save(); 
    }
}










deleted_at

*/