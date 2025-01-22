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


        $u = Auth::user();


        if ($u->isRole('basic-user')) {
            $draft = Application::where('user_id', $u->id)->where('stage', 'Draft')->first();
            if ($draft != null) {
                $url = url('applications/' . $draft->id . '/edit');
                admin_info('Alert', 'You have a draft application. <a href="' . $url . '">Click here to edit and submit the draft application</a>.');
            }
        }


        $content
            ->title('Tax Appeals Tribunal - Dashboard')
            ->description('Hello ' . $u->name . "!");

        $content->row(function (Row $row) {

            $u = Admin::user();

            if (
                $u->isRole('admin') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Pending';
                    $u = Admin::user();
                    if (!$u->isRole('admin')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Pending for review',
                        'sub_title' => 'Waiting for registry to review the application.',
                        'number' => number_format(Application::where($conditons)->count()),
                        'link' => 'applications-pending'
                    ]));
                });
            }

            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Defence';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'URA Defence',
                        'sub_title' => 'Waiting for URA to submit defence.',
                        'number' => number_format(Application::where($conditons)
                            ->where('has_ura_submitted_defence', '!=', 'Yes')
                            ->count()),
                        'link' => 'applications-defense?&has_ura_submitted_defence%5B%5D=No'
                    ]));
                });
            }

            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Defence';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Panel Allocation',
                        'sub_title' => 'Waiting for registry to allocate panel.',
                        'number' => number_format(Application::where($conditons)
                            ->where('has_ura_submitted_defence', '=', 'Yes')
                            ->count()),
                        'link' => 'applications-defense?&has_ura_submitted_defence%5B%5D=Yes'
                    ]));
                });
            }

            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('manager') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Scheduled';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Scheduled for conference',
                        'sub_title' => 'Applications scheduled for conference.',
                        'number' => number_format(Application::where($conditons)
                            ->count()),
                        'link' => 'applications-scheduled'
                    ]));
                });
            }


            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('manager') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Mention';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Mention',
                        'sub_title' => 'Applications under Mention.',
                        'number' => number_format(Application::where($conditons)
                            ->count()),
                        'link' => 'applications-mention'
                    ]));
                });
            }

            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('manager') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Hearing';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Hearing',
                        'sub_title' => 'Applications under Hearing.',
                        'number' => number_format(Application::where($conditons)
                            ->count()),
                        'link' => 'applications-hearing'
                    ]));
                });
            }

            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('manager') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Submission';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => false,
                        'title' => 'Submission',
                        'sub_title' => 'Applications under Submission.',
                        'number' => number_format(Application::where($conditons)
                            ->count()),
                        'link' => 'applications-submission'
                    ]));
                });
            }


            if (
                $u->isRole('admin') ||
                $u->isRole('ura') ||
                $u->isRole('manager') ||
                $u->isRole('basic-user')
            ) {
                $row->column(3, function (Column $column) {
                    $conditons['stage'] = 'Archived';
                    $u = Admin::user();
                    if (!$u->isRole('admin') && !$u->isRole('ura')) {
                        $conditons['user_id'] = $u->id;
                    }
                    $column->append(view('widgets.box-5', [
                        'is_dark' => true,
                        'title' => 'Archived',
                        'sub_title' => 'Completed applications.',
                        'number' => number_format(Application::where($conditons)
                            ->count()),
                        'link' => 'applications-archived'
                    ]));
                });
            }
        });

        $content->row(function (Row $row) {
            $row->column(6, function (Column $column) {
                $column->append(Dashboard::dashboard_members());
            });
            $row->column(6, function (Column $column) {

                $column->append(Dashboard::dashboard_calender());
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
    public function calendar(Content $content)
    {


        $u = Auth::user();
        $content
            ->title('Calendar');


        $content->row(function (Row $row) {

            $row->column(12, function (Column $column) {

                $column->append(Dashboard::dashboard_calender());
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
