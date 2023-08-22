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

Route::get('form', [MainController::class, 'form'])->name('form');
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
    $landLord = \App\Models\Landload::find(request()->id);
    if ($landLord == null) {
        die("Landlord not found.");
    }
    $pdf = App::make('dompdf.wrapper');
    $rentings = Renting::all();
    $tenantsPayments = TenantPayment::all();
    $landlordPayments = LandloadPayment::all();
    $pdf->loadHTML(view('print/landlord-report', compact(
        'rentings',
        'tenantsPayments',
        'landlordPayments',
        'landLord'
    )));
    return $pdf->stream('landlord-report.pdf');
});


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

Route::get('print', function () {
    //return view('print/applicationnew');
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/applicationnew'));
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