<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Association;
use App\Models\Candidate;
use App\Models\Garden;
use App\Models\Group;
use App\Models\Invoice;
use App\Models\InvoiceItem;
use App\Models\Location;
use App\Models\Person;
use App\Models\Product;
use App\Models\StockItem;
use App\Models\Tool;
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
            ->title('EAGLE AIR ADMIN - Dashboard');


        $content->row(function (Row $row) {
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Quarantine In - Stock',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        StockItem::where([
                            'stage' => 'Quarantine In'
                        ])->sum('price')
                    ),
                    'link' => 'quarantine-in-store'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Bonded - Stock',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        StockItem::where([
                            'stage' => 'Bonded'
                        ])->sum('price')
                    ),
                    'link' => 'bonded-store'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Quarantine Out - Stock',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        StockItem::where([
                            'stage' => 'Quarantine Out'
                        ])->sum('price')
                    ),
                    'link' => 'quarantine-out-store'
                ]));
            });
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'All Stock',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        StockItem::where([])->sum('price')
                    ),
                    'link' => 'stock-items'
                ]));
            });
        });

        $content->row(function (Row $row) {
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Pending orders',
                    'sub_title' => NULL,
                    'number' => number_format(
                        Invoice::where(
                            'customer_address',
                            '!=',
                            'Completed'
                        )->where(
                            'customer_address',
                            '!=',
                            'Canceled'
                        )->count()
                    ),
                    'link' => 'invoices'
                ]));
            });

            $row->column(3, function (Column $column) {

                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'Expiring Parts',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        StockItem::where([
                            'monitor_expiry' => 'Yes',
                            'stage' => 'Bonded',
                        ])
                            ->whereDate(
                                'expiry_warning_date',
                                '<=',
                                Carbon::now()
                            )
                            ->sum('price')
                    ),
                    'link' => 'bonded-store'
                ]));
            });

            $row->column(3, function (Column $column) {
                $column->append(view('widgets.box-5', [
                    'is_dark' => false,
                    'title' => 'All Tool\'s Worth',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        Tool::where([])->sum('price')
                    ),
                    'link' => 'tools'
                ]));
            });

            $row->column(3, function (Column $column) {
                $tot = StockItem::where([])->sum('price') + Tool::where([])->sum('price');
                $column->append(view('widgets.box-5', [
                    'style' => 'danger',
                    'title' => 'NETWORTH',
                    'sub_title' => NULL,
                    'number' => "$" . number_format(
                        $tot
                    ),
                    'link' => 'javascript:;'
                ]));
            });
        });


        $content->row(function (Row $row) {
            $row->column(3, function (Column $column) {
                $column->append(view('widgets.position-changing', [
                    'items' => StockItem::where([
                        'monitor_position' => 'Yes'
                    ])
                        ->orderBy(
                            'next_monitor_position_date',
                            'desc'
                        )
                        ->limit(5)
                        ->get()
                ]));
            });
            $row->column(3, function (Column $column) {
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
