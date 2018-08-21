class ReportsController < ApplicationController
    before_action :requires_login

    def index
        recent_reports = Report.get_reports_list
        render json: recent_reports        
    end

    def show
        if params[:id].to_i > 0 
            data = Report.get_report(params[:id])
            Report.export_to_csv(data, params[:id] )
            render json: {message: 'Report OK'}
        else
            report_name = params[:id]
            data = Report.request_report(report_name)
            render json: data
        end
    end

    def get_report
        report_csv = Report.get_report(params[:generatedReportId])
        Report.export_to_csv(report_csv, params[:generatedReportId])
        render json: report_csv
    end


    def request_report
        report = Report.request_report(params[:fetchBody][:report_name])
        render json: report 
    end

    def load_report_to_database
        case params[:type]
        when 'invHealth'
            report_csv = Report.get_report(params[:generatedReportId])
            add_inv_health = Product.add_inv_health(report_csv, current_user_a)
            render json: add_inv_health
        when 'reserved'
            report_csv = Report.get_report(params[:generatedReportId])
            add_reserved = Product.add_reserved(report_csv)
            render json: add_reserved
        end
        
    end

    def reports_list_by_next_token
        recent_reports =  Report.get_report_request_list_by_next_token( params[:nextToken])
        render json: recent_reports        
    end

    private

    def params_request_report
        params.require(:fetchBody).permit(:start_date, :end_date)
    end
end
