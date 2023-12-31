<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\MainController;
use App\Http\Middleware\Authenticate;
use App\Http\Middleware\RedirectIfAuthenticated;
use App\Models\LandloadPayment;
use App\Models\Renting;
use App\Models\TenantPayment;
use App\Models\Utils;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;

Route::get('generate-class', [MainController::class, 'generate_class']);
Route::get('process-things', [Utils::class, 'process_things']);

Route::get('cv', function () {
    //return view('print/print-admission-letter');
    $pdf = App::make('dompdf.wrapper');
    //$pdf->setOption(['DOMPDF_ENABLE_REMOTE' => false]);

    //$pdf->loadHTML(view('print/print-admission-letter'));
    $pdf->loadHTML(view('print/cv'));
    return $pdf->stream();
});


Route::get('invoice', function () {
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/invoice'));
    return $pdf->stream();
});

//tenant receipts
Route::get('receipt', function () {
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/receipt'));
    return $pdf->stream();
});


Route::get('landlord-report', function () {

    $report = \App\Models\LandLordReport::find(request()->id);

    if ($report == null) {
        die("Report not found.");
    }

    $landLord = \App\Models\Landload::find($report->landload_id);
    if ($landLord == null) {
        die("Landlord not found.");
    }
    if ($landLord == null) {
        die("Landlord not found.");
    }

    //start_date
    //end_date
    $start_date = $report->start_date;
    $end_date = $report->end_date;
    $tenantPayments = TenantPayment::where([
        'landload_id' => $landLord->id
    ])->whereBetween('created_at', [$start_date, $end_date])->get();

    $buldings = [];
    $buldings_ids = [];
    $total_income = 0;
    $total_commission = 0;
    $total_land_lord_disbashment = 0;
    $total_landlord_revenue = 0;

    foreach ($tenantPayments as $payment) {
        $total_income += $payment->amount;
        $total_commission += $payment->commission_amount;
        $total_landlord_revenue += $payment->landlord_amount;
        if (!in_array($payment->house_id, $buldings_ids)) {
            $buldings_ids[] = $payment->house_id;
            $buldings[] = $payment->house;
        }
    }



    $pdf = App::make('dompdf.wrapper');
    $rentings = Renting::where([
        'landload_id' => $landLord->id
    ])->orderBy('start_date', 'DESC')
        ->limit(25)
        ->get();


    $landlordPayments = LandloadPayment::where([
        'landload_id' => $landLord->id
    ])->orderBy('id', 'DESC')
        ->whereBetween('created_at', [$start_date, $end_date])
        ->get();

    $total_land_lord_disbashment = 0;
    foreach ($landlordPayments as $payment) {
        $total_land_lord_disbashment += $payment->amount;
    }

    $pdf->loadHTML(view('print/landlord-report', compact(
        'rentings',
        'landlordPayments',
        'landLord',
        'total_income',
        'buldings',
        'tenantPayments',
        'total_commission',
        'total_landlord_revenue',
        'total_land_lord_disbashment',
        'report',
        'start_date',
        'end_date'
    )));
    return $pdf->stream($landLord->name . '-report.pdf');
});
/* 
  "created_at" => "2023-06-30 11:17:43"
    "updated_at" => "2023-07-13 00:10:40"
    "house_id" => 6
    "tenant_id" => 4
    "start_date" => "2023-07-01"
    "end_date" => "2023-10-01 00:00:00"
    "number_of_months" => 3
    "discount" => 0
    "payable_amount" => 450000
    "balance" => -450000
    "is_in_house" => "Yes"
    "is_overstay" => "No"
    "remarks" => null
    "room_id" => 10
    "fully_paid" => "No"
    "landlord_amount" => 405000
    "commision_type" => "Percentage"
    "commision_type_value" => 10
    "commision_amount" => 45000
    "update_billing" => "No"
    "invoice_status" => "Active" 
    "invoice_as_been_billed" => "Yes"
*/

Route::get('quotation', function () {
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/quotation'));
    return $pdf->stream();
});

Route::get('delivery', function () {
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/delivery'));
    return $pdf->stream();
});


/*
Route::get('generate-variables', [MainController::class, 'generate_variables']); 
Route::get('/', [MainController::class, 'index'])->name('home');
Route::get('/about-us', [MainController::class, 'about_us']);
Route::get('/our-team', [MainController::class, 'our_team']);
Route::get('/news-category/{id}', [MainController::class, 'news_category']);
Route::get('/news-category', [MainController::class, 'news_category']);
Route::get('/news', [MainController::class, 'news_category']);
Route::get('/news/{id}', [MainController::class, 'news']);
Route::get('/members', [MainController::class, 'members']);
Route::get('/dinner', [MainController::class, 'dinner']);
Route::get('/ucc', function(){ return view('chair-person-message'); });
Route::get('/vision-mission', function(){ return view('vision-mission'); }); 
Route::get('/constitution', function(){ return view('constitution'); }); 
Route::get('/register', [AccountController::class, 'register'])->name('register');

Route::get('/login', [AccountController::class, 'login'])->name('login')
    ->middleware(RedirectIfAuthenticated::class);

Route::post('/register', [AccountController::class, 'register_post'])
    ->middleware(RedirectIfAuthenticated::class);

Route::post('/login', [AccountController::class, 'login_post'])
    ->middleware(RedirectIfAuthenticated::class);


Route::get('/dashboard', [AccountController::class, 'dashboard'])
    ->middleware(Authenticate::class);


Route::get('/account-details', [AccountController::class, 'account_details'])
    ->middleware(Authenticate::class);

Route::post('/account-details', [AccountController::class, 'account_details_post'])
    ->middleware(Authenticate::class);

Route::get('/logout', [AccountController::class, 'logout']);
 */