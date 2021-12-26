# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)

    results if results.present?
  end
end
