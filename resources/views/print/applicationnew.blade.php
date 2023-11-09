<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap-print.css">
    <link type="text/css" href="{{ public_path('css/print.css') }}" rel="stylesheet" />
    <title>Application Form </title>
</head>

<body>
    <table style="width: 100%">
        <tr>
            <td style="width: 25%;" class="">
            </td>
            <td class="text-center" style="width: 20%;">
                <img style="width: 100px" src="{{ public_path('assets/images/coat_of_arms-min.png') }}">
            </td>
            <td style="width: 25%;" class="">

            </td>
        </tr>
        <tr>
            <td colspan="3" class="text-center pt-3">
                <p class="text-center" style="font-size: 18px"><b>THE REPUBLIC OF UGANDA</b></p>
                <p class="mb-2 mt-2" class="text-center" style="font-size: 18px"><b>TAX APPEALS TRIBUNAL</b></p>
                <p class="mb-0" class="text-center" style="font-size: 12px"><b>NIC Building 7th & 8th Floor</b></p>
                <p class="mb-0" class="text-center" style="font-size: 12px"><b>E-MAIL:</b>
                    info@tat.co.ug, <b>TELEPHONE:</b> +256 0414 340 470/
                    23268</p>
            </td>
        </tr>

    </table>

    <div class="container">

        <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-3 mb-3">
        <h5 class="text-center mb-3"><strong>FORM TAT 1</strong></h5>

        <div>
            <p>IN THE TAX APPEALS TRIBUNAL AT ..................................................................
                REGISTRY APPLICATION NO. .............................................YEAR.........................</p>
        </div>


        <p class="mt-3 text-center">IN THE MATTER OF</p>
        <p>....................................................................................................................................
            APPLICANT</p>
        <p class="mt-3 text-center">AND</p>
        <p>....................................................................................................................................
            RESPONDENT</p>

        <h5 class="text-center mt-4"><strong>APPLICATION</strong></h5>
        <p class="text-center mb-4"><i>(Under Section 17 of the Act and rule 10)</i></p>

        <p class="fs-18 fw-800">1. PARTICULARS OF APPLICANT<p>
        <p class="mb-2"><i>(a)</i> Name: ...........................................................................................................................................</p>
        <p class="mb-2"><i>(b)</i> Name of business: ..................................................................................................................</p>
        <p class="mb-2"><i>(c)</i> Postal address: ..................................................................................................................</p>
        <p class="mb-2"><i>(d)</i> Physical address of the applocant: Plot............................................. Street........................... Town/City....................................................</p>

        <form action="" method="get">
            


            <div class="form-group">
          



                <h4 class="text-ceneter">APPLICATION</h4>
                <p>Under Section 17 of the Act and rule 10</p><br>


                <h4 class="text-ceneter">1. PARTICULARS OF APPLICANT</h4><br>

                <div class="row align-center">
                    <div class="col-4">
                        <label for="name">(a) Name:</label> <input type="text" class="form-control"
                            id="name" name="name"><br>
                    </div>
                    <div class="col-4">
                        <label for="nature">(b) Nature of Business:</label> <input type="text" class="form-control"
                            id="nature" name="nature"><br>
                    </div>
                    <div class="col-4">
                        <label for="PostalAddress">(c) PostalAddress:</label> <input type="text" class="form-control"
                            id="PostalAddress" name="PostalAddress"><br>
                    </div>
                </div>


                <p>(d) Physical Address</p><br>
                <div class="row">
                    <div class="col-4">
                        <label for="plot"> Plot No:</label> <input type="text" class="form-control"
                            id="plot" name="plot"><br>
                    </div>
                    <div class="col-4">
                        <label for="plot"> Plot No:</label> <input type="text" class="form-control"
                            id="plot" name="plot"><br>
                    </div>
                    <div class="col-4">
                        <label for="street"> Street:</label> <input type="text" class="form-control"
                            id="street" name="street"><br>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="village"> Village</label> <input type="text"class="form-control"
                            id="village" name="village"><br>
                    </div>
                    <div class="col-6">
                        <label for="town"> Trading Center/Town/City:</label> <input type="text"
                            class="form-control"id="town" name="town"><br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <label for="telephone">(e) Telephone:</label> <input type="text" class="form-control"
                            id="telephone" name="telephone"><br>

                    </div>
                    <div class="col-4">
                        <label for="fax"> Fax No:</label> <input type="text" class="form-control"
                            id="fax" name="fax"><br>

                    </div>
                    <div class="col-4">
                        <label for="fax"> Email:</label> <input type="email" class="form-control"
                            id="email" name="email"><br>

                    </div>

                </div>

                <div class="row">
                    <div class="col-4">
                        <label for="tin"> (f)TIN:</label> <input type="text" class="form-control"
                            id="tin" name="tin"><br>

                    </div>

                    <div class="col-4">
                        <label for="IncomeTaxFile"> (g)Income Tax File No:</label> <input
                            type="text"class="form-control" id="IncomeTaxFile" name="IncomeTaxFile"><br>

                    </div>
                    <div class="col-4">
                        <label for="VatNumber">(h) Vat Number (if registered):</label> <input type="text"
                            class="form-control" id="VatNumber" name="VatNumber"><br><br>

                    </div>

                </div>
                <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-0 mb-4">





                <h4 class="text-ceneter">2 PARTICULARS OF THE TAX DISPUTES</h4><br>
                <label for="office"> (a)Office where the tax decision is made:</label> <input type="text"
                    class="form-control" id="office" name="office"><br>

                <p>(b)Type of tax specify by a tick in the box below as appropriate</p><br>
                <div class="row">
                    <div class="col-4">
                        <label for="IncomeTax"> INCOME TAX:</label> <input type="checkbox" id="IncomeTax"
                            name="IncomeTax"><br>
                        <label for="ExciseDuty"> EXCISE DUTY:</label> <input type="checkbox" id="ExciseDuty"
                            name="ExciseDuty"><br>
                        <label for="ImportCommision"> IMPORT COMMISION:</label> <input type="checkbox"
                            id="ImportCommision" name="ImportCommision"><br>

                    </div>
                    <div class="col-4">
                        <label for="others"> OTHERS:</label> <input type="checkbox" id="others"
                            name="others"><br>
                        <label for="ImportDuty"> IMPORT DUTY:</label> <input type="checkbox" id="ImportDuty"
                            name="ImportDuty"><br>


                    </div>
                    <div class="col-4">
                        <label for="WithholdingTax"> WITHHOLDING TAX:</label> <input type="checkbox"
                            id="WithholdingTax" name="WithholdingTax"><br>
                        <label for="VAT"> VAT:</label> <input type="checkbox" id="VAT"
                            name="VAT"><br>
                    </div>

                </div>
                <div class="row">
                    <div class="col 4">
                        <label for="AssessmentNo"> (c)Assessment No:</label> <input type="text"
                            class="form-control" id="AssessmentNo" name="AssessmentNo"><br>

                    </div>
                    <div class="col 4">
                        <label for="CustomsBill">(d) Customs Bill of Entry</label> <input type="text"
                            class="form-control" id="CustomsBill" name="CustomsBill"><br>

                    </div>

                </div>
                <div class="row">
                    <div class="col-4">
                        <label for="BankPaymentAdviceFormNo">(e) Bank Payment Advice Form No</label> <input
                            type="text"class="form-control" id="BankPaymentAdviceFormNo"
                            name="BankPaymentAdviceFormNo"><br>

                    </div>
                    <div class="col-4">
                        <label for="AmountOfTax">(f) Amount of tax in dispute or objected to:</label> <input
                            type="text" class="form-control" id="AmountOfTax" name="AmountOfTax"><br>

                    </div>
                    <div class="col-4">
                        <label for="DateOfService"> (g)Date of services of taxation decision :</label> <input
                            type="date" class="form-control"id="DateOfService" name="DateOfService"><br>

                    </div>

                </div>

                <div class="row">


                </div>


                <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-0 mb-4">

                <h4 class="text-center">3 STATEMENT OF FACT AND REASONS IN SUPPORT OF THE APPLICATION</h4>
                <P>if space provided is not adqate, attach as many additional pages as needed for the statement </P><br>
                <input type="textarea" id="StatementOfFacts" class="form-control" name="StatementOfFacts"
                    rows="19" cols="50"><br>

                <h5 class="text-center">4 ISSUES ON WHICH A DECISION/ARE SOUGHT</h5><br>
                <input type="textarea"class="form-control" id="Issues" name="Issues"><br>

                <h5 class="text-center">5 LIST OF BOOKS, DOCUMENTS FOR THINGS TO BE PRODUCES BEFORE THE TRIBUNAL IF ANY
                </h5>
                <P>Give brief description of each </P><br>
                <input type="textarea"class="form-control" id="books" name="books"><br>

                <h5 class="text-center">6 NAMES OF WITNESSES IF ANY AND THEIR ADDRESS</h5><br>

                <input type="textarea"class="form-control" id="books" name="books" rows="4"
                    cols="50"><br>
                <div class="row">
                    <div class="col-4">
                        <label for="Date"> Dated this:</label> <input type="text" class="form-control"
                            id="date" name="date"><br>

                    </div>
                    <div class="col-4">
                        <label for="month"> Month</label> <input type="text" class="form-control"
                            id="Month" name="Month"><br>

                    </div>
                    <div class="col-4">
                        <label for="Year"> Year:</label> <input type="text" class="form-control"
                            id="Year" name="Year"><br>

                    </div>

                </div>
                <p>.................................................... </p>
                <p>Signature of Application/ Advocate for the </p>
                <p> Application/ Aagent of applicant </p><br><br>

                <h4>(FOR OFFICIAL USE)</h4><br>
                <p><strong>7.By Registrar / officer - in- charge</strong></p><br>


                <p>Date of filling of application:.................................. </p> <br>
                <p>Signature:..................................................... </p> <br>

                <p>offical Stamp of Registrar/ officer un charge</p><br>

                <p><strong>8. By Commissioner General</strong></p>
                <p>Service of copy of application on Commisiion General</p><br>

                <p>Date :..................................................... </p> <br>
                <p>Sign:..................................................... </p> <br>


                <input type="submit" value="Submit" class="btn btn-sucess">

        </form>
    </div>


</body>

</html>
