# frozen_string_literal: true

module Admin
  module V1
    module Dashboard
      class DashboardController < Admin::V1::ApiController
        def get_date(date)
          Time.parse(params[date], "%Y-%m-%d")
        rescue
          nil
        end
      end
    end
  end
end
