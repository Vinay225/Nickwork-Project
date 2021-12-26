# frozen_string_literal: true

class AboutUsController < ApplicationController
  def Index; end

  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)

    results if results.present?
  end
end
