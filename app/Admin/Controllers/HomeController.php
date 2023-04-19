<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Association;
use App\Models\Candidate;
use App\Models\Garden;
use App\Models\Group;
use App\Models\Location;
use App\Models\Person;
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



        $u = Auth::user();
        $content
            ->title('JobFlow - Dashboard')
            ->description('Hello ' . $u->name . "!");


        $content->row(function (Row $row) {
            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'MUSANED',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Musaned'])->count()),
                    'link' => 'musaned'
                ]));
            });
            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Interpol',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Interpol'])->count()),
                    'link' => 'interpol'
                ]));
            });
            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Shared CV',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Shared CV'])->count()),
                    'link' => 'shared-cvs'
                ]));
            });
            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'EMIS',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Emis'])->count()),
                    'link' => 'emis'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Training',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Training'])->count()),
                    'link' => 'training'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Ministry',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Ministry'])->count()),
                    'link' => 'ministry'
                ]));
            });
        });

        $content->row(function (Row $row) {

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Enjaz',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'enjaz'])->count()),
                    'link' => 'enjaz'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Embasy',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Embasy'])->count()),
                    'link' => 'embasy'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Departure',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Departure'])->count()),
                    'link' => 'ready-for-departure'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Traveled',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Traveled'])->count()),
                    'link' => 'traveled'
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'style' => 'danger',
                    'title' => 'Failed',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where(['stage' => 'Failed'])->count()),
                    'link' => 'failed' 
                ]));
            });

            $row->column(2, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => true,
                    'title' => 'All candidates',
                    'sub_title' => NULL,
                    'number' => number_format(Candidate::where([])->count()),
                    'link' => 'candidates'
                ]));
            });
        });


        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(Dashboard::dashboard_members());
            });
            $row->column(6, function (Column $column) {
                $column->append(view('widgets.by-categories', []));
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
