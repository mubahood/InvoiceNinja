<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Application;
use App\Models\Association;
use App\Models\Candidate;
use App\Models\Garden;
use App\Models\Group;
use App\Models\Invoice;
use App\Models\InvoiceItem;
use App\Models\Location;
use App\Models\Person;
use App\Models\Product;
use App\Models\Renting;
use App\Models\Room;
use App\Models\Tenant;
use App\Models\TenantPayment;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Auth;
use SplFileObject;

class HomeController extends Controller
{
    public function index(Content $content)
    {

        /* 
        $names = [
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
            "Osman Ramathan Kambo"
        ];

        $faker = Faker::create();
        for ($i = 0; $i < 100; $i++) {
            $ap = new Application();
            $date = new Carbon();
            $date->subDays(rand(1, 100));
            $ap->updated_at = $date;
            $ap->registry = $names[rand(0, count($names) - 1)];
            $ap->application_number = $faker->randomNumber(5);
            $ap->year = $faker->year();
            $ap->respondent = $names[rand(0, count($names) - 1)];
            $ap->applicant_name = $names[rand(0, count($names) - 1)];
            $ap->nature_of_business = $faker->sentence(3);
            $ap->postal_address = $faker->address();
            $ap->physical_address = $faker->address();
            $ap->plot_number = $faker->randomNumber(5);
            $ap->street = $faker->streetName();
            $ap->village = $faker->streetName();
            $ap->telephone_number = $faker->phoneNumber();
            $ap->fax_number = $faker->phoneNumber();
            $ap->email = $faker->email();
            $ap->tin = $faker->randomNumber(5);
            $ap->income_tax_file_number = $faker->randomNumber(5);
            $ap->vat_number = $faker->randomNumber(5);
            $ap->tax_decision_office = $faker->randomNumber(5);
            $ap->tax_type = $faker->randomNumber(5);
            $ap->assessment_number = $faker->randomNumber(5);
            $ap->bill_of_entry = $faker->randomNumber(5);
            $ap->bank_payment = $faker->randomNumber(5);
            $ap->amount_of_tax = $faker->randomNumber(5);
            $ap->taxation_decision_date = $faker->date();
            $ap->statement_of_facts = $faker->sentence(3);
            $ap->decision_issue = $faker->sentence(3);
            $ap->list_of_books = $faker->sentence(3);
            $ap->witness_names = $faker->sentence(3);
            $ap->dated_at = $faker->date();
            $ap->sign = $faker->sentence(3);
            $ap->date_of_filling = $faker->date();
            $ap->sign1 = $faker->sentence(3);
            $ap->date2 = $faker->date();
            $ap->sign2 = $faker->sentence(3);
            $ap->stage = 'Pending';
            $ap->save(); 
        } 
 */

        $u = Auth::user();
        $content
            ->title('Tax Appeals Tribunal - Dashboard')
            ->description('Hello ' . $u->name . "!");

        //return $content;

        /* 
        $content->row(function (Row $row) {
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.dashboard-rooms', [
                    'rooms' => Room::all()
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.dashboard-tenants', [
                    'rooms' => Room::all(),
                    'tenants' => Tenant::all(),
                    'rentings' => Renting::all()
                ]));
            });
            $row->column(3, function (Column $column) {
                $min = new Carbon();
                $max = new Carbon();
                $max->subDays(0);
                $min->subDays((30));

                $column->append(view('widgets.dashboard-this-month', [
                    'rooms' => Room::whereBetween('created_at', [$min, $max])->get(),
                    'tenants' => Tenant::whereBetween('created_at', [$min, $max])->get(),
                    'rentings' => Renting::whereBetween('start_date', [$min, $max])->get(),
                    'payments' => TenantPayment::whereBetween('created_at', [$min, $max])->get()
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.dashboard-all-time', [
                    'rooms' => Room::all(),
                    'tenants' => Tenant::all(),
                    'rentings' => Renting::all(),
                    'payments' => TenantPayment::all()
                ]));
            });
        }); */

        $content->row(function (Row $row) {

            $row->column(3, function (Column $column) {
                $conditons = [
                    ['stage', '=', 'Pending'],
                ];
                if (Auth::user()->isRole('basic-user')) {
                    $conditons[] = ['user_id', '=', Auth::user()->id];
                }
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Pending',
                    'sub_title' => NULL,
                    'number' => number_format(Application::where($conditons)->count()),
                    'link' => 'applications?stage=Pending'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Waiting for Hearing',
                    'sub_title' => NULL,
                    'number' => number_format(Application::where('stage', 'Hearing')->count()),
                    'link' => 'applications?stage=Hearing'
                ]));
            });

            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Under Mediation',
                    'sub_title' => NULL,
                    'number' => number_format(Application::where('stage', 'Mediation')->count()),
                    'link' => 'applications?stage=Mediation'
                ]));
            });

            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => true,
                    'title' => 'In Court',
                    'sub_title' => NULL,
                    'number' => number_format(Application::where('stage', 'Court')->count()),
                    'link' => 'applications?stage=Court'
                ]));
            });
        });

        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(Dashboard::dashboard_members());
            });
            $row->column(3, function (Column $column) {
                $column->append(Dashboard::dashboard_events());
            });
            $row->column(3, function (Column $column) {
                $column->append(Dashboard::dashboard_news());
            });
        });


        return $content;
        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(view('widgets.by-categories', []));
            });
            $row->column(6, function (Column $column) {

                $column->append(view('widgets.by-districts', []));
                // $column->append(Dashboard::dashboard_events());
            });
        });


        return $content;

        $u = Admin::user();


        $content->row(function (Row $row) {
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'New members',
                    'sub_title' => 'Joined 30 days ago.',
                    'number' => number_format(rand(100, 600)),
                    'link' => 'javascript:;'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Products & Services',
                    'sub_title' => 'All time.',
                    'number' => number_format(rand(1000, 6000)),
                    'link' => 'javascript:;'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Job oppotunities',
                    'sub_title' => rand(100, 400) . ' jobs posted 7 days ago.',
                    'number' => number_format(rand(1000, 6000)),
                    'link' => 'javascript:;'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => true,
                    'title' => 'System traffic',
                    'sub_title' => rand(100, 400) . ' mobile app, ' . rand(100, 300) . ' web browser.',
                    'number' => number_format(rand(100, 6000)),
                    'link' => 'javascript:;'
                ]));
            });
        });




        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(view('widgets.by-categories', []));
            });
            $row->column(6, function (Column $column) {
                $column->append(view('widgets.by-districts', []));
            });
        });



        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(Dashboard::dashboard_members());
            });
            $row->column(3, function (Column $column) {
                $column->append(Dashboard::dashboard_events());
            });
            $row->column(3, function (Column $column) {
                $column->append(Dashboard::dashboard_news());
            });
        });




        return $content;
        return $content
            ->title('Dashboard')
            ->description('Description...')
            ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
    }
}
