<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\MainController;
use App\Http\Middleware\Authenticate;
use App\Http\Middleware\RedirectIfAuthenticated;
use App\Models\Application;
use App\Models\LandloadPayment;
use App\Models\Renting;
use App\Models\TenantPayment;
use App\Models\User;
use App\Models\Utils;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('form', [MainController::class, 'form'])->name('form');
Route::get('auth/register', [MainController::class, 'register'])->name('form');
Route::get('generate-class', [MainController::class, 'generate_class']);
Route::get('process-things', [Utils::class, 'process_things']);

/* Route::post('auth/logina', function () {
    $username = request()->username;
    $password = request()->password;
    if ($username == null || strlen($username) < 1) {
        return redirect()->back()->withInput()->withErrors(['username' => 'username and password are required.']);
    }
    if ($password == null || strlen($password) < 1) {
        return redirect()->back()->withInput()->withErrors(['password' => 'username and password are required.']);
    }

    $acc = User::where('email', $username)->first();
    if ($acc == null) {
        $acc = User::where('phone_number', $username)->first();
    }
    if ($acc == null) {
        $acc = User::where('username', $username)->first();
    }
    if ($acc == null) {
        return redirect()->back()->withInput()->withErrors(['username' => 'Invalid username or password.']);
    }

    //attempt login
    if (Admin::attempt(['id' => $acc->id, 'password' => $password])) {
        $url = admin_url('');
        return redirect($url);
    } else {
        return redirect()->back()->withInput()->withErrors(['username' => 'Invalid password.']);
    }
}); */
Route::get('auth/login', function () {
    return view('auth/login');
});
Route::get('verification-mail-send', function () {
    Utils::start_session();
    $u = Admin::user();
    if ($u == null) {
        $_SESSION['my_error'] = 'You are not logged in.';
        $url = url('auth/login');
        return redirect($url);
    }
    $u = User::find($u->id);
    if ($u == null) {
        $_SESSION['my_error'] = 'User not found.';
        $url = url('auth/login');
        return redirect($url);
    }

    try {
        $u->sendEmailVerificationNotification();
    } catch (\Throwable $th) {
        $err = $th->getMessage();
        die("Failed to send email because: " . $err);
    }
    $url = url('verification-mail-sent');
    return redirect($url);
});

Route::get('verification-mail-sent', function () {
    Utils::start_session();
    return view('auth/verification-mail-sent');
});

Route::get('verification-mail-verify', function (Request $r) {
    Utils::start_session();
    $tok = $r->tok;
    if ($tok == null) {
        die("Token not found.");
    }
    $u = User::where('mail_verification_token', $tok)->first();
    if ($u == null) {
        die("User not found.");
    }

    $u->mail_verification_time = date('Y-m-d H:i:s');
    $u->mail_verification_token = null;
    $u->is_mail_verified = 'Yes';
    $u->save();
    $loggedInUser = Admin::user();
    if ($loggedInUser != null) {
        $admin_url = admin_url('');
        $message = 'You have successfully verified your email address.';
        $_SESSION['my_success'] = $message;
        return redirect($admin_url);
    }


    return view('auth/verification-mail-verify', [
        'email' => $u->email
    ]);
});
Route::get('mail-test', function () {

    $data['body'] = 'This should be the body of the <b>email</b>.';
    $data['data'] = $data['body'];
    $data['name'] = 'Hohn peter';
    $data['email'] = 'mubahood360@gmail.com';
    $data['subject'] = 'TAT UGANDA ' . ' - M-Omulimisa';

    Utils::mail_sender($data);
});
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

Route::get('print', function (Request $request) {
    $item = Application::find($request->id);
    if ($item == null) {
        die("Item not found.");
    }
    $pdf = App::make('dompdf.wrapper');
    $pdf->loadHTML(view('print/applicationnew', [
        'item' => $item
    ]));
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