<?php

namespace App\Admin\Controllers;

use App\models\Application;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ApplicationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Application';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Application());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('registry', __('Registry'));
        $grid->column('application_number', __('Application number'));
        $grid->column('year', __('Year'));
        $grid->column('applicant', __('Applicant'));
        $grid->column('respondent', __('Respondent'));
        $grid->column('applicant_name', __('Applicant name'));
        $grid->column('nature_of_business', __('Nature of business'));
        $grid->column('postal_address', __('Postal address'));
        $grid->column('physical_address', __('Physical address'));
        $grid->column('plot_number', __('Plot number'));
        $grid->column('street', __('Street'));
        $grid->column('village', __('Village'));
        $grid->column('trading_center', __('Trading center'));
        $grid->column('telephone_number', __('Telephone number'));
        $grid->column('fax_number', __('Fax number'));
        $grid->column('email', __('Email'));
        $grid->column('tin', __('Tin'));
        $grid->column('income_tax_file_number', __('Income tax file number'));
        $grid->column('vat_number', __('Vat number'));
        $grid->column('tax_decision_office', __('Tax decision office'));
        $grid->column('tax_type', __('Tax type'));
        $grid->column('assessment_number', __('Assessment number'));
        $grid->column('bill_of_entry', __('Bill of entry'));
        $grid->column('bank_payment', __('Bank payment'));
        $grid->column('amount_of_tax', __('Amount of tax'));
        $grid->column('taxation_decision_date', __('Taxation decision date'));
        $grid->column('statement_of_facts', __('Statement of facts'));
        $grid->column('decision_issue', __('Decision issue'));
        $grid->column('list_of_books', __('List of books'));
        $grid->column('witness_names', __('Witness names'));
        $grid->column('dated_at', __('Dated at'));
        $grid->column('sign', __('Sign'))->hide();
        $grid->column('date_of_filling', __('Date of filling'));
        $grid->column('sign1', __('Sign1'))->hide();
        $grid->column('date2', __('Date2')) ->hide();;
        $grid->column('sign2', __('Sign2'))->hide();

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
        $show = new Show(Application::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('registry', __('Registry'));
        $show->field('application_number', __('Application number'));
        $show->field('year', __('Year'));
        $show->field('applicant', __('Applicant'));
        $show->field('respondent', __('Respondent'));
        $show->field('applicant_name', __('Applicant name'));
        $show->field('nature_of_business', __('Nature of business'));
        $show->field('postal_address', __('Postal address'));
        $show->field('physical_address', __('Physical address'));
        $show->field('plot_number', __('Plot number'));
        $show->field('street', __('Street'));
        $show->field('village', __('Village'));
        $show->field('trading_center', __('Trading center'));
        $show->field('telephone_number', __('Telephone number'));
        $show->field('fax_number', __('Fax number'));
        $show->field('email', __('Email'));
        $show->field('tin', __('Tin'));
        $show->field('income_tax_file_number', __('Income tax file number'));
        $show->field('vat_number', __('Vat number'));
        $show->field('tax_decision_office', __('Tax decision office'));
        $show->field('tax_type', __('Tax type'));
        $show->field('assessment_number', __('Assessment number'));
        $show->field('bill_of_entry', __('Bill of entry'));
        $show->field('bank_payment', __('Bank payment'));
        $show->field('amount_of_tax', __('Amount of tax'));
        $show->field('taxation_decision_date', __('Taxation decision date'));
        $show->field('statement_of_facts', __('Statement of facts'));
        $show->field('decision_issue', __('Decision issue'));
        $show->field('list_of_books', __('List of books'));
        $show->field('witness_names', __('Witness names'));
        $show->field('dated_at', __('Dated at'));
        $show->field('sign', __('Sign')) ->hide();;
        $show->field('date_of_filling', __('Date of filling'));
        $show->field('sign1', __('Sign1')) ->hide();
        $show->field('date2', __('Date2')) ->hide();
        $show->field('sign2', __('Sign2')) ->hide();

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Application());

        $form->divider(strtoupper('FORM TAT 1'));
        $form->text('registry', __('Registry'));
        $form->text('application_number', __('Application number'));
        $form->date('year', __('Year'))->default(date('Y-m-d'));
        $form->text('applicant', __('Applicant'));

        $form->divider(strtoupper('APPLICATION'));

        $form->text('respondent', __('Respondent'));
        $form->text('applicant_name', __('Applicant name'));
        $form->text('nature_of_business', __('Nature of business'));
        $form->text('postal_address', __('Postal address'));
        $form->text('physical_address', __('Physical address'));
        $form->text('plot_number', __('Plot number'));
        $form->text('street', __('Street'));
        $form->text('village', __('Village'));
        $form->text('trading_center', __('Trading center'));
        $form->text('telephone_number', __('Telephone number'));
        $form->text('fax_number', __('Fax number'));
        $form->text('email', __('Email'));
        $form->text('tin', __('Tin'));
        $form->text('income_tax_file_number', __('Income tax file number'));
        $form->text('vat_number', __('Vat number'));

        $form->divider(strtoupper('PARTICULARS OF THE TAX DISPUTE'));

        $form->text('tax_decision_office', __('Tax decision office'));
        $form->radioCard('tax_type', __('Tax type'))
        ->options([
                    'INCOME TAX' => 'INCOME TAX',
                    'EXCISE DUTY' => 'EXCISE DUTY',
                    'IMPORT COMMISION' => 'IMPORT COMMISION',
                    'OTHERS' => 'OTHERS',
                    'IMPORT DUTY' => 'IMPORT DUTY',
                    'WITHHOLDING TAX' => 'WITHHOLDING TAX',
                    'VAT' => 'VAT',
                ]);
                    
                    
        $form->text('assessment_number', __('Assessment number'));
        $form->text('bill_of_entry', __('Bill of entry'));
        $form->text('bank_payment', __('Bank payment'));
        $form->text('amount_of_tax', __('Amount of tax'));
        $form->text('taxation_decision_date', __('Taxation decision date'));

        $form->divider(strtoupper('STATEMENT OF FACT AND REASON IN SUPPORT OF THE APPLICATION'));

        $form->textarea('statement_of_facts', __('Statement of facts'));

        $form->divider(strtoupper('ISSUE(S) ON WHICH A DECISION(S)IS /ARE SOUGHT'));

        $form->textarea('decision_issue', __('Decision issue'));
        $form->divider(strtoupper('LIST OF BOOKS, DOCUMENYS OR THINGS TO BE PRODUCED BEFORE THE TRIBUNAL,IF ANY.'));

        $form->textarea('list_of_books', __('List of books'));
        $form->divider(strtoupper('NAMES OF THE WITNESSSES IF ANY, AND THEIR ADDRESS'));

        $form->textarea('witness_names', __('Witness names'));
        $form->divider(strtoupper('(FOR OFFICIAL USE))'));

        $form->date('dated_at', __('Dated at'));
        $form->text('sign', __('Sign'));
        $form->date('date_of_filling', __('Date of filling'))->default(date('Y-m-d'));
        $form->text('sign1', __('Sign'));
        $form->date('date2', __('Date'));
        $form->text('sign2', __('Sign'));

        return $form;
    }
}
