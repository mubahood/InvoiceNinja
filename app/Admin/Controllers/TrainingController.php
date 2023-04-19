<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\BatchReadyForMinistry;
use App\Admin\Actions\Post\BatchReadyForTraining;
use App\Admin\Actions\Post\FailedBatch;
use App\Models\Candidate;
use App\Models\Location;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TrainingController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Training';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Candidate());
        $grid->disableCreation();

        $grid->batchActions(function ($batch) {
            $batch->add(new BatchReadyForMinistry());
            $batch->add(new FailedBatch);
        });


        $grid->quickSearch('name')->placeholder('Search by name');

        $grid->model()
            ->where([
                'stage' => 'Training'
            ])->orderBy('id', 'desc');



        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Registered'))
            ->display(function ($x) {
                return Utils::my_date_1($x);
            })
            ->sortable();

        $grid->column('photo', __('Photo'))
            ->display(function ($avatar) {
                $img = url("storage/" . $avatar);
                $link = admin_url('members/' . $this->id);
                return '<a href=' . $link . ' title="View profile"><img class="img-fluid " style="border-radius: 10px;"  src="' . $img . '" ></a>';
            })
            ->width(80)
            ->sortable();
        $grid->column('full_photo', __('full photo'))
            ->display(function ($avatar) {
                $img = url("storage/" . $avatar);
                $link = admin_url('members/' . $this->id);
                return '<a href=' . $link . ' title="View profile"><img class="img-fluid " style="border-radius: 10px;"  src="' . $img . '" ></a>';
            })
            ->width(80)
            ->hide()
            ->sortable();
        $grid->column('name', __('Name'))
            ->display(function () {
                return $this->first_name . " " . $this->last_name;
            })
            ->sortable();
        $grid->column('first_name', __('First name'))->hide();
        $grid->column('middle_name', __('Middle name'))->hide();
        $grid->column('sex', __('Sex'))->filter([
            'Male' => 'Male',
            'Female' => 'Female',
        ])->sortable();
        $grid->column('last_name', __('Last name'))->hide();
        $grid->column('dob', __('D.O.B'))->display(function ($x) {
            return Utils::my_date_1($x);
        })->hide();
        $grid->column('phone_number', __('Phone number'))->hide();
        $grid->column('email', __('Email'))->hide();
        $grid->column('district_id', __('District id'))->hide();
        $grid->column('subcounty_id', __('Subcounty'))
            ->display(function ($x) {
                if ($this->sub == null) {
                    return $x;
                }
                return $this->sub->name_text;
            })->hide();
        $grid->column('nin', __('NIN'))->hide();
        $grid->column('village', __('Village'))->hide();
        $grid->column('address', __('Address'))->hide();
        $grid->column('phone_number_2', __('Phone number 2'))->hide();
        $grid->column('weight', __('Weight'))->hide();
        $grid->column('height', __('Height'))->hide();
        $grid->column('religion', __('Religion'))->hide();
        $grid->column('agent', __('Agent'))->hide();
        $grid->column('has_passport', __('Has Passport'))
            ->filter([
                'Yes' => 'Yes',
                'No' => 'No',
            ])->hide();
        $grid->column('passport_number', __('Passport number'))->hide();
        $grid->column('passport_issue_date', __('Passport issue date'))->hide();
        $grid->column('passport_expiry', __('Passport expiry'))->hide()->sortable();
        $grid->column('education_level', __('Education level'))->hide()->sortable();
        $grid->column('skills', __('Skills'))->hide();
        $grid->column('parent_farther_name', __('Father name'))->hide();
        $grid->column('parent_farther_contact', __('Father contact'))->hide();
        $grid->column('parent_farther_address', __('Parent father address'))->hide();
        $grid->column('parent_mother_name', __('Mother name'))->hide();
        $grid->column('parent_mother_contact', __('Mother contact'))->hide();
        $grid->column('parent_mother_address', __('Mother address'))->hide();
        $grid->column('next_of_kin_releationship', __('Next of kin releationship'))->hide();
        $grid->column('next_of_kin_name', __('Next of kin name'))->hide();
        $grid->column('next_of_kin_contact', __('Next of kin contact'))->hide();
        $grid->column('next_of_kin_address', __('Next of kin address'))->hide();

        $grid->column('passport_copy', __('Passport copy'))
            ->display(function ($avatar) {
                $img = url("storage/" . $avatar);
                $link = admin_url('members/' . $this->id);
                return '<a href=' . $link . ' title="View profile"><img class="img-fluid " style="border-radius: 10px;"  src="' . $img . '" ></a>';
            })
            ->hide()
            ->width(80)
            ->sortable();

        $grid->column('registration_fee', __('Registration fee'))->hide();
        $grid->column('account', __('Account'))->hide();
        $grid->column('destination_country', __('Destination country'))->sortable();
        $grid->column('job_type', __('Job type'))->hide();
        $grid->column('has_paid', __('Has paid'))->filter([
            'Yes' => 'Yes',
            'No' => 'No',
        ])->hide();
        $grid->column('stage', __('Stage'))->sortable();

        $grid->column('medical_hospital', __('Medical hospital'))->hide();
        $grid->column('medical_date', __('Medical date'))->hide();
        $grid->column('medical_status', __('Medical status'))->hide();
        $grid->column('musaned_status', __('Musaned status'))->hide();
        $grid->column('failed_reason', __('Failed reason'))->hide();
        $grid->column('interpal_appointment_date', __('Interpal Appointment Date'))->sortable();
        $grid->column('interpal_done', __('Interpal done'))->hide();
        $grid->column('interpal_status', __('Interpal status'))->hide();
        $grid->column('cv_sharing', __('Cv sharing'))->hide();
        $grid->column('cv_shared_with_partners', __('Cv shared with partners'))->hide();
        $grid->column('emis_upload', __('Emis upload'))->hide();
        $grid->column('on_training', __('On training'))->hide();
        $grid->column('training_start_date', __('Training start date'));
        $grid->column('training_end_date', __('Training end date'));
        $grid->column('ministry_aproval', __('Ministry aproval'))->hide();
        $grid->column('enjaz_applied', __('Enjaz applied'))->hide();
        $grid->column('enjaz_status', __('Enjaz status'))->hide();
        $grid->column('embasy_submited', __('Embasy submited'))->hide();
        $grid->column('embasy_date_submited', __('Embasy date submited'))->hide();
        $grid->column('embasy_status', __('Embasy status'))->hide();
        $grid->column('depature_status', __('Depature status'))->hide();
        $grid->column('depature_date', __('Depature date'))->hide();
        $grid->column('depature_comment', __('Depature comment'))->hide();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Candidate::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('name', __('Name'));
        $show->field('first_name', __('First name'));
        $show->field('middle_name', __('Middle name'));
        $show->field('sex', __('Sex'));
        $show->field('last_name', __('Last name'));
        $show->field('dob', __('Dob'));
        $show->field('phone_number', __('Phone number'));
        $show->field('email', __('Email'));
        $show->field('district_id', __('District id'));
        $show->field('subcounty_id', __('Subcounty id'));
        $show->field('village', __('Village'));
        $show->field('address', __('Address'));
        $show->field('phone_number_2', __('Phone number 2'));
        $show->field('weight', __('Weight'));
        $show->field('height', __('Height'));
        $show->field('religion', __('Religion'));
        $show->field('agent', __('Agent'));
        $show->field('nin', __('Nin'));
        $show->field('has_passport', __('Has passport'));
        $show->field('passport_number', __('Passport number'));
        $show->field('passport_issue_date', __('Passport issue date'));
        $show->field('passport_expiry', __('Passport expiry'));
        $show->field('photo', __('Photo'));
        $show->field('education_level', __('Education level'));
        $show->field('skills', __('Skills'));
        $show->field('parent_farther_name', __('Parent farther name'));
        $show->field('parent_farther_contact', __('Parent farther contact'));
        $show->field('parent_farther_address', __('Parent farther address'));
        $show->field('parent_mother_name', __('Parent mother name'));
        $show->field('parent_mother_contact', __('Parent mother contact'));
        $show->field('parent_mother_address', __('Parent mother address'));
        $show->field('next_of_kin_releationship', __('Next of kin releationship'));
        $show->field('next_of_kin_name', __('Next of kin name'));
        $show->field('next_of_kin_contact', __('Next of kin contact'));
        $show->field('next_of_kin_address', __('Next of kin address'));
        $show->field('passport_copy', __('Passport copy'));
        $show->field('full_photo', __('Full photo'));
        $show->field('stage', __('Stage'));
        $show->field('destination_country', __('Destination country'));
        $show->field('job_type', __('Job type'));
        $show->field('registration_fee', __('Registration fee'));
        $show->field('has_paid', __('Has paid'));
        $show->field('account', __('Account'));
        $show->field('medical_hospital', __('Medical hospital'));
        $show->field('medical_date', __('Medical date'));
        $show->field('medical_status', __('Medical status'));
        $show->field('musaned_status', __('Musaned status'));
        $show->field('failed_reason', __('Failed reason'));
        $show->field('interpal_appointment_date', __('Interpal appointment date'));
        $show->field('interpal_done', __('Interpal done'));
        $show->field('interpal_status', __('Interpal status'));
        $show->field('cv_sharing', __('Cv sharing'));
        $show->field('cv_shared_with_partners', __('Cv shared with partners'));
        $show->field('emis_upload', __('Emis upload'));
        $show->field('on_training', __('On training'));
        $show->field('training_start_date', __('Training start date'));
        $show->field('training_end_date', __('Training end date'));
        $show->field('ministry_aproval', __('Ministry aproval'));
        $show->field('enjaz_applied', __('Enjaz applied'));
        $show->field('enjaz_status', __('Enjaz status'));
        $show->field('embasy_submited', __('Embasy submited'));
        $show->field('embasy_date_submited', __('Embasy date submited'));
        $show->field('embasy_status', __('Embasy status'));
        $show->field('depature_status', __('Depature status'));
        $show->field('depature_date', __('Depature date'));
        $show->field('depature_comment', __('Depature comment'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Candidate());

        $form->radio('stage', __('Is this candidate ready for Ministry Approval?'))
            ->options([
                'Ministry' => 'Yes',
                'Failed' => 'Failed at this level',
            ])->when('Training', function ($form) {

                $form->hidden('on_training', __('Train'))
                    ->default('Yes')
                    ->rules('required');
                /* 
                $form->date('training_start_date', __('Training start date'))
                    ->rules('required');

                $form->date('training_end_date', __('Training end date'))
                    ->rules('required'); */
            })
            ->when('Failed', function ($form) {

                $form->hidden('on_training', __('No'))
                    ->rules('required');

                $form->text('failed_reason', __('Reason failure'))
                    ->rules('required');
            })
            ->rules('required');


        return $form;
    }
}
