<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    //$router->resource('/', RentingController::class); 
    $router->get('/', 'HomeController@index')->name('home');

    $router->resource('applications', ApplicationController::class);
    $router->resource('cases', ApplicationController::class);

    $router->resource('landloads', LandloadController::class);
    $router->resource('houses', HouseController::class);
    $router->resource('rooms', RoomController::class);
    $router->resource('tenants', TenantController::class);
    $router->resource('rentings', RentingController::class);
    $router->resource('landload-payments', LandloadPaymentController::class);
    $router->resource('tenant-payments', TenantPaymentController::class);
    $router->resource('districts', DistrictController::class);
    $router->resource('sub-counties', SubcountyController::class);

    //$router->resource('cases', CaseModelController::class);
    $router->resource('offences', OffenceController::class);


    $router->resource('quotations', QuotationController::class);
    $router->resource('invoices', InvoiceController::class);
    $router->resource('invoice-items', InvoiceItemController::class);
    $router->resource('deliveries', DeliveryController::class);


    /* ========================START OF NEW THINGS===========================*/
    $router->resource('candidates', CandidateController::class);
    $router->resource('musaned', MusanedController::class);
    $router->resource('interpol', InterpolController::class);
    $router->resource('shared-cvs', SharedCvController::class);
    $router->resource('emis', EmisUploadController::class);
    $router->resource('training', TrainingController::class);
    $router->resource('ministry', MinistryController::class);
    $router->resource('enjaz', EnjazController::class);
    $router->resource('embasy', SubmitedEmbasyController::class);
    $router->resource('ready-for-departure', ReadyForDepatureController::class);
    $router->resource('traveled', DepaturedController::class);
    $router->resource('failed', FailedController::class);

    $router->resource('crops', CropController::class);
    $router->resource('crop-protocols', CropProtocolController::class);
    $router->resource('gardens', GardenController::class);
    $router->resource('garden-activities', GardenActivityController::class);

    /* ========================END OF NEW THINGS=============================*/

    $router->resource('service-providers', ServiceProviderController::class);
    $router->resource('groups', GroupController::class);
    $router->resource('associations', AssociationController::class);
    $router->resource('people', PersonController::class);
    $router->resource('disabilities', DisabilityController::class);
    $router->resource('institutions', InstitutionController::class);
    $router->resource('counselling-centres', CounsellingCentreController::class);
    $router->resource('jobs', JobController::class);
    $router->resource('job-applications', JobApplicationController::class);

    $router->resource('course-categories', CourseCategoryController::class);
    $router->resource('courses', CourseController::class);
    $router->resource('settings', UserController::class);
    $router->resource('participants', ParticipantController::class);
    $router->resource('members', MembersController::class);
    $router->resource('post-categories', PostCategoryController::class);
    $router->resource('news-posts', NewsPostController::class);
    $router->resource('events', EventController::class);
    $router->resource('event-bookings', EventBookingController::class);
    $router->resource('products', ProductController::class);
    $router->resource('product-orders', ProductOrderController::class);
});
