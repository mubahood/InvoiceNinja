<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use SplFileObject;

class Utils extends Model
{
    use HasFactory;

    /* 
/* 

Full texts
id	
created_at	
updated_at	
association_id	
group_id	
name	
address	
parish	
village	
phone_number	
email		
subcounty_id	
	
phone_number_2	
dob	
sex	
	 
	
caregiver_sex	
caregiver_phone_number	
caregiver_age	
caregiver_relationship	
photo	
deleted_at	
status	
administrator_id	
	
*/

    /* 
  
[] => 
[9] => RELATIONSHIP WITH CAREGIVER
[] => District
*/


    public static function importPwdsProfiles($path)
    {
        $csv = new SplFileObject($path);
        $csv->setFlags(SplFileObject::READ_CSV);
        //$csv->setCsvControl(';');  //separator change if you need
        set_time_limit(-1); // Time in seconds
        $disability_description = [];
        $cats = [];
        $isFirst  = true;
        foreach ($csv as $line) {
            if ($isFirst) {
                $isFirst = false;
                continue;
            }

            $name = $line[0];
            $user = Person::where(['name' => $name])->first();
            if ($user == null) {
                continue;
            }
            $user->district_id = 88;
            $user->parish .= 1;
            $user->save();
            continue;



            /* if ((Person::count('id') >= 3963)) {
                die("done");
            } */

            $p = new Person();
            $p->name = 'N/A';



            $p->subcounty_description = null;
            if (
                isset($line[10]) &&
                $line[10] != null &&
                strlen($line[10]) > 2
            ) {
                $dis = $line[10];
                $_dis = Location::where(
                    'name',
                    'LIKE',
                    '%' . $dis . '%'
                )->first();
                if ($_dis != null) {
                    $p->district_id = $_dis->id;
                } else {
                    $p->district_id = 1002006;
                }
            }


            $p->subcounty_description = null;
            if (
                isset($line[8]) &&
                $line[8] != null &&
                strlen($line[8]) > 1
            ) {
                $p->dob = $line[8];
            }

            $p->subcounty_description = null;
            if (
                isset($line[7]) &&
                $line[7] != null &&
                strlen($line[7]) > 3
            ) {
                $p->caregiver_name = $line[7];
                $p->has_caregiver = 'Yes';
            } else {
                $p->has_caregiver = 'No';
            }

            $p->subcounty_description = null;
            if (
                isset($line[4]) &&
                $line[4] != null &&
                strlen($line[4]) > 3
            ) {
                $p->disability_description = $line[4];
            }

            $p->education_level = null;
            if (
                isset($line[5]) &&
                $line[5] != null &&
                strlen($line[5]) > 1
            ) {
                //$p->education_level = $line[5];
            }

            $p->job = null;
            if (
                isset($line[6]) &&
                $line[6] != null &&
                strlen($line[6]) > 1
            ) {
                $p->employment_status = 'Yes';
                $p->job = $line[6];
            } else {
                $p->employment_status = 'No';
            }

            if (
                isset($line[0]) &&
                $line[0] != null &&
                strlen($line[0]) > 2
            ) {
                $p->name = trim($line[0]);
            }

            $p->sex = 'N/A';
            if (
                isset($line[1]) &&
                $line[1] != null &&
                strlen($line[1]) > 0
            ) {
                if (strtolower(substr($line[0], 0, 1)) == 'm') {
                    $p->sex = 'Male';
                } else {
                    $p->sex = 'Female';
                }
            }

            $p->phone_number = null;
            if (
                isset($line[2]) &&
                $line[2] != null &&
                strlen($line[2]) > 5
            ) {
                $p->phone_number = Utils::prepare_phone_number($line[2]);
            }

            if (
                isset($line[3]) &&
                $line[3] != null &&
                strlen($line[3]) > 2
            ) {
                $cat =  trim(strtolower($line[3]));

                if (in_array($cat, [
                    'epilepsy'
                ])) {
                    $p->disability_id = 1;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'visual',
                    'visual impairment',
                    'deaf-blind',
                    'visual disability',
                    'visual impairmrnt',
                    'blind',
                ])) {
                    $p->disability_id = 2;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'deaf',
                    'epileosy/hard of speach',
                    'hard of hearing',
                    'hearing impairment',
                    'deaf blindness',
                    'hearing impairment',
                    'deaf-blind',
                    'youth rep (deaf )',
                    'deaf rep',
                    'deaf rep.',
                    'deaf',
                    'deafblind',
                ])) {
                    $p->disability_id = 3;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'visual disabilty',
                    "low vision",
                    "visual",
                    "visual impairment",
                ])) {
                    $p->disability_id = 4;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'intellectual disability',
                    'mental disabilty',
                    'mental disability',
                    'intellectual',
                    'interlectual',
                    'parent with interlectual',
                    'interlectual rep.',
                    'cerebral pulse',
                    'mental',
                    'mental retardation',
                    'mental health',
                    'mental illness',
                ])) {

                    $p->disability_id = 5;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'epileptic',
                    'parent with children with intellectual disability',
                    'brain injury',
                    'spine damage',
                    'epilipsy',
                    'person with epilepsy',
                    'epilepsy',
                    'hydrosphlus',
                    'epilpesy',
                    'celebral palsy',
                    'women rep .celebral palsy',
                ])) {

                    $p->disability_id = 6;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'physical',
                    'parent',
                    'physical  disability',
                    'physical disability',
                    'physical disabbility',
                    'physical disabilty',
                    'pyhsical disability',
                    'physical didability',
                    'physical diability',
                    'physical impairment',
                    'male',
                    'amputee',
                    'sickler',
                    'physical',
                    'physical impairment',
                    'parent rep',
                    'women rep.',
                    'youth rep',
                    'parent rep.',
                    'parent  rep.',
                    'parent',
                    'youth rep,',
                    'women rep',
                    'youth rep.',
                ])) {
                    $p->disability_id = 7;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'albino',
                    'albinism',
                    'person with albinism',
                    'albism',
                    'albino',
                    'albinsim',
                    'albinism',
                ])) {
                    $p->disability_id = 8;
                    $p->disability_description = $line[3];
                } elseif (in_array($cat, [
                    'little person',
                    'littleperson',
                    'liitleperson',
                    'liittleperson',
                    'little person',
                    'dwarfism',
                    'persons of short stature (little persons)',
                ])) {
                    $p->disability_id = 9;
                    $p->disability_description = $line[3];
                } else {
                    $p->disability_id = 7;
                    $p->disability_description = $line[3];
                }
            } else {
                $p->disability_id = 6;
                $p->disability_description = 'Other';
            }

            $p->subcounty_description = null;
            if (
                isset($line[2]) &&
                $line[2] != null &&
                strlen($line[2]) > 5
            ) {
                $p->phone_number = Utils::prepare_phone_number($line[2]);
            }

            $_p = Person::where(['name' => $p->name, 'district_id' => $p->district_id])->first();
            if ($_p != null) {
                echo "FOUND => $_p->name<=========<hr>";
                continue;
            }

            try {
                $p->save();
                echo $p->id . ". " . $p->name . "<hr>";
            } catch (\Throwable $th) {
                echo $th;
                echo "failed <br>";
            }
        }

        dd($disability_description);
        echo "done! with $p->id <pre>";
        die('');

        dd($path);
    }





    public static function phone_number_is_valid($phone_number)
    {
        $phone_number = Utils::prepare_phone_number($phone_number);
        if (substr($phone_number, 0, 4) != "+256") {
            return false;
        }

        if (strlen($phone_number) != 13) {
            return false;
        }

        return true;
    }
    public static function prepare_phone_number($phone_number)
    {
        $original = $phone_number;
        //$phone_number = '+256783204665';
        //0783204665
        if (strlen($phone_number) > 10) {
            $phone_number = str_replace("+", "", $phone_number);
            $phone_number = substr($phone_number, 3, strlen($phone_number));
        } else {
            if (substr($phone_number, 0, 1) == "0") {
                $phone_number = substr($phone_number, 1, strlen($phone_number));
            }
        }
        if (strlen($phone_number) != 9) {
            return $original;
        }
        return "+256" . $phone_number;
    }



    public static function docs_root()
    {
        $r = $_SERVER['DOCUMENT_ROOT'] . "";

        if (!str_contains($r, 'home/')) {
            $r = str_replace('/public', "", $r);
            $r = str_replace('\public', "", $r);
        }

        if (!(str_contains($r, 'public'))) {
            $r = $r . "/public";
        }


        /* 
         "/home/ulitscom_html/public/storage/images/956000011639246-(m).JPG
        
        public_html/public/storage/images
        */
        return $r;
    }

    public static function upload_images_2($files, $is_single_file = false)
    {

        ini_set('memory_limit', '-1');
        if ($files == null || empty($files)) {
            return $is_single_file ? "" : [];
        }
        $uploaded_images = array();
        foreach ($files as $file) {

            if (
                isset($file['name']) &&
                isset($file['type']) &&
                isset($file['tmp_name']) &&
                isset($file['error']) &&
                isset($file['size'])
            ) {
                $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
                $file_name = time() . "-" . rand(100000, 1000000) . "." . $ext;
                $destination = Utils::docs_root() . '/storage/images/' . $file_name;

                $res = move_uploaded_file($file['tmp_name'], $destination);
                if (!$res) {
                    continue;
                }
                //$uploaded_images[] = $destination;
                $uploaded_images[] = $file_name;
            }
        }

        $single_file = "";
        if (isset($uploaded_images[0])) {
            $single_file = $uploaded_images[0];
        }


        return $is_single_file ? $single_file : $uploaded_images;
    }






    public static function checkEventRegustration()
    {
        return true;
        $u = Admin::user();
        if ($u == null) {
            return;
        }

        if (!$u->complete_profile) {
            return;
        }

        $ev = EventBooking::where(['administrator_id' => $u->id, 'event_id' => 1])->first();
        if ($ev != null) {
            return;
        }


        $btn = '<a class="btn btn-lg btn-primary" href="' . admin_url('event-bookings/create?event=1') . '" >BOOK A SEAT</a>';
        admin_info(
            'NOTICE: IUIU-ALUMNI GRAND DINNER - 2023',
            "Dear {$u->name}, there is an upcoming IUIUAA Grand dinner that will take place on 10th FEB, 2023.
        Please this form to apply for your ticket now! {$btn}"
        );
    }
    public static function system_boot()
    {
        foreach ($r = Candidate::where([
            'name' => null
        ])->get() as $key => $value) {
            $value->name = $value->first_name . " " . $value->middle_name . " " . $value->last_name;
            $value->save();
        }
        $u = Admin::user();

        if ($u != null) {
            $r = AdminRoleUser::where([
                'user_id' => $u->id
            ])->first();
            if ($r == null) {
                $role = new AdminRoleUser();
                $role->user_id = $u->id;
                $role->role_id = 2;
                $role->save();
            }
        }
    }

    public static function start_session()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }



    public static function month($t)
    {
        $c = Carbon::parse($t);
        if ($t == null) {
            return $t;
        }
        return $c->format('M - Y');
    }
    public static function my_day($t)
    {
        $c = Carbon::parse($t);
        if ($t == null) {
            return $t;
        }
        return $c->format('d M');
    }


    public static function my_date_1($t)
    {
        $c = Carbon::parse($t);
        if ($t == null) {
            return $t;
        }
        return $c->format('D - d M');
    }

    public static function my_date($t)
    {
        $c = Carbon::parse($t);
        if ($t == null) {
            return $t;
        }
        return $c->format('d M, Y');
    }

    public static function my_date_time($t)
    {
        $c = Carbon::parse($t);
        if ($t == null) {
            return $t;
        }
        return $c->format('d M, Y - h:m a');
    }

    public static function to_date_time($raw)
    {
        $t = Carbon::parse($raw);
        if ($t == null) {
            return  "-";
        }
        $my_t = $t->toDateString();

        return $my_t . " " . $t->toTimeString();
    }
    public static function number_format($num, $unit)
    {
        $num = (int)($num);
        $resp = number_format($num);
        if ($num < 2) {
            $resp .= " " . $unit;
        } else {
            $resp .= " " . Str::plural($unit);
        }
        return $resp;
    }





    public static function COUNTRIES()
    {
        $data = [];
        foreach ([
            '',
            "Uganda",
            "Somalia",
            "Nigeria",
            "Tanzania",
            "Kenya",
            "Sudan",
            "Rwanda",
            "Congo",
            "Afghanistan",
            "Albania",
            "Algeria",
            "American Samoa",
            "Andorra",
            "Angola",
            "Anguilla",
            "Antarctica",
            "Antigua and Barbuda",
            "Argentina",
            "Armenia",
            "Aruba",
            "Australia",
            "Austria",
            "Azerbaijan",
            "Bahamas",
            "Bahrain",
            "Bangladesh",
            "Barbados",
            "Belarus",
            "Belgium",
            "Belize",
            "Benin",
            "Bermuda",
            "Bhutan",
            "Bolivia",
            "Bosnia and Herzegovina",
            "Botswana",
            "Bouvet Island",
            "Brazil",
            "British Indian Ocean Territory",
            "Brunei Darussalam",
            "Bulgaria",
            "Burkina Faso",
            "Burundi",
            "Cambodia",
            "Cameroon",
            "Canada",
            "Cape Verde",
            "Cayman Islands",
            "Central African Republic",
            "Chad",
            "Chile",
            "China",
            "Christmas Island",
            "Cocos (Keeling Islands)",
            "Colombia",
            "Comoros",
            "Cook Islands",
            "Costa Rica",
            "Cote D'Ivoire (Ivory Coast)",
            "Croatia (Hrvatska",
            "Cuba",
            "Cyprus",
            "Czech Republic",
            "Denmark",
            "Djibouti",
            "Dominica",
            "Dominican Republic",
            "East Timor",
            "Ecuador",
            "Egypt",
            "El Salvador",
            "Equatorial Guinea",
            "Eritrea",
            "Estonia",
            "Ethiopia",
            "Falkland Islands (Malvinas)",
            "Faroe Islands",
            "Fiji",
            "Finland",
            "France",
            "France",
            "Metropolitan",
            "French Guiana",
            "French Polynesia",
            "French Southern Territories",
            "Gabon",
            "Gambia",
            "Georgia",
            "Germany",
            "Ghana",
            "Gibraltar",
            "Greece",
            "Greenland",
            "Grenada",
            "Guadeloupe",
            "Guam",
            "Guatemala",
            "Guinea",
            "Guinea-Bissau",
            "Guyana",
            "Haiti",
            "Heard and McDonald Islands",
            "Honduras",
            "Hong Kong",
            "Hungary",
            "Iceland",
            "India",
            "Indonesia",
            "Iran",
            "Iraq",
            "Ireland",
            "Israel",
            "Italy",
            "Jamaica",
            "Japan",
            "Jordan",
            "Kazakhstan",

            "Kiribati",
            "Korea (North)",
            "Korea (South)",
            "Kuwait",
            "Kyrgyzstan",
            "Laos",
            "Latvia",
            "Lebanon",
            "Lesotho",
            "Liberia",
            "Libya",
            "Liechtenstein",
            "Lithuania",
            "Luxembourg",
            "Macau",
            "Macedonia",
            "Madagascar",
            "Malawi",
            "Malaysia",
            "Maldives",
            "Mali",
            "Malta",
            "Marshall Islands",
            "Martinique",
            "Mauritania",
            "Mauritius",
            "Mayotte",
            "Mexico",
            "Micronesia",
            "Moldova",
            "Monaco",
            "Mongolia",
            "Montserrat",
            "Morocco",
            "Mozambique",
            "Myanmar",
            "Namibia",
            "Nauru",
            "Nepal",
            "Netherlands",
            "Netherlands Antilles",
            "New Caledonia",
            "New Zealand",
            "Nicaragua",
            "Niger",
            "Niue",
            "Norfolk Island",
            "Northern Mariana Islands",
            "Norway",
            "Oman",
            "Pakistan",
            "Palau",
            "Panama",
            "Papua New Guinea",
            "Paraguay",
            "Peru",
            "Philippines",
            "Pitcairn",
            "Poland",
            "Portugal",
            "Puerto Rico",
            "Qatar",
            "Reunion",
            "Romania",
            "Russian Federation",
            "Saint Kitts and Nevis",
            "Saint Lucia",
            "Saint Vincent and The Grenadines",
            "Samoa",
            "San Marino",
            "Sao Tome and Principe",
            "Saudi Arabia",
            "Senegal",
            "Seychelles",
            "Sierra Leone",
            "Singapore",
            "Slovak Republic",
            "Slovenia",
            "Solomon Islands",

            "South Africa",
            "S. Georgia and S. Sandwich Isls.",
            "Spain",
            "Sri Lanka",
            "St. Helena",
            "St. Pierre and Miquelon",
            "Suriname",
            "Svalbard and Jan Mayen Islands",
            "Swaziland",
            "Sweden",
            "Switzerland",
            "Syria",
            "Taiwan",
            "Tajikistan",
            "Thailand",
            "Togo",
            "Tokelau",
            "Tonga",
            "Trinidad and Tobago",
            "Tunisia",
            "Turkey",
            "Turkmenistan",
            "Turks and Caicos Islands",
            "Tuvalu",
            "Ukraine",
            "United Arab Emirates",
            "United Kingdom (Britain / UK)",
            "United States of America (USA)",
            "US Minor Outlying Islands",
            "Uruguay",
            "Uzbekistan",
            "Vanuatu",
            "Vatican City State (Holy See)",
            "Venezuela",
            "Viet Nam",
            "Virgin Islands (British)",
            "Virgin Islands (US)",
            "Wallis and Futuna Islands",
            "Western Sahara",
            "Yemen",
            "Yugoslavia",
            "Zaire",
            "Zambia",
            "Zimbabwe"
        ] as $key => $v) {
            $data[$v] = $v;
        };
        return $data;
    }
}
